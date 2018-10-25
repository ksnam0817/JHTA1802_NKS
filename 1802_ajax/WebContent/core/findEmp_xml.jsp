<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findEmp</title>
</head>
<body>
<!-- 성명의 일부분을 입력받아 ajax를 사용하여 findEmp_result.jsp 호출 -->
<div id='findEmp'>
	<h3>Employees테이블 검색(XML)</h3>
	<p id='info'>
		Employees테이블 검색(XML)
	</p>
	
	<form name='frm'>
		<label>성명의 일부분</label>
		<input type='text' name='name' value='a' />
		<input type='button' value='검색' id='btn' />
	</form>
	<hr/>
	
	<div id='result'></div>
	
</div>

<script>
var xhr;
var btn = document.getElementById('btn');
var rs = document.getElementById('result');
var f= document.frm;

btn.onclick = function() {
	if (xhr == null) xhr = new XMLHttpRequest();
	
	var str = '';
	var name = f.name.value;
	var param = '?name=' + name;
	var url = "/1802_ajax/core/findEmp_result_xml.jsp" + param;
	
	xhr.open('get', url, true);
	xhr.send();
	
	// 상태값이 바뀌면
	xhr.onreadystatechange = function() {
		if (xhr.status==200 && xhr.readyState==4) {
			var xml = xhr.responseXML;
			
			var id = xml.getElementsByTagName("id");
			var name = xml.getElementsByTagName("name");
			var phone = xml.getElementsByTagName("phone");
			var salary = xml.getElementsByTagName("salary");
			
			var str = "<table border='1' cellpadding='4' cellspacing='0'>"
					+ "<tr><th>아이디<\/th><th>성명<\/th><th>연락처<\/th><th>급여<\/th><\/tr>";
			
			for (i=0; i<id.length; i++) {
				str += "<tr>"
					+  "<td>" + id.item(i).firstChild.nodeValue + "<\/td>"
					+  "<td>" + name.item(i).firstChild.nodeValue + "<\/td>"
					+  "<td>" + phone.item(i).firstChild.nodeValue + "<\/td>"
					+  "<td>" + salary.item(i).firstChild.nodeValue + "<\/td>"
					+ "<\/tr>";
			}
			str += "<\/table>";
			rs.innerHTML = str;
		}
	}
}

</script>


</body>
</html>