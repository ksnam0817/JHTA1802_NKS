<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>load JSON</title>
</head>
<body>
<div id='load_json'>
	<h3>JSON타입의 데이터 Load</h3>
	<p id='info'>
		JSON타입의 데이터를
	</p>
		<ul>
			<li>객체형</li>
			<li>배열형</li>
			<li>복합형</li>
			<li>DB에서</li>
		</ul>
		형태로 읽어 표현.
		<p/>
		
		<input type='button' value='객체형' id='btnObj' />
		<input type='button' value='배열형' id='btnArr' />
		<input type='button' value='복합형' id='btnComp' />
		<input type='button' value='폼을 JSON으로' id='btnFtJ' >
		<input type='button' value='DB에서' id='btnDB' />
		<p/>
		<hr/>
		
		
		<!-- 
			form정보를 손쉽게 ajax로 전송하려면 반드시 encType이 정의되어야 한다
		 -->
		
		<label>Form to JSON Text Form</label>
		<form name='frmJSON' encType='multipart/data-form'>
			<label>아이디</label>
			<input type='text' size='6' name='name' value='a' />
			<br />
			
			<label>취미</label>
			<label><input type='checkbox' name='hobby' value='축구' />축구</label>
			<label><input type='checkbox' name='hobby' value='야구' />야구</label>
			<label><input type='checkbox' name='hobby' value='농구' />농구</label>
			<label><input type='checkbox' name='hobby' value='배구' />배구</label>
		</form>
		
		
		
		
		
		<div id='result'>
		<h3>Result DIV</h3>
		</div>
</div>

<script>
/*
 * 전역변수(필드 느낌)
 */
var btnObj = document.getElementById('btnObj');
var btnArr = document.getElementById('btnArr');
var btnComp = document.getElementById('btnComp');
var btnFtJ = document.getElementById('btnFtJ');
var btnDB  = document.getElementById('btnDB');
var rs     = document.getElementById('result');
var xhr;

// 객체형
btnObj.onclick = function() {
	var data = {"key" 	: "value",
				"id"  	: "a001",
				"name"	: "lee bong gi",
				"phone" : "02-882-5748",
				"email" : "iyabong@gmail.com"
				};
	
	var str = "<li>key: " + data.key
	      	+ "<li>ID: " + data.id
	      	+ "<li>Name: " + data.name
	      	+ "<li>Phone: " + data.phone
	      	+ "<li>Email: " + data.email;
	
	rs.innerHTML = str;
}

// 배열형
btnArr.onclick = function() {
	var data = ["백두산", "한라산", "설악산", "금강산", "치악산", "내장산", "지리산"];
	var str = data.join("<br/>");
	
	rs.innerHTML = str;
}

// 복합형 (객체형 + 배열형)
btnComp.onclick = function() {
	var data = {
			"id"	 : "a001",
			"name" 	 : "홍길동",
			"hobby"  : ["축구", "농구", "배구", "야구", "족구"]
	};
	
	var str = "<li>아이디: " 		 + data.id + "<\/li>"
			+ "<li>성명: " 		 + data.name + "<\/li>"
			+ "<li>취미: " 		 + data.hobby + "<\/li>"
			+ "<li>강추 취미:" 		 + data.hobby[3] + "<\/li>";
	
	rs.innerHTML = str;
}

// form안에 있는 파라메터들을 JSON타입으로 변경하고 다시 form 타입으로
btnFtJ.onclick = function() {
	var frm = document.frmJSON;
	var str = "";
	
	// form 정보를 JSON으로
	var jsonType = JSON.stringify(frm);
	
	str = "<li>form to JSON : " + jsonType;
	
	rs.innerHTML = str;
}

// DB에서 데이터를 선택하여 JSON 타입으로 반환
btnDB.onclick = function() {
	var str = "";
	if (xhr == null) xhr = new XMLHttpRequest();
	var url = '/1802_ajax/core/findEmp_result_json.jsp';
	var param = "?name=" + document.frmJSON.name.value;
	url = url + param;
	
	xhr.open('get', url, true);
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.status == 200 && xhr.readyState == 4) {
			var temp = xhr.responseText;
			
			// 문자열로 되어 있는 JSON타입을 JSON Object로 변환
			var list = JSON.parse(temp);
			str = "<table border='1' cellpadding='4' cellspacing='0'>";
			
			for (i=0; i<list.length-1; i++) {
				str += "<tr>"
					+  "<td>" + list[i].id + "<\/td>"
					+  "<td>" + list[i].name + "<\/td>"
					+  "<td>" + list[i].phone + "<\/td>"
					+  "<td>" + list[i].salary + "<\/td>"
					+  "<\/tr>";
			}
			str += "<\/table>";
			rs.innerHTML = str;
		}
	}
}


// form안에 있는 정보를 ajax로 보내는 방법
btnToJson.onclick = function() {
	var frm = document.frmJSON;
	var str =  "";
	
	var newFrm = new FrmData(frm);
	
	if (xhr == null) xh = XMLHttpRequest();
	xhr.open('post', '/1802_ajax/core/loadJSON_test.jsp', true);
	xhr.send(newFrm);
	
	xhr.onreadystatechange = function() {
		if (xhr.status==200 && xhr.readyStatus == 4) {
			var doc = xhr.responseText;
			rs.innerHTM = doc;
		}
	}
	
}




</script>

</body>
</html>