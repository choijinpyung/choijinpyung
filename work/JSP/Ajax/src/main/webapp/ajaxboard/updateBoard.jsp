<%@page import="db.ajaxboard.ajaxBoardDao"%>
<%@page import="db.ajaxboard.ajaxBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post방식
	request.setCharacterEncoding("utf-8");

	String num=request.getParameter("unum");
	String writer=request.getParameter("uwriter");
	String subject=request.getParameter("usubject");
	String story=request.getParameter("ustory");
	String avata=request.getParameter("uavata");
	
	//dto선언
	ajaxBoardDto dto=new ajaxBoardDto();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setStory(story);
	dto.setAvata(avata);
	
	//dao
	ajaxBoardDao dao=new ajaxBoardDao();
	dao.updateForm(dto);
%>