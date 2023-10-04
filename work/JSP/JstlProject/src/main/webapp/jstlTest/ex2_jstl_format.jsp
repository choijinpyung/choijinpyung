<%@page import="java.util.Date"%>
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
	<!-- jstl 변수선언 -->
	<c:set var="name" value="김영준"/>
	<c:set var="age" value="22"/>
	<c:set var="today" value="<%=new Date() %>"/>
	
	<!-- jstl 출력법_1 -->
	<h2>이름 : <c:out value="${name }"/></h2>
		
	<br>
	
	<!-- jstl 출력법_2 -->
	<h2>이름 : ${name }</h2>
	<h2>이름 : ${age }</h2>
	<h2>이름 : ${today }</h2>
	
	<br>
	
	<!--  pattern 이용한 fmt 날짜 형식 -->
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm"/><br>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd a HH:mm"/><br>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEE"/><br>
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEEE"/><br>
	<fmt:formatDate value="${today }" pattern="yyyy년MM월dd일"/>
	
	<c:set var="money" value="1000000"/>
	<c:set var="num1" value="123.456789"/>
	
	<br>
	
	<!-- 숫자 출력 -->
	<pre>
	  ${money }
	  ${num1 }
	  
	  <!-- number: 3자리마다 컴마 -->
	  <fmt:formatNumber value="${money }" type="number"/>
	  
	  <!-- currency: 3자리마다 콤마, 화폐단위 -->
	  <fmt:formatNumber value="${money }" type="currency"/>
	  
	  <!-- pattern -->
	  <fmt:formatNumber value="${num1 }" pattern="0.00"/>
	  
	  <fmt:formatNumber value="1.5" pattern="0.00"/> <!--  0은 값이 없어도 무조건 출력 -->
	  
	  <fmt:formatNumber value="1.5" pattern="0.##"/> <!--  #은 값이 없으면 출력 안함 -->
	</pre>
	
	
	<!-- if문 -->
	
	<!-- 변수 선언 -->
	<c:set var="num1" value="7"></c:set>
	<c:set var="num2" value="4"></c:set>
	
	<!-- 출력:c:out은 생략 가능 -->
	숫자1: ${num1 }<br>
	숫자2: ${num2 }<br>
	
	<!-- 조건문 c:if..else 없음 -->
	<c:if test="${num1>num2 }">
		<h2>숫자1이 더 큽니다</h2>
	</c:if>
	
	<c:if test="${num2<num1 }">
		<h2>숫자2이 더 큽니다</h2>
	</c:if>
	
	<!-- if문 -->
	<c:set var="nara" value="프랑스"/>
	
	<c:if test="${nara=='체코' }"> <!-- 문자열 비교도 ==으로 비교한다 -->
		<h2>체코 콧구멍멍멍~</h2>
	</c:if>
	
	<c:if test="${nara=='프랑스' }">
		<h2>프랑스에서 프링글스~</h2>
	</c:if>
</body>
</html>