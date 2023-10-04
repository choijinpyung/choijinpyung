<%@page import="model.myteam.TeamDto"%>
<%@page import="model.myteam.TeamDao"%>
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
<%
	String num=request.getParameter("num");
	TeamDao dao=new TeamDao();
	TeamDto dto=dao.getData(num);
%>
</head>
<body>
<form action="updateAction.jsp" method="post">

	  <input type="hidden" name="num" value="<%=num %>">
      <table class="table table-bordered" style="width:300px;">
      
      <tr>
         <th>이름</th>
         <td>
            <input type="text" name="name" style="width:120px;" value="<%=dto.getName()%>">
         </td>
      </tr>
      <tr>
         <th>운전면허</th>
         <td>
            <input type="checkbox" name="driver" <%=dto.getDriver().equals("있음")?"checked":"" %>>운전면허여부
         </td>
      </tr>
      <tr>
         <th>주소</th>
         <td>
            <input type="text" name="addr" style="width: 120px;"
			value="<%=dto.getAddr()%>">
			</td>
         </td>
      </tr>
      
      <tr>
         <td colspan="2" align="center">
            <input type="submit" value="수정" class="btn btn-info">
			<input type="button" value="목록" onclick="location.href='list.jsp'"
						 class="btn btn-success">
         </td>
      </tr>
      
      </table>
   </form>
</body>
</html>