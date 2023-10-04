<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<body>
	<!-- 한글 엔코딩 -->
	<fmt:requestEncoding value="utf-8" />
	<form action="ex3_jstl_form.jsp" method="post" style="width: 200px;">
		<h3>이름 입력</h3>
		<input type="text" name="irum" class="form-control">
		<h3>가고싶은 나라</h3>
		<input type="text" name="nara" class="form-control"> <br>
		<button type="submit" class="btn btn-outline-info">결과확인</button>
	</form>

	<!-- 이름을 입력시에만 결과가 나오게 -->

	<c:if test="${!empty param.irum}">
		<!-- 비어있지 않으면 -->
		<h2>이름 : ${param.irum }</h2>
		<h3>나라 : ${param.nara }</h3>

		<c:choose>
		
			<c:when test="${param.nara=='프랑스' }">
				<h3 style="color: blue;">프랑스는 에펠탑</h3>
			</c:when>

			<c:when test="${param.nara=='홍콩' }">
				<h3 style="color: pink;">홍콩여행 가자!</h3>
			</c:when>



			<c:when test="${param.nara=='브라질' }">
				<h3 style="color: green;">브라질은 확싱~</h3>
			</c:when>


			<c:otherwise>
				<h3 style="color: red;">${param.nara }는해당 사항이 없습니다!!!</h3>
			</c:otherwise>

		</c:choose>
	</c:if>
</body>
</html>