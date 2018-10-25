<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>

<%
// Board���̺��� ������ �������� ���� ���
String type = request.getParameter("type");
String searchStr = request.getParameter("searchStr");
if (searchStr == null) searchStr = "";

// Ŀ�ؼǰ�ü �����ͼ� DB�˻�
Connection conn = new DBConnection().getConn();
StringBuilder sb = new StringBuilder();

//������
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
	boolean start = true;	// ������ ""(����������) ���� ����
	
		while(rs.next()) {
			if (!start) {
				sb.append(",");
			}
			sb.append("\"" + rs.getString(""));
		}
}

%>