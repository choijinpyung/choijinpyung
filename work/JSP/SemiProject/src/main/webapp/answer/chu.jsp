<%@page import="org.json.simple.JSONObject"%>
<%@page import="Dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  //num
  String idx=request.getParameter("idx");
  //dao
  AnswerDao adao=new AnswerDao();
  //num에 해당하는 chu 증가
  adao.updateChu(idx);
  System.out.println("츄 페이지로드");
  
  //증가된 chu값을 json형식으로 변환
  int chu=adao.getData(idx).getChu();
  
  System.out.println("Chu="+chu);
  
  
  
  JSONObject ob=new JSONObject();
  ob.put("chu", chu);
  ob.put("idx", idx);
%>
<%=ob.toString()%>