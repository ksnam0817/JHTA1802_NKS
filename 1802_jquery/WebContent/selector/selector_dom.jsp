<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector_dom</title>

<script>
	$(document).ready(function(){
		$('#selector_dom #btn').click(function() {
			$('#selector_dom .ok').css({'background-color' : 'olive'});		
			
			
		});	// End of btn.click()
	}); // End of ready()
	
</script>
</head>
<body>
<div id='selector_dom'>
	<fieldset>
	<legend>selector_dom</legend>
	<ol>
		<li>dom 1</li>
		<li>dom 2</li>
		<li>dom 3</li>
		<li class='ok'>dom 4</li>
		<li class='ok'>dom 5</li>
		<li class='ok'>dom 6</li>
	</ol>
	</fieldset>
	<p/>
	<input type='button' value='RUN' id='btn' />
</div>
</body>
</html>