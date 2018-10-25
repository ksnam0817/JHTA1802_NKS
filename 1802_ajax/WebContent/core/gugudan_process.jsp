<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			int dan = Integer.parseInt(request.getParameter("dan"));
			StringBuffer sb = new StringBuffer();
			
			for (int i=1; i<10; i++) {
				String temp = String.format("%d * %d = %d <br/>", dan, i , (dan*i));
				sb.append(temp);
			}
			out.print(sb.toString());
			
		%>
</body>
</html>