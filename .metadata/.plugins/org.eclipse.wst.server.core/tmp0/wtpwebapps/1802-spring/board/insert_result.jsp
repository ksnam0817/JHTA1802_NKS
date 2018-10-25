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
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-2" data-genuitec-path="/1802-spring/WebContent/board/insert_result.jsp">
<div id='brd' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-2" data-genuitec-path="/1802-spring/WebContent/board/insert_result.jsp">
	<div id='title'>등록 결과</div>

	${pVo.msg }
	<p/>
	<form name='frm_board' id='frm_board' class='frm_board' method='post'>
		<input type='hidden' name='nowPage' value='${pVo.nowPage }'/>
		<input type='hidden' name='findStr' value='${pVo.findStr }' />
		<input type='hidden' name='backPage' value='${pVo.backPage }' />
		<input type='button' name='btnList' id='btnList'  value='목록으로' />
	</form>
</div>
</script>
</body>
</html>