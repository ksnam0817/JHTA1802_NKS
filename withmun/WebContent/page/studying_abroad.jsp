<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="">외국어번역행정</a>
			> <a href="">개인</a>
			> <a href="./studying_abroad.do" class="on">유학 및 이민서류 관련</a>
		</div>
		<div class="toptit">
		    <h2><a href="./studying_abroad.do">유학 및 이민서류 관련</a></h2>
			<p>최상의 상품제공 및 서비스를 통하여 고객님께서 다시 찾으실 수 있도록 최선을 다하겠습니다.</p>
		</div>	
	</div>
</div>

<!------------------------------------------------------------------->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$(".jtoggle_up").click(function(){
		$(".toggle_menu").slideDown();
		$(".jtoggle_down").css("display","block");
		$(".jtoggle_up").css("display","none");		
	});
	$(".jtoggle_down").click(function(){
		$(".toggle_menu").slideUp();
		$(".jtoggle_down").css("display","none");
		$(".jtoggle_up").css("display","block");
	});

	$(".jtoggle_up2").click(function(){
		$(".toggle_menu2").slideDown();
		$(".jtoggle_down2").css("display","block");
		$(".jtoggle_up2").css("display","none");		
	});
	$(".jtoggle_down2").click(function(){
		$(".toggle_menu2").slideUp();
		$(".jtoggle_down2").css("display","none");
		$(".jtoggle_up2").css("display","block");
	});
});
</script>

<!------------------------------------------------------------------->

<div class ="main">
	 <div class="main_wrap">
	<%@ include file = "../include/left_foreign.jsp" %>	
		<div class = "content">			
			<div class ="content_first">
				<img src="./images/studying_abroad_topimg.jpg" alt="" alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second">					
					<img src="./images/sub_cu03_05.jpg" alt="" style="width:100%;">		
			</div>
		</div>
	</div>
</div>