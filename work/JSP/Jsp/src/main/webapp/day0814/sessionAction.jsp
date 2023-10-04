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
	request.setCharacterEncoding("utf-8");
	
	//세션이 있는지 확인 후 없으면 꽝!!!
	String msg=(String)session.getAttribute("msg"); //오브젝트 타입이라서 스트링으로 형변환 후 문자열 변수 선언
	String travel=request.getParameter("travel");
	
	if(msg==null || !msg.equals("happy"))
	{%>
		<h3 style="color: red;">시간초과로 꽝입니다</h3>
	<%}
	else
	{%>
		<h3>축하합니다 <%=travel %>여행 상품에 당첨됨!!!</h3>
	<%}
%>

	<a href="sessionForm.jsp">다시선택</a>
</body>
</html>