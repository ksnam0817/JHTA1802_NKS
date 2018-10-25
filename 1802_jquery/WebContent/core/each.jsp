<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>each</title>
</head>
<body>
<div id='each'>
	<h3>get</h3>
	<div id='info'>
		each() 함수를 사용하여 1개 이상의 동일한 속성을 갖는 요소를 반복하면서 지정된 내용을 처리한다<br/>
		버튼을 클릭하면 span 안에 있는 문자들의 색상을 바꾼다.
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
var bg = ['red', 'green', 'blue', 'yellow', 'pink', 'olive'];		// 색깔을 적당하게 만들어 놓고 
$('#each #btn').click(function(){
	
	// 하나씨 가져온다(하나의 each 태그)
	$('#each span').each(function(index){
		$(this).css('color', bg[index]);
	});
});
	
</script>

</body>
</html>