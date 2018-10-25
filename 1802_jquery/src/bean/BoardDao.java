package bean;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardDao {
	
	/*
	 * 필드
	 */
	
	// DB처리 관련 변수들
	Connection conn = null;
	PreparedStatement ps = null;
	
	ResultSet rs = null;
   
	String uploadDir = "D:/bong/eclipse-workspace/1802_jquery/WebContent/upload/";
	
	String encType = "utf-8";				
	int fileSize = 1024 * 1024 * 50; // 50Mb;

   // -------------------
   // thumb nail
   // -------------------
   ParameterBlock pb = null;
   RenderedOp op = null;
   BufferedImage bi = null;
   BufferedImage thumb = null;
   Graphics2D g = null;
   File file = null;
	
	
	
	
	
	// 페이징 처리를 위한 11개의 변수 (3개는 초기값 지정해주기)
	int listSize = 5;
	int blockSize = 3;
	int nowPage = 1;
	
	int totSize = 0;
	int totPage = 0;
	int totBlock = 0;
	int nowBlock = 0;
	
	int endPage = 0;
	int startPage = 0;
	int endNo = 0;
	int startNo = 0;
	
	

	
	/*
	 * 생성자(dao객체 만들자마자 커넥션까지!)
	 */
	public BoardDao() {
		conn = new DBConnection().getConn();
	}
	
	/*
	 * 메소드들
	 */
	
	// 페이징처리 계산메소드
	public void pageCompute(String searchStr) {
		String sql = " select count(serial) cnt from board where "
				   + " id like ? "
				   + " or subject like ? "
				   + " or doc like ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchStr + "%");
			ps.setString(2, "%" + searchStr + "%");
			ps.setString(3, "%" + searchStr + "%");
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			totSize = rs.getInt("cnt");
			
			// totSize를 가져왔으므로, 이제 아래 변수들을 공식에 따라 계산할 수 있따.
			totPage = (int)Math.ceil(totSize/(double)listSize);
			totBlock = (int)Math.ceil(totPage/(double)blockSize);
			nowBlock = (int)Math.ceil(nowPage/(double)blockSize);
			
			endPage = nowBlock*blockSize;
			startPage = endPage - blockSize +1;
			endNo = nowPage * listSize;
			startNo = endNo - listSize +1;
			
			
			if (endPage > totPage) endPage = totPage;
			if (startPage <1) startPage = 1;
			
			if (endNo > totSize) endNo = totSize;
			if (startNo <1) startNo = 1;
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	// 게시물 목록 구하기(Board - list)
	public List<BoardVo> list(String searchStr) {
		
		pageCompute(searchStr);
		List<BoardVo> list = new ArrayList<>();
		
		// 3중 쿼리!!!
		String sql = " select * from ( "
				   + "	  select rownum num, r.* from ( "		// rownum 구하기
				   + " 		 select * from board where "		// 실제로 가져올 데이터
				   + " 					id like ? "
				   + " 			or subject like ? "
				   + "          or 	   doc like ?  "
				   + "			order by serial desc "
				   + "        )r "
				   + "     ) where num between ? and ? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + searchStr + "%");
			ps.setString(2, "%" + searchStr + "%");
			ps.setString(3, "%" + searchStr + "%");
			ps.setInt(4,  startNo);
			ps.setInt(5, endNo);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				BoardVo v = new BoardVo();
				v.setSerial(rs.getInt("serial"));
				v.setMdate(rs.getString("mdate").substring(0,10));		// ".toString()" 필요한지는 확인해보자.
				v.setId(rs.getString("id"));
				v.setPwd(rs.getString("pwd"));
				v.setSerial(rs.getInt("serial"));
				v.setSubject(rs.getString("subject"));
				v.setDoc(rs.getString("doc"));
				
				v.setHit(rs.getInt("hit"));
				v.setGrp(rs.getInt("grp"));
				v.setDeep(rs.getString("deep"));
				v.setAttfile(rs.getString("attfile"));
				v.setFileOri(rs.getString("fileori"));
				
				list.add(v);
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
			list = null;
		
		}finally {
			try {
				conn.close();				// 커넥션을 닫는다
				conn = null;				// GC가 빠르게 청소하게
			}catch(SQLException sqle) {
				sqle.printStackTrace();
			}
			return list;
		}
	}
	
	
	
	
	// 글 새로 쓰기
	public boolean register(HttpServletRequest req) {
		boolean b = true;
		
		// 파일업로드 처리
		MultipartRequest multi = fileUpload(req);
		
		BoardVo v = setVo(multi);
		

		String msg = "";
		
		// 데이터 저장
		String sql = " insert into board values( "
				   + " SEQ_BOARD.NEXTVAL, "
				   + " SYSDATE, "
				   + " ?, ?, ?, ?, "						// ID, PWD, SUBJCT, DOC
				   + " 0, "
				   + " SEQ_BOARD.CURRVAL, "
				   + " SEQ_BOARD.CURRVAL, "
				   + " ?, ?"							// ATTFILE. FILEORI
				   + " ) ";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, v.getId());
			ps.setString(2, v.getPwd());
			ps.setString(3, v.getSubject());
			ps.setString(4, v.getDoc());
			ps.setString(5, v.getAttfile());
			ps.setString(6, v.getFileOri());
			
			int cnt = ps.executeUpdate();
			
			if(cnt <= 0) b = false;
			
		}catch(Exception ex) {
			ex.printStackTrace();
			b = false;
		}finally {
			return b;
		}
		
	}
	
   public MultipartRequest fileUpload(HttpServletRequest req) {
	      MultipartRequest multi = null;
	   
	      try {
	         multi = new MultipartRequest(req, uploadDir, fileSize, encType, new DefaultFileRenamePolicy());

	         Enumeration tags = multi.getFileNames();

	         while (tags.hasMoreElements()) {
	            String tag = (String) tags.nextElement();
	            String fileName = multi.getOriginalFileName(tag);
	            String reName = multi.getFilesystemName(tag);

	            if (reName == null)
	               break;

	            // thumb nail 생성
	            pb = new ParameterBlock();
	            pb.add(uploadDir + reName);
	            op = JAI.create("fileload", pb);

	            bi = op.getAsBufferedImage();
	            thumb = new BufferedImage(70, 70, BufferedImage.TYPE_INT_RGB);

	            g = thumb.createGraphics();
	            g.drawImage(bi, 0, 0, 70, 70, null);

	            file = new File(uploadDir + "sm_" + reName);
	            String ext = reName.substring(reName.indexOf(".") + 1);

	            ImageIO.write(thumb, ext, file);

	            System.gc();

	         }
	      } catch (Exception ex) {
	         ex.printStackTrace();
	      }

	      return multi;
	   }	
	
	
   //registerR, modifyR, repR
   public BoardVo setVo(MultipartRequest req) {
      BoardVo v = new BoardVo();
      if(req.getParameter("serial") != null) {
         v.setSerial(Integer.parseInt(req.getParameter("serial")));
      }
      
      v.setId(req.getParameter("writer"));
      v.setPwd(req.getParameter("pwd"));
      v.setSubject(req.getParameter("subject"));
      v.setDoc(req.getParameter("doc"));
      
      //답변글 처리시만 사용
      if(req.getParameter("grp") != null) {
         v.setGrp(Integer.parseInt(req.getParameter("grp")));
         v.setDeep(req.getParameter("deep"));
      }

      // file 태그명과 원본파일명, 변경된 파일명의 정보
      Enumeration tags = req.getFileNames();
      while (tags.hasMoreElements()) {
         String tag = (String) tags.nextElement();
         String fileName = req.getOriginalFileName(tag);
         String reName = req.getFilesystemName(tag);

         v.setAttfile(reName);
         v.setFileOri(fileName);
      }

      return v;
   }

   
   
   
   // list, view, modify
   public BoardVo setVo(ResultSet rs) {
      BoardVo v = new BoardVo();
      try {
         v.setSerial(rs.getInt("serial"));
         v.setId(rs.getString("id"));
         v.setPwd(rs.getString("pwd"));
         v.setSubject(rs.getString("subject"));
         v.setDoc(rs.getString("doc"));
         v.setHit(rs.getInt("hit"));
         v.setGrp(rs.getInt("grp"));
         v.setDeep(rs.getString("deep"));
         v.setMdate(rs.getDate("mdate").toString());
   
         v.setAttfile(rs.getString("afffile"));
         v.setFileOri(rs.getString("fileori"));
      }catch(Exception ex) {
         ex.printStackTrace();
         v = null;
      }finally {
         return v;
      }
   }	
   
   // 게시글 상세정보
   public BoardVo view(int serial) {
	   BoardVo vVo = null;
	   String sql = " select * from board where serial = ? ";
	   
	   try {
		   PreparedStatement ps = conn.prepareStatement(sql);
		   ps.setInt(1, serial);
		   ResultSet rs = ps.executeQuery();
		   
			while(rs.next()) {	// 데이터가 있으면 true, 없으면 false
				vVo = new BoardVo();
				vVo.setSerial(rs.getInt("serial"));
				vVo.setId(rs.getString("id"));
				vVo.setMdate(rs.getDate("mdate").toString().substring(0, 10));
				vVo.setPwd(rs.getString("pwd"));
				vVo.setSubject(rs.getString("subject"));
				vVo.setDoc(rs.getString("doc"));
				
				vVo.setHit(rs.getInt("hit"));
				vVo.setGrp(rs.getInt("grp"));
				vVo.setDeep(rs.getString("deep"));
				vVo.setAttfile(rs.getString("attfile"));
				vVo.setFileOri(rs.getString("fileori"));
			}
			
			
	   }catch(Exception ex) {
		   ex.printStackTrace();
		   vVo = null;
	   }finally {
		   return vVo;
	   }
   }
	
	
	
   
   
   
   
   
   
   
   
   
   
   
   
   
	
	
	public BoardVo seletcOne(int serial) {
		BoardVo vo = null;
		
		return vo;
	}
	
	public boolean modify() {
		boolean b = true;
		
		return b;
	}

	
	public boolean delete(int serial) {
		boolean b = true;
		
		return b;
	}
	
	
	public boolean rep() {
		boolean b = true;
		
		return b;
	}
	
	
	/*
	 * 페이징처리 관련변수 Getter/Setter
	 */
	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotSize() {
		return totSize;
	}

	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	
	
	
} // End of BoardDao
