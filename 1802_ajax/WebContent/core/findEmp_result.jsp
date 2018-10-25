<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findEmp_Result</title>
</head>
<body>
<!-- 사번, 연락처, 급여정보를 적당한 layout으로 출력 -->


<table>
	<tr>
		<th>사번</th>
		<th>성명</th>
		<th>연락처</th>
		<th>급여</th>
	<tr/>
<%
Connection conn = new DBConnection().getConn();

if (conn !=null) {
	out.print("connnection객체 얻어오기 성공 <p/>");
}

// findEmp.jsp로부터 받은 request
String first_name = request.getParameter("first_name");

try{
	String sql = " select employee_id, first_name, phone_number, salary from employees "
			   + " where first_name like ? ";						// '?' => 파라미터 위치 (like %a%)
	
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, "%" + first_name + "%");						// first_name에 'a'가 들어가 있는 사람만 나옴
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()) {
		out.print("<tr>");
		out.print("<td>" + rs.getString("employee_id") + "</td>");
		out.print("<td>" + rs.getString("first_name") + "</td>");
		out.print("<td>" + rs.getString("phone_number") + "</td>");
		out.print("<td>" + rs.getString("salary") + "</td>");
		out.print("</tr>");
	}
	
}catch(Exception ex) {
	ex.printStackTrace();
}

%>
</table>
</body>
</html>