<%@page import="db.memo.MemoDto"%>
<%@page import="db.memo.MemoDao"%>
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
	MemoDao dao=new MemoDao();

	//엔코딩
	request.setCharacterEncoding("utf-8");
	
	//데이터읽기(writer,story,avata)
	String writer=request.getParameter("writer");
	String story=request.getParameter("story");
	String avata=request.getParameter("avata");
	
	//dto로 묶기
	MemoDto dto=new MemoDto();
	dto.setWriter(writer);
	dto.setStory(story);
	dto.setAvata(avata);
	
	dao.insertMemo(dto);
%>
</body>
</html>
</html>