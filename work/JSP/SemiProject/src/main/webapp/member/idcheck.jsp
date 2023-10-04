<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
	String key=request.getParameter("key"); //처음 호출시 null
	
	if(key==null)
	{%>
		<div style="margin: 10px 30px;">
			<form action="idcheck.jsp" method="post">
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
			
			<div style="margin: 15px 35px;">
			<h6><%=id %>는 이미 가입된 아이디 입니다</h6><br>
			<button type="button" class="btn btn-danger btn-xs"
			onclick="location.href='idcheck.jsp'">재입력</button>
			</div>
		<%}
		else
			//존재하지않을경우
		{%>
			<div style="margin: 15px 35px;">
			<h6><%=id %>는 사용 가능한 아이디 입니다</h6><br>
			<button type="button" class="btn btn-info btn-xs"
			onclick="saveId('<%=id%>')">적용하기</button>
			<button type="button" class="btn btn-danger btn-xs"
			onclick="location.href='idcheck.jsp'">재입력</button>
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