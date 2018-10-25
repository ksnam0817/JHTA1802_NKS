<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insert</title>

<script>
// jQuery
$(document).ready(function(){
	// 이미지태그 클릭하면 '파일태그'가 클릭된 효과를 준다
	$('#insert img').click(function(){
		$('#insert #attFile').click();
	});
	
	// 이미지 미리보기
	$('#insert #attFile').change(function(){
		// 파일이름 표시
		var fileName = $(this).val();
		fileName = fileName.substr(fileName.lastIndexOf('\\')+1);
		$('#insert output').val(fileName);
		
		var attFile = document.frmInsert.attFile;	// 이벤트가 발생한 태그
		var fileLoc = attFile.files[0];				// 선택된 이미지의 경로
		
		var reader = new FileReader();
		reader.onload = function(e) {
			document.frmInsert.img.src = e.target.result;
		}
		
		reader.readAsDataURL(fileLoc);
	});
	
	// [저장]버튼이 클릭되면
	$('#insert #btnSend').click(function(){
		var frmInsert = new FormData(document.frmInsert);
		$.ajax({
			url			:	'./board/insertResult.jsp',
			data		:	frmInsert,
			type		:	'post',
			contentType :	false,
			processData	:	false,
			success		:	function(resp) {
				$('#content').html(resp);
			}
		});		// End of $.ajax
	});
	
	
}); // End of jQuery
</script>
</head>
<body>
<div id='insert'>
	<h3>게시판 입력</h3>
	<form name='frmInsert' id='frmInsert' method='post' enctype='multipart/form-data'>
		<label>작성자아이디</label>
		<input type='text' name='id' /><br/>
		
		<label>제목</label>
		<input type='text' name='subject' size='50' /><br/>
		
		<label>내용</label>
		<textarea rows='10' cols='40' name='doc'></textarea><br/>
		
		<label>첨부파일</label>
		<div id='divAttFile'>
			<img src='http://via.placeholder.com/120x160' name='img'>
			<output id='imgOutput'></output>
			<input type='file' name='attFile' id='attFile' />
		</div>
		
		<label>암호</label>
		<input type='password' name='pwd' />
		<p/>
		<input type='button' id='btnSend' value='저장' />
		
		
	</form>
</div>
</body>
</html>