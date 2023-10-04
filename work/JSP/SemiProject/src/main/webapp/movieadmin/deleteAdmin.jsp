<%@page import="Dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   MovieDao dao=new MovieDao();
   String num=request.getParameter("num");
   dao.deleteMovie(num);
   
   response.sendRedirect("listAdmin.jsp");
%>