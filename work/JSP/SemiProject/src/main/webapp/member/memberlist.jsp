<%@page import="Dto.MemberDto"%>
<%@page import="Dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
table {
    width: 100%;
    max-width: 1920px;
    margin: 0 auto;
  }
</style>
<script type="text/javascript">

	function funcdel(num) {
		
		var yes=confirm("해당회원을 추방하시겠습니까?");
		if(yes)
		{
			location.href='memberdelete.jsp?num='+num;
			alert("삭제완료");
		}
	}	
</script>
</head>
<%
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	int no=1;

	/* 로그인한 본이꺼만 수정/삭제 보이도록....*/
	String loginok=(String)session.getAttribute("loginok");
	String id=(String)session.getAttribute("myid");
%>
<body>
<div align="center">
<br>
<h1>회원목록</h1>
<br>
<table class="table table-bordered" style="width: 100%;">
<tr class="table-success" align="center">
<th style="background-color: #e6e6fa" width="80px" valign="middle">번호</th>
<th style="background-color: #e6e6fa" width="120px" valign="middle">아이디</th>
<th style="background-color: #e6e6fa" width="350px" valign="middle">비밀번호</th>
<th style="background-color: #e6e6fa" width="100px" valign="middle">이름</th>
<th style="background-color: #e6e6fa" width="100px" valign="middle">성별</th>
<th style="background-color: #e6e6fa" width="150px" valign="middle">생년월일</th>
<th style="background-color: #e6e6fa" width="150px" valign="middle">핸드폰</th>
<th style="background-color: #e6e6fa" width="350px" valign="middle">이메일</th>
<th style="background-color: #e6e6fa" width="350px" valign="middle">가입일</th>
<th style="background-color: #e6e6fa" width="350px" valign="middle">주소</th>
<th style="background-color: #e6e6fa" width="150px" valign="middle">회원관리</th>
</tr>

<%

	
for(MemberDto dto:list)	
{%>

	<tr align="center">
	  <td><%=no++ %></td>
	  <td><%=dto.getMem_id() %></td>
	  <td><%=dto.getMem_pass() %></td>
	  <td><%=dto.getMem_name() %></td>
	  <td><%=dto.getMem_gender() %></td>
	  <td><%=dto.getMem_birth() %></td>
	  <td><%=dto.getMem_ph() %></td>
	  <td><%=dto.getMem_email() %></td>
	  <td><%=sdf.format(dto.getMem_regdate()) %></td>
	  <td><%=dto.getMem_addr()%></td>
	  <td><button type="button" onclick="funcdel(<%=dto.getMem_no()%>)">추방</button></td>
	</tr>
<%}
%>
</table>
</div>
</body>
</html>