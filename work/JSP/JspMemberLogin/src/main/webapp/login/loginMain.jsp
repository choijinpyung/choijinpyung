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
<%
	String loginok=(String)session.getAttribute("loginok");

	if(loginok==null || loginok.equals("")) //logout
	{%>
		<jsp:include page="loginForm.jsp"/>
	<%}
	else //login
	{%>
		<jsp:include page="../member/memberList.jsp"/>	
	<%}
%>
</body>
</html>