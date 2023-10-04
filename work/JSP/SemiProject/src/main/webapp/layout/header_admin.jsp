<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header_admin</title>
<%
//절대경로잡기
String root = request.getContextPath();

String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
%>
<style>
.admin_header_content {
    width: 100%;
    height: 185px;
    background-color: black;
    border-bottom: 1px solid silver;
}

.admin_header_img {
	position: absolute;
	top: 5%;
	left: 8%;
    width: 430px;
    height: 200px;
}

.admin_admin_login{
	position: absolute;
	top: 12%;
	left: 70%;
	width: 17.5%;
	height: 5%;
}

.admin_admin_login b{
	color: white;
	font-size: 20pt;
}
</style>
</head>
<body>
<div class="admin_header_content">
	<div class="admin_header_img">
		<img alt="" src="<%=root%>/logoimg/test1.gif">
	</div>
	
	<div class="admin_admin_login">
	<%
		if(myid!=null&&myid.equals("admin")&&loginok!=null)
		{%>
		<b>관리자님이 로그인 하셨습니다</b>
		<%}
	
		//어드민 로그인 에러시 메세지 출력
		else
		{%>
		<script>
		alert("로그인 에러 발생! 관리자 권한이 없습니다.");
		history.back();
		</script>
		<%}
	%>
	
	</div>
</div>
</body>
</html>