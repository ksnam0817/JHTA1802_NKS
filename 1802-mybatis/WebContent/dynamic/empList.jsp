<%@page import="bean.EmpVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>empList</title>
</head>
<body>
<%
String[] deptNames = request.getParameterValues("deptNames");
System.out.println(deptNames.length);
EmpDao dao = new EmpDao();

List<EmpVo> list = dao.foreachTest(deptNames);



request.setAttribute("list", list);
%>
<h4>부서원 [ 검색인원: ${fn:length(list)}]</h4>

<c:forEach var='vo' items='${list}'>
	<ul class='list'>
		<li>사번 : ${vo.employee_id}</li>
		<li>성명: ${vo.first_name}</li>
		<li>연락처: ${vo.phone_number}</li>
		<li>급여: ${vo.salary}</li>		
	</ul>
</c:forEach>

</body>
</html>