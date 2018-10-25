<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>node_info</title>
</head>
<body>
<div id='node_info' class='info'>
	<h3>Node Information</h3>
	<p id='info'>
		특정 Node의 정보를 Element Interface를 사용하여 확인한다
	</p>
	<div id='div1' class='div1' style='color:olive'>
		Element interface를 사용한 Node의 정보
	</div>
	<p/>
	<input type='button' value='Information' onclick='info()' />
	<hr/>
	
	<div id='result'>
	결과가 표시될 영역(result)
	</div>
	
</div>

<script>
function info() {
	// 내가 핸들링하려는 영역을 일단 가져온다
	var rs = document.getElementById('result');
	var rootNode = document.getElementById('node_info');
	var str = '';
	
	str = '<li><b>Node Name: <\/b>' + rootNode.nodeName + '<\/li>'
		+ '<li><b>Root Node ID: <\/b>' + rootNode.id + '<\/li>'
		+ '<li><b>Root Node Class Name: <\/b> ' + rootNode.className + '<\/li>'
		+ '<li><b>Root Node Type: <\/b> ' + rootNode.nodeType + '<\/li>';
		
	// rootNode의 childNode 중에서 div인 것만 가져와 정보를 표시해 주기
	var childNodes = rootNode.getElementsByTagName('div');
	
	str += '<li><\/li>'
	    +  '<li><b>child node length: <\/b>' + childNodes.length + '<\/li>';
	    
	for (i=0; i<childNodes.length; i++) {
		str += '<li><li><b>child node id : <\/b>' + childNodes.item(i).id + '<\/li>'
			+  '<li><b> child node text content : <\/b>' + childNodes.item(i).firstChild.textContent + '';
	}
	
		
	rs.innerHTML = str;
}
</script>
</body>
</html>