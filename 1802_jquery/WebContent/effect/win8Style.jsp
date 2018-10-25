<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>win8Style</title>
</head>
<style>


#layout {
	position: relative;
	width: 400px;
	height: 600px;
}

#layout > div {
	position: absolute;
}

#layout #left_top, #layout #right_top {
	width:200px;
	height: 400px;
}

#layout #right_top {
	left: 200px;
}

#layout #bottom {
	top: 400px;
	width:400px;
	height: 200px;
}

#layout img {
	width: 100%;
	height: 100%;
	border: 1px solid olive;
}


</style>


<body>
<div id='win8'>
	
	<!-- 설명 -->
	<h3>win8 style</h3>
	<div id='info'>
		css와 hover이벤트를 사용한 간단한 win8스타일 레이아웃 구성
	</div>
	
	<!-- 시작 -->
	<div id='layout'>
		<div id='left_top' >
			<img src='./img/lt1.jpg' class='first'>
			<img src='./img/lt2.jpg' class='second'>
		</div>
	
		<div id='right_top' >
			<img src='./img/rt1.jpg' class='first'>
			<img src='./img/rt2.png' class='second'>
		</div>
		
		<div id='bottom' >
			<img src='./img/bt1.PNG' class='first'>
			<img src='./img/bt2.PNG' class='second'>
		</div>
	</div>
	
</div>

<script>
// jQuery
$(document).ready(function(){
	
	// left_top
	$('#layout #left_top').mouseenter(function(){
		$('#left_top .first').hide(1000);
		$('#left_top .second').fadeIn(1000);
	});
	
	$('#layout #left_top').mouseleave(function(){
		$('#left_top .second').hide(1000);
		$('#left_top .first').fadeIn(1000);
	});
	
	// rigth_top
	$('#layout #right_top').mouseenter(function(){
		$('#right_top .first').hide(1000);
		$('#right_top .second').fadeIn(1000);
	});
	
	$('#layout #right_top').mouseleave(function(){
		$('#right_top .second').hide(1000);
		$('#right_top .first').fadeIn(1000);
	});
	
	// bottom
	$('#layout #bottom').mouseenter(function(){
		$('#bottom .first').hide(1000);
		$('#bottom .second').fadeIn(1000);
	});
	
	$('#layout #bottom').mouseleave(function(){
		$('#bottom .second').hide(1000);
		$('#bottom .first').fadeIn(1000);
	});
	
});	// End of jQuery

</script>

</body>
</html>