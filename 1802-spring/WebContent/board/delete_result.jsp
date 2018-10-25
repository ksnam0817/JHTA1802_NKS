<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel='stylesheet' type='text/css' href='./lib/board.css'/>
<script src='./lib/append_file.js'></script>
<script src='./lib/board_button.js'></script>

</head>
<body>
<div id='delete'>
	<h3>게시물 삭제 결과</h3>
	${pVo.msg }
	<p/>
	
	<form name='frm_board' id='frm_board'>
		<input type='hidden' name='nowPage'  value='${pVo.nowPage }'/>
		<input type='hidden' name='findStr'  value='${pVo.findStr }'/>
		<input type='hidden' name='backPage' value='${pVo.backPage }'/>
	</form>
	<input type = 'button' value='목록으로' id='btnList' />
</div>
</body>
</html>