<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ToggleEvent</title>

<!-- Toggle() => Deprecated and Removed -->


<style>
#toggleEvent #target {
	display: inline-block;
	width: 300px;
	height: 200px;
	border: 3px solid black;	
}

.addClass {
	background-color: olive;
}


</style>

</head>
<body>

<div id='toggleEvent'>
	
	<input type='button' value='Event Toggle' id='btnToggle' />
	<hr/>
	
	<div id='target'>
	</div>
</div>

<script>
$(document).ready(function(){
	$('#toggleEvent #btnToggle').toggle(evenFunc, oddFunc);
});

function evenFunc() {
	$('#toggleEvent #target').addClass('addClass');	
}

function oddFunc() {
	$('#toggleEvent #target').removeClass('addClass');
}


</script>

</body>
</html>