<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findEmp</title>
</head>
<body>
<div id='findEmp'>
	<h3>employee테이블 검색</h3>
	<p id='info'>
		employee테이블 검색
	</p>
	
	<form name='frm'>
		<label>성명의 일부분</label>
		<input type='text' name='first_name' value='a' />
		<input type='button' value='검색' id='btn' />
	</form>
	<hr/>
	
	<div id='result'>
	<h3>result DIV</h3>
	</div>
	
</div>

<script>
var xhr;
var btn = document.getElementById('btn');
var rs = document.getElementById('result');
var f= document.frm;

btn.onclick = function() {
	if (xhr == null) xhr = new XMLHttpRequest();
	
	var first_name = f.first_name.value;
	var param = '?first_name=' + first_name;
	var url = "/1802_ajax/core/findEmp_result.jsp" + param;
	
	xhr.open('get', url, true);
	
	// 상태값이 바뀌면
	xhr.onreadystatechange = function() {
		if (xhr.status==200 && xhr.readyState==4) {
			// text, html, jsp의 출력결과
			var str = xhr.responseText;
			rs.innerHTML = str;
		}
	}
	xhr.send();
}

</script>


</body>
</html>