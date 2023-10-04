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
	<c:forEach var="s" begin="1" end="10">
	[${s }]&nbsp;
	</c:forEach>
	<br>
	
	<%
		String [] myColor ={"red","blue","green","yellow","black","pink","white"};
	%>
	
	<c:set var="myColor" value="<%=myColor %>"/>
	
	<table class="table table-bordered" style="width: 300px;">
	<caption align="top"><b>전체 값 출력</b></caption>
		<tr>
			<th>index</th>
			<th>count</th>
			<th>color</th>
		</tr>
		
		<c:forEach var="a" items="${myColor }" varStatus="i">
			<tr align="center">
				<td>${i.index }</td>
				<td>${i.count }</td>
				<td style="background-color: ${a }">${a }</td>
			</tr>
		</c:forEach>
	</table>
	
	<table class="table table-bordered" style="width: 300px;">
	<caption align="top"><b>일부 값 출력</b></caption>
		<tr>
			<th>index</th>
			<th>count</th>
			<th>color</th>
		</tr>
		
		<c:forEach var="a" items="${myColor }" varStatus="i" begin="3" end="6">
			<tr align="center">
				<td>${i.index }</td>
				<td>${i.count }</td>
				<td style="background-color: ${a }">${a }</td>
			</tr>
		</c:forEach>
	</table>
	
	<c:set var="msg" value="민규,성신,영환,성경,희찬"/>
	${msg }<br>
	
	<h2>msg 값을 콤마로 분리해서 출력</h2>
	<c:forTokens var="s" items="${msg }" delims="," varStatus="i">
		<h3>${i.count }: ${s }</h3>
	</c:forTokens>
</body>
</html>