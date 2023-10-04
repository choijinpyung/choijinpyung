<%@page import="java.text.SimpleDateFormat"%>
<%@page import="quizproject.db.QuizProjectDto"%>
<%@page import="quizproject.db.QuizProjectDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail View</title>
</head>
<body>
<%

String q_num=request.getParameter("num");

// Dao 객체 생성
QuizProjectDao dao = new QuizProjectDao();

// 조회수 증가
dao.updateReadCount(q_num); // num 값을 문자열로 변환하여 전달

// 해당 게시글의 정보 가져오기
QuizProjectDto dto = dao.getBoard(q_num);

if (dto != null) {

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

%>
	<div style="margin: 140px 500px;">
    <h1>게시글 상세 내용</h1>
    <table class="table table-bordered" style="width: 500px;">
    <p>번호: <%= dto.getQ_num() %></p>
    <p>제목: <%= dto.getTitle() %></p>
    <p>작성자: <%= dto.getWriter() %></p>
    <p>작성일: <%= sdf.format(dto.getWriteday()) %></p>
    <p>조회수: <%= dto.getReadcount() %></p>
    </table>
    <!-- 여기에 게시글 내용 등의 정보 출력 -->

<%
} else {
%>
    <p>해당 게시글을 찾을 수 없습니다.</p>
<%
}
%>
	<button type="button" class="btn btn-outline-danger" style="margin-left: 150px;"
	onclick="location.href='quizlist.jsp'">뒤로가기</button>
</div>
</body>
</html>