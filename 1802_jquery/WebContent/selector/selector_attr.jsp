<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector_attr</title>

<script>
$(document).ready(function(){
	$("#content div[align != 'center']").css('background-color', 'lightgray');
	$("#content div[align != 'center']").css('background-color', 'darkgray');
	$("#content div[align != 'center']").css('background-color', 'gray');
});
</script>


<style>
#content div {
	border: 2px solid black;
	width: 200px;
	height: 100px;
	margin: 10px;
}

</style>

</head>
<body>



<div align='left'>
	div align='left'
</div>

<div align='center'>
	div align='center'
</div>

<div align='right'>
	div align='right'
</div>







</body>
</html>