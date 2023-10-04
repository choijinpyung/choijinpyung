<%@page import="Dto.MovieDto"%>
<%@page import="Dao.MovieDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>
  table {
    width: 100%;
    max-width: 1920px;
    margin: 0 auto;
  }
</style>
</head>
<%
	MovieDao dao=new MovieDao();
	List<MovieDto> list=dao.getAllMovies();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>

<body>
<h2 align="center">관리자 페이지 영화 리스트</h2>
<div class="container">
<table class="table table-bordered" style="font-size: 0.8em;" >
<tr class="table-success" valign="middle" align="center">
	
	<th>번호</th>
	<th>제목</th>
	<th>포스터</th>
	<th>감독</th>
	<th>줄거리</th>
	<th>트레일러</th>
	<th>개봉일자</th>
	<th>기본정보</th>
	<th>등록일자</th>
	<th>장르</th>
	<th>배우</th>
	<th>성인가격</th>
	<th>청소년가격</th>
	<th>아동가격</th>
	<th>영화관리</th>
</tr>
<%
	for(int i=0;i<list.size();i++){
		MovieDto dto = list.get(i);
		%>
	<tr style="text-align: center; ">
		<td><%=dto.getMv_no() %></td>
		<td><%=dto.getMv_title() %></td>

		
		<td><img src="../<%=dto.getMv_poster() %>" width="100px" height="auto"></td>
		<td><%=dto.getMv_director() %></td>
		<td><%=dto.getMv_st() %></td>
		<td><%=dto.getMv_trailer() %></td>
		<td><%=dto.getMv_opendate() %></td>
		<td><%=dto.getMv_info() %></td>
		<td><%=sdf.format(dto.getMv_regdate()) %></td>
		<td><%=dto.getMv_genre() %></td>
		<td><%=dto.getMv_name() %></td>
		<td><%=dto.getMv_adult() %></td>
		<td><%=dto.getMv_teen() %></td>
		<td><%=dto.getMv_child() %></td>
		<td> 
		<button type="button" class="btn btn-outline-warning" 
		onclick="location.href='updateAdminForm.jsp?num=<%=dto.getMv_no()%>'">정보수정</button><br><br><br><hr><br><br><br>
		<button type="button" class="btn btn-outline-danger" 
		onclick="location.href='deleteAdmin.jsp?num=<%=dto.getMv_no() %>'">정보삭제</button>
		</td>
	</tr>	
	<%}
%>
</table>
<button type="button" class="btn btn-outline-success"
 onclick="location.href='insertAdminForm.jsp'">정보추가</button>
</div>
</body>
</html>
