<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="v"  items="${list }" >
	<span>
		<img src = './upload/${v.attfile}' width="120px" height='150px' 
			onclick = 'go(${v.pSerial })' 	><br/>
	</span>
</c:forEach>

<c:if test="${image_last=='true' }">
	<script>
		var btnMore = document.getElementById("btnImageMore");
		btnMore.style.display='none';
	</script>
</c:if>
