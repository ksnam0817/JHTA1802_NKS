<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>menu</title>

<script>
// jQuery
$(function(){
	$('#menu').css({
		'width' : '200px'
	});
	
	
	$('#menu').menu();
});
</script>


</head>
<body>
<div id='widget_menu'>
	<h3>menu</h3>
	<div id='info'>
		menu()를 사용하여 다단계 메뉴와 활성화/비활성화 상태의 메뉴를 구성한다
	</div>
	<hr/>
	
	<ul id='menu'>
		<li>
			<a href='#'>web</a>
			<ul>
				<li><a href='#'>html</a></li>
				<li><a href='#'>css</a></li>
				<li><a href='#'>javascript</a></li>
				<li>
					<a href='#'>jsp</a>
					<ul>
						<li><a href='#'>bean</a></li>
						<li><a href='#'>servlet</a></li>
						<li><a href='#'>jstl</a></li>
					</ul>
				</li>
			</ul>
		</li>
		
		<li>
			<a href='#'>application</a>
			<ul>
				<li><a href='#'>java</a></li>
				<li><a href='#'>android</a></li>
			</ul>
		</li>
	</ul>
</div>
</body>
</html>