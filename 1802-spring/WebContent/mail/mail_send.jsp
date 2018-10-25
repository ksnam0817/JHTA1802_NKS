<%@page import="javax.mail.Transport"%>
<%@page import="javax.activation.DataHandler"%>
<%@page import="javax.activation.FileDataSource"%>
<%@page import="javax.mail.internet.MimeBodyPart"%>
<%@page import="javax.mail.internet.MimeMultipart"%>
<%@page import="javax.mail.Multipart"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="bean.MyAuthenticator"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mail_send</title>
</head>
<body>
<h3>메일 전송 결과</h3>
<%
request.setCharacterEncoding("utf-8");
String uploadPath = "c:/temp/"; // 메일전송시 사용된 첨부파일의 임시 경로
String encoding="utf-8";
int    fileSize = 1024*1024*50; // 최대파일크기 50Mb
MultipartRequest multi = null;

//메일과 관련된 변수
String sender = "";
String receiver = "";
String subject ="";
String content = "";
String file = null;

try{
	multi = new MultipartRequest(request, uploadPath, fileSize, encoding,
				new DefaultFileRenamePolicy() );

	String id      = multi.getParameter("id");
	String findStr = multi.getParameter("findStr");
	String nowPage = multi.getParameter("nowPage");
	
	pageContext.setAttribute("id", id);
	pageContext.setAttribute("findStr", findStr);
	pageContext.setAttribute("nowPage", nowPage);
	
	//첨부파일
	Enumeration em = multi.getFileNames();
	if(em !=null){ // 첨부파일이 있는 경우
		String tag = (String)em.nextElement();
		file = multi.getFilesystemName(tag);// 실제 저장된 파일명
	}
	
	sender = multi.getParameter("sender");
	receiver = multi.getParameter("receiver");
	subject = multi.getParameter("subject");
	content = multi.getParameter("content");
			
	//------------------------------------
	//메일전송 로직
	//------------------------------------
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
	message.setFrom(new InternetAddress(sender));
	message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
	message.setSubject(subject);
	message.setSentDate(new Date());

	//문자열과 이미지를 동시에 전송
	Multipart part = new MimeMultipart();
	MimeBodyPart text = new MimeBodyPart();
	text.setContent(content, "text/html;charset=utf-8");
	part.addBodyPart(text);
	
	//첨부파일을 메일에 추가
	if(file != null){
		MimeBodyPart img = new MimeBodyPart();
		FileDataSource source = new FileDataSource(uploadPath + file);
		img.setDataHandler(new DataHandler(source));
		img.setFileName(source.getName());
		part.addBodyPart(img);
	}
	
	message.setContent(part);
	Transport.send(message);
	
	out.print("메일이 정상적으로 전송되었습니다....");
	
	
}catch(Exception ex){
	out.print(ex.toString());
}finally{
	//임시파일을 삭제
	if(file != null){
		File delFile = new File(uploadPath + file);
		if(delFile.exists()) delFile.delete();
		
	}
}
%>

<form name='frm_mail' id='frm_std' >
	<input type='hidden' name='id'      value='${id }' />
	<input type='hidden' name='nowPage' value='${nowPage }' />
	<input type='hidden' name='findStr' value='${findStr }' />

	<input type='button' value='회원 상세보기' id='btnView'>
	<input type='button' value='회원 목록'    id='btnList'>

</form>
<%@include file="../student/param.jsp" %>

</body>
</html>








