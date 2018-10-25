<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Attribute</title>
</head>
<body>
<div id='append_child'>
	<h3>appendChild</h3>
	<p id='info'>
		appendChild()와 removeChild()를 사용하여 Element를 추가하거나 제거
	</p>
	<input type='button' value='Append' onclick='append()' />
	<input type='button' value='RemoveAll' onclick='removeAll()' />
	<p/>
	
	<div id='result'></div>
</div>

<script>
var cnt = 0;
var rs = document.getElementById('result');

function append() {
	var ele = makePanel();
	rs.appendChild(ele);
}




// 하나의 div 안에 input과 button을 추가하여 반환
function makePanel() {
	var div = document.createElement("div");
	var input = document.createElement("input");
	var btn = document.createElement("input");
	
	// text상자의 속성 지정
	input.setAttribute("type", "text");
	input.setAttribute("name", "id" + cnt)
	input.setAttribute("value", "aaaa" + cnt);
	cnt++;
	
	// 삭제버튼 속성 지정
	btn.setAttribute("type", "button");
	btn.setAttribute("value", "Del");
	btn.addEventListener("click", remove);	// btn.onclick = remove;
	
	div.appendChild(input);
	div.appendChild(btn);
	
	return div;
}


function removeAll() {
	rs.innerHTML = 'remove';
	console.log('remove');
}

function remove(ev) {
	var ele = ev.srcElement;			// 이벤트가 발생한 버튼
	var pDiv = ele.parentNode;			// 버튼을 포함한 구성요소
	
	rs.removeChild(pDiv);
}

</script>

</body>
</html>