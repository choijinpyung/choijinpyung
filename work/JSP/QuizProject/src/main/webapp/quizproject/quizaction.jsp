<%@page import="quizproject.db.QuizProjectDto"%>
<%@page import="quizproject.db.QuizProjectDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

	String realPath = getServletContext().getRealPath("/upload");
	int uploadSize = 1024 * 1024 * 3;

	MultipartRequest multi = null;
	multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());

	//dao선언
	QuizProjectDao dao = new QuizProjectDao();
	//dto선언
	QuizProjectDto dto = new QuizProjectDto();

	dto.setWriter(multi.getParameter("writer"));
	dto.setTitle(multi.getParameter("title"));
	dto.setContent(multi.getParameter("content"));
	dto.setImgname(multi.getParameter("imgname"));

	//dto.setImage(multi.getFilesystemName("photo"));
	String photo = multi.getFilesystemName("imgname");

	dto.setImgname("../upload/" + photo); //사진선택한경우

	dao.InsertQuizBoard(dto);

	//목록으로 이동
	response.sendRedirect("quizlist.jsp");
	%>
</body>
</html>