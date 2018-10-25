<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<style>
#login_main {
	border: 1px outset #4444ff;
	width: 240px; box-sizing : border-box;
	margin: 0 auto;
	padding: 20px;
	box-shadow: 2px 2px 4px #888888;
	box-sizing: border-box;
}
#login_main>form>label {
	display: inline-block;
	width: 60px;
}
#btnlogin {
	width: 100px;
	height: 50px;
	margin-left: 70px;
}
.msg {
	font-size: 10px;
	color: red;
	text-align: center;
}
</style>
<script>
function aa(){
	ff = document.frm_login;
	ff.btnfind.onclick = function(){
		ff.action = 'loginR.login';
		ff.submit();
	}
}
</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-18" data-genuitec-path="/withmun/WebContent/login.jsp">
	<div id='login_main' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-18" data-genuitec-path="/withmun/WebContent/login.jsp">
		<h4>Login</h4>
		<form name='frm_login' method='post' action='loginR.login'>
			<label>아이디&nbsp;</label><input type='text' name='mid'> <br />
			<label>암&nbsp;&nbsp;&nbsp;호&nbsp;</label><input type='password'
				name='pwd'><br />
			<output name='msg' class='msg'>${msg }</output>
			<p />
			<input type='submit' name='btnlogin' id='btnlogin' value='LOGIN'>
		</form>

	</div>
<script>
aa();
</script>
</body>
</html>
