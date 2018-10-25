<%@page import="bean.BoardDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>writeResult</title>

<%
 
/* // MultipartRequest 관련
String uploadDir = "D:/bong/eclipse-workspace/1802_jquery/WebContent/upload";
int maxSize = 1024 * 1024 * 10;	// 10MB
String enc = "UTF-8";

MultipartRequest multi = new MultipartRequest
(request, uploadDir, maxSize, enc, new DefaultFileRenamePolicy());

// multi.getParameter => request.setAttribute
request.setAttribute("writer", multi.getParameter("writer"));
request.setAttribute("pwd", multi.getParameter("pwd"));
request.setAttribute("subject", multi.getParameter("subject"));
request.setAttribute("doc", multi.getParameter("doc"));
request.setAttribute("searchStr", multi.getParameter("searchStr"));
request.setAttribute("nowPage", multi.getParameter("nowPage"));
 */
String msg ="";
BoardDao dao = new BoardDao();

dao.write(request);

request.setAttribute("dao", dao);
request.setAttribute("msg", msg);


%>
<script>
function pageLoad() {
	var f = document.frmWriteResult;
	
	// [목록으로]버튼이 클릭되면
	f.btnList.onclick = function() {
		$('#content').load('./board/list.jsp');
	}
	

	
	
} // End of pageLoad();
</script>

<style>
#writeResult {
	position:relative;
	margin-left: 10px;
}
#writeResult #pic {
	position:absolute;
	right:10px;
}
#writeResult #pic label {
	display:block;
}
#writeResult #pic input {
	width: 180px;
	display:block;
}
#writeResult #inputs label {
	display: inline-block;
	width: 66px;
}
#writeResult #inputs #doc {
	overflow: hidden;
}
#writeResult #inputs #doc label {
	float: left;
}
#writeResult #inputs #doc textarea {
	float: left;
	margin-top: 2px;
	margin-left: 6px;
}
#writeResult #buttons {
	margin-bottom: 10px;
}


</style>
</head>

<body>

<form name='frmWriteResult' id='frmWriteResult' enctype="multipart/form-data">
<div id='writeResult'>

	
	<h3 id='info'>myBatis 게시판 - 글등록 결과</h3>

	<div id='inputs'>
		<label for='msg'>처리결과</label>
		<input type='text' name='msg' id='msg' value='${requestScope.msg }' disabled /><br/>

	</div>
	<hr/>
	
	<div id='buttons'>
		<input type='button' value='목록으로' name='btnList' id='btnList' />
	</div>
	
</div>
</form>
<script>
pageLoad();
</script>
</body>
</html>