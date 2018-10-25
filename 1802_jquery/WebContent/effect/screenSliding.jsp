<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Screen Sliding</title>
<style>

/* 8월 8일꺼 */
#screen {
	border: 1px solid black;
	position: relative;
	overflow: hidden;
	width: 400px;
	height: 460px;
}

#screen > input {
	position: absolute;
	font-size: 160px;
	top: 100px;
	z-index: 10;
	background: none;
	border: none;
}

#screen > input#btnNext {
	right:0;
}

#screen #slideMain {
	position:relative;
	width:2000px;
}

#screen .slide{
	width: 400px;
	display: inline-block;
	float: left;
}





/* 8월 7일꺼 */
/* #screen {
	position:relative;
	overflow: hidden;
	width: 400px;
	height: 400px;
}

#screen > input {
	position:absolute;
	font-size: 160px;
	color: olive;
	opacity: 0.7;
	background: none;
	top: 70px;
	border: none;
}

#screen > input#btnNext {
	right: 0px;
}

#slideMain {
	width: 2000px;
}

#slideMain > div {
	margin: 4px;
	display: linline-block;
	float: left;
} */
</style>


</head>
<body>
<div id='screen'>
	<!-- 버튼들 -->
	<input type='button' value='&lt;' id='btnPrev' />
	<input type='button' value='&gt;' id='btnNext' />
	
	<div id='slideMain'>
		<div class='slide'>
			<span>1번째 화면</span><br/>
			<img src='./img/moomin1.png' width='400px' height='400px' />		
		</div>
		<div class='slide'>
			<span>2번째 화면</span><br/>
			<img src='./img/moomin2.jpg' width='400px' height='400px' />		
		</div>
		<div class='slide'>
			<span>3번째 화면</span><br/>
			<img src='./img/moomin3.png' width='400px' height='400px' />		
		</div>
		<div class='slide'>
			<span>4번째 화면</span><br/>
			<div id='exFilter'></div>		
		</div>
		<div class='slide'>
			<span>5번째 화면</span><br/>
			<div id='exEach'></div>		
		</div>
	</div>
	
</div>

<script>
// jQuery
$(document).ready(function(){
	var pos = 0;								// 위치
	var slides =  $('#screen .slide').get();	// 모든 .slide가 배열형태로 반환됨
	
	// 4,5번째 slide에는 외부에서 문서를 읽어들여 표시
	$('#exFilter').load('./filter/filter_mountains.jsp #filter_mountains');
	$('#exEach').load('./core/each.jsp #each');
	
	
	// [Next]버튼 클릭시
	$('#screen #btnNext').click(function(){
		pos -= 400;
		if (pos <= -2000) pos = 0;
		$('#screen #slideMain').animate({marginLeft:pos}, 600);
		
	});
	
	// [Prev]버튼 클릭시
	$('#screen #btnPrev').click(function(){
		pos += 400;
		
		if (pos > 0) pos = -1600;
		$('#screen #slideMain').animate({marginLeft:pos}, 600);
	});
}); // end of jQuery

</script>

</body>
</html>