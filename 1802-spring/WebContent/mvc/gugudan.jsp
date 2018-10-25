<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gugudan</title>
<script src='./lib/jquery-3.3.1.min.js'></script>

</head>
<body>
<div id='gugudan'>
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