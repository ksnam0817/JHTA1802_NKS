<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script>

</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-28" data-genuitec-path="/1802-spring/WebContent/mvc/hap.jsp">
<div id='hap' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-28" data-genuitec-path="/1802-spring/WebContent/mvc/hap.jsp">
	<div id='info'>두수 x~y의 합계</div>
	<form id='frm'>
		<label>X</label>
		<input type='text' name='x' size='4' value='1'>~
		<input type='text' name='y' size='4' value='100'>
		<input type='button' value='계산' 
			onclick = "viewResult('hap.hta', this.form)"/>
	</form>
	<hr/>
	<div id='result'></div>
</div>
</body>
</html>