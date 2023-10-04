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
	%>

	<jsp:useBean id="dao" class="db.simpleboard.SimpleBoardDao" />
	<jsp:useBean id="dto" class="db.simpleboard.SimpleBoardDto" />

	<!-- dto의 멤버랑 같은 이름의 폼태그는 자동으로 읽어서 dto에 넣어준다 -->
	<jsp:setProperty property="*" name="dto" />

	<%
	//db에 insert
	dao.insertSimpleBoard(dto);

	//목록으로 이동
	response.sendRedirect("boardlist.jsp");

	//내용보기로 이동하려면?
	//int num=dao.getMaxNum();
	//response.sendRedirect("detailview.jsp?num="+num);
	%>
</body>
</html>