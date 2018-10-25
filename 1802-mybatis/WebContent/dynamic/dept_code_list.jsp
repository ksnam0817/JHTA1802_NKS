<%@page import="bean.DeptVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dept_code_list.jsp</title>
</head>
<body>
<h3>dept_code_list.jsp</h3>
<%
EmpDao dao = new EmpDao();
List<DeptVo> list = dao.foreachTestDeptList();
request.setAttribute("deptList", list);
%>

<c:forEach var='d' items='${deptList}'>
	<label class='dept_list'>
		<input type='checkbox' name='deptNames' value='${d.department_id}' />${d.department_name}
	</label>
</c:forEach>


</body>
</html>