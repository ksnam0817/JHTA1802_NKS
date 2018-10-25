<%@page import="bean.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>

</head>
<body>

<%
String searchStr = request.getParameter("searchStr");
String np = request.getParameter("nowPage");


int nowPage = 1;

if(searchStr == null) searchStr = "";
if (np != null) nowPage = Integer.parseInt(np);

BoardDao dao = new BoardDao();
dao.setNowPage(nowPage);


 List<BoardVo> list = dao.select(searchStr);
request.setAttribute("list", list);
request.setAttribute("dao", dao);
%>


<form name='frmList' id='frmList'>
<div id='list'>
	<h3 id='info'>	myBatis 게시판 - 글목록</h3>
	<div id='search'>
		<input type='text' name='searchStr' id='searchStr' placeholder="검색어를 입력하세요" value='${param.searchStr}'/>
		<input type='button' name='btnSearch' id='btnSeach' value='검색' />
	</div>
	<div id='cols'>
		<span class='rownum' >RN</span>
		<span class='no' >S</span>
		<span class='writer'>작성자ID</span>
		<span class='subject'>글제목</span>
		<span class='hit' >조회수</span>
		<span class='mdate'>수정일</span>
	</div>
	<hr class='listHrs'/>	

	<div class='rows'>
		<c:forEach var='i' items='${list}'>
		<div class='row'>
			<span class='rownum'>${i.num}</span>
			<span class='no' onclick="view('${i.serial}')" >${i.serial}</span>
			<span class='writer'>${i.id }</span>
			<span class='subject'>${i.subject }</span>
			<span class='hit' >${i.hit }</span>
			<span class='mdate'>${i.mdate }</span>
		</div>
		</c:forEach>
	</div>


	<hr class='listHrs' />
	
	<div id='buttons'>
		<!-- 왼쪽꺽쇄 -->
		<c:if test="${dao.nowBlock > 1}">
		<input type='button'  id='btnFirst' value='첫블록' onclick='movePage(1)'/>	
		<input type='button'  id='btnPrev' value='이전블록' onclick='movePage(${dao.startPage-1})'/>
		</c:if>
		
		<!-- 페이지번호 -->
		<c:forEach begin="${dao.startPage}" end="${dao.endPage}" varStatus="status"> 
			
			<!-- '현재페이지'번호를 굵게 -->
			<c:choose>
				<c:when test="${status.index == dao.nowPage}">
					<input type='button' value='${status.index}' onclick='movePage(${status.index})' class='nowPage' />
				</c:when>
				
				<c:otherwise>
					<input type='button' value='${status.index }' onclick='movePage(${status.index})' />
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 오른쪽꺽쇄 -->
		<c:if test="${dao.nowBlock < dao.totBlock}">
		<input type='button' id='btnNext' value='다음블록' onclick='movePage(${dao.endPage+1})'/>
		<input type='button' id='btnLast' value='마지막블록' onclick='movePage(${dao.totPage})'/>
		</c:if>
	</div>	
	<hr class='listHrs'/>	
	
	<div id='write'>
		<input type='button' value='글쓰기' name='btnWrite' id='btnWrite' />
	</div>
			
</div>

<!--  hidden들 -->
<label for='nowPage'>nowPage: </label>
<input type='text' name='nowPage' value='${dao.nowPage}' /><br/>

<label for='serial'>serial: </label>
<input type='text' name='serial' />
</form>

<script>
var f = document.frmList;

// [글쓰기]버튼이 클릭되면
f.btnWrite.onclick = function(){
	var param = $('#frmList').serialize();
	$('#content').load('./board/write.jsp', param);
};	


// [검색]버튼이 클릭되면
f.btnSearch.onclick = function() {
	var param = $('#frmList').serialize();
	$('#content').load('./board/list.jsp', param);
};

// [글번호]가 클릭되면
function view(serial) {
	f.serial.value = serial;
	var param = $('#frmList').serialize();
	$('#content').load('./board/view.jsp', param);
};



// [페이지번호]가  클릭되면
function movePage(nowPage) {
	f.nowPage.value = nowPage;
		
	var param = $('#frmList').serialize();
	$('#content').load('./board/list.jsp', param);
};
 

</script>
</body>
</html>
