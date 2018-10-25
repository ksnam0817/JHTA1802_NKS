<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>by_class_name</title>
</head>
<body>
<div id='by_class_name'>
	<h3>by_class_name</h3>
	<p id='info'>
		chekcbox의 class속성을 사용하여 체크박스를 선택한 후
		체크되어있는 요소만 관련정보를 출력
	</p>
	
	<form name='frm'>
		<label>당신의 취미 생활은?</label>
		<br/>
		<label><input type='checkbox' class='chk' value='축구'>축구</label>
		<label><input type='checkbox' class='chk' value='야구'>야구</label>
		<label><input type='checkbox' class='chk' value='농구'>농구</label>
		<label><input type='checkbox' class='chk' value='개발'>개발</label>
		<br/>
		<label><input type='checkbox' class='chk' value='마라톤'>마라톤</label>
		<label><input type='checkbox' class='chk' value='수영'>수영</label>
		<label><input type='checkbox' class='chk' value='탁구'>탁구</label>
		<p/>
		
		<input type='button' value='RUN' onclick='hobby()' />
		<input type='button' value='전체선택' onclick="hobby('enableAll')" />
		<input type='button' value='전체미선택' onclick="hobby('disableAll')" />				
	</form>
	<p/>
	
	<hr/>
	<div id='result'>
	</div>
</div>

<!-- 체크박스만을 선택한 후, 체크되어 있는 요소의 value값을 result영역에 표시하세요 -->
<script>
function hobby(flag) {
	var rs = document.getElementById('result');
	var str;
	
	var nodes = document.getElementsByClassName('chk');
	str = '<h4>전체 노드 갯수: ' + nodes.length + '<\/h4>';
	
	for (i=0; i<nodes.length; i++) {
		if (flag == 'enableAll') {
			nodes[i].checked = true;
		}else if (flag == 'disableAll') {
			nodes[i]
		}
		
		
		if (nodes[i].checked) {
			str += '<li>' + nodes[i].value + '<\/li>';
		}
	}
	
	rs.innerHTML = strc;
	
}


</script>
</body>
</html>