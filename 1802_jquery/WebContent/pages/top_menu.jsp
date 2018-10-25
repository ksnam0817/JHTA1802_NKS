<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>top_menu.jsp</title>

<script>
$(document).ready(function() {
	// 페이지 새로고침해도 현재페이지 유지하기
	var left_menu;
	var content;
	
	// 왼쪽메뉴
	if (sessionStorage.getItem('left_menu') != null) {
		left_menu = sessionStorage.getItem('left_menu');
		$('#left_menu').load(left_menu);
	}
	
	// 오른쪽 메뉴
	if (sessionStorage.getItem('content') != null) {
		content = sessionStorage.getItem('content');
		loadPage(content);
	}
	
	
	$('#top_items  span').click(function(ev) {
		//var item = ev.target.innerHTML;
		var item = $(this).text();
		left_menu = './pages/left_menu.jsp #'+item;
		
		$('#left_menu').load(left_menu);
		sessionStorage.setItem("left_menu", left_menu);
	}); // End of span.click
	
	
});	// End of ready

function loadPage(page) {
	$('#content').load(page);
	sessionStorage.setItem("content", page);
}

</script>



</head>
<body>
	<div id='top_items'>
		<span>All</span>
		<span>Selector</span>
		<span>Filter</span>
		<span>Traverse</span>
		<span>Manipulation</span>
		<span>Core</span>
		<span>Event</span>
		<span>Effect</span>
		<span>Interaction</span>
		<span>Widget</span>
		<span>Ajax</span>
		<span>Parsing</span>
		<span>Board</span>
	</div>



</body>
</html>