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
<style type="text/css">
	div.layout{
		position: absolute;
	}
	
	div.title{
		width: 100%;
		heght: 50%;
		line-height: 80px;
		text-align: center;
	}
	
	div.menu{
		width: 100%;
		height: 15%;
		line-height: 80px;
		text-align: center;
		top: 180px;
		left: 20px;
	}
	
	div.info{
		width: 200px;
		height: 500px;
		line-height: 10px;
		left: 10px;
		top: 360px;
		padding: 20px 10px;
		border-radius: 20px;
	}
	
	div.info1{
		left: 1100px;
		top: 360px;
	}
	
	div.main{
		width: 830px;
		height: 820px;
		left: 230px;
		top: 350px;
	}
	
	body{
		background-image: url(../image2/back.png);
	}
</style>
</head>
<%
	//절대경로잡기
	String root=request.getContextPath();
	
	//기본페이지
	String mainPage="layout/main.jsp";

	//url을 통해서 main값을 얻어 메인 페이지에 출력한다
	if(request.getParameter("main")!=null)
	{
		mainPage=request.getParameter("main");
	}
%>
<body style="background-color: #EFF0F1">
	<div class="layout title">
		<jsp:include page="layout/title.jsp"/>
	</div>
	
	<div class="layout menu">
		<jsp:include page="layout/menu.jsp"/>
	</div>
	
	<div class="layout info">
		<jsp:include page="layout/info.jsp"/>
	</div>
	
	<div class="layout info1">
		<jsp:include page="layout/info1.jsp"/>
	</div>
	
	<div class="layout main">
		<jsp:include page="<%=mainPage %>"/>
	</div>
</body>
</html>