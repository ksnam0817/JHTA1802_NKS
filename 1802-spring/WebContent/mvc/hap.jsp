<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script>

</script>
</head>
<body>
<div id='hap'>
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