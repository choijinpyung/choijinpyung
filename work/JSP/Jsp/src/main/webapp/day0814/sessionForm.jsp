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
		session.setAttribute("msg", "happy");
		session.setMaxInactiveInterval(10);
	%>
	<h2>10초안에 눌러주세요!!!</h2>
	
	<form action="sessionAction.jsp" method="post">
		<h2>가고싶은 여행지</h2>
		<input type="radio" value="일본" name="travel" checked="checked">&nbsp;일본&nbsp;
		<input type="radio" value="중국" name="travel">&nbsp;중국&nbsp;
		<input type="radio" value="대만" name="travel">&nbsp;대만&nbsp;
		<input type="radio" value="홍콩" name="travel">&nbsp;홍콩&nbsp;<br>
		<input value="여행당첨" type="submit">
	</form>
</body>
</html>