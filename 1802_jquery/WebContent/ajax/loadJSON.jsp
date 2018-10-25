<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loadJSON</title>
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
	$('#loadJSON #btnLoad').click(function(){
		var findStr = $('#loadJSON #findStr').val();
		
		console.log('findStr: ' + findStr);
		
		$.ajax({
			
			// xhr.open() 느낌
			type		: 'post',
			url			: './ajax/emp_data.jsp',
			data		: {'findStr':findStr, 'type':'json'},
			dataType	: 'json',
			
			// if(xhr.state==200 && xhr.status==4) {} 느낌
			success		: function(data){
							var str ='';
							var pos = 0;
							
							for (d=0; d<data.length; d++) {
								str += "<span class='item'>" + data[d] + '</span>';
								pos++;
								if (pos%3 ==0) str += '<br/>';
							}
							
							$('#loadJSON #result').html(str);
			}
		});
		
	});
}); // End of jQuery
</script>






</head>
<body>
<div id='loadJSON'>
	<h3>load JSON</h3>
	<div id='info'>
		jQuery의 ajax를 통해 데이터를 JSON 타입으로 읽어들임
	</div>
	
	<input type='text' value='' id='findStr'/>
	<input type='button'	 value='Load JSON' id='btnLoad' />
	<hr/>
	<div id='result'>
	</div>
</div>


</body>
</html>