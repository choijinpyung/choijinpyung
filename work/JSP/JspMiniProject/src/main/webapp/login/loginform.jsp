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
</head>
	<%
//세션값 얻기
	String saveok=(String)session.getAttribute("saveok");

	String myid="";
	if(saveok!=null){
		myid=(String)session.getAttribute("myid");
	}
	%>
<body>
		<div align="center" style="margin-bottom: 7px;">
		<b style="color: black; margin-right: 30px;">로그인</b>
		</div>
		<div style="border: 1px solid black; width: 300px; border-radius: 10px; background-color: white;
			margin-left: 253px;">
		<form action="login/loginaction.jsp" method="post" style="margin-left: 45px; margin-top: 20px; margin-bottom: 20px;">
			<br>
			<input type="text" name="id" style="width: 200px;"
			class="form-control" placeholder="아이디" value=<%=saveok==null?"":myid %>><br>
			<input type="password" name="pass" style="width: 200px;"
			class="form-control" placeholder="비밀번호"><br>
			
			<button type="submit" class="btn btn-outline-dark" style="width: 200px; height: 50px;">로그인</button>
			<br><br>
			<input type="checkbox" name="cbsave" <%=saveok==null?"":"checked" %>> 아이디저장 <!-- 수정된 부분 -->
			<button type="button" class="btn btn-warning" onclick="location.href='index.jsp?main=member/memberform.jsp'"
			style="width: 100px; margin-left: 15px;">회원가입</button>
		</form>
	</div>
</body>
</html>