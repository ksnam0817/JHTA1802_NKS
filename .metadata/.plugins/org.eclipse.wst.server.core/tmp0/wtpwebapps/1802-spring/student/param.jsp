<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-39" data-genuitec-path="/1802-spring/WebContent/student/param.jsp">
    
<script>


$('#btnList').click(function(){
	var param = $('.frm_std').serialize();
	$('#content').load('list.std', param)
})

$('#btnFind').click(function(){
	var param = $('.frm_std').serialize();
	$('#content').load('list.std', param)
})

$('#btnView').click(function(){
	var param = $('.frm_std').serialize();

	$('#content').load('view.std', param)
})

$('#btnInsert').click(function(){
	var param = $('.frm_std').serialize();
	$('#content').load('./student/insert.jsp', param)
})

$('#btnInsertR').click(function(){
	var data = new FormData($('#frm_std')[0]);
	
	$.ajax({
		url   : 'insertR.std',
		data  : data,
		type  : 'post',
		contentType : false,
		processData : false,
		success : function(resp){
			$('#content').html(resp);
		}
	})
})

// -----------------------------------------------
// 수정 관련 모듈
// -----------------------------------------------
$('#btnModify').click(function(){
	var param = $('.frm_std').serialize();
	$('#content').load('modify.std', param)
})

$('#btnModifyR').click(function(){
	var data = new FormData($('#frm_std')[0]);
	
	$.ajax({
		url   : 'modifyR.std',
		data  : data,
		type  : 'post',
		contentType : false,
		processData : false,
		success : function(resp){
			$('#content').html(resp);
		}
	})
	
})


// -----------------------------------------------
// 삭제 관련 모듈
// -----------------------------------------------

$('#btnDeleteR').click(function(){
	var pwd = prompt('삭제하려면 암호를 입력하세요');
	$('.frm_std')[0].pwd.value = pwd;
	var param = $('.frm_std').serialize();
	
	$('#content').load('deleteR.std', param)
})

</script>