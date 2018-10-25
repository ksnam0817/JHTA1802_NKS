<%@page import="java.util.List"%>
<%@page import="bean.EmpVo"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>empList2</title>
</head>
<body>
<div id='empList2'>
	<h3>empList2 - 이름 또는 연락처로 검색</h3>
	<form name='frmEmpList2' id='frmEmpList2' method='post'>
		<label for='findStr'>이름 또는 연락처 : </label>
		<input type='text' name='findStr' value='${param.findStr}'/>
		<input type='button' id='btn' value='RUN' />
	</form>
	<hr/>
	<h3>result</h3>
	<%
		String findStr = request.getParameter("findStr");
		if (findStr != null) {
			EmpDao dao = new EmpDao();
			List<EmpVo> list = dao.select2(findStr);
			
			if (list == null) {
				out.print("list가 null");
			}else {
				
				 for (EmpVo v : list) {
				out.println("eId: " + v.getEmployee_id() + ", ");
				out.println("fn: " + v.getFirst_name() + ", ");
				out.println("ph: " + v.getPhone_number() + ", ");
				out.println("slaary: " + v.getSalary() + ", ");
				out.println("<br/>");	
				} 
			}
		}
	%>
	
</div>

<script>
$(document).ready(function(){
	$('#empList2 #btn').click(function(){
		var param = $('#frmEmpList2').serialize();
		console.log(param);
		var url ='./begin/empList2.jsp';
		$('#content').load(url, param);
		
	});
});
</script>

</body>
</html>