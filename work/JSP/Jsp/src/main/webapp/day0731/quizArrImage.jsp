<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- f1~f20.png 4행 5열 (2중 or로 출력하세요) -->
<table class="table table-bordered" style="width: 300px">
	<%
	int n=0;
	
	for(int row=1; row<=4; row++)
	{%>
		<tr>
		<%
		for(int col=1;col<=5;col++)
		{
			n++;
		%>
			<td>
				<img alt="" src="../image/연예인사진/<%=n%>.jpg" width="150" height="200">
		<%}
		%>
	<%}
	%>		
</table>
</body>
</html>