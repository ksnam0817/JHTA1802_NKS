<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<div id='title'>게시물 등록</div>
	<form name='frm_board' id='frm_board' class='frm_board' method='post' enctype='multipart/form-data'>
		<label>작성자</label>
		<input type='text' name='worker' value='${empty session_id ? 'park w.g' : session_id }'/><br/>

		<label>제 목</label>
		<input type='text' name='subject' id='subject' size='80'  value="한번 해보슈~~"/><br/>
		
		<label> </label>
		<textarea cols='80' rows='14' name='content'>안돼요~~~</textarea><br/>
		<label>암 호</label>
		<input type='password' name='pwd'  value='1111'/><br/>
		
		<label>첨부파일</label>
		<div id='attfile_zone'></div>
		
		<div id='button_zone'>
			<input type='button' name='btnRegister' id='btnRegister' value='저장' />
			<input type='button' name='btnList'     id='btnList'     value='목록으로' />
		</div>
	
		<input type='hidden' name='nowPage'  value='${param.nowPage }'/>
		<input type='hidden' name='findStr'  value='${param.findStr }'/>
		<input type='hidden' name='backPage' value='${param.backPage }'/>
	</form>
</div>

<script>
/* 첨부 파일 처리를 위해서 */
var cnt = 0;
var attZone;

$(function(){
	attZone = $('#attfile_zone')[0];
	appendAttFile(attZone); //페이지가 로딩되면 첨부파일 한개 자동 생성 
})
</script>

</body>
</html>






