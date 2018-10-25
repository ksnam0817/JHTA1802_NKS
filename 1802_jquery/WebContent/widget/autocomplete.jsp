<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>autocomplete</title>

<style>
#autocomplete #findZone {
	overflow: hidden;
}
</style>

<script>
// jQuery
$(document).ready(function(){
	// json타입의 데이터를 DB로 읽어들여 자동완성기능에 사용
	
	// .keyup() => 페이지 로드 후 처음 입력시 안됨
	// .keypress() => 페이지 로드 후 처음 입력해도 됨
	
	$('#findJson').keypress(function(){
		var v = $(this).val();								// '#findJson' 입력상자 값을 v변수에 담는다
		$('#findJson').autocomplete({
			source    : './widget/emp_data.jsp?type=json&findStr=' + v,
			minLength : 1													// '#findJson' 입력상자 값이 1글자 이상일 때 'source'를 찾아라
		});
	});
	
	// text타입의 데이터를 DB로 읽어들여 자동완성기능에 사용 - ajax 활용 및 제3의 장소에 뿌리기
	// autocomple()에 내장된 ajax 기능을 임의로 변경했음.
	$('#findText').keypress(function(){
		var v = $(this).val();
		$(this).autocomplete({
							// 요청, 응답정보
			source : function(req, resp) {		
						$.ajax({
							type 	: 'post',
							url	 	: './widget/emp_data.jsp',
							data 	: { 'type' : 'text', 'findStr' : v},
							success : function(data) {
								$('#autocomplete #result').html(data);
							}
						});
					 },
			minLength : 1
		});
	}); 
	
	// ----------------------------------------
	// ajax의 처리 결과를 autocomplete에 적용(위와 반대)
	// ----------------------------------------
	/* $('#findText').keypress(function(){
		var v = $(this).val();
		$.ajax({
			type		: 'post',
			url			: './widget/emp_data.jsp',
			data		: {'type' : 'json', 'findStr' : v},
			dataType	: 'json',
			success		: function(data) {
				$('#findText').autocomplete({
					source : data,
					minLength : 1
				});
			}
		});
	}); */
	
	
	
	
}); // End of jQuery

</script>
</head>
<body>

<div id='autocomplete'>
	<h3>Autocomplete</h3>
	<div id='info'>
		jQuery로 만든 자동완성기능<br/>
		데이터 유형 : json, text 방식으로 읽어들이기
	</div>
	<p/>
	
	
	<div id='findZone'>
		<div id='json'>
			<label>검색(json)</label>
			<input type='text' value='' id='findJson' />
		</div>
	
		<div id='text'>
			<label>검색(Text)</label>
			<input type='text' value='' id='findText' />
		</div>
	</div>
	<hr/>

		
	<h3>result</h3>
	<div id='result'>
	</div>
	
</div>
</body>
</html>