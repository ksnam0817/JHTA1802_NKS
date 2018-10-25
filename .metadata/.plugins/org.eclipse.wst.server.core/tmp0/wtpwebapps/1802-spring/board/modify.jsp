<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='./lib/board.css'/>
<script src='./lib/append_file.js'></script>
<script src='./lib/board_button.js'></script>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-6" data-genuitec-path="/1802-spring/WebContent/board/modify.jsp">
<div id='brd' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-6" data-genuitec-path="/1802-spring/WebContent/board/modify.jsp">
	<div id='title'>게시물 수정</div>
	<form name='frm_board' id='frm_board' class='frm_board' method='post' 
			enctype='multipart/form-data'>
		<label>작성자</label>
		<input type='text' name='worker' readonly value='${vo.worker }'/><br/>

		<label>제 목</label>
		<input type='text' name='subject' size='80' value='${vo.subject }'/><br/>
		
		<label> </label>
		<textarea cols='80' rows='14' name='content'>${vo.content }</textarea><br/>
		
		<label>암 호</label>
		<input type='password' name='pwd' value='1111'/><br/>

		<label>첨부파일</label>
		<div id='att_files'>
			<c:forEach var="v"  items="${vo.attList }" >
					<span>
							<img src = './upload/${v.attfile }' width="120px" height='150px' >
							<br/>
						<label><input type='checkbox' name='delFiles' value='${v.attfile }'/>삭제</label>
					</span>
			</c:forEach>
		</div>
		<br/>
		<div id='attfile_zone'></div>
		
	
		<input type='button' name='btnModifyR'R id='btnModifyR' value='수정' />
		<input type='button' name='btnList'    id='btnList'    value='취소' />
		<br/>
		<input type='hidden' name='nowPage'  value='${pVo.nowPage }' />
		<input type='hidden' name='findStr'  value='${pVo.findStr }'/>
		<input type='hidden' name='backPage' value='${pVo.backPage }' placeholder='backpage'/>
		<input type='hidden' name='serial'   value='${vo.serial }'/>
		<input type='hidden' name='pSerial'  value='${vo.pSerial }' placeholder='pserial'/>
		
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