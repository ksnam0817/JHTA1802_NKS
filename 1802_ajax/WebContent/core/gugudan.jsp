<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구구단</title>
</head>
<body>
<div id='gugudan'>
	<h3>구구단</h3>
	<div id='info'>
		Ajax를 사용한 구구단 프로그램
	</div>
	
	<form name='frm' method='post'>
		<label>구구단</label>
		<input type='text' size='4'	name='dan' value='${param.dan }' />
		<input type='button' value='실행' id='btn' />
		<br/>		
	</form>
	<hr/>
	<div id='result'></div>
</div>

<script>
	var btn = document.getElementById('btn');
	var xhr;	// ajax 객첵를 담는 변수
		
	// [실행] 버튼이 클릭되면
	btn.onclick = function() {
		xhr = new XMLHttpRequest();
		var param = document.frm.dan.value;
		var url = '/1802_ajax/core/gugudan_process.jsp?dan=' + param;
		
		xhr.open('post', url, true);
		xhr.onreadystatechange = function() {
			if (xhr.status == 200 && xhr.readyState == 4) {
				var str = xhr.responseText;
				var rs = document.getElementById('result');
				rs.innerHTML = str;
			}
		}
		xhr.send();
	}
</script>	
</body>
</html>