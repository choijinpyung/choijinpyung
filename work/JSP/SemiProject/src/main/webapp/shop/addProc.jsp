<%@page import="Dao.ShopDao"%>
<%@page import="Dto.ShopDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
String uploadPath=getServletContext().getRealPath("/shopimg"); //업로드 실제 경로
System.out.println(uploadPath);

int uploadSize=1024*1024*5; //약 5MB

MultipartRequest multi=null;

try{
	multi=new MultipartRequest(request,uploadPath,uploadSize,"utf-8",new DefaultFileRenamePolicy());
	
	String sang=multi.getParameter("sang");
	String detail=multi.getParameter("sang_detail");
	String category=multi.getParameter("sang_category");
	String photo=multi.getFilesystemName("sang_photo");
	int price=Integer.parseInt(multi.getParameter("sang_price"));
	
	//dto에 호출한 name 값들 세팅
	ShopDto dto=new ShopDto();
	
	dto.setShop_sangpum(sang);
	dto.setShop_detail(detail);
	dto.setShop_category(category);
	dto.setShop_photo(photo);
	dto.setShop_price(price);
	
	//dao호출
	ShopDao dao=new ShopDao();
	
	//db에 적용
	dao.ShopInsert(dto);
	
	//페이지 이동
	response.sendRedirect("../index.jsp?main=shop/addform.jsp");
	
}catch(Exception e){
	System.out.println("오류메세지:"+e.getMessage());
}

%>
</body>
</html>