<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>oracle JDBC Driver Testing...</title>

<style>
.item1 {
	display:inline-block;
	width: 150px;
	border: 1px solid gray;
}

.item2 {
	display:inline-block;
	width: 250px;
	border: 1px solid gray;
}
</style>
</head>

<body>
<%
// 사전준비
/* String driver = "oracle.jdbc.driver.OracleDriver";		// oracle JDBC 드라이버 문자열 상수
String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";	// 쿼리박스에 넣은 내용과 동일
String dbUser = "hr";
String dbPwd = "hr";

// DB연결시 항상 예외처리 해야 함
try {
	// Driver Loading
	Class.forName(driver);
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
	out.print("Connection GooD");
	
	
}catch(Exception ex) {
	out.print(ex.toString());
} */

Connection conn = new DBConnection().getConn();

if (conn !=null) {
	out.print("connnection객체 얻어오기 성공 <p/>");
}

try{
	String sql = "select first_name, phone_number from employees "
			   + "where first_name like ?";							// '?' => 파라미터 위치 (like %a%)
	
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, "%na%");											// first_name에 'a'가 들어가 있는 사람만 나옴
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()) {
		out.print("<div>");
		out.print("<span class='item1'>" + rs.getString("first_name") + "</span>");
		out.print("<span class='item2'>" + rs.getString("phone_number") + "</span>");
		out.print("</div>");
	}
		
	
	
}catch(Exception ex) {
	out.print(ex.toString());
}


%>
</body>
</html>