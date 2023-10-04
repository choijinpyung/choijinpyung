<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="db.ajaxboard.ajaxBoardDto"%>
<%@page import="db.ajaxboard.ajaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");

ajaxBoardDao dao = new ajaxBoardDao();

ajaxBoardDto dto = dao.getData(num);
SimpleDateFormat sdf = new SimpleDateFormat();
JSONObject ob = new JSONObject();

ob.put("num", dto.getNum());
ob.put("writer", dto.getWriter());
ob.put("story", dto.getStory());
ob.put("subject", dto.getSubject());
ob.put("avata", dto.getAvata());
ob.put("writeday", sdf.format(dto.getWriteday()));
%>

<%=ob.toString()%>