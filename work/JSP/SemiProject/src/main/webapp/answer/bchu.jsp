<%@page import="org.json.simple.JSONObject"%>
<%@page import="Dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  //num
  String idx=request.getParameter("idx");
  //dao
  AnswerDao adao=new AnswerDao();
  //num에 해당하는 chu 증가
  adao.updateBchu(idx);
  System.out.println("비츄 페이지로드");
  
  //증가된 chu값을 json형식으로 변환
  int bchu=adao.getData(idx).getBchu();
  
  System.out.println("Bchu="+bchu);
  
  
  JSONObject ob=new JSONObject();
  ob.put("bchu", bchu);
  ob.put("idx", idx);
%>
<%=ob.toString()%>