<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loadXML</title>
<style>
.item {
	display: inline-block;
	width: 200px;
	border: 1px solid gary;
}
</style>
<script>
// jQuery
$(document).ready(function(){
	// '#btnLoad'버튼이 클릭되면
	$('#loadXML #btnLoad').click(function(){
		var findStr = $('#loadXML #findStr').val();
		
		$.ajax({
			// xhr.open() 느낌
			type		: 'post',
			url			: './ajax/emp_data_xml.jsp',
			data		: {'findStr' : findStr},
			dataType	: 'xml',
			
			// if(xhr.state==200 && xhr.status==4) {} 느낌
			success		: function(data){
								var nodeList = $(data).find("employee");
								
								var str="<table border='1' width='500px'>";
								if (nodeList.length <=0) {
									str += "<tr><td colspan='10'>데이터가 없음</td></tr>";
								}else {
									str += '<tr><th>id</th><th>이름</th><th>연락처</th><th>급여</th></tr>'
									$(nodeList).each(function() {
										var id = $(this).find("id").text();
										var fn = $(this).find("fn").text();
										var ph = $(this).find("ph").text();
										var sal = $(this).find("sal").text();
										
										str += '<tr>'
									  	 	+  '<td>' + id + '</td>'
											+  '<td>' + fn + '</td>'
											+  '<td>' + ph + '</td>'
											+  '<td>' + sal + '</td>'
											+  '</tr>';
									});
								}
								
								str += '</table>';
								$('#loadXML #result').html(str);
			}
		});	// End of $.ajax 
	}); // End of btnLoad
});	// End of jQuery
</script>


</head>
<body>
<div id='loadXML'>
	<h3>load JSON</h3>
	<div id='info'>
		jQuery의 ajax를 통해 데이터를 XML 타입으로 읽어들임
	</div>
	
	<input type='text' value='' id='findStr'/>
	<input type='button' value='Load XML' id='btnLoad' />
	<hr/>
	
	<div id='result'>
	</div>
</div>


</body>
</html>