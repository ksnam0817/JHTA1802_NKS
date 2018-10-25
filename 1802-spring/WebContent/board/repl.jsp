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
	<div id='title'>답변하기</div>

	<form name='frm_board' id='frm_board' class='frm_board' method='post' 
				enctype='multipart/form-data'>
		<label>작성자</label>
		<input type='text' name='worker' value='${session_id }'/><br/>

		<label>제 목</label>
		<input type='text' name='subject' size='80' /><br/>
		
		<label> </label>
		<textarea cols='80' rows='14' name='content'></textarea><br/>
		
		<label>암 호</label>
		<input type='password' name='pwd' /><br/>
	
		<label>첨부파일</label>
		<div id='attfile_zone'></div>
		
		<input type='button' name='btnReplR'  id='btnReplR'  value='답변저장' />
		<input type='button' name='btnView'   id='btnView'   value='상세보기' />
		<input type='button' name='btnList'   id='btnList'   value='목록으로' />
		<br/>
		<input type='hidden' name='nowPage'   value='${pVo.nowPage }'/>
		<input type='hidden' name='findStr'   value='${pVo.findStr }'/>
		<input type='hidden' name='backPage'  value='${pVo.backPage }'/>
		<input type='hidden' name='serial'    value='${vo.serial }'/>
		
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