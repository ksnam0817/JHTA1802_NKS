<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id='delete_result'>
		<h2>학생정보 삭제 결과</h2>
		${msg }
	</div>
	<p/>
	<form name='frm_std' id='frm_std' class='frm_std'>
		<input type='button' value='목록' name='btnList' id='btnList'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }' /> 
		<input type='hidden' name='findStr' value='${param.findStr }' /> 
	</form>
	<%@include file="param.jsp" %>
</body>
</html>