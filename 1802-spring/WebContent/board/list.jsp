<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='./lib/board.css' />
<script src='./lib/append_file.js'></script>
<script src='./lib/board_button.js'></script>

</head>
<body>
<div id='brd'>
	<div id='title'>자유 게시</div>
	<form name='frm_board' method='post' id='frm_board' class='frm_board'>
		<input type='button' value='입력' name='btnInsert' id='btnInsert'/>
		<div id='findZone'>
			<input type='text' name='findStr' value="${pVo.findStr}"/>
			<input type='button' name='btnSearch' id='btnSearch' value='검색' />
		</div>
		<div id='hiddenZone'>
			<input type='hidden' name='nowPage'  value='${pVo.nowPage }' />
			<input type='hidden' name='serial'   value='0'/>
			<input type='hidden' name='backPage' value='list'/>
		</div>
	</form>
	
	<!--  title  -->
	<div id='items_header'>
		<span class='serial'> No </span>
		<span class='subject'> 제 목 </span>		 
		<span class='id'> 작성자 </span>		 
		<span class='mdate'> 작성일 </span>		 
		<span class='hit'> 조회수 </span>		 
	</div>
	<div id='item_list'>
		<c:forEach var='v' items="${list }">
			<div id='items'>
				<span class='serial'> ${v.serial } </span>
				<span class='subject' onclick='go(${v.serial})'>
					${v.subject } [${v.cnt }] 
				</span>	 
				<span class='id'> ${v.worker } </span>		 
				<span class='mdate'> ${v.mdate } </span>		 
				<span class='hit'> ${v.hit } </span>		 
			</div>
		</c:forEach>
	</div>
	<hr/>
	<div id='buttons'>
		<c:if test='${dao.nowBlock>1}'>
			<input type='button' value='맨첨' onclick ='movePage(1)' id='btnFirst'/>
			<input type='button' value='이전' 
							onclick = 'movePage(${dao.startPage-1 })' id='btnPrev'/>
		</c:if>
		
		<c:forEach var='p' begin='${dao.startPage }' end='${dao.endPage}'>
			<c:set var='here' value=''/>
			<c:if test='${p == dao.nowPage }'>
				<c:set var='here' value="here" />
			</c:if>
			<input type='button' value='${p }' class='${here }' onclick='movePage(${p})' class='btnNowPage'/>
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