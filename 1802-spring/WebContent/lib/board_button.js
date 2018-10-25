/**
 *  조회, 목록, 상세보기 버튼들의 스크립트
 *  date : 2018. 8(pwg) 
 */

var ff ;

$('#btnList').click(function(){
	ff = document.frm_board;
	var param = $(ff).serialize();
	var bp = ff.backPage.value;
	
	if(bp == 'list'){
		$('#content').load('list.brd', param);
	}else{
		$('#content').load('list_album.brd', param);
	}
	
	sessionStorage.setItem('inc_url', bp+'.brd');
	sessionStorage.setItem('inc_param', param);	
})


$('#btnSearch').click(function(){
	ff = document.frm_board;
	ff.nowPage.value = 1;
	var param = $(ff).serialize();
	
	$('#content').load('list.brd', param);
	sessionStorage.setItem('inc_url', 'list.brd');
	sessionStorage.setItem('inc_param', param);
})

$('#btnSearchAlbum').click(function(){
	var param = $('.frm_board').serialize();
	$('#content').load('list_album.brd', param)
	
	sessionStorage.setItem('inc_url', 'list_album.brd');
	sessionStorage.setItem('inc_param', param);	
})

/* 입력 ---------- */
$('#btnInsert').click(function(){
	var param = $('.frm_board').serialize();
	$('#content').load('insert.brd', param);
	
	sessionStorage.setItem('inc_url', 'insert.brd');
	sessionStorage.setItem('inc_param', param);	
})

$('#btnRegister').click(function(){
	var ff = document.frm_board;
	var data = new FormData(ff);
	$.ajax({
		url   : 'insertR.brd',
		data  : data,
		type  : 'post',
		contentType : false,
		processData : false,
		success : function(resp){
			$('#content').html(resp);
		}
	});

});


$('#btnDelete').click(function(){
	var ff = document.frm_board;
	var pwd = prompt("정말로 삭제하시려면 암호를 ... ");
	ff.pwd.value = pwd;
	var param = $(ff).serialize();
	
	$('#content').load('deleteR.brd', param);	
})


$('#btnModify').click(function(){
	ff = document.frm_board;
	var param = $(ff).serialize();
	
	$('#content').load('modify.brd', param);	
	
	sessionStorage.setItem('inc_url', 'modify.brd');
	sessionStorage.setItem('inc_param', param);
})

$('#btnModifyR').click(function(){
	var ff = document.frm_board;
	var data = new FormData(ff);
	$.ajax({
		url   : 'modifyR.brd',
		data  : data,
		type  : 'post',
		contentType : false,
		processData : false,
		success : function(resp){
			$('#content').html(resp);
		}
	});

});


$('#btnRepl').click(function(){
	ff = document.frm_board;
	var param = $(ff).serialize();
	$('#content').load('repl.brd', param);	

	sessionStorage.setItem('inc_url', 'repl.brd');
	sessionStorage.setItem('inc_param', param);
})

$('#btnReplR').click(function(){
	var ff = document.frm_board;
	var data = new FormData(ff);
	$.ajax({
		url   : 'replR.brd',
		data  : data,
		type  : 'post',
		contentType : false,
		processData : false,
		success : function(resp){
			$('#content').html(resp);
		}
	});

});

/* 이미지 더 보기 --------------------------------- */
$('#btnImageMore').click(function(){
	var ff = document.frm_board;
	ff.nowPage.value = Number(ff.nowPage.value) + 1;
	
	var param = $('.frm_board').serialize();
	
	
	$('<span>').load('list_album_append.brd' , param, function(){
		$('#att_list').append(this);
	});
	
	
	sessionStorage.setItem('inc_url', 'list_album.brd');
	sessionStorage.setItem('inc_param', param);	

})



$('#btnView').click(function(){
	var ff = document.frm_board;
	go(ff.serial.value);
})


function go(serial){
	ff = document.frm_board;
	ff.serial.value = serial;
	var param = $('.frm_board').serialize();
	$('#content').load('view.brd', param)
	
	sessionStorage.setItem('inc_url', 'view.brd');
	sessionStorage.setItem('inc_param', param);
}

function movePage(nowPage){
	
	ff = document.frm_board;
	ff.nowPage.value = nowPage;
	var bp = ff.backPage.value;

	var param = $('.frm_board').serialize();
	
	if(bp == 'list'){
		$('#content').load('list.brd', param);
	}else{
		$('#content').load('list_album.brd', param);
	}	
	
	sessionStorage.setItem('inc_url', bp+ '.brd');
	sessionStorage.setItem('inc_param', param);
	
}






