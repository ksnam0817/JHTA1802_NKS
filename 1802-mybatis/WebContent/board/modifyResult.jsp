<%@page import="bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modifyResult</title>
</head>
<body>
<div id='insertResult'>
<h3>myBatis게시판 - 글 수정결과</h3>

<%
BoardDao dao = new BoardDao();
String msg = dao.modify(request);
out.print(msg);
%>
</div>
</body>
</html>