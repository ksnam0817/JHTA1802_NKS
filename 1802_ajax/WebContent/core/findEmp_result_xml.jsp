<?xml version="1.0" encoding="UTF-8"?>

<%@page import="bean.EmpVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
String name = request.getParameter("name");
Connection conn = new DBConnection().getConn();
List<EmpVo> list = new ArrayList<>();


try{
	String sql = "select employee_id, phone_number, "
			   + " first_name, to_char(salary, '99,999') salary "
			   + " from employees where lower(first_name) like lower(?) ";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, "%" + name + "%");						// first_name에 'a'가 들어가 있는 사람만 나옴
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()) {
		EmpVo v = new EmpVo();
		v.setEmployee_id(rs.getString("employee_id"));
		v.setFirst_name(rs.getString("first_name"));
		v.setPhone_number(rs.getString("phone_number"));
		v.setStrSal(rs.getString("salary"));
		
		list.add(v);
	}
	
}catch(Exception ex) {
	ex.printStackTrace();
}

	request.setAttribute("list", list);
%>


<employees>
	<c:forEach var="v" items="${list}">
		<employee>
			<id>${v.employee_id }</id>
			<name>${v.first_name }</name>
			<phone>${v.phone_number }</phone>
			<salary>${v.strSal }</salary>
		</employee>
	</c:forEach>
</employees>












