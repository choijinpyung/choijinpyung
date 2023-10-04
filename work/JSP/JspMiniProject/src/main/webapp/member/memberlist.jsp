<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
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
<script type="text/javascript">
	function delfunc(num){
		var yes=confirm("강퇴하시겠습니까?");
		
		if(yes)
			{
				location.href='member/memberdelete.jsp?num='+num;
			}
	}
</script>
</head>
<%
	MemberDao dao=new MemberDao();
	List<MemberDto> list=dao.getAllMembers();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
	<table class="table table-bordered" style="width: 828px; border: 1px solid black;">
	
		<caption align="top"><div align="center"><b style="color: black; margin-right: 20px;">전체 학생 목록</b></div></caption>
	
		<tr align="center">
			<th width="70">번호</th>
			<th width="100">학생명</th>
			<th width="100">아이디</th>
			<th width="150">연락처</th>
			<th width="200">주소</th>
			<th width="150">이메일</th>
			<th width="150">가입일</th>
			<th width="100">수정</th>
		</tr>
	
	<%
		for(MemberDto dto:list)
		{%>
			<tr align="center">
			<td><%=dto.getNum() %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getHp() %></td>
			<td><%=dto.getAddr() %></td>
			<td><%=dto.getEmail() %></td>
			<td><%=sdf.format(dto.getGaipday()) %></td>
			<td>
			<button type="button" class="btn btn-outline-danger btn-sm"
			onclick="delfunc(<%=dto.getNum()%>)">강퇴</button>
			</td>
			</tr>
		<%}
	%>
	</table>
</body>
</html>