<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-38" data-genuitec-path="/1802-spring/WebContent/student/modify_result.jsp">
	<div id='modify_result' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-38" data-genuitec-path="/1802-spring/WebContent/student/modify_result.jsp">
		<h2>회원 수정 결과</h2>
		${pVo.msg }
	
	</div>
	<p/>
	<form name='frm_std' id='frm_std' class='frm_std' method='post'>
		<input type='button' value='목록' name='btnList' id='btnList'/>
		
		<input type='hidden' value='${pVo.id }'      name='id'/>
		<input type='hidden' value='${pVo.findStr }' name='findStr'/>
		<input type='hidden' value='${pVo.nowPage }' name='nowPage'/>
	</form>

	<%@include file='param.jsp' %>
</body>

</html>