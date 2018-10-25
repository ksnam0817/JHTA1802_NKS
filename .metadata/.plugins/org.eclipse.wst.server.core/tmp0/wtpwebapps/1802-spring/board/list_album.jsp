<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel='stylesheet' type='text/css' href='./lib/board.css' />
<script src='./lib/append_file.js'></script>
<script src='./lib/board_button.js'></script>
<style>
#frm_board{
	overflow      : hidden;
	background    : #dddddd;
	margin-bottom : 5px;
	padding       : 3px;
	box-sizing    : border-box;
}

#frm_board #findZone{
	float   : right;
}

#att_files  span{
	display :  inline-block;
	cursor  :  pointer;
}

#btnImageMore{
	width      : 280px;
	height     : 45px;
	margin-top : 20px;
	text-align : center;
	border     : 2px solid #cccccc;
	background : #eeeeee;
	padding    : 6px;
	box-sizing : border-box;
	border-radius : 20px;
	
}
</style>


<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"60061",secure:"60066"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-4" data-genuitec-path="/1802-spring/WebContent/board/list_album.jsp">
	<div id='brd' data-genuitec-lp-enabled="false" data-genuitec-file-id="wc2-4" data-genuitec-path="/1802-spring/WebContent/board/list_album.jsp">
		<div id='title'>사진 앨범</div>
		
		<div id='att_files'>
			
			<form name='frm_board' method='post' id='frm_board' class='frm_board'>
				<input type='button' value='입력' name='btnInsert' id='btnInsert'/>
				<div id='findZone'>
					<input type='text' name='findStr' size='40' value="${pVo.findStr}"  placeholder='파일명으로 검색'/>
					<input type='button' name='btnSearch' id='btnSearchAlbum' value='검색' />
				</div>
				<div id='hiddenZone'>
					<input type='hidden' name='nowPage'  value='${pVo.nowPage }' />
					<input type='hidden' name='backPage' value='${pVo.backPage }'/>
					<input type='hidden' name='serial'   value= '0'              />
				</div>
			</form>
			
			<div id='att_list'>
				<c:forEach var="v"  items="${list }" >
					<span>
						<img src = './upload/${v.attfile}' width="120px" height='150px' 
							onclick = 'go(${v.pSerial })' 	><br/>
					</span>
				</c:forEach>
			</div>
		</div>
		
		<c:if test="${dao.totPage > dao.nowPage }">
			<center><input type='button' value='이미지 더 보기' id='btnImageMore'/></center>
		</c:if>
		
	</div>
</body>


</html>