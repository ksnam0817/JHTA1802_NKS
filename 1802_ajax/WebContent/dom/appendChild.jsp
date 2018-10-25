<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
#target {
	display:block;
	border: 1px solid olive;
	padding: 20px;
	box-sizing: border-box;
	width: 90%;
}
</style>

<title>appendChild</title>
</head>
<body>
	<h3>Attribute</h3>
	<p id='info'>
		특정 태그의 속성값을 설정하거나 취소하는 예
	</p>
	<font id='target'>
		이곳의 문자 색상과 정렬상태값이 버튼으로 설정됩니다.
	</font>
	<p/>
	<input type='color' name='textColor' id='textColor' />
	[
		<label>왼쪽정렬</label>
		<label><input type='radio' name='text_align' class='align' value='left' />왼쪽정렬</label>
		<label><input type='radio' name='text_align' class='align' value='center' />가운데정렬</label>
		<label><input type='radio' name='text_align' class='align' value='right' />오른쪽정렬</label>
	]
	<p/>
	<input type='button' value='확인' onclick='run()' />

<script>
function run() {
	var taget = document.getElementById('target');
	var color = document.getElementById('textColor');
	
	// 문자색상 변경
	target.setAttribute("color", color.value);
	var pos = target.innerHTML.indexOf(']');
	if (pos == -1) pos = target.innerHTML.length;
	var txt = target.innerHTML.substring(0, pos-1);
	target.innerHTML = txt + " ]]]  color : " + target.getAttribute("color");
	
	// 정렬 상태값 설정
	var alignNodes = document.getElementsByClassName('align');
	for (i=0; i<alignNodes.length; i++) {
		if (alignNodes[i].checked) {
			target.setAttribute("align", alignNodes[i].value);
		}
	}
}
</script>
</body>
</html>