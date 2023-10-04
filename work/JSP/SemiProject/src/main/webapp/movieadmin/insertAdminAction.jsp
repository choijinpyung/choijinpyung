<%@page import="Dto.MovieDto"%>
<%@page import="Dao.MovieDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link  href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
 		rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<% 
	String realPath =getServletContext().getRealPath("/upload");

	int uploadSize=1024*1024*3;
	System.out.println(realPath);
	
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
			new DefaultFileRenamePolicy());
	//dao선언
	MovieDao dao=new MovieDao();
	//dto
	MovieDto dto=new MovieDto();
	
	dto.setMv_title(multi.getParameter("title"));
	//포스터는 따로
	dto.setMv_director(multi.getParameter("director"));
	dto.setMv_st(multi.getParameter("st"));
	dto.setMv_trailer(multi.getParameter("trailer"));
	dto.setMv_opendate(multi.getParameter("opendate"));
	dto.setMv_info(multi.getParameter("info"));
	dto.setMv_genre(multi.getParameter("genre"));
	dto.setMv_name(multi.getParameter("name"));
	dto.setMv_adult(Integer.parseInt(multi.getParameter("adult")));
	dto.setMv_teen(Integer.parseInt(multi.getParameter("teen")));
	dto.setMv_child(Integer.parseInt(multi.getParameter("child")));
	
	//포스터
	String poster=multi.getFilesystemName("poster");
	
	dto.setMv_poster("/upload/"+poster); //사진선택한경우
	
	//db에 insert    
	dao.insertMovie(dto);
	
	//성공후 이동
	response.sendRedirect("listAdmin.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>