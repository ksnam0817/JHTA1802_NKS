<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id='insert_result'>
		<h2>학생 정보 입력 결과</h2>
		${msg }

		<p/>
		<form name='frm_std' id='frm_std' class='frm_std'>
			<input type='button' value='목록' name='btnList' id='btnList'/>
		</form>
		
		<%@include file="param.jsp" %>
		
	</div>
	
</body>
</html>