<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>filter_mountains</title>
<script>
$(document).ready(function(){
	$('#filter_mountains #btn').click(function(){
		$('#filter_mountains li:nth-child(3n)').css({'text-decoration' : 'underline'});
		
	});	// end of btn.click
});	// End of ready
</script>

</head>
<body>
<!-- li태그로 유명한 산을 나열하고, 버튼을 클릭하면 3개 항목마다 문자열에 밑줄을 나타내세요. -->

<div id='filter_mountains'>
	<fieldset>
	<legend>filter_mountains</legend>
	<ol>
		<li>관악산</li>
		<li>백두산</li>
		<li>금강산</li>
		
		<li>한라산</li>
		<li>소요산</li>
		<li>Mt. Everest</li>
		
		<li>내장산</li>
		<li>송악산</li>
		<li>황산</li>
	</ol>
	</fieldset>
	<input type='button' value='RUN' id='btn' />
</div>
</body>
</html>