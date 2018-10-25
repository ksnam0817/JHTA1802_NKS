<%@page import="java.util.List"%>
<%@page import="bean.EmpVo"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dynamicSQL - if </title>
</head>
<body>
<div id='if'>
	<h3>DynamicSQL(if) - 입사월이 입력된 경우만 입사월을 where 조건으로 검색</h3>
	<form name='frmIf' id='frmIf' method='post'>
		<label for='findStr'>입사월: </label>
		<input type='text' name='hireMonth' value='${param.hireMonth}'/>
		<input type='button' id='btn' value='RUN' />
	</form>
	<hr/>
	<h3>result</h3>
	<%
		String hireMonth = request.getParameter("hireMonth");
		if (hireMonth != null) {
			EmpDao dao = new EmpDao();
			
			// 검색하기
			List<EmpVo> list = dao.selectHireMonth(hireMonth);
			
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
	$('#if #btn').click(function(){
		var param = $('#frmIf').serialize();
		console.log('[RUN]버튼이 클릭되었습니다');
		console.log(param);
		var url ='./dynamic/if.jsp';
		$('#content').load(url, param);
		
	});
});
</script>

</body>
</html>