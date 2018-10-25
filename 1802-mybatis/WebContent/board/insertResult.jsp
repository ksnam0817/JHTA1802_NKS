<%@page import="bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertResult</title>
</head>
<body>
<div id='insertResult'>
<%
BoardDao dao = new BoardDao();
String msg = dao.insert(request);
out.print(msg);
%>
</div>
</body>
</html>