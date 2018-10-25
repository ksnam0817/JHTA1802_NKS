<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

</head>
<body>
<div = 'amount'>
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