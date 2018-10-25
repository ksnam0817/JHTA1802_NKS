<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>accordion</title>

<script>
// jQuery
$(document).ready(function(){
	$('#accordion').accordion();
});
</script>

</head>
<body>
	<div id='layout_accordion'>
		<h3>Accordion</h3>
		<div id='info'>
			accordion()을 사용해서 간단하게 accordion 타입의 메뉴 생성
		</div>
		<hr/>
		
		<div id='accordion'>
			<h3>WEB</h3>
			<div>
				<ul>
					<li>html</li>
					<li>css</li>
					<li>javascript</li>
				</ul>
			</div>		
			
			<h3>framework</h3>
			<div>
				<ul>
					<li>ajax</li>				
					<li>jQuery</li>				
					<li>mybatis</li>				
					<li>spring</li>				
				</ul>
			</div>
		</div>
		
	</div>
</body>
</html>