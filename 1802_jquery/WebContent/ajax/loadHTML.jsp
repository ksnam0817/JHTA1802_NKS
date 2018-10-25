<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loadHTML</title>

<script>
// jQuery
$(document).ready(function(){
	// '#btnLoad'버튼이 클릭되면
	$('#loadHTML #btnLoad').click(function(){
		var findStr = $('#loadHTML #findStr').val();
		
		console.log('findStr: ' + findStr);
		
		$.ajax({
			type		: 'post',
			url			: './ajax/emp_data.jsp',
			data		: {'findStr':findStr, 'type':'text'},
			dataType	: 'html',
			success		: function(data){
							data = data.trim();
							data = data.split('\n').join('<br/>');
							$('#loadHTML #result').html(data);
			}
		});
		
	});
}); // End of jQuery
</script>

</head>
<body>
<div id='loadHTML'>
	<h3>HTML문서를 ajax로 읽기</h3>
	
	<div id='info'>
		jQuery안에 있는 ajax를 사용하여 html타입의 문서를 읽어들여 => 결과영역에 표시해 줌
	</div> 
	
	<input type='text' value='' id='findStr' />
	<input type='button' value='LOAD HTML' id='btnLoad' />
	<h2>Result</h2>
	<hr/>
	
	<div id='result'>
	</div>

</div>
</body>
</html>