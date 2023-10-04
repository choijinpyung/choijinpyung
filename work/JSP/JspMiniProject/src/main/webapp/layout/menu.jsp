<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String loginok = (String) session.getAttribute("loginok");
String myid = (String) session.getAttribute("myid");
MemberDao dao = new MemberDao();
String name = dao.getName(myid);

// 절대경로 잡기
String root = request.getContextPath();
%>
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
<style type="text/css">
</style>
<script type="text/javascript">
    function goToMemberForm() {
        <%if (loginok == null) {%>
            location.href = '<%=root%>/index.jsp?main=member/memberform.jsp';
        <%} else {%>
            alert("로그인 상태에서는 회원 가입을 할 수 없습니다.");
        <%}%>
    }
</script>
</head>
<body>
    <div class="menu">
        <a style="color: gray;" href="<%=root%>/index.jsp">메인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <%
        if (loginok == null) {
        %>
        <a style="color: gray;"
            href="<%=root%>/index.jsp?main=login/loginform.jsp">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <%
        } else {
        %>
        <a style="color: gray;" href="<%=root%>/login/logoutaction.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <%
        }
        %>
        <a style="color: gray;"
            href="<%=root%>/index.jsp?main=member/memberform.jsp"
            onclick="return !<%= (loginok == null) %>;">회원가입</a>
        <a style="color: gray;"
            href="<%=root%>/index.jsp?main=member/memberlist.jsp">회원목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a style="color: gray;"
            href="<%=root%>/index.jsp?main=guest/guestlist.jsp">회원방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a style="color: gray;"
            href="<%=root%>/index.jsp?main=board/boardlist.jsp">회원게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a style="color: gray;"
            href="<%=root%>/index.jsp?main=member/myinfo.jsp">나의정보</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a style="color: gray;" href="<%=root%>/index.jsp?main=load/map.jsp">찾아오시는길</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</body>
</html>