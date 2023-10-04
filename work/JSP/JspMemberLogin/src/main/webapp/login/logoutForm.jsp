<%@page import="idx.model.idxDao"%>
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
	//세션으로부터 idok
	String id=(String)session.getAttribute("idok");

	//아이디에 해당하는 이름을 dao로부터 얻는다
	idxDao db=new idxDao();
	String name=db.getName(id);
%>

<br><br>
<img alt="" src="../image/html_img/naver.gif" style="margin-left: 478px;">
<br><br>
<b style="margin-left: 550px;"><%=name %>님이 로그인중~~~</b><br><br>
<div>
<input type="button" value="회원목록" class="btn btn-outline-warning"
onclick="location.href='../member/memberList.jsp'" style="margin-left: 545px;">
<input type="button" value="로그아웃" class="btn btn-outline-danger"
onclick="location.href='logoutAction.jsp'" style="margin-left: 1px;">
</div>
</body>
</html>