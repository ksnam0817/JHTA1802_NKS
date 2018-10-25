package bean;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.util.SystemPropertyUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardDao {
	String uploadPath = "M:\\workspace\\1802\\1802-spring\\WebContent\\upload\\";
	HttpServletRequest req;


	int size = 1024 * 1024 * 20;
	String encode = "utf-8";

	// 페이지 분리와 관련된 변수들
	int listSize = 15; // 한페이지에 표시될 데이터의 갯수
	int blockSize = 5; // 한블럭당 표시될 페이지 번수의 갯수
	int totSize = 0; // 검색된 결과의 전체 갯수
	int totPage = 0; // 전체 페이지 수
	int totBlock = 0; // 전체 블럭수
	int nowPage = 1; // 현재 페이지
	int nowBlock = 1; // 현재 블럭
	int startPage = 1; // 표시될 페이지의 시작번호
	int endPage = 4; // 표시될 페이지의 끝번호
	int startNo = 1; // 표시될 데이터의 시작번호
	int endNo = 2; // 표시될 데이터의 끝번호

	SqlSession s;
	
	ParamVo pVo;

	public BoardDao() {
		s = StudentFactory.getFactory().openSession();
 
	}
	//서버에 배포되었을 때 필요함
	public String getUploadPath() {
		uploadPath = req.getRealPath("upload");
		return uploadPath;
	}



	public List<BoardVo> select(HttpServletRequest req) {
		this.req = req;
		BoardVo vo = setVo(req);
		pVo = setPVo(req);
		pVo.setBackPage("list");
		

		int tot = s.selectOne("brd.page_count", pVo.getFindStr());
		pageCompute(tot);

		pVo.setStartNo(startNo);
		pVo.setEndNo(endNo);
		
		List<BoardVo> list = s.selectList("brd.select", pVo);

		return list;
	}



	public List<BoardAttVo> selectAlbum(HttpServletRequest req) {
		this.req = req;

		BoardVo vo = setVo(req);
		pVo = setPVo(req);
		pVo.setBackPage("list_album");
		
		int tot = s.selectOne("brd.page_count_att", pVo.getFindStr());
		pageCompute(tot);
		
		
		pVo.setStartNo(1);
		pVo.setEndNo(endNo);

		List<BoardAttVo> list = s.selectList("brd.select_att_list", pVo);

		return list;
	}

	public List<BoardAttVo> selectAlbumAppend(HttpServletRequest req) {
		this.req = req;

		BoardVo vo = setVo(req);
		pVo = setPVo(req);
		pVo.setBackPage("list_album");
		
		int tot = s.selectOne("brd.page_count_att", pVo.getFindStr());
		pageCompute(tot);
		
		
		pVo.setStartNo(startNo);
		pVo.setEndNo(endNo);

		List<BoardAttVo> list = s.selectList("brd.select_att_list", pVo);

		return list;
	}

	
	public void pageCompute(int tot) {
		totSize = tot;

		totPage = (int) Math.ceil(totSize / (double) listSize);
		totBlock = (int) Math.ceil(totPage / (double) blockSize);
		nowBlock = (int) Math.ceil(nowPage / (double) blockSize);

		endPage = nowBlock * blockSize;
		startPage = endPage - blockSize + 1;
		
		if (endPage > totPage)
			endPage = totPage;

		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;
		if (endNo > totSize)
			endNo = totSize;

	}	
	
	
	public ParamVo insertR(HttpServletRequest req) {
		this.req = req;
		BoardVo vo = null;
		pVo = null;
		
		String msg = "정상적으로 저장되었습니다.";
		try {
			MultipartRequest mul = new MultipartRequest(req, getUploadPath(), size, encode, new DefaultFileRenamePolicy());

			vo = setVo(mul);
			pVo = setPVo(mul);
			
			int cnt = s.insert("brd.insert", vo);

			if (cnt > 0) {
				s.commit();
			} else {
				msg = "저장중 오류 발생";
				s.rollback();
			}

		} catch (Exception e) {
			msg = "저장중 예외 발생...<br/>" + e.toString();
			e.printStackTrace();
		} finally {
			pVo.setMsg(msg);
			
			return pVo;
		}
	}

	public BoardVo view(HttpServletRequest req) {
		this.req = req;
		BoardVo vo = setVo(req);
		pVo = setPVo(req);
		
		BoardVo v = null; // 리턴되는 vo값

		try {
			int cnt = s.update("brd.hit_up", vo.getSerial());
			v = s.selectOne("brd.select_one", vo.getSerial());
			List<BoardAttVo> attList = s.selectList("brd.select_att", vo.getSerial());

			v.setContent(v.getContent().replaceAll("\n", "<br/>"));
			v.setAttList(attList);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			v = null;
		} finally {
			s.commit();
			return v;
		}

	}

	public BoardVo modify(HttpServletRequest req) {
		this.req = req;
		BoardVo vo = setVo(req);
		pVo = setPVo(req);

		BoardVo v = null; // 리턴되는 vo값
		try {
			v = s.selectOne("brd.select_one", vo.getSerial());
			List<BoardAttVo> attList = s.selectList("brd.select_att", vo.getSerial());
			v.setAttList(attList);
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
			v = null;
		} finally {
			s.commit();
			return v;
		}

	}

	public BoardVo modifyR(HttpServletRequest req) {
		this.req = req;
		BoardVo vo = null;
		pVo = null;
		
		try {
			MultipartRequest mul = 
					new MultipartRequest(req, getUploadPath(), size, encode,
							new DefaultFileRenamePolicy());

			vo = setVo(mul);
			pVo = setPVo(mul);
			
			pVo.setMsg("정상적으로 수정되었습니다.");
			
			int cnt = s.update("brd.modify", vo);
			if (cnt > 0) {
				if (vo.getDelFiles() != null) {
					s.delete("brd.attDelete", vo);
				}
				if (vo.getAttFiles().size() > 0) {
					s.insert("brd.attInsert", vo);
				}
			
				s.commit();
	
				// delFiles 삭제
				for (String f : vo.getDelFiles()) {
					File delFile = new File(getUploadPath() + f);
					if (delFile.exists() && !delFile.isDirectory()) {
						delFile.delete();
					}
				}
			}else {
				s.rollback();
				pVo.setMsg("수정중 오류 발생");
			}
				
		} catch (Exception ex) {
			pVo.setMsg("수정 중 오류 발생 ");
			s.rollback();
			ex.printStackTrace();
			
		} finally {
			return vo;
		}

	}

	public BoardVo deleteR(HttpServletRequest req) {
		this.req = req;
		BoardVo vo = setVo(req);
		pVo = setPVo(req);
		
		pVo.setMsg("정상적으로 삭제되었습니다.");

		List<BoardAttVo> attList = null;
		try {
			attList = s.selectList("brd.select_att", vo.getSerial());

			s.delete("brd.deleteR", vo);

			for (BoardAttVo v : attList) {
				File delFile = new File(getUploadPath() + v.getAttfile());
				if (delFile.exists() && !delFile.isDirectory()) {
					delFile.delete();
				}
			}
		} catch (Exception ex) {
			pVo.setMsg("삭제중 예외 발생 >>>>> " + ex.toString());
			s.rollback();
			ex.printStackTrace();
		} finally {
			s.commit();
			return vo;
		}
	}

	public BoardVo replR(HttpServletRequest req) {
		this.req = req;
		BoardVo vo = null;
		pVo = null;
		

		String msg = "정상적으로 저장되었습니다.";
		try {
			MultipartRequest mul = 
				new MultipartRequest(req, getUploadPath(), size, encode, 
						new DefaultFileRenamePolicy());
			
			vo = setVo(mul);
			pVo = setPVo(mul);
			
			vo.setpSerial(vo.getSerial());

			int cnt = s.insert("brd.repl", vo);

			if (cnt > 0) {
				s.commit();
			} else {
				msg = "저장중 오류 발생";
				s.rollback();
			}

		} catch (Exception e) {
			s.rollback();
			msg = "저장중 예외 발생...<br/>" + e.toString();
			e.printStackTrace();
		} finally {
			pVo.setMsg(msg);
			return vo;
		}
	}

	public BoardVo setVo(MultipartRequest mul) {
		BoardVo vo = new BoardVo();

		vo.setWorker(mul.getParameter("worker"));
		vo.setSubject(mul.getParameter("subject"));
		vo.setContent(mul.getParameter("content"));
		vo.setPwd(mul.getParameter("pwd"));

		if (mul.getParameter("serial") != null) {
			vo.setSerial(Integer.parseInt(mul.getParameter("serial")));
		}
		if (mul.getParameter("pSerial") != null) {
			vo.setpSerial(Integer.parseInt(mul.getParameter("pSerial")));
		}


		Map<String, String> map = new HashMap<String, String>();
		Enumeration en = mul.getFileNames();
		while (en.hasMoreElements()) {
			String tag = (String) en.nextElement();
			String photo = mul.getFilesystemName(tag);
			String photoOri = mul.getOriginalFileName(tag);

			if (photo == null)
				continue;

			map.put(photo, photoOri);
		}
		vo.setAttFiles(map);

		if (mul.getParameterValues("delFiles") != null) {
			vo.setDelFiles(mul.getParameterValues("delFiles"));
		}

		return vo;
	}

	public ParamVo setPVo(MultipartRequest mul) {
		pVo = new ParamVo();

		if(mul.getParameter("backPage") != null) {
			pVo.setBackPage(mul.getParameter("backPage"));
		}
		if(mul.getParameter("msg") != null) {
			pVo.setMsg(mul.getParameter("msg"));
		}

		if (mul.getParameter("findStr") != null && !mul.getParameter("findStr").equals("")) {
			pVo.setFindStr(mul.getParameter("findStr"));
		}


		if (mul.getParameter("nowPage") != null) {
			pVo.setNowPage(Integer.parseInt(mul.getParameter("nowPage")));
			nowPage = pVo.getNowPage();
		}
		if (mul.getParameter("startNo") != null) {
			pVo.setStartNo(Integer.parseInt(mul.getParameter("startNo")));
		}
		if (mul.getParameter("endNo") != null) {
			pVo.setEndNo(Integer.parseInt(mul.getParameter("endNo")));
		}

		return pVo;
	}

	
	public BoardVo setVo(HttpServletRequest req) {
		BoardVo vo = new BoardVo();
		vo.setSerial(1);

		if (req.getParameter("pwd") != null) {
			vo.setPwd(req.getParameter("pwd"));
		}

		if (req.getParameter("serial") != null) {
			vo.setSerial(Integer.parseInt(req.getParameter("serial")));
		}

		return vo;
	}

	public ParamVo setPVo(HttpServletRequest req) {
		pVo = new ParamVo();
		
		if(req.getParameter("backPage") != null) {
			pVo.setBackPage(req.getParameter("backPage"));
		}
		if(req.getParameter("msg") != null) {
			pVo.setMsg(req.getParameter("msg"));
		}

		if (req.getParameter("findStr") != null && !req.getParameter("findStr").equals("")) {
			pVo.setFindStr(req.getParameter("findStr"));
		}

		if (req.getParameter("nowPage") != null) {
			pVo.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
			nowPage = pVo.getNowPage();
		}
		if (req.getParameter("startNo") != null) {
			pVo.setStartNo(Integer.parseInt(req.getParameter("startNo")));
		}
		if (req.getParameter("endNo") != null) {
			pVo.setEndNo(Integer.parseInt(req.getParameter("endNo")));
		}
		
		return pVo;
	}
	
	
	public ParamVo getpVo() {
		return pVo;
	}

	public void setpVo(ParamVo pVo) {
		this.pVo = pVo;
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

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
}
