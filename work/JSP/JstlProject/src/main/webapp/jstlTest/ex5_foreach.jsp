<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<h3>1~10 출력</h3>
	<c:forEach var="a" begin="1" end="10">
		${a }&nbsp;
	</c:forEach>
	
	<h3>0~30 출력 3의 배수</h3>
	<c:forEach var="a" begin="0" end="30" step="3">
		${a }&nbsp;
	</c:forEach>
	
	<%
		List<String> list=new ArrayList<>();
	
		list.add("red");
		list.add("blue");
		list.add("green");
		list.add("yellow");
		list.add("black");
		list.add("pink");
		
		request.setAttribute("list", list);
		request.setAttribute("totalCount", list.size());
		
		//세션에 아이디 저장
		session.setAttribute("id" , "devil");
	%>
	
	<h3>list에는 총 ${totalCount}개의 색상이 들어있다</h3>
	<h3>list에는 총 ${requestScope.totalCount}개의 색상이 들어있다</h3>
	<!--
	달러{변수명}일 경우에 앞에 requestScope가 생략 된 것임..
	request에 저장된 데이터는 자바처럼 getAttribute로 얻지 않아도 바로 출력 가능하다
	하지만 세션은 sessionScope를 생략하지 않는다
	-->
	
	<h3>세션 아이디 출력</h3>
	<h3>현재 로그인한 아이디는 ${sessionScope.id } 입니다 </h3>
	
	<hr>
	<h3>list 전체 출력</h3>
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<th>No.</th>
			<th>index</th>
			<th>color</th>
		</tr>
		
		<c:forEach var="s" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td> <!-- 무조건 1번부터 출력 -->
				<td>${i.index }</td> <!-- 실제 list의 인덱스 값 출력 -->
				<td>
					<b style="color: ${s}">${s }</b>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	
	<h3>list 인덱스 2~4 출력</h3>
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<th>No.</th>
			<th>index</th>
			<th>color</th>
		</tr>
		
		<c:forEach var="s" items="${list }" varStatus="i" begin="2" end="4">
			<tr>
				<td>${i.count }</td> <!-- 무조건 1번부터 출력 -->
				<td>${i.index }</td> <!-- 실제 list의 인덱스 값 출력 -->
				<td>
					<b style="color: ${s}">${s }</b>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>