<%@page import="model.mymall.MallDto"%>
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
<style>
	#selphoto{
		width: 300px;
		height: 300px;
		border: 1px solid gray;
		border-radius: 20px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		//select된 선택값 얻기
		var srcImg=$("#photo").val();
		
		//selphoto에 넣기
		$("#selphoto").attr("src",srcImg);
		
		$("#photo").change(function(){
			var s=$(this).val();
			$("#selphoto").attr("src",s);
		})
	})
</script>
</head>
<%
	String num = request.getParameter("num");
	MallDao dao = new MallDao();
	MallDto dto = dao.getdata(num);
%>
<body>
<form action="updateAction.jsp" method="post">

	<input type="hidden" name="num" value="<%=dto.getNum() %>">
	<table class="table table-bordered" style="width: 300px;">
	
	<tr>
		<td colspan="5">
		<img alt="" src="" id="selphoto">
		</td>
	</tr>
		
	<tr>
		<th>상품명</th>
		<td>
			<input type="text" name="sangpum" style="width: 200px;" placeholder="상품명"
					value="<%=dto.getSangpum() %>">
		</td>
	</tr>
	
	<tr>
		<th>상품사진</th>
		<td>
			<select name="photo" id="photo" style="width: 200px;">
			<option value="../image/쇼핑몰사진/1.jpg"
			<%=dto.getPhoto().equals("../image/쇼핑몰사진/1.jpg")?"selected":"" %>>코트</option>
			<option value="../image/쇼핑몰사진/2.jpg"
			<%=dto.getPhoto().equals("../image/쇼핑몰사진/2.jpg")?"selected":"" %>>원피스</option>
			<option value="../image/쇼핑몰사진/3.jpg"
			<%=dto.getPhoto().equals("../image/쇼핑몰사진/3.jpg")?"selected":"" %>>모자</option>
			<option value="../image/쇼핑몰사진/4.jpg"
			<%=dto.getPhoto().equals("../image/쇼핑몰사진/4.jpg")?"selected":"" %>>슬랙스</option>
			<option value="../image/쇼핑몰사진/5.jpg"
			<%=dto.getPhoto().equals("../image/쇼핑몰사진/5.jpg")?"selected":"" %>>티</option>
			</select>
		</td>
	</tr>	
		
	<tr>
		<th>가격</th>
		<td>
			<input type="text" name="price" style="width: 200px;" placeholder="가격"
					value="<%=dto.getPrice()%>">
		</td>
	</tr>
	
	<tr>
		<th>입고일</th>
		<td>
			<input type="date" name="ipgoday" style="width: 200px;"
					value="<%=dto.getIpgoday() %>">
		</td>
	</tr>
	
	<tr>
         <td colspan="2" align="center">
            <button type="submit" class="btn btn-outline-info">상품정보수정</button>
            <button type="button" class="btn btn-outline-info" onclick="location.href='list.jsp'">목록</button>
         </td>
    </tr>
    
	</table>
</form>
</body>
</html>