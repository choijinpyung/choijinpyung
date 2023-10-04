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
	<div class="loginForm" style="border: 1px solid black; width: 300px; height: 200px; border-radius: 10px; background-color: white;
			margin-left: 240px;">
	<%
		//세션으로부터 아이디를 얻는다
		String myid=(String)session.getAttribute("myid");
	
		//db에 있는 값을 가져온다
		MemberDao dao=new MemberDao();
		String name=dao.getName(myid);
	%>
	<div align="center">
	<img alt="" src="image1/3.png" width="298px;" height="150px;" style="border-radius: 10px 10px 0px 0px;">
	</div>
	<div align="center" style="margin-top: 5px;"><b><%=name %>님이 로그인 하셨습니다</b>&nbsp;&nbsp;
	<button type="button" class="btn btn-danger"
	onclick="location.href='login/logoutaction.jsp'">로그아웃</button>	</div>
	</div>
</body>
</html>