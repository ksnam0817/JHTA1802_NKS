<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<form id='frm'>
	<input type='text' name='nowPage' value='${empty param.nowPage? 1 : param.nowPage}' />
	<input type='text' name='id' value='${param.id}' />
</form>

<script>
$('#btnSearch').click(function(){
	var param = $('.frm').serialize();
	$('#right').load('insert.brd', param)
})

$('#btnInsert').click(function(){
	var param = $('.frm').serialize();
	$('#right').load('insert.brd', param)
})

$('#btnInsertR').click(function(){
	var param = $('.frm').serialize();
	$('#right').load('insertR.brd', param)
})

$('#btnList').click(function(){
	var param = $('.frm').serialize();
	$('#right').load('list.brd', param)
})

$('#btnView').click(function(){
	var param = $('.frm').serialize();
	$('#right').load('view.brd', param)
})

$('#btnModify').click(function(){
	var param = $('.frm').serialize();
	$('#right').load('modify.brd', param)
})

$('#btnModifyR').click(function(){
	var param = $('.frm').serialize();
	$('#right').load('modifyR.brd', param)
})

$('#btnDeleteR').click(function(){
	var param = $('.frm').serialize();
	$('#right').load('deleteR.brd', param)
})



</script>