<%@page import="data.dao.MemberDao"%>
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
	//머였는지까먹음
	String loginok=(String)session.getAttribute("loginok");
	//아이디 얻기
	String myid=(String)session.getAttribute("myid");
	//dao에 이름 얻기
	MemberDao dao=new MemberDao();
	String name=dao.getName(myid);

%>
<body>
<%
	if(loginok==null)
	{%>
		<button type="button" class="btn btn-outline-success" style="width: 100px; margin-top: 1000px;"
		onclick="location.href='index.jsp?main=login/loginform.jsp'">Login</button>	
	<%}
	
	else
	{%>
		<b><%=name %>로그인중</b>
		<button type="button" class="btn btn-outline-success" style="width: 100px; margin-top: 1000px;"
		onclick="location.href='login/logoutaction.jsp'">Logout</button>		
	<%}
%>
<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String cbsave=request.getParameter("cbsave");
	
	//아이디와 비밀번호가 맞는지 확인
	//MemberDao dao=new MemberDao();
	boolean flag=dao.isIdPass(id, pass);
	
	//맞으면 세션 지정 후 로그인 메인으로 이동
	if (flag) {
        // 로그인 중인지 알 수 있는 세션 저장
        session.setAttribute("loginok", "yes");
        // 아이디 세션 저장
        session.setAttribute("myid", id);

        if (cbsave != null) {
            // 아이디 저장 체크박스가 체크된 경우
            session.setAttribute("saveok", "yes");
        }

        // 세션 유지시간
        session.setMaxInactiveInterval(60 * 60 * 8); // 8시간동안 유지

        response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
    } else {
        // 로그인 실패 처리
        response.sendRedirect("login/login.jsp");
    }
%>
</body>
</html>