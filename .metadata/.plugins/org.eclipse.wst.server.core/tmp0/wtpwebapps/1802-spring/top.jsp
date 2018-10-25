<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script>
$(function(){
	$('#btnLogin').click(function(){
		location.href = 'login.std';
	})
	$('#btnLogout').click(function(){
		location.href = 'logout.std';
	})
})
</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-41" data-genuitec-path="/1802-spring/WebContent/top.jsp">
<div id='login_zone' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-41" data-genuitec-path="/1802-spring/WebContent/top.jsp">
	<c:choose>
		<c:when test="${session_id == null  }">
			<input type='button' value='로그인' id='btnLogin'>
		</c:when>
		<c:when test="${session_id != null  }">
			<input type='button' value='로그아웃' id='btnLogout'>
		</c:when>
	</c:choose>
</div>
</body>
</html>