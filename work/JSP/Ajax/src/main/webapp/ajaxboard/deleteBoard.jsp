<%@page import="db.ajaxboard.ajaxBoardDto"%>
<%@page import="db.ajaxboard.ajaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num=request.getParameter("num");

ajaxBoardDao dao=new ajaxBoardDao();

dao.deleteForm(num);
%>