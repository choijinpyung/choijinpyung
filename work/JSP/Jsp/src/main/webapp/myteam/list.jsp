<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.myteam.TeamDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.myteam.TeamDao"%>
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
<%
TeamDao dao = new TeamDao();
ArrayList<TeamDto> list = dao.getAllMyTeam();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
	<a href="addForm.jsp">팀원추가</a>
	<table class="table table-bordered"
		style="width: 1000px; text-align: center">
		<tr>
			<th width="60">번호</th>
			<th width="60">이름</th>
			<th width="60">운전면허</th>
			<th width="60">주소</th>
			<th width="60">작성일</th>
			<th width="60">수정 삭제</th>
		</tr>

		<%
		for (int i = 0; i < list.size(); i++) {
			TeamDto dto = list.get(i); //i번지의 dto꺼낸다
		%>
		<tr>
			<td align="center"><%=i + 1%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getDriver()%></td>
			<td><%=dto.getAddr()%></td>
			<td><%=sdf.format(dto.getWriteday())%></td>
			<td>
				<button type="button" class="btn btn-outline-info btn-sm"
					onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
				<button type="button" class="btn btn-outline-danger btn-sm"
					onclick="location.href='delete.jsp?num=<%=dto.getNum()%>'">삭제</button>
			</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>