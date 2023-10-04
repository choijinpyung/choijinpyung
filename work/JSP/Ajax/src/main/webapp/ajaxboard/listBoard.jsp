<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="db.ajaxboard.ajaxBoardDto"%>
<%@page import="java.util.Vector"%>
<%@page import="db.ajaxboard.ajaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
   ajaxBoardDao dao=new ajaxBoardDao();
   Vector<ajaxBoardDto> list=dao.getAllDatas();
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
   JSONArray arr=new JSONArray();
   for(ajaxBoardDto dto:list)
   {
      JSONObject ob=new JSONObject();
      ob.put("num", dto.getNum());
      ob.put("writer",dto.getWriter());
      ob.put("subject",dto.getSubject());
      ob.put("story",dto.getStory());
      ob.put("avata",dto.getAvata());
      ob.put("writeday",sdf.format(dto.getWriteday()));
      
      arr.add(ob);
   }
   
%>
<%=arr.toString() %>