<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.simpleboard.SimpleBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="db.simpleboard.SimpleBoardDao"%>
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
a:link, a:visited {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: underline;
	color: gray;
}
</style>
</head>
<%
SimpleBoardDao dao = new SimpleBoardDao();
//List<SimpleBoardDto> list = dao.getAllBoards();

	int totalCount=dao.getTotalCount();
	int totalPage;		//총 페이지의 수
	int startPage; 		//각 블럭에서 보여질 시작 페이지
	int endPage; 		//각 블럭에서 보여질 끝 페이지
	int startNum; 		//db에서 가져올 글 시작 번호 (mysql은 첫글이 0,오라클은 1)
	int perPage=3; 		//한 페이지당 보여질 글의 갯수
	int perBlock=5; 	//한 블럭당 보여질 페이지 갯수
	int currentPage; 	//현재 페이지
	int no; 			//각 페이지당 출력 할 시작 번호 (해도되고 안해도됨)
	
	//현재 페이지 읽기 (단 null일 경우는 1페이지로 준다) 계산을 해야하므로 int로 형변환해줌
	if(request.getParameter("currentPage")==null)
	currentPage=1;
	
  	else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
    
	//총 페이지 수 구하기
	//총 글의 갯수/한 페이지당 보여질 갯수로 나눔 (7/5=1)
	//나머지가 1이라도 있으면 무조건 1페이지 추가 (1+1+2 페이지가 필요)
  	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
  	
	//각 블럭당 보여야 할 시작 페이지
	//perBlock=5일 경우는 현재 페이지 1~5 시작:1 끝:5
	//현재 페이지 13 시작:11 끝:15
  	startPage=(currentPage-1)/perBlock*perBlock+1;
     
  	endPage=startPage+perBlock-1;
    
    //총 페이지가 23일 경우 마지막 블럭은 25가 아니라 23이다
    if(endPage>totalPage)
	endPage=totalPage;
    
    //각 페이지에서 보여질 시작 번호
    //1페이지: 0,2페이지:5 3페이지:10....
    startNum=(currentPage-1)*perPage;
    
    //각 페이지의 출력 할 시작번호 구하기
    //총글 갯수가 23이면 1페이지 23,2페이지는 18,3페이지는 13...
    no=totalCount-(currentPage-1)*perPage;
    
    //페이지에서 보여질 글만 가져오기
    List<SimpleBoardDto> list=dao.getPagingList(startNum, perPage);

%>
<body>
	<div style="margin: 30px 30px; width: 800px;">
		<button type="button" class="btn btn-outline-info"
			onclick="location.href='addform.jsp'">
			<i class="bi bi-pencil">글쓰기</i>
		</button>

		<br>

		<h6>
			<b>총 <%=totalCount%>개의 게시글이 있습니다
			</b>
		</h6>

		<table class="table table-bordered">
			<tr>
				<td align="center" style="width: 100px;">번호</td>
				<td align="center" style="width: 180px;">제목</td>
				<td align="center" style="width: 170px;">작성자</td>
				<td align="center" style="width: 220px;">작성일</td>
				<td align="center" style="width: 100px;">조회</td>
			</tr>
		</table>
		<%
		if (list.size() == 0) {
		%>
		<tr>
			<td colspan="5" align="center">
				<h6>
					<b>등록된 게시글이 없습니다</b>
				</h6>
			</td>
		</tr>
		<%
		}

		else {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		for (int i = 0; i < list.size(); i++) {
			SimpleBoardDto dto = list.get(i);
		%>
		<table class="table table-bordered">
			<tr>
				<td align="center" style="width: 100px;"><%=no--%></td>
				<td align="center" style="width: 180px;"><a
					href="detailview.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject()%></a></td>
				<td align="center" style="width: 170px;"><%=dto.getWriter()%></td>
				<td align="center" style="width: 220px;"><%=sdf.format(dto.getWriteday())%></td>
				<td align="center" style="width: 100px;"><%=dto.getReadcount()%></td>
			</tr>
		</table>
		<%
		}
		}
		%>

		<!-- 페이지 번호 출력 -->

		<div>
			<ul class="pagination justify-content-center">

				<li class="page-item"><a class="page-link"
					href="boardlist.jsp?currentPage=<%=currentPage-1%>">이전</a></li>
				<%
				for (int pp = startPage; pp <= endPage; pp++) {
				if (pp == currentPage) {
				%>
				<li class="pageitem active"><a
					style="background-color: deeppink; border: 1px solid pink;"
					class="page-link" href="boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
				<%}
					else
					{%>
				<li class="page-item"><a class="page-link"
					href="boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a></li>
				<%}
				}%>
				<li class="page-item"><a class="page-link"
					href="boardlist.jsp?currentPage=<%=currentPage+1%>">다음</a></li>
			</ul>
		</div>
	</div>
</body>
</html>