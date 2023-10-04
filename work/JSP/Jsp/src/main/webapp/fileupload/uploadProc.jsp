<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	ServletContext context=getServletContext();
	String realFolder=context.getRealPath("/upload"); //현재 폴더에서 나가서 upload 폴더로 간다
	
	System.out.println(realFolder);
	
	int filesize=1024*1024*3; //3mb가 된다
	
	try{
	MultipartRequest multi=null;
	multi=new MultipartRequest(request,realFolder,filesize,"utf-8",
			new DefaultFileRenamePolicy());
	
	String writer=multi.getParameter("writer");
	String subject=multi.getParameter("subject");
	String uploadname=multi.getFilesystemName("ufile");
	String originalFileName=multi.getOriginalFileName("ufile");
	%>
	
	<table>

		<tr>
			<th>글쓴이</th>
			<td><%=writer%></td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td><%=subject%></td>
		</tr>
		
		<tr>
			<th>업로드 파일명</th>
			<td><img src="../upload/<%=uploadname%>"></td>
		</tr>
		
		<tr>
			<th>원래 파일명</th>
			<td><%=originalFileName %></td>
			
			<tr>
				<td>
				<input type="button" value="다시업로드" onclick="location.href='uploadForm.jsp'">
				</td>
			</tr>
			
	</table>
	<%}catch(Exception e){
		System.out.println("업로드 오류 : "+e.getMessage());
	}
%>
</body>
</html>