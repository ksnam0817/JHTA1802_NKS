<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

</head>
<body>
	<div id='menu'>

		<fieldset id='home' onclick = "location.href='./index.jsp'">
			<center>HOME</center>
			
		</fieldset>
	
	
		<fieldset>
			<legend>MVC</legend>
			<ul>
				<li onclick="viewContent('./mvc/gugudan.jsp')">구구단</li>
				<li onclick="viewContent('./mvc/hap.jsp')">합계</li>
				<li onclick="viewContent('./mvc/amount.jsp')">계산</li>
			</ul>
		</fieldset>
	
	
		<fieldset>
			<legend>DI & AOP</legend>
			<ul>
				<li onclick="viewContent('./test.txt')">Test</li>
				<li>메뉴1</li>
				<li>메뉴1</li>
				<li>메뉴1</li>
			</ul>
		</fieldset>
	
		<fieldset>
			<legend>관리</legend>
			<ul>
				<li onclick="viewContent('list.std')">학생관리</li>
				<li onclick="viewContent('list.brd')">게시판</li>
				<li onclick="viewContent('list_album.brd')">게시판(앨범)</li>
			</ul>
		</fieldset>
	
	&nbsp;
	</div>
</body>
</html>