<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String code=request.getParameter("s_code");
	String name=request.getParameter("s_name");
	String price=request.getParameter("s_price");
	String color=request.getParameter("color");
	
	JSONObject ob=new JSONObject();
	ob.put("code", code);
	ob.put("name", name);
	ob.put("price", price);
	ob.put("color", color);
%>

<%=ob.toString() %>