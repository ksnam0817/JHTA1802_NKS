<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>responseText</title>
</head>
<body>
<script type="text/javascript">
var xhr;
function start() {
	xhr = new XMLHttpRequest();
	xhr.open('get', './test.txt', true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 & xhr.status == 200){
			
		}
		}
	
}
</script>

</body>
</html>