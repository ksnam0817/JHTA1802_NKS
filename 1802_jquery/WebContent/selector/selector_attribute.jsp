<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector_attribute</title>

<script>
	$(document).ready(function() {
		$('#selector_attribute #btn').click(function() {
			/* $('#selector_attribute #center div').css("border", "1px solid gray"); */
			
			$('#selector_attribute #center p').css({'color':'pink',
													'background-color': 'gray'});
			
			$('#selector_attribute #center').css({'border' : '1px dotted blue',
												  'padding' : '10px'});
			
			$('#selector_attribute').css({'overflow' : 'hidden'});
			$('#selector_attribute #center').css({'width' : '200px',
												  'float' : 'left'});
			
			$('#selector_attribute .center span').css({'width' : '100px',
													   'height' : '40px',
													   'color' : 'brown'});
			
			
			
		}); // End of btn.click
	}); // End of ready
</script>

</head>
<body>
<div id='selector_attribute' >
	<h3>id, class 또는 속성을 사용한 요소 선택</h3>
	<p id='info'>
		태그에 선언되어 있는 속성들을 사용하여 요소를 선택하는 방법
	</p>
	
	<div id='center'>
		<p>P 1 </p>
		<div>DIV 1</div>
		<p>P 2 </p>
	</div>
	
	<div class='center'>
		<span>SPAN 1</span>
		<div>DIV 2</div>
		<span>SPAN 2</span>
	</div>
	<p/>
	<input type='button' value='RUN' id='btn' />
</div>
</body>
</html>