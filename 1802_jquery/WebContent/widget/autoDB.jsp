<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.EmpVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>autoDB</title>

<script>
// DB에서 꺼낸 이름들을 담을 배열
var dbNames = new Array();

//jQuery
$(document).ready(function(){
	$('#autoDB #inputNames').autocomplete({
		source: dbNames
	});
}); // End of jQuery

</script>



<%
Connection conn = new DBConnection().getConn();
List<EmpVo> list = new ArrayList<>();

try {
	String sql = " select first_name "
			   + " from employees ";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ResultSet rs = ps.executeQuery();
	
	while(rs.next()) {
		EmpVo v = new EmpVo();
		v.setFirst_name(rs.getString("first_name"));
		
		list.add(v);
	}
	
}catch(Exception ex) {
	ex.printStackTrace();
}

request.setAttribute("list", list);
%>

</head>

<body>
<div id='autoDB'>
	<div id='info'>
		jQueryUI의 autocomplete기능에 DB연동
	</div>
	<hr/>
	
	<div id='autocomplete'>
		<label for='inputNames'>Names: </label>
		<input type='text' id='inputNames' />
	</div>
	<hr/>
	
	
	<div id='dbNames'>
		<h3>DB에서 꺼내온 이름들</h3>
		<c:forEach var='v' items='${list }'>
			${v.first_name }
			
			<script>
			// DB에서 꺼낸 이름들을 JS에 넣자
			dbNames.push('${v.first_name}');
			</script>
		</c:forEach>
	</div>
	<hr/>
	
</div>

</body>
</html>




