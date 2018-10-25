<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-24" data-genuitec-path="/1802-spring/WebContent/mvc/amount.jsp">
<div = 'amount' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-24" data-genuitec-path="/1802-spring/WebContent/mvc/amount.jsp">
	<div id='info'>
		수량과 단가를 입력받아 세금과 총액을 계산하여 표시
	</div>
	<form id='frm'>
		<label>수량</label>
		<input type='text' name='ea' value='123'/><br/>
		<label>단가</label>
		<input type='text' name='price' value='100.5'><br/>
		<input type='button' value='계산하기' 
			onclick = "viewResult('amount.hta', this.form )"/>
	</form>
</div>
<h3>Result</h3>
<div id='result'></div>
</body>
</html>