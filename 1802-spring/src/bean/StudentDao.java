package bean;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StudentDao {
	
	String uploadPath = "M:\\workspace\\1802\\1802-spring\\WebContent\\upload\\"; 
	int    size = 1024*1024*20;
	String encode = "utf-8";
	
	
	// 페이지 분리와 관련된 변수들
	int listSize = 12; // 한페이지에 표시될 데이터의 갯수
	int blockSize = 10; // 한블럭당 표시될 페이지 번수의 갯수
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
	public StudentDao() {
		s = StudentFactory.getFactory().openSession();
	}
	
	public boolean login(String id, String pwd) {
		boolean b = true;
		StudentVo vo = new StudentVo();
		vo.setId(id);
		vo.setPwd(pwd);
		int cnt = s.selectOne("std.login", vo);
		
		if(cnt<1) {
			b=false;
		}
		return b;
	}
	
	public boolean findId(String findStr) {
		boolean b=true;
		StudentVo vo = s.selectOne("std.find_id", findStr);
		
		if(vo == null) {
			b=false;
		}else {
			boolean sendFlag = sendMail(vo);
			if(!sendFlag) b=false;
		}
		
		return b;
	}
	
	public boolean sendMail(StudentVo vo) {
		boolean sendFlag = true;
		
		String receiver = vo.getEmail();
		String content = "아이디 : " + vo.getId() + "<br/>"
				       + "암 호 : " + vo.getPwd();
		
		try {
			String mailServer = "smtp.naver.com";
			
			Properties prop = new Properties();
			prop.put("mail.smtp.starttls.enable", "true");//메일 전송서버 활성화
			prop.put("mail.transport.protocol", "smtp"); //메일전송시 사용되는 프로토콜
			prop.put("mail.smtp.port", "465");
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.user", receiver);
			prop.put("mail.smtp.host", mailServer);
			prop.put("mail.smtp.ssl.enable", "true"); //ssl 보안연결 활성화
			
			// 기본 메시지 설정
			Session mailSession = Session.getInstance(prop, new MyAuthenticator());
			Message message = new MimeMessage(mailSession);
			message.setFrom(new InternetAddress("hipwg@naver.com"));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject("아이와 암호입니다.");
			message.setSentDate(new Date());
			
			Multipart part = new MimeMultipart();
			MimeBodyPart text = new MimeBodyPart();
			text.setContent(content, "text/html;charset=utf-8");
			part.addBodyPart(text);
			message.setContent(part);
			Transport.send(message);

		}catch(Exception ex) {
			ex.printStackTrace();
			sendFlag=false;
		}
		
		return sendFlag;
	}
	
	public List<StudentVo> select(HttpServletRequest req){
		String findStr = "";
		
		findStr = req.getParameter("findStr");
		if(req.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(req.getParameter("nowPage"));
		}

		int tot = s.selectOne("std.page_count", findStr);
		pageCompute(tot);
		
		ParamVo pVo = new ParamVo();
		pVo.setFindStr(findStr);
		pVo.setStartNo(startNo);
		pVo.setEndNo(endNo);
		
		List<StudentVo> list = s.selectList("std.select", pVo);
		
		return list;
	}
	
	public void pageCompute(int tot) {
		totSize = tot;
		
		totPage  = (int)Math.ceil(totSize/(double)listSize);
		totBlock = (int)Math.ceil(totPage/(double)blockSize);
		nowBlock = (int)Math.ceil(nowPage/(double)blockSize);

		endPage   = nowBlock * blockSize;
		startPage = endPage - blockSize + 1;
		if(endPage > totPage) endPage = totPage;

		endNo   = nowPage * listSize;
		startNo = endNo - listSize + 1;
		if(endNo > totSize) endNo = totSize;
			
	}

	
	
	
	
	public StudentVo selectOne(String findStr){
		StudentVo vo = null;
		
		vo = s.selectOne("std.select_one", findStr);
		
		System.out.println(findStr);
		System.out.println(vo.getPhoto());
		
		if(vo.getPhoto() != null || !vo.getPhoto().equals("")) {
			vo.setDelFile(vo.getPhoto());
		}
		
		return vo;
	}
	
	
	public String insertR(HttpServletRequest req) {
		StudentVo vo = null;
		String msg = "정상적으로 저장되었습니다.";
		try {
			MultipartRequest mul = new MultipartRequest(req, uploadPath, size, encode, new DefaultFileRenamePolicy());
			
			vo = setVo(mul);
			int cnt = s.insert("std.insert", vo);
			
			if(cnt>0) {
				s.commit();
			}else {
				msg = "저장중 오류 발생";
				s.rollback();
			}
			
		} catch (IOException e) {
			msg = "저장중 예외 발생...<br/>" + e.toString();
			e.printStackTrace();
		}finally {
			return msg;
		}
	}
	
	public ParamVo modifyR(HttpServletRequest req) {
		StudentVo vo = null;
		ParamVo pVo = new ParamVo();
		MultipartRequest mul = null;
		String msg = "정상적으로 수정되었습니다.";
	
		try {
			mul = new MultipartRequest(req, uploadPath, size, encode, 
							new DefaultFileRenamePolicy());
			vo = setVo(mul);
			
			int cnt = s.update("std.update", vo);
			
			if(cnt>0) {
				s.commit();
				if(vo.getPhoto() != null) {
					fileDel(vo.getDelFile());
				}
			}else {
				msg = "수정중 오류 발생";
				s.rollback();
			}
		} catch (IOException e) {
			msg = "회원 수정중 예외 발생";
			e.printStackTrace();
		}finally {
			pVo.setNowPage(Integer.parseInt(mul.getParameter("nowPage")));
			pVo.setFindStr(mul.getParameter("findStr"));
			pVo.setMsg(msg);
			return pVo;
		}
		
	}
	
	public String deleteR(HttpServletRequest req) {
		StudentVo vo = null;
		String msg = "정상적으로 삭제되었습니다.";
		 
		String id=req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String photo = req.getParameter("photo");
		vo = new StudentVo();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setPhoto(photo);

		try {
			int cnt = s.delete("std.delete", vo);
			if(cnt>0) {
				s.commit();
				if(vo.photo != null) {
					fileDel(vo.photo);
				}
				
			}else {
				s.rollback();
				msg = "삭제중 오류 발생";
			}
		}catch(Exception ex) {
			s.rollback();
			msg = "삭제중 예외 발생";
		}finally {
			return msg;
		}
		
	}
	
	
	
	public StudentVo setVo(MultipartRequest mul) {
		StudentVo vo = new StudentVo();
		
		vo.setId(mul.getParameter("id"));
		vo.setPost(mul.getParameter("post"));
		vo.setName(mul.getParameter("name"));
		vo.setPwd(mul.getParameter("pwd"));
		vo.setPhone(mul.getParameter("phone"));
		vo.setAddress(mul.getParameter("address"));
		vo.setEmail(mul.getParameter("email"));
		vo.setRdate(mul.getParameter("rDate"));
		vo.setDelFile(mul.getParameter("delFile"));
		
		Enumeration en = mul.getFileNames();
		while(en.hasMoreElements()) {
			String tag = (String)en.nextElement();
			String photo = mul.getFilesystemName(tag);
			String photoOri = mul.getOriginalFileName(tag);
			vo.setPhoto(photo);
			vo.setPhotoOri(photoOri);
			
			
		}
		
		return vo;
		
	}
	
	public void fileDel(String photo) {
		try {
			File file = new File(uploadPath + photo);
			if(file.exists() && !file.isDirectory()) {
				file.delete();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	public String getEncode() {
		return encode;
	}

	public void setEncode(String encode) {
		this.encode = encode;
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
