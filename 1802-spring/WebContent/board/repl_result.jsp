<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='./lib/board.css'/>
<script src='./lib/append_file.js'></script>
<script src='./lib/board_button.js'></script>
</head>
<body>
<div id='brd'>
	<div id='title'>답변 결과</div>
	${pVo.msg }
	<p/>
	<form name='frm_board' class='frm_board' id='frm_board' method='post'>
		<input type='button' name='btnList' id='btnList'  value='목록으로' />
		
		<input type='hidden' name='nowPage'   value='${pVo.nowPage }'/>
		<input type='hidden' name='findStr'   value='${pVo.findStr }'/>
		<input type='hidden' name='backPage'  value='${pVo.backPage }'/>
		<input type='hidden' name='serial'    value='${vo.serial }'/>	
		
	</form>
</div>


</body>
</html>