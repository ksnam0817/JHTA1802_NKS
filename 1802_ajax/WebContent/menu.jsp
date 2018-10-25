<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>menu</title>

<style>
#menu .item {
	cursor: pointer;
}

#menu .item:hover {
	text-decoration: underline;
}

#menu .item:active {
	color: red;
}

</style>


</head>
<body>
<div id='menu'>
	<div id='1802'>
		<fieldset>
			<legend>1802</legend>
				<ol>
					<a href="http://35.200.86.247:8080/1802_web3/"><li><span class='item'>1802_web3</span></li></a>
					<a href="http://35.200.86.247:8080/1802_jquery/"><li><span class='item'>1802_jQuery</span></li></a>
				</ol>
		</fieldset>
	</div>

	<div id='core'>
		<fieldset>
			<legend>CORE</legend>
				<ol>
					<li><span class='item' onclick="pageLoad('/1802_ajax/core/gugudan.jsp')">구구단</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/core/sum.jsp')">합계 구하기</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/core/findEmp.jsp')">직원조회</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/core/findEmp_xml.jsp')">직원조회(XML)</span></li>
					
					<li><span class='item' onclick="pageLoad('/1802_ajax/core/loadXML.jsp')">load XML</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/core/loadJSP.jsp')">load JSP</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/core/loadTEXT.jsp')">load TEXT</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/core/loadJSON.jsp')">load JSON</span></li>
				</ol>
		</fieldset>
	</div>
	
	<div id='dom'>
		<fieldset>
			<legend>DOM</legend>
				<ol>
					<li><span class='item' onclick="pageLoad('/1802_ajax/dom/node_info.jsp')">Node Information</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/dom/by_class_name.jsp')">by_class_name</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/dom/appendChild.jsp')">appendChild</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/dom/attribute.jsp')">attribute</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/dom/appendChild2.jsp')">appendChild2</span></li>
					<li><span class='item' onclick="pageLoad('/1802_ajax/dom/suggest.jsp')">검색어 제안</span></li>
				</ol>
		</fieldset>	
	</div>
	
	<div id='xml'>
		<fieldset>
				<legend>XML</legend>
				<ol>
					<li><span>xml 1</span></li>
					<li><span>xml 2</span></li>
					<li><span>xml 3</span></li>
				</ol>
		</fieldset>
	</div>
	
	<div id='json'>
		<fieldset>
				<legend>JSON</legend>
				<ol>
					<li><span>json 1</span></li>
					<li><span>json 2</span></li>
					<li><span>json 3</span></li>
				</ol>
		</fieldset>
	</div>
	
	
</div>
</body>
</html>