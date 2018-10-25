<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>serialize(직렬화)</title>
</head>
<script src="../lib/jquery-3.3.1.js"></script>
<script src="../lib/jquery-ui.js"></script>
<link rel="stylesheet" href="../lib/jquery-ui.css" />

<body>
<script>
// jQuery
$(document).ready(function(){
	$('#serialize #btnSubmit').click(function(){
		var data = $('#serialize #frmSerialize').serialize();
		$('#serialize #result').text(data);
		return false;
	});
}); // End of jQuery
</script>

<div id='serialize'>
	<form name='frmSerialize' id='frmSerialize'>
		<label for='nickName'>닉네임</label>
		<input type='text' name='nickName' id='nickName' /><br/>
		
		<label for='pwd'>암호</label>
		<input type='text' name='pwd' id='pwd' /><br/>
		<input type='button' value='Submit' name='btnSubmit' id='btnSubmit' />
	</form>
</div>
<hr/>
<div id='result'>
</div>

</body>
</html>