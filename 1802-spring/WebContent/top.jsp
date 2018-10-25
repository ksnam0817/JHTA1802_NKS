<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script>
$(function(){
	$('#btnLogin').click(function(){
		location.href = 'login.std';
	})
	$('#btnLogout').click(function(){
		location.href = 'logout.std';
	})
})
</script>
</head>
<body>
<div id='login_zone'>
	<c:choose>
		<c:when test="${session_id == null  }">
			<input type='button' value='로그인' id='btnLogin'>
		</c:when>
		<c:when test="${session_id != null  }">
			<input type='button' value='로그아웃' id='btnLogout'>
		</c:when>
	</c:choose>
</div>
</body>
</html>