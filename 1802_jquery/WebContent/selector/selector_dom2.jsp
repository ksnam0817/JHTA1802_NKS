<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Selector - properties</title>

<style>

#content > div {
	border: 1px solid olive;
	width: 100px;
	height: 100px;
	margin: 10px;
}
</style>

<script>
$(document).ready(function(){
	$('div + p').css({'color' : 'red'});	
	$('ul + div').css({'color' : 'blue'});	
	$('#content div + div').css({'background-color' : 'gray'});	
});



</script>

</head>
<body>
	<div>
		<p> div > p</p>
	</div>
	
	<p> div + p </p>
	<ul>
		<li> ul > li </li>
	</ul>
	
	<div> ul + div</div>
	<div> ul + div</div>
	<div> ul + div</div>

</body>
</html>