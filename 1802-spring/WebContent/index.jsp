<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1802-spring</title>
<link rel="stylesheet" type='text/css' href='./lib/main.css'/>
<script src="./lib/jquery-3.3.1.min.js"></script>



<script>
$(function(){
	var inc_url = sessionStorage.getItem("inc_url");
	
	//페이지를 새로고침하였을 때 기존 정보 유지
	if( inc_url != null){
		var inc_param = sessionStorage.getItem("inc_param");
		$('#content').load(inc_url, inc_param);
	}
	
})

function viewResult(url, frm){
	var param = $(frm).serialize();
	$('#result').load(url, param);
	
	sessionStorage.setItem('inc_url', url);
	sessionStorage.setItem('inc_param', param);
}

function viewContent(url, frm){
	
	var param = $(frm).serialize();
	param += "&nowPage=1";
	$('#content').load(url, param);
	
	sessionStorage.setItem('inc_url', url);
	sessionStorage.setItem('inc_param', param);

}
</script>


</head>
<body>
<div id='main'>
	<%@include file="top.jsp" %>
	<%@include file='header.jsp' %>
	
	<div id='center'>
		<%@include file='menu.jsp' %>
		<div id='content'><%@include file='intro.jsp' %></div>
	</div>
	
	<%@include file='footer.jsp' %>
</div>
</body>
</html>