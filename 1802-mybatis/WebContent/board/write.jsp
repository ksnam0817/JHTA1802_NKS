<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write</title>
<script>
function pageLoad() {
	var f = document.frmWrite;
	
	// [input file]이 변경되면
	f.picFile.onchange = function(ev) {
		var picFile = ev.srcElement;		// 이벤트가 발생한 태그
		var url = picFile.files[0];			// 선택된 이미지의 경로
		
		var reader = new FileReader();		// FileReader 객체를 가져온다
		
		// 사진파일이 로딩되면
		reader.onload = function(e) {
			f.picImg.src = e.target.result;	// 로딩된 결과를 뿌려준다
		}
		reader.readAsDataURL(url);
	}
	
	// [글 저장]버튼 클릭시
	f.btnSave.onclick = function() {
		var fw = document.frmWrite;
		var data = new FormData(fw);
		
 		$.ajax({
			type 		: 'POST',
			url			: './board/writeResult.jsp',
			contentType	: false,
			processData	: false,
			data		: data,
			success		: function(resp) {
				$('#content').html(resp);
			}
		}); 
	}
	
	
} // End of pageLoad();
</script>
</head>

<body>
<form name='frmWrite' id='frmWrite' enctype="multipart/form-data">
<div id='write'>

	<div id='pic'>
		<label for='picImg'>사진</label>
		<img src='http://via.placeholder.com/120x160' name='picImg'
			width='120' height='160' />
		<input type='file' name='picFile' id='picFile' />
	</div>
	
	<h3 id='info'>myBatis 게시판 - 글쓰기</h3>

	<div id='inputs'>
		<label for='writer'>작성자ID </label>
		<input type='text' name='writer' /><br/>
		
		<label for='pwd'>암호</label>
		<input type='text' name='pwd' /><br/>
		
		<label for='subject'>글제목</label>
		<input type='text' name='subject' /><br/>
			
		<div id='doc'>
		<label for='doc'>글내용</label>
		<textarea rows='6' cols='40' name='doc'></textarea>
		</div>
		
		<hr/>
		<label for='searchStr'>searchStr</label>
		<input type='text' name='searchStr' value='${param.searchStr}' /><br/>
		
		<label for='nowPage'>nowPage</label>
		<input type='text' name='nowPage' value='${param.nowPage}' />
	</div>
	<hr/>
	
	<div id='buttons'>
		<input type='button' value='글 저장' name='btnSave' id='btnSave' />
		<input type='button' value='목록으로' name='btnList' id='btnList' />
	</div>
	
</div>
</form>
<script>
pageLoad();
</script>
</body>
</html>