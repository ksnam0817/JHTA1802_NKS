<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#insert {
	position: relative;
}
#insert label{
	display: inline-block;
	width  : 90px;
	text-align: right;
}

#insert .photoZone{
	position : absolute;
	top : 25px;
	right : 90px;
}
</style>
<script charset="UTF-8" type="text/javascript" 
	src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=true"></script>

<script>
$(function(){

	$('#btnPhoto').click(function(){
		//파일 미리보기
		var btn = document.frm_std.photo;
		
		btn.onchange =function(ev){
			var f = ev.srcElement;
			var url = f.files[0];
			var reader = new FileReader();
			var p = $('#photo')[0]
			reader.readAsDataURL(url);
			reader.onload = function(e){
				p.src = e.target.result;//<img src='...'/>
			}
			
		}
		
		
	})	
	
})

	$('#btnZip').click(function(){
	    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
						var ff = document.frm_std;
						ff.post.value = data.zonecode;
						ff.address.value = data.roadAddress;
						
	            }
	        }).open();
	    });
		
	})

</script>
</head>
<body>
<div id='insert'>
	<h2>학생 입력</h2>
	<form name='frm_std' id='frm_std' method='post' enctype='multipart/form-data' 
			action='insertR.std'>
		<label>아이디</label>
		<input type='text' name='id' value='tester'><br/>
		
		<label>성명</label>
		<input type='text' name='name'/><br/>
		
		<label>연락처</label>
		<input type='text' name='phone'/><br/>

		<label>이메일</label>
		<input type='text' name='email' size='40'/><br/>

		<label>우편번호</label>
		<input type='text' name='post' size='5' readonly/>
		<input type='button' value='우편번호' id='btnZip' />
		<br/>

		<label>주소</label>
		<input type='text' name='address' size='50'/><br/>

		<label>사진</label>
		<input type='file' name='photo' id='btnPhoto'><br/>
		<label>암호</label>
		<input type='password' name='pwd'/>		
		<p/>							
			
		<span class='photoZone'>
			<img src='http://placehold.it/150x200' id='photo'/>
		</span>	
			
		<label></label>
		<input type='button' id='btnInsertR' value='자료 저장'/>
		<input type='button' id='btnList' value='목록'/>
	</form>
	
	<%@include file="param.jsp" %>
	
</div>
</body>
</html>