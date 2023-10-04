<%@page import="Dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idx = request.getParameter("idx");


AnswerDao dao = new AnswerDao();
dao.deleteAnswer(idx);
%>
