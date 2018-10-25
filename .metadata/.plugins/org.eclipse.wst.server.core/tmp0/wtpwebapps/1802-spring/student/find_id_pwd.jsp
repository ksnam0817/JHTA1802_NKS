<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type='text/css' href='/1802-spring/lib/main.css'/>
<script src="/1802-spring/lib/jquery-3.3.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
#findIdAndPwd #content{
	width:500px;
	height : 250px;
	margin: 0 auto;
}
#findIdAndPwd #result{
	color : #4444ff;
	font-size : 13px;
}
</style>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-31" data-genuitec-path="/1802-spring/WebContent/student/find_id_pwd.jsp">
<div id='findIdAndPwd' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-31" data-genuitec-path="/1802-spring/WebContent/student/find_id_pwd.jsp">
	<%@include file='../header.jsp' %>
		<div id='content'>
			<div>
				<h3>아이디 또는 비번 찾기</h3>
				아이디나 가입시 입력했던 연락처를 입력하시면 이메일로 아이디와 암호를 전송해 드립니다.	
			</div>
			<form name='frm_std' id='frm_std' method='post'>
				<output id='msg'>${msg }&nbsp;</output><p/>
				<div>
					<font size='3'><b>아이디 또는 연락처</b></font><br/>
					<input type='text' name='findStr' value='kim' size='30'/>
					<input type='button' value='메일전송' id='btnSendMail' />
					<input type='button' value='홈으로'   id='btnHome' />
				</div>
				<br/>
				<div id='result'>${msg }</div>
				<p/>
			</form>
		</div>
		
	<%@include file='../footer.jsp' %>

</div>

<script>
$('#btnSendMail').click(function(){
	var param = $('#frm_std').serialize();
	$('#result').load('../findIdR.std' , param);
})
$('#btnHome').click(function(){
	location.href = '../index.jsp';
})
</script>



</body>
</html>