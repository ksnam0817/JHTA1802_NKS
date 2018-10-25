<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>suggest</title>
<style>
#suggest {
	position: relative;
}

#suggest #sel {
	position: absolute;
	margin-top:6px;
	width:220px;
	top:140px;
	display:none;
}
</style>

</head>
<body>
<div id='suggest'>
	<h3>JSON을 사용한 제시어 기능</h3>
	<p id='info'>
		검색어를 사용하여 suggest_result.jsp를 호출하면 => 검색결과가 JSON 타입으로 리턴된다.
	</p>
	<form name='frm'>
	<label>검색</label>
	<input type='text' name='findStr' id='findStr' placeholder='성명, 연락처, 이메일로 검색' />
	
	<select size='10' name='sel'id='sel'></select>
	
	<input type='button' value='검색' id='btnFind' />
	</form>
	<p/>
	
	<div id='result'></div>
	
	
</div>
<script>
var xhr;
var rs = document.getElementById('result');
var btn = document.getElementById('btnFind');
var sel = document.getElementById('sel');

// [검색]버튼 누른 경우
btn.onclick = function() {
	if (xhr == null) xhr = new XMLHttpRequest();
	
	var findStr = document.getElementById('findStr').value;
	var url = '/1802_ajax/dom/suggest_result.jsp?findStr=' + findStr;  
	
	xhr.open('get', url, true);
	
	xhr.onreadystatechange = function() {
		if (xhr.status==200 && xhr.readyState==	4) {
			var temp = xhr.responseText;
			// text형태의 JSON타입 문자열을 JSON Objec로 변환
			var list = JSON.parse(temp);
			
	     var str =  "<table border='1' >";
			str += "<tr>"
			    +  "<th>사번<\/th>"
			    +  "<th>성명<\/th>"
			    +  "<th>이메일<\/th>"
			    +  "<th>연락처<\/th>"
			    +  "<th>급여<\/th><\/tr>"
			for (i=0;i<list.length-1;i++) {
				str += "<tr>"
					+ "<td>" + list[i].id + "<\/td>"
					+ "<td>" + list[i].name + "<\/td>"
					+ "<td>" + list[i].email + "<\/td>"
					+ "<td>" + list[i].phone + "<\/td>"
					+ "<td>" + list[i].salary + "<\/td>"
					+ "<\/tr>";
			}
			str += "<\/table>";
			rs.innerHTML = str;
		}
	}
	xhr.send();
}

// 검색어가 변경되거나 입력된 경우
findStr.onkeyup = function() {
	if (document.getElementById('findStr').value.length <=0) {
		sel.style.display = "none";
	}else {
		sel.style.display = 'block';
	}
	
	var findStr = document.getElementById('findStr').value;
	var url = '/1802_ajax/dom/suggest_find.jsp?findStr=' + findStr;  
	
	if (xhr == null) xhr = new XMLHttpRequest();
	xhr.open('get', url, true);
	xhr.send();
	
	xhr.onreadystatechange = function() {
		if (xhr.status==200 && xhr.readyState==4) {
		var find = JSON.parse(xhr.responseText);
			
			// select박스 초기화
			sel.length = 0;
			
			for(var i=0; i<find.length-1; i++) {
		    	sel.options[i] = new Option(find[i], find[i]);	
			}
			
			sel[0].seletected = true;
		}
	}
}

// 셀렉트박스를 더블클릭한 경우
sel.ondblclick = function() {
	findStr.value = sel[sel.selectedIndex].text;
	sel.style.display = 'none';
}

sel.onkeyup = function(ev) {
	if (ev.keyCode == 13) {		// 엔터키
		findStr.value = sel[sel.selectedIndex].text;
		sel.style.display = 'none';
		btnFind.focus();		// 바로 검색할 수 있도록 포커스 이동
	}
}

















</script>

</body>
</html>