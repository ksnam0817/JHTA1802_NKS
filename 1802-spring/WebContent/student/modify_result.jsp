<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id='modify_result'>
		<h2>회원 수정 결과</h2>
		${pVo.msg }
	
	</div>
	<p/>
	<form name='frm_std' id='frm_std' class='frm_std' method='post'>
		<input type='button' value='목록' name='btnList' id='btnList'/>
		
		<input type='hidden' value='${pVo.id }'      name='id'/>
		<input type='hidden' value='${pVo.findStr }' name='findStr'/>
		<input type='hidden' value='${pVo.nowPage }' name='nowPage'/>
	</form>

	<%@include file='param.jsp' %>
</body>

</html>