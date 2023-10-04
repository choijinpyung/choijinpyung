<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ShopDao"%>
<%@page import="Dto.ShopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
ShopDao dao=new ShopDao();
List<ShopDto> list=dao.getAllData();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
NumberFormat nf=NumberFormat.getCurrencyInstance();
ShopDto dto1=new ShopDto();
%>
<script>
$(function(){
	
	
	//전체 선택 클릭시 
	$(".allselect").click(function(){
	
		var all=$(this).prop("checked"); //.allselect의 체크 상태 가져오기
		//console.log(all);

		$(".eachcheck").prop("checked",all); //.allselect의 체크 상태를 eachcheck들에 적용
		

	})
	
	$("#delbutton").click(function(){
		
		var length=$(".eachcheck:checked").length;
		//alert(length);
		
		if(length==0){
			alert("삭제할 상품을 선택해주세요")
			
		}else{
			
			var y=confirm(length+"개의 글을 삭제하시겠습니까?");
			
			if(y){
				
				//체크한 곳의 value값 얻기
				var num="";
				
				$(".eachcheck:checked").each(function(idx){
					num+=$(this).val()+",";
				})
				num=num.substring(0,num.length-1);
				
				console.log(num);
				
				location.href="shop/deleteaction.jsp?num="+num;
				
				
			}else{
				alert("취소되었습니다.");
			}
		}

	})
	
})



function funceachdel(number){
	
	var y=confirm("해당 항목을 삭제하시겠습니까?")
	
	if(y){
		location.href="shop/deleteaction.jsp?num="+number;
	}else{
		alert("취소되었습니다");
	}
}
</script>
<body>
<br><br>
<div class="container">
<table class="table table-bordered" style="width:1300px;">
<tr>
	<th><input type="checkbox" class="allselect" ></th>
	<th>카테고리</th>
	<th>상품 사진</th>
	<th>상품명</th>
	<th>상품 상세 설명</th>
	<th>가격</th>
	<th>등록일</th>
	<th></th>
</tr>

	<% for(int i=0;i<list.size();i++){
		ShopDto dto=list.get(i);
	%>
		<tr>
		<td><input type="checkbox" value=<%=dto.getShop_num() %> class="eachcheck"></td>
		<td name="category"><%=dto.getShop_category() %></td>
		<td align="center"><img src="shopimg/<%=dto.getShop_photo() %>" style="width:100px;text-align: center;"name="photo"></td>
		<td name="sang"><%=dto.getShop_sangpum() %></td>
		<td name="detail"><%=dto.getShop_detail() %></td>
		<td name="price"><%=nf.format(dto.getShop_price()) %></td>
		<td><%=sdf.format(dto.getShop_ipgoday()) %></td>
		<td>
			<button type="button" value="<%=dto.getShop_num() %>" class="btn btn-warning mod" data-bs-target="#myModal" 
			data-bs-toggle="modal" name="mod">수정</button>
			<input type="button" value="삭제" class="btn btn-danger eachdel" onclick="funceachdel(<%=dto.getShop_num()%>)">
		</td>
		</tr>
	<%};
	%>
	<tr>
		<td colspan="7" align="center">
			<input type="button" onclick="index.jsp?main=shop/addform.jsp" value="상품 등록" class="btn btn-success">
			<input type="button" onclick="index.jsp?main=shop/addform.jsp" value="상품 삭제" class="btn btn-danger" id="delbutton">
		</td>
	</tr>

</table>
</div>

</body>
</html>