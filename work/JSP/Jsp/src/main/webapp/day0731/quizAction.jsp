<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	//quizForm에서 값 받아오기
	String sang=request.getParameter("sang"); //sang의 값을 문자열 변수 sang로 지정
	String size=request.getParameter("size"); //size의 값을 문자열 변수 size로 지정
	
	//값이 하나가 아니기에 [] 같이 지정 후 parameterValues로 불러옴
	String [] color=request.getParameterValues("color"); //color 값을 문자열 변수 color로 지정
														 
	String chu=request.getParameter("chu"); //size의 값을 문자열 변수 chu로 지정
	%>
	
	상품명 : <%=sang %><br><br>
	상품색상 : <br><br>
	<%
		if(color==null)
		{%>
			<b>색깔이 없습니다</b>
		<%}
	
			else
			{
			for(int i=0; i<color.length; i++)
			{%>
				<div style="width: 50px; border-radius: 100px;
				height: 50px; border-ladius: 100px; background-color:
				<%=color[i]%>;"></div><br>
			<%}%>
		<%}
	%>
		
	사이즈 : <%=size %><br><br>
	추가상품 : <%=chu %><br><br>
				
</body>
</html>