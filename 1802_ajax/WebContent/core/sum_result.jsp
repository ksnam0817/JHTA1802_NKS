<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sum_result</title>
</head>
<body>
<%
	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));
	int sum = 0;
	
	StringBuffer sb = new StringBuffer();
	for (int i=x; i<=y; i++) sum += i;
	
		String str = String.format("%d 부터 %d 까지의 합: %d ", x, y, sum);
		out.print(str);

%>
</body>
</html>