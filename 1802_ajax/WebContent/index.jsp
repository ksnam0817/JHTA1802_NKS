<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<script>
// ajax로 삽입된 페이지 => javascript 실행되지 않는다
// 다른곳에서 쓸 수 있게 밖으로 뺐음
var xhr;


// 윈도우가 로드되면
window.onload = function() {
	// ajax 사용을 위해 가장 중요한 객체
	xhr = new XMLHttpRequest();
	xhr.open('get', '/1802_ajax/menu.jsp', true);
	xhr.onreadystatechange = menuLoad;				// 상태값이 바뀔때마다 menuLoad 호출한다
	xhr.send();
}

function menuLoad() {
	var left = document.getElementById('left');
	
	if (xhr.status=200 && xhr.readyState==4) {
		var str = xhr.responseText;
		left.innerHTML = str;
	}
} // end of menuLoad

function pageLoad(url) {
	if (xhr == null) xhr = new XMLHttpRequest();
	var content = document.getElementById('content');
	
	xhr.open('get', url, true);
	xhr.onreadystatechange = function() {
		if(xhr.status==200 && xhr.readyState==4) {
			var doc = xhr.responseText;
			content.innerHTML = doc;
			makeScript(doc);
		}
	}
	xhr.send();
}

// ajax로 include된 파일의 script부분 parsing
function makeScript(doc) {
	
	// script 태그 사이에 있는 모든 문자열을 match
	var mat = doc.match(/<script[^>]*>(([^<]|\n|\r|<[^\/])+)<\/script>/);
	
	var sc = document.getElementById('script');
	if (mat == null) return;
	sc.text = mat[1];
	eval.call(window, sc.text);
}




</script>

<!-- include된 페이지의 스크립트 부분이 로딩될 부분 -->
<script id='script'></script>



<style>
div {
	border: 1px solid gray;
}

#ajax {
	width: 1000px;
	margin: 0 auto;
}

#ajax #header {
	background-color: #eeeeee;
	border-radius: 6px;
	height: 80px;
	text-align: center;

}

#ajax #center {
	overflow: hidden;
}

#ajax #center #left {
	display: inline-block;
	width: 240px;
	float: left;
}

#ajax #center #content {
	display: inline-block;
	width: 740px;
	float: right;
}

#ajax #footer {
	background-color: #eeeeee;
	border-radius: 6px;
	height: 60px;
	text-align: center;
}


</style>
</head>


<body>

<div id='ajax'>
	<div id='header'>
		1802 ajax homepage
	</div>
	
	<div id='center'>
		<div id='left'>
		left
		</div>
		<div id='content'>
		content
		</div>
	</div>
	
	<div id='footer'>
	footer
	</div>
	
	
	
</div>


</body>
</html>