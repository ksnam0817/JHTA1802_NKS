<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trigger Event</title>
</head>
<body>
<div id='triggerEvent'>
	
	<input type='button' value='Trigger Test' id='btn' />
	<hr/>
	
	<div id='result'>
	</div>

</div>

<script>
$(document).ready(function(){
	var cnt= 0;
	
	// 페이지가 로딩되는 순간 실행됨.(밑에 trigger에 의해 강제적으로 실행됨)
	$('#triggerEvent #btn').click(function(){
		$('#triggerEvent #result').html('버튼이 클릭되었습니다' + (++cnt));
	});
	
	// 단순히 trigger만 적용해서는 실행되지 않는다. 반드시 이벤트에 대한 처리내용이 있어야 한다.
	$('#triggerEvent #btn').trigger('click');		
});

</script>

</body>
</html>