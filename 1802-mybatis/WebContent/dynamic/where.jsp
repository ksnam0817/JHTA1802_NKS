<%@page import="java.util.List"%>
<%@page import="bean.EmpVo"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dynamicSQL - where </title>
</head>
<body>
<div id='where'>
	<h3>DynamicSQL(where) - 사원명과 입사년을 입력받아 직원정보를 조회하는데, 사원명이나 입사년이 입력된 경우만 조건절에 사용되도록</h3>
	<form name='frmWhere' id='frmWhere' method='post'>
	
		<label for='first_name'>first_name: </label>
		<input type='text' name='first_name' value='${param.first_name}'/><br/>
		
		<label for='hire_year'>입사년 </label>
		<input type='text' name='hire_year' value='${param.hire_year}'/>
		
		<input type='button' id='btn' value='RUN' />
	</form>
	<hr/>
	<h3>result</h3>
	<%
		String first_name = request.getParameter("first_name");
		String hire_year = request.getParameter("hire_year");
		if (first_name != null || hire_year != null) {
			EmpDao dao = new EmpDao();
			
			// 검색하기
			List<EmpVo> list = dao.selectWhere(first_name, hire_year);
			
			// 가져오기
			if (list == null) {
				out.print("list가 null");
			}else {
				//향상된 for문
				for (EmpVo v : list) {
					out.println("eId: " + v.getEmployee_id() + ", ");
					out.println("fn: " + v.getFirst_name() + ", ");
					out.println("ph: " + v.getPhone_number() + ", ");
					out.println("slaary: " + v.getSalary() + ", ");
					out.println("hire_date: " + v.getHire_date() + ", ");
					out.println("<br/>");	
				} 
			}
		}
	%>
</div>

<script>
$(document).ready(function(){
	// [RUN] 버튼이 클릭되면
	$('#where #btn').click(function(){
		var param = $('#frmWhere').serialize();
		console.log('[RUN]버튼이 클릭되었습니다');
		console.log(param);
		var url ='./dynamic/where.jsp';
		$('#content').load(url, param);
		
	});
});
</script>

</body>
</html>