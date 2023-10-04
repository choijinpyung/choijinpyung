<%@page import="java.util.Enumeration"%>
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

	  request.setCharacterEncoding("utf-8");
      //톰캣에 업로드된 프로젝트 경로 구하기
      ServletContext context = getServletContext();
   
      //프로젝트의 업로드의 실제 경로 구하기
      String realFolder = context.getRealPath("/upload");
      
      System.out.println(realFolder);
      
      //업로드시 허용되는 크기 지정
      int uploadsize = 1024*1024*3; //3mb
      
      try {
      MultipartRequest multi = null;
      multi = new MultipartRequest(request , realFolder , uploadsize , "utf-8" , new DefaultFileRenamePolicy());
      
      
      //입력값 읽기
      String nick = multi.getParameter("nick");
      %>
      
      <h2>작성자명 : <%=nick %></h2>
      
      <%
      //파일타입이  여러개인 경우
      Enumeration forNames = multi.getFileNames(); //file타입만 얻어옴
      
      while(forNames.hasMoreElements()) {
         String fileNames = (String)forNames.nextElement();
         System.out.println("file type의 name" + fileNames);
         
         //실제 업로드된 파일명 얻기
         String uploadName = multi.getFilesystemName(fileNames);
         System.out.println(uploadName);
         
         //파일선택안하면 null값 얻기
         if(uploadName!=null) { %>
            <figure>
            <img art="" src="../upload/<%=uploadName %>" style="max-width:200px;" border="1">
            <figcaption><%=uploadName %></figcaption>
            </figure>
         <%}

      }
      
      %>
      
      <%} catch(Exception e){
      }
   %>

</body>
</html>