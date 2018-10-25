<%@page import="java.util.List"%>
<%@page import="bean.EmpVo"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>empHire</title>
</head>
<body>
<div id='empHire'>
	<h3>empHire - 입사년도를 입력받아 해당년에 입사한 직원들을 조회하세요</h3>
	<form name='frmEmpHire' id='frmEmpHire' method='post'>
		<label for='findStr'>입사년도: </label>
		<input type='text' name='findStr' value='${param.findStr}'/>
		<input type='button' id='btn' value='RUN' />
	</form>
	<hr/>
	<h3>result</h3>
	<%
		String findStr = request.getParameter("findStr");
		if (findStr != null) {
			EmpDao dao = new EmpDao();
			
			// 검색하기
			List<EmpVo> list = dao.selectHire(findStr);
			
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
	$('#empHire #btn').click(function(){
		var param = $('#frmEmpHire').serialize();
		console.log('[RUN]버튼이 클릭되었습니다');
		console.log(param);
		var url ='./begin/empHire.jsp';
		$('#content').load(url, param);
		
	});
});
</script>

</body>
</html>