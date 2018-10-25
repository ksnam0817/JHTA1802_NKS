<%@page import="bean.EmpVo"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>empList</title>
</head>
<body>
<div id='empList'>
	<h3>empList - employee_id로 검색</h3>
	<form name='frmEmpList' id='frmEmpList' method='post'>
		<label for='employee_id'>employee_id : </label>
		<input type='text' name='employee_id' value='${param.employee_id}' />
		<input type='button' id='btn' value='RUN' />
	</form>
	<hr/>
	<h3>result</h3>
	<%
		String eId = request.getParameter("employee_id");
		if (eId != null) {
			EmpDao dao = new EmpDao();
			EmpVo vo = dao.select(eId);
			out.println("eId: " + vo.getEmployee_id() + "<br/>");
			out.println("fn: " + vo.getFirst_name() + "<br/>");
			out.println("ph: " + vo.getPhone_number() + "<br/>");
			out.println("slaary: " + vo.getSalary() + "<br/>");
		}
	%>
	
</div>

<script>
$(document).ready(function(){
	$('#btn').click(function(){
		var param = $('#frmEmpList').serialize();
		var url ='./begin/empList.jsp';
		$('#content').load(url, param);
	});
});
</script>

</body>
</html>