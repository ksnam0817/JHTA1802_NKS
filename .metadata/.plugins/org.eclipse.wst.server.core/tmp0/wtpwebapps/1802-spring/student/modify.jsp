<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./lib/jquery-3.3.1.min.js"></script>
<script charset="UTF-8" type="text/javascript" 
	src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=true"></script>

<style>
#modify #frm_std{
	position: relative;
}

#modify #frm_std .title{
	display: inline-block;
	width  : 90px;
	text-align: right;
	margin-bottom: 4px;
}

#modify  #frm_std .photo{
	position : absolute;
	top : 5px;
	right : 90px;
}

#modify #btnZone{
	margin-left:60px;
}
</style>


<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-37" data-genuitec-path="/1802-spring/WebContent/student/modify.jsp">
<div id='modify' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-37" data-genuitec-path="/1802-spring/WebContent/student/modify.jsp">
	<h2>학생정보 수정</h2>
	<form name='frm_std' id='frm_std' class='frm_std' method='post' 
			enctype='multipart/form-data'>
			
		<span class='title'>아이디</span>
		<input type='text' name='id' value='${vo.id }' /><br/>
		
		<span class='title'>성명</span>
		<input type='text' name='name' value='${vo.name }' /><br/>
		
		<span class='title'>우편번호</span>
		<input type='text' name='post' size='5' readonly/>
		<input type='button' value='우편번호' id='btnZip' />
		<br/>
	
		<span class='title'>주소</span>
		<input type='text' name='address' value='${vo.address}' size='50'/><br/>
				
		<span class='title'>연락처</span>
		<input type='text' name='phone' value='${vo.phone}' /> <br/>
	
		<span class='title'>이메일</span>
		<input type='text' name='email' value='${vo.email}' size='40'/><br/>
	
		<span class='title'>사진</span>
		<input type='file' name='photo' id='photo'/><br/>
		
		<span class='title' id='dialog_pwd'>암 호</span>
		<input type='password' size='8' name='pwd' />[작성시 암호]<p/>

		<span class='photo'>
					<c:choose>
				<c:when test="${vo.photo == null }">
					<img src='http://placehold.it/150x200' id='pho'/>
				</c:when>
				
				<c:when test="${vo.photo != null }">
						<img src='./upload/${vo.photo}' width='150px' height='200px'
									alt="${vo.photo }" id='pho' />	
					</a>							
				</c:when>
			</c:choose>
		
		
	
		</span>
		<br/>

		<div id='btnZone'>
			<input type='button' value='저장' name='btnModifyR'   id='btnModifyR'/>
			<input type='button' value='목록' name='btnList'      id='btnList'/>
		</div>
		
		<input type='hidden' value='${vo.delFile }'    name='delFile'/>
		<input type='hidden' value='${param.findStr }' name='findStr'/>
		<input type='hidden' value='${param.nowPage }' name='nowPage'/>
			
	</form>
	<%@include file="param.jsp" %>
</div>
<script>

$('#photo').click(function(){
	//파일 미리보기
	var btn = document.frm_std.photo;
	
	btn.onchange =function(ev){
		var f = ev.srcElement;
		var url = f.files[0];
		var reader = new FileReader();
		var p = $('#pho')[0];
		reader.readAsDataURL(url);
		reader.onload = function(e){
			p.src = e.target.result;//<img src='...'/>
		}
		
	}
	
	
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
</body>
</html>