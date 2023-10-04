<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Dto.AnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.AnswerDao"%>
<%@page import="Dto.MovieDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
   MovieDto mdto = new MovieDto();
   AnswerDao adao = new AnswerDao();
   String num = request.getParameter("num");
   
   List<AnswerDto> list = adao.getAllAnswers(num);

   int totalrate = 0;
   double avgrate = 0;
   int totalcomment = 0;
   
   for(AnswerDto adto : list) {
      
	   // 총 평점
      totalrate += Integer.parseInt(adto.getStar());
   }
   
   // 평균 평점
   avgrate = (double)totalrate / (list.size());
   
   //총댓글수
   totalcomment = list.size();
   
   
   
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   JSONArray arr = new JSONArray();
   for(AnswerDto dto : list) {
      JSONObject ob = new JSONObject();

      ob.put("num", dto.getNum());
	  ob.put("totalrate", totalrate);
	  ob.put("avgrate", avgrate);
	  ob.put("totalcomment", totalcomment);
      
      arr.add(ob);
   }
%>


<%=arr.toString()%>
