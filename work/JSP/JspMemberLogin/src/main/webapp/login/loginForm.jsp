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
	div.loginForm{
		width: 500px;
		margin-top: 100px;
		margin-left: 500px;
	}
</style>
</head>
<body>
	<%
		//세션으로부터 아이디, 세이브 체크값 얻기
		String myid=(String)session.getAttribute("idok");
		String saveid=(String)session.getAttribute("saveok");
		
		boolean save=true;
		
		if(saveid==null)
		{
			myid=""; //아이디 저장을 체크하지 않을 경우 아이디 없앤다
			save=false; //체크하지 않을 경우 false,그이외에는 초기값이 true니까 true가 된다
		}
	%>
	<div class="loginForm" style="border: 4px solid green; width: 300px; border-radius: 10px;">
		<form action="loginAction.jsp" method="post" style="margin-left: 45px; margin-top: 20px; margin-bottom: 20px;">
			<img src="../image/html_img/naver.gif" style="width: 190px;">
			<br><br>
			<input type="text" name="id" style="width: 200px;"
			class="form-control" placeholder="아이디" required="required" value="<%=myid%>"><br>
			<input type="password" name="pass" style="width: 200px;"
			class="form-control" placeholder="비밀번호" required="required"><br>
			
			<button type="submit" class="btn btn-outline-success" style="width: 200px; height: 50px;">로그인</button>
			<br><br>
			<input type="checkbox" name="savechk"
			<%=save?"checked":""%>> 아이디저장
			<button type="submit" class="btn btn-warning"
			style="width: 100px; margin-left: 15px;" onclick="location.href='../member/addForm.jsp'">회원가입</button>
		</form>
	</div>
</body>
</html>