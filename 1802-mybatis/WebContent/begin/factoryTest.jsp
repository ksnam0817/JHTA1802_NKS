<%@page import="bean.BeginFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>factoryTest</title>
</head>
<body>
<div id='factoryTest'>
	<h3>factoryTest</h3>
	<div id='info'>
		SqlSessionFactory가 생성되어 반환되는지 여부를 테스트
	</div>
	<%
		SqlSession s = BeginFactory.getFactory().openSession();
		
		if (s == null) {
			out.print("세션 생성시 오류 발생 ㅜ.ㅜ");
		}else {
			out.print("세션 생성 성공!");
		}
	%>
	
</div>
</body>
</html>