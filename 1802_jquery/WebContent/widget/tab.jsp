<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tab</title>



<script>
$(document).ready(function(){
	$('#tabs').tabs();
	$('#tabs').css('height', '400px');
	
	$('#tab #keyEvent').load('./event/keyEvent.jsp');
	$('#tab #oneEvent').load('./event/oneEvent.jsp');
	$('#tab #triggerEvent').load('./event/triggerEvent.jsp');
	$('#tab #toggleEvent').load('./event/toggleEvent.jsp');
});
</script>

</head>
<body>
<div id='tab'>
	<h3>tabs</h3>
	<div id='info'>
		jQueryUI의 tabs()를 사용하여 메뉴를 탭형태로 구성
	</div>
	
	<div id='tabs'>
		<!-- 탭의 목록 -->
		<ul>
			<li><a href='#keyEvent'>keyEvent</a></li>
			<li><a href='#oneEvent'>oneEvent</a></li>
			<li><a href='#triggerEvent'>triggerEvent</a></li>
		</ul>
		
		<hr/>
		<div id='keyEvent'>keyEvent</div>
		<div id='oneEvent'>oneEvent</div>
		<div id='triggerEvent'>triggerEvent</div>
		
		
	</div>
	
	
	
</div>

</body>
</html>