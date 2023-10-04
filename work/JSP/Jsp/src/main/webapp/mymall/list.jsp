<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.mymall.MallDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.mymall.MallDao"%>
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
MallDao dao=new MallDao();
ArrayList<MallDto> list=dao.getAllMyMall();
%>
</head>
<body>
<table class="table table-bordered">
	
	<h1 align="center" style="color: deepskyblue">My Mall~~!!</h1>
	<tr>
		<td align="center">번호</td>
		<td align="center">상품명</td>
		<td align="center">사진</td>
		<td align="center">가격</td>
		<td align="center">입고일</td>
		<td align="center">작성일</td>
		<td align="center">편집</td>
	</tr>
	<%
	if(list.size()==0){
		%>
		<tr>
		<td colspan="6" align="center">
		<h5>등록된 상품이 없습니다</h5>
		</td>
		</tr>
		<%}else{
		NumberFormat nf=NumberFormat.getCurrencyInstance();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH시");
				
		for(int i=0; i<list.size(); i++)
		{
			MallDto dto=list.get(i);
			%>
			
			<tr>
				<td align="center"><%=i+1 %></td>
				<td align="center">
				<b align="center"><%=dto.getSangpum()%></b>
				<td align="center"><img alt="" src="<%=dto.getPhoto()%>" style="width: 50px" height="50px"></td>
				<td align="center"><%=nf.format(Integer.parseInt(dto.getPrice()))%></td>
				<td align="center"><%=dto.getIpgoday() %></td>
				<td align="center"><%=sdf.format(dto.getWriteday()) %></td>
				<td align="center">
				<button type="button" class="btn btn-success btn-sm"
				onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
				<button type="button" class="btn btn-danger btn-sm"
				onclick="location.href='delete.jsp?num=<%=dto.getNum()%>'">삭제</button>
				</td>
			</tr>
		<%}
	
	}
	
%>
	<tr>
	
	<td colspan="7" align="center">
	<button type="button" class="btn btn-info" onclick="location.href='addForm.jsp'">상품추가</button>
	</td>
	</tr>	
</table>

</body>
</html>