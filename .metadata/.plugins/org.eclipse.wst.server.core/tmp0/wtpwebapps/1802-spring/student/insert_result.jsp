<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-34" data-genuitec-path="/1802-spring/WebContent/student/insert_result.jsp">
	<div id='insert_result' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-34" data-genuitec-path="/1802-spring/WebContent/student/insert_result.jsp">
		<h2>학생 정보 입력 결과</h2>
		${msg }

		<p/>
		<form name='frm_std' id='frm_std' class='frm_std'>
			<input type='button' value='목록' name='btnList' id='btnList'/>
		</form>
		
		<%@include file="param.jsp" %>
		
	</div>
	
</body>
</html>