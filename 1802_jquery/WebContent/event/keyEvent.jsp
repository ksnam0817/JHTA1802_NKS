<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>keyEvent</title>
<style>
#msg {
	background-color: lightgray;
}
</style>
</head>
<body>
<div id='keyEvent'>
	
	<label>테스트 문자열: </label>
	<input type='text' size='70' name='msg' id='msg' />
	<hr/>
	
	<div id='result'>
	</div>
</div>

<script>
$(document).ready(function(){
	$('#keyEvent #msg').bind('keyup keydown', function(ev){
		var msg = '<li>key type: ' + ev.type
			    + '<li>key code: ' + ev.keyCode;
		
		$('#result').html(msg);
		
	});
});

</script>

















</body>
</html>