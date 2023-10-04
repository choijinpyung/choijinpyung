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
<%
	//로그인 상태 확인후 입력폼 나타낼것 회원만 보이게
	String loginok=(String)session.getAttribute("loginok");
%>
<body>
<%
	if(loginok!=null)
	{%>
		<jsp:include page="addform.jsp"/>
		<hr align="left" width="700">
	<%}
%>
</body>
</html>