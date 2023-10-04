<%@page import="db.memo.MemoDao"%>
<%@page import="db.memo.MemoDto"%>
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
	String num=request.getParameter("unum");
	String writer=request.getParameter("uwriter");
	String story=request.getParameter("ustory");
	String avata=request.getParameter("uavata");
	
	//입력 데이터를 dto 묶어서
	MemoDto dto=new MemoDto();
	
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setStory(story);
	dto.setAvata(avata);
	
	//update 메소드 전달
	MemoDao dao=new MemoDao();
	dao.memoupdate(dto);
%>
</body>
</html>