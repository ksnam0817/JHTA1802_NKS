<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>topMenu</title>

<script>
// jQuery
$(document).ready(function(){
	// 페이지 새로고침해도 현재페이지 유지하기
	var leftMenu;
	var content;
	
	// #leftMenu
	if (sessionStorage.getItem('leftMenu') !=null) {
		leftMenu = sessionStorage.getItem('leftMenu');
		$('#leftMenu').load(leftMenu);
	}
	
	// #content
	if (sessionStorage.getItem('content') != null) {
		content = sessionStorage.getItem('content');
		loadPage(content);
	}
	
	
	$('#pageTopMenu ul li').click(function(ev) {
		var item = $(this).text();
		leftMenu = './pages/leftMenu.jsp #'+item;	// leftMenu.jsp에서 #item 부분만
		
		$('#leftMenu').load(leftMenu);
		sessionStorage.setItem("leftMenu", leftMenu);
	}); 
	
	
}); // End of jQuery

function loadPage(page) {
	$('#content').load(page);
	sessionStorage.setItem("content", page);
}
</script>

</head>
<body>
<div id='pageTopMenu'>
<ul>
	<li>All</li>
	<li>Begin</li>
	<li>SqlMap</li>
	<li>DynamicSQL</li>
</ul>
</div>
</body>
</html>