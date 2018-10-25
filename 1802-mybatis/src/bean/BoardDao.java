package bean;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardDao {
	/*
	 * 필드
	 */
	
	// myBatis
	SqlSession sqlSession;

	// MultiPartRequest
	String uploadPath = "D:/bong/eclipse-workspace/1802-mybatis/WebContent/upload/";
	String encType = "utf-8";
	int size = 1024 * 1024 * 50; // 50MB
	
    // thumb nail
    ParameterBlock pb = null;
    RenderedOp op = null;
    BufferedImage bi = null;
    BufferedImage thumb = null;
    Graphics2D g = null;
    File file = null;
	
	// 페이징 처리를 위한 11개의 변수 (3개는 초기값 지정해주기)
	int listSize = 10;
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
	 * 생성자
	 */
	public BoardDao() {
		sqlSession = BeginFactory.getFactory().openSession();
	}
	
	/*
	 * 메소드들
	 */
	
	// 페이징처리 계산메소드
	public String pageCompute(String findStr) {
		String msg = "정상적으로  페이징처리 sql 수행!";
		
		try {
			totSize = sqlSession.selectOne("board.list_count", findStr);
			
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
			if (startNo <1) startNo = 1;// totSize를 가져와
			
		}catch(Exception ex) {
			msg = "페이징처리 중 에러 발생";
			ex.printStackTrace();
		}finally {
			return msg;
		}
	}
	
	// list.jsp
	@SuppressWarnings("finally")
	public List<BoardVo> select(String findStr) {
		
		pageCompute(findStr);
		List<BoardVo> list = new ArrayList<>();
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("findStr", "%"+findStr+"%");
		paramMap.put("startNo", startNo);
		paramMap.put("endNo", endNo);
		
		
		try {
			list = sqlSession.selectList("board.list", paramMap);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			return list;
		}
	}

	
   // view.jsp
   @SuppressWarnings("finally")
	public BoardVo view(int serial) {
		BoardVo vVo = null;
		try {
			vVo = sqlSession.selectOne("board.view", serial);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
			return vVo;
		}
	}
   
	
	// writeResult.jsp (myBatis게시판 글등록)
	@SuppressWarnings("finally")
	public String write(HttpServletRequest req) {
		String msg = "정상적으로 저장되었습니다";
		
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadPath, size, encType,
					new DefaultFileRenamePolicy());
			
			BoardVo vo = setVo(multi);
			int cnt = sqlSession.insert("board.write", vo);

			if (cnt > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
				msg = "<span class='err'>저장 중 오류 발생</span>";
			}

		} catch (Exception ex) {
			msg = "<span class='err'>저장 중에 예외 발생: " + ex.toString() + "</span>";
			ex.printStackTrace();
		} finally {
			sqlSession.close();
			return msg;
		}
	}
	
	// modifyResult.jsp
	@SuppressWarnings("finally")
	public String modify(HttpServletRequest req) {
		String msg = "정상적으로 수정되었습니다";
		
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadPath, size, encType,
					new DefaultFileRenamePolicy());
			
			BoardVo mVo = setVo(multi);
			int cnt = sqlSession.update("board.modify", mVo);
			System.out.println("cnt:" + cnt);
			
			if (cnt > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
				msg = "<span class='err'>수정 중 오류 발생</span>";
			}
			
		} catch (Exception ex) {
			msg = "<span class='err'>수정 중에 예외 발생: " + ex.toString() + "</span>";
			ex.printStackTrace();
		} finally {
			sqlSession.close();
			return msg;
		}
	}
	

	// insert.jsp (글작성 연습)
	@SuppressWarnings("finally")
	public String insert(HttpServletRequest req) {
		String msg = "정상적으로 저장되었습니다";
		
		try {
			MultipartRequest multi = new MultipartRequest(req, uploadPath, size, encType,
					new DefaultFileRenamePolicy());
			
			BoardVo vo = setVo(multi);
			int cnt = sqlSession.insert("board.insert", vo);

			if (cnt > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
				msg = "<span class='err'>저장 중 오류 발생</span>";
			}

		} catch (Exception ex) {
			msg = "<span class='err'>저장 중에 예외 발생: " + ex.toString() + "</span>";
			ex.printStackTrace();
		} finally {
			sqlSession.close();
			return msg;
		}
	}

	// setVo(writeResult.jsp, modifyResult.jsp)
	public BoardVo setVo(MultipartRequest req) {
		BoardVo vo = new BoardVo();
		
		// modify
		if (req.getParameter("serial") != null) {
			vo.setSerial(Integer.parseInt(req.getParameter("serial")));
		}
		
		vo.setId(req.getParameter("writer"));
		vo.setPwd(req.getParameter("pwd"));
		vo.setSubject(req.getParameter("subject"));
		vo.setDoc(req.getParameter("doc"));
		
		// 답글
		if (req.getParameter("gep") != null) {
			vo.setGrp(Integer.parseInt(req.getParameter("grp")));
			vo.setDeep(req.getParameter("deep"));
		}

		// 첨부파일
		Enumeration e = req.getFileNames();
		while (e.hasMoreElements()) {
			String tagName = (String) e.nextElement(); // input type='file'의 name값(picFile)
			String attFile = req.getFilesystemName(tagName); // 서버
			String fileOri = req.getOriginalFileName(tagName); // 클라이언트

			// 사진파일 바뀐경우
			if (attFile !=null && fileOri !=null ) {
				vo.setAttfile(attFile); // 서버
				vo.setFileOri(fileOri); // 클
			
			// 사진파일 안바뀐경우
			}else {
				vo.setAttfile(req.getParameter("attfile"));
				vo.setFileOri(req.getParameter("fileOri"));
			}
			
			System.out.println("vo.getAttfile: " + vo.getAttfile());
			System.out.println("vo.getFileOri: " + vo.getFileOri());
			
		}
		return vo;
	}

	
	
	/*
	 * 페이징처리용 Getters and Setters
	 */
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getEncType() {
		return encType;
	}

	public void setEncType(String encType) {
		this.encType = encType;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public ParameterBlock getPb() {
		return pb;
	}

	public void setPb(ParameterBlock pb) {
		this.pb = pb;
	}

	public RenderedOp getOp() {
		return op;
	}

	public void setOp(RenderedOp op) {
		this.op = op;
	}

	public BufferedImage getBi() {
		return bi;
	}

	public void setBi(BufferedImage bi) {
		this.bi = bi;
	}

	public BufferedImage getThumb() {
		return thumb;
	}

	public void setThumb(BufferedImage thumb) {
		this.thumb = thumb;
	}

	public Graphics2D getG() {
		return g;
	}

	public void setG(Graphics2D g) {
		this.g = g;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

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
	
	
	
	
} // End of class
