<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>manipulation</title>

<style>
#content div {
	border: 1px solid black;
}
</style>
</head>
<body>
<div id='manipulation'>
	<h3>manipulation</h3>
	<div id='info'>
		<p>특정 요소에 또 다른 특정요소를 추가하거나 삭제하는 기능</p>
	<ul>
		<li>wrap()</li>
		<li>append() | prepend()</li>
		<li>before() | after()</li>
		<li>remove()</li>
		<li>empty()</li>
	</ul>
	</div>	
	<hr/>
	
	<!-- 타겟 DIV들 -->
	<div id='wrap_target'>Wrap_target</div>
	<div id='append_target'>Append_target</div>
	<div id='prepend_target'>Prepend_target</div>
	<div id='before_target'>Before_target</div>
	<div id='after_target'>After_target</div>
	<div id='remove_target'>Remove_target</div>
	<div id='empty_target'>Empty_target</div>
	<hr/>
	
	<!-- 버튼들 -->
	<input type='button' value='Wrap' id='btnWrap' />
	<input type='button' value='Append' id='btnAppend' />
	<input type='button' value='Prepend' id='btnPrepend' />
	<input type='button' value='Before' id='btnBefore' />
	<input type='button' value='After' id='btnAfter' />
	<input type='button' value='Remove' id='btnRemove' />
	<input type='button' value='Empty' id='btnEmpty' />
</div>


<script>
var str = "<font color='red' class='wrap'>내가 너를 감싸주마</font>";
var div = "<font color='blue'>제가 뚸다놓은 보릿자루!!!</font>";

$('#btnWrap').click(function(){
	$('#wrap_target').wrap(str);
});

$('#btnAppend').click(function(){
	$('#append_target').append(div);
});

$('#btnPrepend').click(function(){
	$('#prepend_target').prepend(div);	
});

$('#btnBefore').click(function(){
	// TODO
	$('#before_target').before(div);
});

$('#btnAfter').click(function(){
	// TODO
	$('#after_target').after(div);
});

$('#btnRemove').click(function(){
	$('#remove_target').remove();
});

$('#btnEmpty').click(function(){
	$('#empty_target').empty();
});
</script>

</body>
</html>