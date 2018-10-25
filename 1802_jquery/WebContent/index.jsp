<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1802_jQuery</title>


<!-- <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script> -->

<script src="./lib/jquery-3.3.1.js"></script>
<script src="./lib/jquery-ui.js"></script>
<link rel="stylesheet" href="./lib/jquery-ui.css" />


<style>
#index {
	width: 1000px;
	margin: 0 auto;
}

#index #header {
	height: 80px;
	border: 3px solid olive;
	border-radius: 6px;
	background-color: #BFD8AD;
	margin-bottom: 10px;
	text-align: center;
}

#index #header #title {
	line-height: 100%;	
}


#index #top_menu {
	height: 40px;
	border: 3px solid olive;
	border-radius: 6px;
	background-color: #9CDDC8;
	text-align: center;
	margin-bottom: 10px;
	line-height: 40px;
}


#index #top_menu #top_items span{
	padding: 10px;
}

#index #top_menu #top_items span:hover {
	cursor: pointer;
	font-weight: bold;
}



#index #wrap_middle {
	/* 자식요소에 flow 쓸 때, 부모요소는 overflow:hidden */
	overflow: hidden;
	margin-bottom: 10px;
}

#index #wrap_middle #left_menu {
	float: left;
	width: 220px;
	border: 3px solid olive;
	border-radius: 6px;
	background-color: #DDD9AB;
}


#left_menu li:hover {
	font-weight: bold;
	cursor: pointer;
}


#index #wrap_middle #content {
	float: right;
	width: 760px;
	min-height: 300px;
	border: 3px solid olive;
	border-radius: 6px;
	background-color: #F7AF63;
}

#index #footer {
	height: 60px;
	border: 3px solid olive;
	border-radius: 6px;
	background-color: #633D2E;
}
</style>
</head>
<body>
<div id='index'>
	<div id='header'>
	<%@ include file='./pages/header.jsp' %>
	</div>
	<div id='top_menu'>
	<%@ include file='./pages/top_menu.jsp' %>
	</div>
	<div id='wrap_middle'>
		<div id='left_menu'>
		</div>
		<div id='content'>
		</div>
	</div>
	<div id='footer'>
	<%@ include file='./pages/footer.jsp' %>
	</div>	
</div>
</body>
</html>