<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrapper" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc3-38" data-genuitec-path="/withmun/WebContent/page/employment_notice.jsp">
	<div class="container">
		<div class ="top">
			<a href="./index.jsp" ">HOME</a>
			> <a href="./service_procedure.do" >Other</a>
			> <a href="./employment_notice.do" class="on">채용공고</a>
		</div>
		<div class="toptit">
		    <h2><a href="./employment_notice.do">채용공고</a></h2>
			<p>신뢰와 나눔속에 사랑받는 기업으로 기억되고자 합니다.</p>
		</div>	
	</div>
</div>
<!------------------------------------------------------------------->

<script>
$(document).ready(function(){
	$(".jtoggle_up").click(function(){
		$(".toggle_menu").slideDown();
		$(".jtoggle_down").css("display","block");
		$(".jtoggle_up").css("display","none");
		$(".line2").css("display","block");
		
	});
	$(".jtoggle_down").click(function(){
		$(".toggle_menu").slideUp();
		$(".jtoggle_down").css("display","none");
		$(".jtoggle_up").css("display","block");
		$(".line2").css("display","none");
	
	});
});
</script>
<!------------------------------------------------------------------->

<div class ="main">
<div class="main_wrap">
	<%@ include file = "../include/left_other.jsp" %>
		<div class = "content">			
			<div class ="content_second" style="margin-top:0;text-align:center">
			     <div class ="second">				
					<img src="./images/recruit.jpg" alt="withmun" style="width:100%"/>
				</div>
			</div>	
		</div>
	</div>
</div>