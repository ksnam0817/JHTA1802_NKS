<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#view #std_view{
	position: relative;
}

#view #std_view .title{
	display: inline-block;
	width  : 90px;
	text-align: right;
	margin-bottom: 4px;
}

#view #std_view .val{
	display: inline-block;
	width  : 280px;
	margin-bottom: 2px;
	border-bottom : 1px dashed #aaaaaa;
}
#view #std_view .email:hover{
	background: #eeeeee;
	cursor: pointer;
}

#view  #std_view .photo{
	position : absolute;
	top : 5px;
	right : 90px;
}

#view .frm_std{
	margin-left:60px;
}
</style>

</head>
<body>
<div id='view'>
	<h2>학생정보 상세보기</h2>
	
	<div id='std_view'>
	
		<span class='title'>아이디 / </span>
		<span class='val'>${vo.id }</span><br/>
		
		<span class='title'>성명 / </span>
		<span class='val'>${vo.name }</span><br/>
		
		<span class='title'>우편번호 / </span>
		<span class='val'>${vo.post}</span><br/>
	
		<span class='title'>주소 / </span>
		<span class='val'>${vo.address}</span><br/>
		
		<span class='title'>연락처 / </span>
		<span class='val'>${vo.phone}</span><br/>
	
		<span class='title'>이메일 / </span>
		<span class='val email' 
				onclick="viewContent('./mail/mail.jsp', $('.frm_std') )">${vo.email}
		</span><br/>
		
		<span class='photo'>
			<c:choose>
				<c:when test="${vo.photo == null }">
					<img src='http://placehold.it/150x200' />
				</c:when>
				
				<c:when test="${vo.photo != null }">
					<a href='./upload/${vo.photo}' download>
						<img src='./upload/${vo.photo}' width='150px' height='200px'
									alt="${vo.photo }" />	
					</a>							
				</c:when>
			</c:choose>
		
		</span><br/>
		<span>
		</span><br/>
	</div>	
	
	<p/>
	<form name='frm_std' class='frm_std' method='post'>
		<input type='button' name='btnModify'  id='btnModify' value='수정' />
		<input type='button' name='btnDeleteR' id='btnDeleteR' value='삭제' />
		<input type='button' name='btnList'    id='btnList'  value='목록' />
		<input type='hidden' name='id'       value='${vo.id }' /> 
		<input type='hidden' name='email'    value='${vo.email}' /> 
		<input type='hidden' name='pwd'  /> 
		<input type='hidden' name='photo'    value='${vo.photo }' />
		<input type='hidden' name='findStr'  value='${param.findStr }' /> 
		<input type='hidden' name='nowPage'  value='${empty param.nowPage? 1 : param.nowPage}' />
	</form>
	
	<%@include file="param.jsp" %>
	
</div>

</body>
</html>




