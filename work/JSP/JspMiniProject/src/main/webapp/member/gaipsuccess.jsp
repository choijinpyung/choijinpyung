<%@page import="data.dao.MemberDao"%>
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
	String id=request.getParameter("id");
	MemberDao dao=new MemberDao();
	//아이디에 대한 이름 얻기
	String name=dao.getName(id);
%>

	<div style="margin: 0px 100px;">
	
	<img alt="" src="image2/1.png" style="width: 300px;">
	<img alt="" src="image2/1.png" style="width: 300px;">
	<div style="float: right; margin-right: 22px; margin-top: 20px;">
	<button type="button" class="btn btn-outline-success"
	onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>
	<button type="button" class="btn btn-outline-danger"
	onclick="location.href='index.jsp'">메인으로</button>
	</div>
	
	</div>
	
</body>
</html>