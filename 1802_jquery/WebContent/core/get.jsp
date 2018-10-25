<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>get</title>
</head>
<body>
<div id='get'>
	<h3>get</h3>
	<div id='info'>
		get()을 사용하여 특정요소를 배열형태로 가져올 때 사용
	</div>
	<hr/>
	
	<span>A</span>
	<span>B</span>
	<span>C</span>
	<span>D</span>
	<span>E</span>
	<span>F</span>
	<p/>
	<input type='button' value='RUN' id='btn' />
	<hr/>
	
	<div id='result'>
	</div>
</div>

<script>
// jQuery를 짧게 표현하면 이렇게
// span 태그들을 가로모드에서 세로모드로 ^^
$(function(){
	$('#get #btn').click(function(){
		var spans = $('#get span').get();
		
		$('#result').html('<li>size=' + spans.length);
		$('#result').append("<br/>");
		$('#result').append(spans.join('<br/>'));
		
		// span 태그 중에서 첫번째 가져옴
		var ele = $('#get span').get(0);
		$('#result').append("<p/> text=" + ele.innerHTML);
		
		
	}); // End of btn.click();
}); // End of ready
</script>

</body>
</html>