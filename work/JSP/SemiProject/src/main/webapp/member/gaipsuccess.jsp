<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
   <div style="margin: 200px 200px;">
      <b><%=name %>님의 회원가입을 축하합니다</b>
      <br><br>
      <button type="button" class="btn btn-outline-info" onclick="location.href='../login/loginmain.jsp'">로그인</button>
      <button type="button" class="btn btn-outline-success" onclick="location.href='index.jsp'">메인</button>
   </div>
   
</body>
</html>