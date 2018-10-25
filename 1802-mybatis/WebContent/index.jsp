<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- jQuery library -->
<script src="./lib/jquery-3.3.1.js"></script>

<link rel='stylesheet' type='text/css' href='./css/index.css'>

<script>
// jQuery(페이지 로딩되면 실행)
$(document).ready(function(){
	$('#leftMenu').load('./pages/leftMenu.jsp');
	$('#content').load('./pages/intro.jsp');
});
</script>



<title>myBatis index</title>
</head>
<body>
<div id='index'>

	<!-- 위부분 -->
	<div id='header'>
	<%@ include file='./pages/header.jsp' %>
	</div>
	<div id='topMenu'>
	<%@ include file='./pages/topMenu.jsp' %>
	</div>
	
	<!-- 중간 부분 -->	
	<div id='middle'>
		<div id='leftMenu'>
		</div>

		<div id='content'>
		</div>
	</div>
	
	<!-- 아래 부분 -->
	<div id='footer'>
	<%@ include file='./pages/footer.jsp' %>
	</div>	
	
</div>


</body>
</html>