<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-36" data-genuitec-path="/withmun/WebContent/page/certificate.jsp">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" >HOME</a>
			> <a href="">외국어번역행정</a>
			> <a href="">개인</a>
			> <a href="./certificate.do" class="on">번역확인증명서</a>
		</div>
		<div class="toptit">
		    <h2><a href="./english_contract.do">번역확인증명서</a></h2>
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
				<img src="./images/certificate_topimg.jpg" alt="" style="width:100%;height:100%;">
			</div>

			<div class ="content_second">			
					<img src="./images/sub_cu02_02.jpg" alt="" style="width:100%;">		
			</div>
		</div>
	</div>
</div>