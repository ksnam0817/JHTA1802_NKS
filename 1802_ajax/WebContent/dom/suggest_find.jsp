<%@page import="bean.EmpVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
String findStr = request.getParameter("findStr");

Connection conn = new DBConnection().getConn();
List<String> list = new ArrayList<String>();

try{
	String sql = "select distinct employee_id, phone_number, email, first_name "
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
		list.add(rs.getString("first_name"));
		list.add(rs.getString("employee_id"));
		list.add(
				rs.getString("phone_number"));
		list.add(rs.getString("email"));
	}
	
}catch(Exception ex) {
	ex.printStackTrace();
}

	request.setAttribute("list", list);
%>

[
	<c:forEach var="v" items="${list}">
		"${v}",
	</c:forEach>
	""
]
