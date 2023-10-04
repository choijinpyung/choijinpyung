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
<body>
<form action="addAction.jsp" method="post">
	<table class="table table-bordered" style="width: 300px;">
	
	<tr>
		<td colspan="5">
		<img alt="" src="" id="selphoto">
		</td>
		</tr>
	
	<tr>
		<th>상품명</th>
		<td>
			<input type="text" name="sangpum"
			required="required" style="width: 200px;" placeholder="상품명 입력">
		</td>
	</tr>
	
	<tr>
		<th>상품사진</th>
		<td>
			<select name="photo" id="photo">
			<option value="../image/쇼핑몰사진/1.jpg">코트</option>
			<option value="../image/쇼핑몰사진/2.jpg">원피스</option>
			<option value="../image/쇼핑몰사진/3.jpg">모자</option>
			<option value="../image/쇼핑몰사진/4.jpg">슬랙스</option>
			<option value="../image/쇼핑몰사진/5.jpg">티</option>
			</select>
		</td>
	</tr>	
		
	<tr>
		<th>가격</th>
		<td>
			<input type="text" name="price"
			required="required" style="width: 200px;" placeholder="가격 입력">
		</td>
	</tr>
	
	<tr>
		<th>입고일</th>
		<td>
			<input type="date" name="ipgoday" style="width: 200px;">
		</td>
	</tr>
	
	<tr>
         <td colspan="2" align="center">
            <button type="submit" class="btn btn-outline-info">상품추가</button>
            <button type="button" class="btn btn-outline-info" onclick="location.href='list.jsp'">목록</button>
         </td>
    </tr>
    
    <tr>
    
    </tr>

	</table>
	
</form>
</body>
</html>