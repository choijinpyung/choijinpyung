<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	//한글깨짐방지
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String pass = request.getParameter("pass");
	%>

	<jsp:useBean id="dao" class="db.simpleboard.SimpleBoardDao" />

	<%
	//db에 insert
	boolean check = dao.getCheckPass(num, pass);
	if (check) {
		response.sendRedirect("updateform.jsp?num=" + num);
	} else {
	%>
	<script>
		alert('비밀번호가 맞지 않습니다');
		history.back();
	</script>

	<%}
%>
</body>
</html>