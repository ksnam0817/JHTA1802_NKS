<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>traverse</title>
<script>
$(document).ready(function(){
	$('#traverse #btn').click(function(){
		// filter
		// $('#traverse li:nth-child(3n)').css({'text-decoration' : 'underline'});
		
		// traverse
		$('#traverse li').filter(function(index){
			if (index%3 == 0) {
				$(this).css({'background-color': 'brown'})
			}
		});
		
	});	// end of btn.click
});	// End of ready

</script>

</head>
<body>
<p id='info'>
traverse
</p>

<div id='traverse'>
	<fieldset>
	<legend>traverse</legend>
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