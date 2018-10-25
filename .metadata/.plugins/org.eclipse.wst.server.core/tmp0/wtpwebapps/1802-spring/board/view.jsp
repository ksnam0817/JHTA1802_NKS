<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='./lib/board.css'/>
<script src='./lib/append_file.js'></script>
<script src='./lib/board_button.js'></script>

<style>
#frm_board #btnDelete{
	color : red;
}

#frm_board #btnModify{
	color : blue;
}
#brd #content{
	width      : 100%;
	min-height : 250px;
	padding    : 20px;
	box-sizing : border-box;
	overflow   : scroll;
	border     : 3px solid #eeeeee;
	border-radius: 10px;
}

</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-12" data-genuitec-path="/1802-spring/WebContent/board/view.jsp">
<div id='brd' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-12" data-genuitec-path="/1802-spring/WebContent/board/view.jsp">
	<div id='title'>상세보기</div>
	
	<form name='frm_board' id='frm_board' method='post'>
		<label>작성자</label>
		<span>${vo.worker } &emsp;  [ ${vo.mdate } ] / ${vo.hit }</span><br/>

		<label>제 목</label>
		<span>${vo.subject }</span><br/>
		
		<label> </label>
		<div id='content'>${vo.content }</div><br/>
		
		<c:if test = '${fn:length(vo.attList)==0 }'>
			<div>첨부파일이 없습니다.</div><br/>
		</c:if>
		
		<div id='att_files'>
			<c:forEach var="v"  items="${vo.attList }" >
					<span>
						<a href='./upload/${v.attfile }' download >
							<img src = './upload/${v.attfile }' width="120px" height='150px' >
						</a><br/>
						<output>${v.attfile }</output>
					</span>
			</c:forEach>
		</div>
		<p/>
		
		<input type='button' name='btnDelete' id='btnDelete'  value='삭제' />
		<input type='button' name='btnModify' id='btnModify'  value='수정' />
		<input type='button' name='btnRepl'   id='btnRepl'     value='답장' />
		<input type='button' name='btnList'   id='btnList'    value='목록으로' />
		<br/>
		<input type='hidden' name='nowPage'  value='${pVo.nowPage }'  placeholder='nowpage'/>
		<input type='hidden' name='findStr'  value='${pVo.findStr }'  placeholder='findstr'/>
		<input type='hidden' name='backPage' value='${pVo.backPage }' placeholder='backpage'/>
		<input type='hidden' name='serial'   value='${vo.serial }'   placeholder='serial'/>
		<input type='hidden' name='pSerial'  value='${vo.pSerial }'  placeholder='pserial'/>
		<input type='hidden' name='pwd' placeholder="pwd"/>
		
	</form>
</div>


</body>
</html>