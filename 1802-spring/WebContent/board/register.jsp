<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='brd'>
	<div id='title'>게시물 등록</div>
	<form name='frm_board' method='post' enctype='multipart/form-data'>
		<label>작성자</label>
		<input type='text' name='id' value='${session_id }'/><br/>

		<label>제 목</label>
		<input type='text' name='subject' size='80' /><br/>
		
		<label> </label>
		<textarea cols='80' rows='14' name='doc'></textarea><br/>
		
		<label>첨부파일</label>
		<input type='file' name='attfile' /><br/>
		
		<label>암 호</label>
		<input type='password' name='pwd' /><br/>
		
		<input type='button' name='btnRegister' id='btnRegister'  value='저장' />
		<input type='button' name='btnList'     id='btnList'      value='목록으로' />
	
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='findStr' value='${param.findStr }'/>
	</form>
</div>

<script>
var ff = document.frm_board;
ff.btnList.onclick = function(){
	ff.action='list.do';
	ff.submit();
}

ff.btnRegister.onclick = function(){
	ff.action='registerR.do';
	ff.submit();
}


</script>
</body>
</html>