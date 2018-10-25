<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>popup</title>

<style>
.horizontal {
	display:inline-block;
}


#popup #menu1, #popup #menu2 {
	position: relative;
}

#popup #sub1, #popup #sub2 {
	width:200px;
	border: 1px solid gray;
	padding: 2px;
	box-sizing: border-box;
}


#popup #item1, #popup #item2 {
	width:200px;
	background-color: olive;
	position: absolute;
	display:none;
}


</style>
</head>

<body>
<div id='popup'>
	
	<input type='button' value='세로모드' id='btnV' />
	<input type='button' value='가로모드' id='btnH' />
	<hr/>
	
	<div id='menu'>
		<!-- menu1 -->
		<div id='menu1'>
			<div id='sub1'>
			<span>파일 메뉴(sub1)</span>
			</div>
			<div id='item1'>
			
			<fieldset>
			<legend>item1</legend>
			<ul>
				<li>파일 읽기</li>
				<li>파일 저장</li>
				<li>새이름으로 저장</li>
				<li>파일명 변경</li>
			</ul>
			</fieldset>
			</div>
		</div>
	
		<!-- menu2 -->
		<div id='menu2'>
			<div id='sub2'>
			<span>편집 메뉴(sub2)</span>
			</div>
			<div id='item2'>
			<fieldset>
			<legend>item2</legend>
			<ul>
				<li>복사하기</li>
				<li>잘라내기</li>
				<li>이동하기</li>
				<li>줄간격</li>
			</ul>
			</fieldset>
			</div>
		</div>
	</div>
</div>

<script>
// jQuery
$(document).ready(function(){
	
	// sub1 클릭되면
	$('#popup #sub1').click(function(){
		$('#popup #item2').hide(600);		
		$('#popup #item1').slideToggle(600);		
	});
	
	// sub2 클릭되면
	$('#popup #sub2').click(function(){
		$('#popup #item1').hide(600);		
		$('#popup #item2').slideToggle(600);		
	});
	
	// 가로모드
	$('#popup #btnH').click(function(){
		$('#popup #menu1, #popup #menu2').addClass('horizontal');
	});
	
	// 세로모드
	$('#popup #btnV').click(function(){
		$('#popup #menu1, #popup #menu2').removeClass('horizontal');
	});
	
});	// End of jQuery

</script>

</body>
</html>