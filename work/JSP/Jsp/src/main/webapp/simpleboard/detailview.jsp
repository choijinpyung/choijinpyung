<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleboard.SimpleBoardDto"%>
<%@page import="db.simpleboard.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<title>Insert title here</title>
</head>
<body>
	<%
   //num을 읽는다
   String num = request.getParameter("num");

   //dao선언
   SimpleBoardDao dao = new SimpleBoardDao();

   //조회수1증가
   //dao.updateReadCount(num);

   //dto  
   dao.updateReadCount(num);
   SimpleBoardDto dto = dao.getBoard(num);
 

   //날짜형식
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   %>

	<div style="margin: 30px 30px; width: 500px">

		<table class="table table-striped">
			<tr>
				<td><b>작성자 : <%=dto.getSubject()%></b> <span class="day"><%=sdf.format(dto.getWriteday())%>
						&nbsp;&nbsp;&nbsp; 조회수:<%=dto.getReadcount()%> </span></td>
			</tr>

			<tr height="150">
				<td>
					<!-- replace()이용 : db저장시 br태그가 \n으로 저장됨. --> <%=dto.getStory().replace("\n", "<br>")%>
				</td>
			</tr>

			<tr>
				<td>
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='addform.jsp'">
						<i class="bi bi-pencil-square"></i>글쓰기
					</button>
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='boardlist.jsp'">
						<i class="bi bi-card-checklist"></i>목록
					</button>
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'">
						<i class="bi bi-person-vcard-fill"></i>수정
					</button>
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'">
						<i class="bi bi-trash2"></i>삭제
					</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>