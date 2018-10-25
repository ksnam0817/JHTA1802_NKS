<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugudan</title>
<script src='./lib/jquery-3.3.1.min.js'></script>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-26" data-genuitec-path="/1802-spring/WebContent/mvc/gugudan.jsp">
<div id='gugudan' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-26" data-genuitec-path="/1802-spring/WebContent/mvc/gugudan.jsp">
	<div id='info'>
		구구단 하나를 입력받아 구구단 표시
	</div>
	<form id='frm' name='frm' method='post'>
		<label>구구단</label>
		<input type='text' size='5' name='dan' value='3' />
		<input type='button' id='btn' value='실행' 
			onclick="viewResult('gugudan.hta',this.form)"/>
	</form>
	<hr/>
	<h3>Result</h3>
	<div id='result'></div>
</div>
</body>
</html>