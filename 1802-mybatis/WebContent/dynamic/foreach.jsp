<%@page import="java.util.List"%>
<%@page import="bean.EmpVo"%>
<%@page import="bean.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dynamicSQL - foreach </title>
</head>
<body>
<div id='foreach'>
	<h4>DynamicSQL(foreach) -<br/>
	  1) departments 테이블을 사용하여, 부서코드를 select하여 체크박스형태로 부서코드와 부서명을 나열한 후,<br/> 
 	  2) 해당 부서코드를 선택하면 부서코드를 foreach로 SQL을 생성하고 <br/>
	  3)이에 해당하는 직원들의 사번, 성명, 연락처, 급여(EmpVo)를 조회하세요<br/>
	</h4>
	<hr/>
	
	<form name='frmForeach' id='frmForeach' method='post'>
		<div id="dept_code_list">
		</div>
		<input type='button' name='btn' id='btn' value='RUN' />
	</form>
	
	<hr/>
	<h3>result</h3>
	<div id='result'>
	</div>
	
</div>

<script>
// 페이지로딩이 완료되면
$(document).ready(function(){
	$('#dept_code_list').load('./dynamic/dept_code_list.jsp');
	
	$('#foreach #btn').click(function(){
		var param = $('#foreach #frmForeach').serialize();
		var url = './dynamic/empList.jsp';
		$('#foreach #result').load(url, param);
	});
});
</script>

</body>
</html>