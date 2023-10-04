<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="Dto.AnswerDto"%>
<%@page import="Dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
AnswerDao dao = new AnswerDao();

request.setCharacterEncoding("utf-8");

String content = request.getParameter("content");
String star = request.getParameter("star");
String num = request.getParameter("num");
String myid=(String)session.getAttribute("myid");

LocalDateTime now=LocalDateTime.now();
String sdfNow=now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0"));

AnswerDto dto = new AnswerDto();
dto.setContent(content);
dto.setStar(star);
dto.setNum(num);
dto.setMyid(myid);

dao.insertAnswer(dto,sdfNow);
%>