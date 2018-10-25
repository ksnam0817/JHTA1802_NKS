<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>One Event</title>
</head>
<body>
<div id='oneEvent'>

	<input type='button' value='여러번' id='btnMulti' />
	<input type='button' value='한번만' id='btnOne' />
	<hr/>
	
	<div id='result'></div>
</div>
<script>
$(document).ready(function(){
	var cnt=0;
	
	$('#oneEvent #btnMulti').click(function(){
		cnt++;
		$('#oneEvent #result').html(cnt + '번째 클릭됨');
	});

	$('#oneEvent #btnOne').one('click', function(){
		cnt++;
		$('#oneEvent #result').html(cnt + '번째 클릭됨');
	});
}); // End of ready


</script>
</body>
</html>