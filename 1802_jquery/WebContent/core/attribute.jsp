<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>attribute</title>

<style>
.menu_item {
	list-style: none;
	padding: 5px;
	box-sizing: border-box;
	width: 60px;
	margin: 3px;
	border: 1px solid black;
}

.add_class {
	/*display: inline-block; */
	display: table-cell;
}

</style>

</head>
<body>
<div id='attribute'>
	<h3>attribute</h3>

	<fieldset>
	<legend>음식</legend>
	<ul>
		<li>한식</li>
		<li>양식</li>
		<li>중식</li>
		<li>분식</li>
		<li>외식</li>
		<li>조식</li>
		<li>석식</li>
		<li>학식</li>
		<li>급식</li>
	</ul>
	</fieldset>
	
	<input type='button' value='remove Attribute' id='btnRemoveAttr' />
	<input type='button' value='add Attribute' id='btnAddAttr' />
	<input type='button' value='Toggle Attribute' id='btnToggle' />
	
</div>

<script>
// $(document).ready(function(){});
$(function() {
	$('#attribute ul li').addClass('menu_item');
	
	$('#btnRemoveAttr').click(function(){
		$('#attribute ul li').removeAttr('class');
	});
	
	$('#btnAddAttr').click(function(){
		$('#attribute ul li').addClass('add_class');
	});
	
	$('#btnToggle').click(function(){
		$('#attribute ul li').toggleClass('menu_item');
	});
	
	
	
	
	
	
	
	
	
	
	
	
});
</script>
</body>
</html>