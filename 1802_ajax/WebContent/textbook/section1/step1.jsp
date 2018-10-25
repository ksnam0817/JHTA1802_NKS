<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>get XMLHttpRequest Test</title>

<script>
var xhr = null;
var msg = "";
	
function getXMLHttpRequest() {
	
	if (window.XMLHttpRequest) {
		msg = "XMLHttpRequest객체 생성됨!";
	}
}	
	
function get() {
	xhr = getXMLHttpRequest();
	
}
</script>


</head>



<body>
	
</body>
</html>