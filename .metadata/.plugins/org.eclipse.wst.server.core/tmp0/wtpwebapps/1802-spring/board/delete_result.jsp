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

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-0" data-genuitec-path="/1802-spring/WebContent/board/delete_result.jsp">
<div id='delete' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-0" data-genuitec-path="/1802-spring/WebContent/board/delete_result.jsp">
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