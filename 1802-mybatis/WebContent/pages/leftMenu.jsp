<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>leftMenu.jsp</title>
</head>
<body>
<div id='All'>All
	<div id='Begin'>
		<fieldset>
		<legend>Begin</legend>
		<ul>
			<li onclick="loadPage('./begin/factoryTest.jsp')">factoryTest</li>
			<li onclick="loadPage('./begin/empList.jsp')">empList</li>
			<li onclick="loadPage('./begin/empList2.jsp')">empList2</li>
			<li onclick="loadPage('./begin/empHire.jsp')">empHire</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='SqlMap'>
		<fieldset>
		<legend>SqlMap</legend>
		<ul>
			<li onclick="loadPage('./board/insert.jsp')">insert</li>
			<li onclick="loadPage('./board/list.jsp')">list</li>
		</ul>
		</fieldset>
	</div>
	
	<div id='DynamicSQL'>
		<fieldset>
		<legend>DynamicSQL</legend>
		<ul>
			<li onclick="loadPage('./dynamic/if.jsp')">if</li>
			<li onclick="loadPage('./dynamic/where.jsp')">where</li>
			<li onclick="loadPage('./dynamic/foreach.jsp')">foreach</li>
		</ul>
		</fieldset>
	</div>
</div>

<script>

// 이제 topMenu.jsp에 있는 loadPage() 메소드를 사용한다
/* function go(url) {
	$('#content').load(url);
} */
</script>
</body>
</html>