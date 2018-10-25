<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>load TEXT</title>
</head>
<body>
<div id='loadTEXT'>
	<h3>load Text | HTML file</h3>
	<p id='info'>
		text 또는 html문서를 읽어오기 위한 예. 기본적으로 text파일을 읽지만
		html속성이 포함되어 있으면 특별한 처리외에는 모두 적용된다.
	</p>
	
	<input type='button' value='load TEXT' id='btnLoad' />
	<br/>
	<div id='result'>
	<!-- <h3>Result DIV</h3> -->
	</div>
</div>


<script>
	var xhr;
	var btn = document.getElementById('btnLoad');
	var rs  = document.getElementById('result');
	
	//버튼이 클릭되면 시작합니다
	btn.onclick = function() {
		if (xhr == null) xhr = new XMLHttpRequest();
		var url = '/1802_ajax/core/text.txt';
		xhr.open('get', url, true);
		xhr.send();
		xhr.onreadystatechange= function() {
			if (xhr.status== 200 && xhr.readyState ==4) {
				rs.innerHTML = xhr.responseText;
			}
		}
	}
</script>

</body>
</html>