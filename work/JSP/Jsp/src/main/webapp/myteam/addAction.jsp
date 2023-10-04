<%@page import="model.myteam.TeamDao"%>
<%@page import="model.myteam.TeamDto"%>
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

   request.setCharacterEncoding("utf-8");

   String name=request.getParameter("name");
   String driver=request.getParameter("driver");
   String addr=request.getParameter("addr");
   
   TeamDto dto=new TeamDto();
   dto.setName(name);
   dto.setDriver(driver==null?"없음":"있음");
   dto.setAddr(addr);
   
   TeamDao db=new TeamDao();
   db.insertMyTeam(dto);
   
   response.sendRedirect("list.jsp");
%>
</body>
</html>
</html>