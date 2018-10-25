<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>load XML</title>
</head>
<body>
<div id='loadXML'>
	<h3>XML file LOAD</h3>
	<p id='info'>
		XML형태 파일을 읽어 => 파서없이 화면에 표시
	</p>
	<input type='button' value='XML File load' id='btnLoad' />
	<p/>
	
	<div id='result'>
	
	</div>
</div>

<script>
var xhr;
var rs =  document.getElementById('result');
var btn = document.getElementById('btnLoad');

btn.onclick = function() {
	if (xhr == null) xhr = new XMLHttpRequest();
	
	xhr.open('get', '/1802_ajax/core/file.xml', true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.status==200 && xhr.readyState==4) {
			var xml = xhr.responseXML;
			
			var name = xml.getElementsByTagName("성명");
			var addr = xml.getElementsByTagName("주소");
			var contact = xml.getElementsByTagName("연락처");
			var zip = xml.getElementsByTagName("우편번호");
			
			var str= "";
			
			for (i=0; i<name.length; i++) {
			 str +=  "<ul>"
				 + "<li>성명: " + name.item(i).firstChild.nodeValue + "<\/li>"
				 + "<li>주소: " + addr.item(i).firstChild.nodeValue + "<\/li>"
				 + "<li>연락처: " + contact.item(i).firstChild.nodeValue + "<\/li>"
				 + "<li>우편번호: " + zip.item(i).firstChild.nodeValue + "<\/li>"
				 + "<\/ul>";
			}
			rs.innerHTML = str;
			
		}
	}
}

</script>

</body>
</html>