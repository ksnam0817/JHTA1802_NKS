<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%
// jQuery autocomplete 기능에서 사용
// autocomple.jsp로부터 파라미터 받아오기
String type= request.getParameter("type");
String findStr = request.getParameter("findStr");
if (findStr == null) findStr = "";

// 커넥션객체 가져와서 DB 검색
Connection conn = new DBConnection().getConn(); 
StringBuilder sb = new StringBuilder();
	
// 디버깅용
// System.out.println("type:" + type);
// System.out.println("findStr:" + findStr);


String sql = " select distinct first_name || ' ' || last_name fn "  
           + " from employees "
           + " where lower(first_name) like lower(?) "
           + " order by fn ";

PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, "%" + findStr + "%");
ResultSet rs = ps.executeQuery();

// 분기처리
// JSTL을 쓰면 JSON형식 포맷으로 쉽게 만들 수 잇다(forEach등과 함꼐)
if (type.equals("json")) {
	sb.append("[");
	boolean start=true;		// 마지막 ""(공갈데이터)를 제거하기 위해
	
		while(rs.next()) {
			if(!start) {
				sb.append(",");
			}
			sb.append("\"" + rs.getString("fn") + "\"");
			start=false;
		}
		
		sb.append("]");
		out.println(sb.toString());

}else if (type.equals("text")) {
	while (rs.next()) {
		out.print(rs.getString("fn"));
		out.print("\n");
	}
}


%>
