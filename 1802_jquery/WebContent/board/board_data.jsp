<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>

<%
// Board테이블에서 데이터 가져오기 위해 사용
String type = request.getParameter("type");
String searchStr = request.getParameter("searchStr");
if (searchStr == null) searchStr = "";

// 커넥션객체 가져와서 DB검색
Connection conn = new DBConnection().getConn();
StringBuilder sb = new StringBuilder();

//디버깅용
System.out.println("type: " + type);
System.out.println("searchStr: " + searchStr);

String sql = " select serial, id, subject, hit, mdate "
		   + " from board "
		   + " where id like ? "
		   + "    or subject like ? "
		   + "    or doc like ? ";

PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, "%" + searchStr + "%" );
ps.setString(2, "%" + searchStr + "%" );
ps.setString(3, "%" + searchStr + "%" );

ResultSet rs = ps.executeQuery();

if (type.equals("json")) {
	sb.append("[");
	boolean start = true;	// 마지막 ""(공갈데이터) 제거 위해
	
		while(rs.next()) {
			if (!start) {
				sb.append(",");
			}
			sb.append("\"" + rs.getString(""));
		}
}

%>