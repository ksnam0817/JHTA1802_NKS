<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type='text/css' href='/1802-spring/lib/main.css'/>
<script src="/1802-spring/lib/jquery-3.3.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>

#login #msg{
	color : red;
	font-size : 12px;
}
#login a{
	text-decoration: none;
}

#login #frm_std{
	position: relative;
	width:350px;
	height:200px;
	border:2px solid #aaaaaa;
	padding : 20px;
	
	margin : 30px auto;

	box-sizing: border-box;
}

#login #frm_std label{
	display: inline-block;
	width  : 50px;
}

#login #frm_std #btnLogin{
	width:100px;
	height:48px;
	position: absolute;
	top  : 54px;
	right : 10px;
	
}
</style>
<script>
$(function(){
	$('#btnLogin').click(function(){
		var ff = document.frm_std;
		ff.action = "loginR.std";
		ff.submit();
	})
})
</script>

<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-36" data-genuitec-path="/1802-spring/WebContent/student/login.jsp">
<div id='login' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-36" data-genuitec-path="/1802-spring/WebContent/student/login.jsp">
<%@include file='../header.jsp' %>
	<form name='frm_std' id='frm_std' method='post'>
		<output id='msg'>${msg }&nbsp;</output><p/>
		<div>
			<label>아이디</label>
			<input type='text' name='id' value='kim' size='19'/><br/>
		</div>
		<div>
			<label>암호</label>
			<input type='text' name='pwd' value='1111' size='19'/><br/>
		</div>
		
		<input type='button' value='로그인' id='btnLogin' />
		<p/>
		<div>
			<center>
				<a href='./student/find_id_pwd.jsp'>[아이디 / 암호 찾기]</a><p/>
				<input type='button' value='home' onclick="location.href='./index.jsp'">
			</center>
		</div>
	
	</form>
	<%@include file='../footer.jsp' %>
</div>
</body>
</html>