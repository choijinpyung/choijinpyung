<%@page import="db.ajaxboard.ajaxBoardDto"%>
<%@page import="db.ajaxboard.ajaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

String writer=request.getParameter("writer");
String subject=request.getParameter("subject");
String story=request.getParameter("story");
String avata=request.getParameter("avata");

ajaxBoardDto dto=new ajaxBoardDto();

dto.setWriter(writer);
dto.setSubject(subject);
dto.setStory(story);
dto.setAvata(avata);

ajaxBoardDao dao=new ajaxBoardDao();

dao.insertBoard(dto);

%>