<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>영화 그 이상의 감동 '3'CINE 입니다</title>
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
</head>
<style type="text/css">

.header{
	width: 100%;
	height: 100%;
}

.main{
	width: 100%;
	height: 100%;
}

.footer{
	width: 100%;
	height: 100%;
}
</style>
<body style="background-color: black; overflow-x: hidden">
	
	<div class="layout header">
		<jsp:include page="layout/header.jsp"/>
	</div>
	
	<div class="layout main">
		<jsp:include page="<%=mainPage %>"/>
	</div>
	
	<div class="layout footer">
		<jsp:include page="layout/footer.jsp"/>
	</div>
</body>
</html>