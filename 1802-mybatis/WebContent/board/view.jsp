<%@page import="bean.BoardVo"%>
<%@page import="bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>view</title>

<%
int serial = Integer.parseInt(request.getParameter("serial"));

BoardDao dao = new BoardDao();
BoardVo vVo = dao.view(serial);


request.setAttribute("dao", dao);
request.setAttribute("vVo", vVo);


%>
<script>
function pageLoad() {
	var f = document.frmView;
	
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
	
	// [목록으로]버튼이 클릭되면
	f.btnList.onclick = function() {
		var param = $('#frmHidden').serialize();
		$('#content').load('./board/list.jsp', param);
	}
	
	// [수정하기]버튼이 클릭되면
	$('#view #btnModify').click(function(){
		alert('[수정하기]버튼이 클릭되엇따!');
		var frmView = new FormData(document.frmView);
		$.ajax({
			url			: './board/modifyResult.jsp',
			data		: frmView,
			type		: 'post',
			contentType	: false,
			processData	: false,
			success		: function(resp) {
				$('#content').html(resp);
			}
		});
	});
	
	// [답글달기]버튼이 클릭되면
	f.btnReply.onclick = function() {
		var param = $('#frmHidden').serialize();
		$('#content').load('./board/list.jsp', param);
	}
	
} // End of pageLoad();
</script>
</head>

<body>
<form name='frmView' id='frmView' enctype="multipart/form-data">
<div id='view'>

	<div id='pic'>
		<label for='picImg'>사진</label>
		<img src='./upload/${vVo.attfile}' name='picImg'
			width='120' height='160' />
		<input type='file' name='picFile' id='picFile' />
	</div>
	
	<h3 id='info'>myBatis 게시판 - 글 상세보기</h3>

	<div id='inputs'>
		
		<label for='writer'>작성자ID </label>
		<input type='text' name='writer' value='${vVo.id }'  /><br/>
		
		<label for='pwd'>암호</label>
		<input type='text' name='pwd' value='${vVo.pwd}'  /><br/>
		
		<label for='subject'>글제목</label>
		<input type='text' name='subject' value='${vVo.subject}'  /><br/>
			
		<div id='doc'>
		<label for='doc'>글내용</label>
		<textarea rows='6' cols='40' name='doc'  >
		${vVo.doc}
		</textarea>
		</div>
		
		<label for='searchStr'>searchStr</label>
		<input type='text' name='searchStr' value='${param.searchStr}'  /><br/>
		
		<label for='nowPage'>nowPage</label>
		<input type='text' name='nowPage' value='${param.nowPage}'  />
		
		<label for='serial'>serial</label>
		<input type='text' name='serial' value='${param.serial}'  />
		
		<label for='attfile'>attfile</label>
		<input type='text' name='attfile' value='${vVo.attfile}'  />
		
		<label for='fileOri'>fileOri</label>
		<input type='text' name='fileOri' value='${vVo.fileOri}'  />
		
		
	</div>
	<hr/>
	
	<div id='buttons'>
		<input type='button' value='목록으로' name='btnList' id='btnList' />
		<input type='button' value='수정하기' name='btnModify' id='btnModify' />
		<input type='button' value='답글달기' name='btnReply' id='btnReply' />
	</div>
	
</div>
</form>

<!-- 기타정보 -->
<form id='frmHidden' name='frmHidden' method='post'>
	<label for='searchStr'>searchStr</label>
	<input type='text' name='searchStr' value='${param.searchStr}' /><br/>
		
	<label for='nowPage'>nowPage</label>
	<input type='text' name='nowPage' value='${param.nowPage}' />
	
	<label for='serial'>serial</label>
	<input type='text' name='serial' value='${param.serial}' />
</form>



<script>
pageLoad();
</script>
</body>
</html>