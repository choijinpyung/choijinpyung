<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	String key=request.getParameter("key"); //처음 호출시 null
	
	if(key==null)
	{%>
		<div style="margin: 10px 30px;">
			<form action="idCheck.jsp" method="post">
				<b>아이디 입력</b>
				<input type="text" name="id" class="form-control"
				style="width: 130px;">
				<br>
				<input type="hidden" name="key" value="yes">
				<button type="submit" class="btn btn-success">중복체크</button>
			</form>
		</div>
	<%}
	else
	{
		//action처리
		String id=request.getParameter("id");
		
		//dao에서 id 존재 유무에 관한 메서드
		MemberDao dao=new MemberDao();
		boolean b=dao.isIdCheck(id);
		
		if(b){
			//존재하는경우
			%>
			
			<div style="margin: 10px 30px;">
			<h5><%=id %>는 이미 가입된 아이디 입니다</h5>
			<img src="../image/다운로드/null.png" width="100px;"><br>
			<button type="button" class="btn btn-danger btn-xs"
			onclick="location.href='idCheck.jsp'">재입력</button>
			</div>
		<%}
		else
			//존재하지않을경우
		{%>
			<div style="margin: 10px 30px;">
			<h5><%=id %>는 사용 가능한 아이디 입니다</h5>
			<img src="../image/다운로드/good.png" width="100px;"><br>
			<button type="button" class="btn btn-info btn-xs"
			onclick="saveId('<%=id%>')">적용하기</button>
			<button type="button" class="btn btn-danger btn-xs"
			onclick="location.href='idCheck.jsp'">재입력</button>
			</div>
		<%}
	}
%>

<script type="text/javascript">

	function saveId(id) {
		
		//alert(id); //아이디 제대로 넘어오는지 확인
		
		//부모창:opener
		//현재창의 id를 부모창의 id에 나타내준다
		opener.mfrm.mid.value=id;
		//현재창닫기
		window.close();
	}
</script>
</body>
</html>