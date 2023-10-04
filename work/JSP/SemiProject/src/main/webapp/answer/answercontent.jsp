<%@page import="Dto.AnswerDto"%>
<%@page import="Dao.AnswerDao"%>
<%@page import="org.json.simple.JSONObject"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idx = request.getParameter("idx"); //시퀀스번호
String myid = request.getParameter("myid"); //아이디
String content=request.getParameter("content"); //댓글내용
String star = request.getParameter("star"); //별점

AnswerDao dao = new AnswerDao();
AnswerDto dto = dao.getData(idx);

JSONObject ob =new JSONObject();

ob.put("idx",idx);
ob.put("myid",myid);
ob.put("content",content);
ob.put("star",star);

%>
<%=ob.toString()%>