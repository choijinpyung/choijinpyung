<%@page import="quizproject.db.QuizProjectDto"%>
<%@page import="java.util.List"%>
<%@page import="quizproject.db.QuizProjectDao"%>
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
<style type="text/css">
</style>
</head>
<%
QuizProjectDao dao = new QuizProjectDao();
List<QuizProjectDto> list = dao.QuizgetAllBoards();
int itemsPerRow = 5; // 한 행에 출력할 아이템 개수 설정
%>
<body>
<div style="margin: 150px 135px; width: 1000px;">
<% for (int i = 0; i < list.size(); i++) { 
    QuizProjectDto dto = list.get(i);
    if (i % itemsPerRow == 0) { %>
        <div style="display: flex; justify-content: space-between;">
    <% } %>
    <table style="width: 400px;">
        <tr>
            <td align="center"><img src="<%= dto.getImgname() %>" width="50px;" height="50px;"
                style="border-radius: 20px; border: 1px solid gray;"></td>
        </tr>
        <tr>
            <td align="center" style="width: 180px;">제목 : <%= dto.getTitle() %></td>
        </tr>
        <tr>
            <td align="center" style="width: 170px;">작성자 : <%= dto.getWriter() %></td>
        </tr>
    </table>
    <% if ((i + 1) % itemsPerRow == 0 || i == list.size() - 1) { %>
        </div>
        
    <% } %>
    
<% } %>

<button type="button" class="btn btn-outline-danger" style="margin-left: 862px; margin-top: 70px;"
	onclick="location.href='quizlist.jsp'">뒤로가기</button>
</div>
</body>
</html>