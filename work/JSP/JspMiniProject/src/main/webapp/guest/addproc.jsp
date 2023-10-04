<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
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
	//db에 저장할 아이디 얻기
	String myid = (String) session.getAttribute("myid");

	// 실제경로
	String realPath = getServletContext().getRealPath("/save");

	int uploadSize = 1024 * 1024 * 3;

	MultipartRequest multi = null;

	try {
		multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());

		// 주의 : request 대신 multi 변수로 모든 폼 데이터를 읽어야 한다
		String content = multi.getParameter("content");
		String photoname = multi.getFilesystemName("photo");

		// dto에 저장
		GuestDto dto = new GuestDto();
		dto.setMyid(myid);
		dto.setContent(content);
		dto.setPhotoname(photoname);

		// dao
		GuestDao dao = new GuestDao();
		// insert
		dao.insertGuest(dto);

		// 방명록 목록으로 이동
		response.sendRedirect("../index.jsp?main=guest/guestlist.jsp");
	} catch (Exception e) {
		// 오류 처리
		e.printStackTrace();
	}
	%>
</body>
</html>