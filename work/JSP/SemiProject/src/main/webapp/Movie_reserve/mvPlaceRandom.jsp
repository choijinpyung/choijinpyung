<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//시간 클릭시 상영관 랜덤 배정
	//랜덤한 값 선택을 위한 Random 객체 생성
	Random random = new Random();

	int mvplace = random.nextInt(5)+1;
	
	JSONObject ob = new JSONObject();
	ob.put("mvplace", mvplace);
%>
<%=ob.toString()%>