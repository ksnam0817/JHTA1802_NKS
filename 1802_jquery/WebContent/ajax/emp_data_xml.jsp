<?xml version="1.0" encoding="UTF-8" ?>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" %>


<%
String findStr = request.getParameter("findStr");
if (findStr == null) findStr = "";

// 커넥션객체 가져와서 DB 검색
Connection conn = new DBConnection().getConn(); 
StringBuilder sb = new StringBuilder();


String sql = " select employee_id, first_name, phone_number, to_char(salary, '99,999') salary "
		   + " from employees "
		   + " where lower(first_name) like lower(?) "
		   + " order by first_name ";

PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, "%" + findStr + "%");
ResultSet rs = ps.executeQuery();

out.print("<employees>");
while(rs.next()) {
	out.print("<employee>");
	out.print("<id>" + rs.getString("employee_id") + "</id>");
	out.print("<fn>" + rs.getString("first_name") + "</fn>");
	out.print("<ph>" + rs.getString("phone_number") + "</ph>");
	out.print("<sal>" + rs.getString("salary") + "</sal>");
	out.print("</employee>");
}

out.print("</employees>");


%>
