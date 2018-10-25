<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메일 전송</title>
<script src="../lib/jquery-3.3.1.min.js"></script>
<style>
#mail  label{
   display:inline-block;
   width:70px;
   text-align: right;
   vertical-align: top;
}
#mail>form{
   line-height: 170%;
}
</style>
</head>
<body>
<div id='mail'>
   <h2 id='title'>메일 발송</h2>
	<form name='frm_mail' id='frm_mail' method='post' action='mail_send.jsp' 
	           enctype='multipart/form-data'>
	   <label>발신자</label>
	   <input type='text' size='50' name='sender' value='hipwg@naver.com'><br/>
	   
	   <label>수신자</label>
	   <input type='text' size='50' name='receiver' value='${param.email }'><br/>
	
	   <label>제목</label>
	   <input type='text' size='80' name='subject' value='식사는 하셨나요???'><br/>
	
	   <label>내용</label>
	   <textarea cols='82' rows='10' name='content'>밥먹으로 가시죠 !!!!</textarea><br/>
	   
	   <label>첨부파일</label>
	   <input type='file' name='attfile'/>
	   
	   <p/>
	   <label></label>
	   <input type='button' value='전송' id='btnSendMail' name='btnSendMail'>
	   <input type='button' value='취소' id='btnCancel' name='btnCancel'>
	   
	   <input type='hidden' name='id'      value='${param.id }' />
	   <input type='hidden' name='findStr' value='${param.findStr }' />
	   <input type='hidden' name='nowPage' value='${param.nowPage }' />
	   
	</form>
</div>
</body>
<script>
var ff = document.frm_mail;
ff.btnCancel.onclick = function(){
	viewContent('view.std', $('#frm_mail')[0]);
}

ff.btnSendMail.onclick = function(){
	var data = new FormData(ff);
	
	$.ajax({
		url         : './mail/mail_send.jsp',
		data        : data,
		type        : 'post',
		contentType : false,
		processData : false,
		success     : function(resp){
			$('#content').html(resp);
		}
	})
	
	//viewContent('./mail/mail_send.jsp', $('#frm_mail')[0]);
}

</script>



</html>










	