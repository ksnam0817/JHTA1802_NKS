<%@page import="bean.EmpVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- FindEmp_result_json.jsp 파일에서  --%>
<%-- SQL문 수정하기(성명, 연락처, 이메일 중 하나로 검색되도록) --%>

<%
String findStr = request.getParameter("findStr");
/* String phone = request.getParameter("phone");
String email = request.getParameter("email"); */

Connection conn = new DBConnection().getConn();
List<EmpVo> list = new ArrayList<>();

try{
	String sql = "select employee_id, phone_number, email, "
			   + " first_name, to_char(salary, '99,999') salary "
			   + " from employees "
			   + " where lower(first_name) like lower(?) OR "
			   + " lower(phone_number) like lower(?) OR "
			   + " lower(email) like lower(?) ";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setString(1, "%" + findStr + "%");						
	ps.setString(2, "%" + findStr + "%");						
	ps.setString(3, "%" + findStr + "%");						
	
	
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()) {
		EmpVo v = new EmpVo();
		v.setEmployee_id(rs.getString("employee_id"));
		v.setFirst_name(rs.getString("first_name"));
		v.setPhone_number(rs.getString("phone_number"));
		v.setStrSal(rs.getString("salary"));
		v.setEmail(rs.getString("email"));
		
		list.add(v);
	}
	
}catch(Exception ex) {
	ex.printStackTrace();
}

	request.setAttribute("list", list);
%>

[
	<c:forEach var="v" items="${list}">
		{
			"id" : "${v.employee_id }",
			"name" : "${v.first_name }",
			"email" : "${v.email }",
			"phone" : "${v.phone_number }",
			"salary" : "${v.strSal }"
		},
	</c:forEach>
	{}
]
