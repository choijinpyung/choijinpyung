<%@page import="Dao.MemberDao"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
   request.setCharacterEncoding("utf-8");
   
   //데이터 읽어서 dto에 넣기
   MemberDto dto=new MemberDto();
   
   String num=request.getParameter("num");
   String pass=request.getParameter("pass");
   String name=request.getParameter("name");
   String gender=request.getParameter("gender");
   String birth=request.getParameter("birth");
   String ph=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
   String email=request.getParameter("email1")+"@"+request.getParameter("email2");
   String addr="("+request.getParameter("postnum")+")\t"+request.getParameter("addr1")+"\t"+request.getParameter("addr2")+"\t"+request.getParameter("addr3");
   
   dto.setMem_no(num);
   dto.setMem_pass(pass);
   dto.setMem_name(name);
   dto.setMem_gender(gender);
   dto.setMem_birth(birth);
   dto.setMem_ph(ph);
   dto.setMem_email(email);
   dto.setMem_addr(addr);
   
   MemberDao dao=new MemberDao();
   dao.updateMember(dto);
   
   response.sendRedirect("index.jsp?main=member/myinfo.jsp");
%>
</body>
</html>