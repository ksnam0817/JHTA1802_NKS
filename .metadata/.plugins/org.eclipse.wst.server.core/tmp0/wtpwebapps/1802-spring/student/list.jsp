<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
#buttons{
	text-align: center;
}
#buttons input{
	border-radius: 10px;
}
</style>
<script>
function view(id){
	document.frm_std.id.value = id;
	viewContent('view.std', document.frm_std);
}

function movePage(nowPage){
	var ff = document.frm_std;
	ff.nowPage.value = nowPage;
	viewContent('list.std', ff);
}
</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-35" data-genuitec-path="/1802-spring/WebContent/student/list.jsp">
<div id='list' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-35" data-genuitec-path="/1802-spring/WebContent/student/list.jsp">
	<div id='info'>학생정보 조회</div>
	<form name='frm_std' id='frm_std' class='frm_std'>
		<span id='left'>
			<input type='button' value='입력' id='btnInsert'>
		</span>
		<span id='right'>
			<input type='text' name='findStr' value='${param.findStr }'>
			<input type='button' value='검색' id='btnFind' >
		</span>

		<input type='hidden' name='id'>
		<input type='hidden' name='nowPage' value='${empty param.nowPage? 1 : param.nowPage}' />

	</form>
	<%@include file="./param.jsp" %>
	
	<c:forEach var='vo' items='${list }'>
		<div class='items' onclick = "view('${vo.id}')">
			<div class='id' >	${vo.id }</div>
			<div class='name'>${vo.name }</div>
			<div class='phone'>${vo.phone }</div>
			<div class='email'>${vo.email }</div>
			<div class='photo'>
				<c:choose>
					<c:when test="${vo.photo eq null}">
						<img src = 'http://placehold.it/100x130'/>
					</c:when>
					<c:when test="${vo.photo ne null}">
						<img src = './upload/${vo.photo }' width='100px' height='130px'/>
					</c:when>
				</c:choose>
			</div>
		</div>
	</c:forEach>
	
	
	<div id='buttons'>
		<c:if test='${dao.nowBlock>1}'>
			<input type='button' value='맨첨' onclick ='movePage(1)' id='btnFirst'/>
			<input type='button' value='이전' 
							onclick = 'movePage(${dao.startPage-1 })' id='btnPrev'/>
		</c:if>
		
		<c:forEach var='p' begin='${dao.startPage }' end='${dao.endPage}'>
			<c:set var='here' value=''/>
			<c:if test='${p == dao.nowPage }'>
				<c:set var='here' value="disabled" />
			</c:if>
			<input type='button' value='${p }' ${here } onclick='movePage(${p})' class='btnNowPage'/>
		</c:forEach>
		
		<c:if test = '${dao.nowBlock < dao.totBlock}'>
			<input type='button' value='다음' 
							onclick = 'movePage(${dao.endPage+1})' id='btnNext'/>
			<input type='button' value='맨끝' 
							onclick = 'movePage(${dao.totPage})' id='btnLast'/>
		</c:if>
	</div>
	
	
	
</div>
</body>
</html>