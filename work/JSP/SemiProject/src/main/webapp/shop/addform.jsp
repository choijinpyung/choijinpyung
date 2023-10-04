<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<style>

div.container{

margin-top: 50px;

}

</style>
<script>

	 //미리보기 처리함수
	   function readURL(input) {
	       if (input.files && input.files[0]) {
	           var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	           reader.onload = function (e) {
	           //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	               //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정 
	               $('#showimg').attr('src', e.target.result);
	           }
	           //File내용을 읽어 dataURL형식의 문자열로 저장 
	           reader.readAsDataURL(input.files[0]);
	       }
	   }//readURL()--
	
	 function funcselec(){
		   
		   var y=confirm("상품을 등록하시겠습니까?");
		   
		   if(y){
			   document.getElementById("#shopform").submit();
			   
		   }
	   }  
	   
</script>

<body>
<div class="container">
<form id="shopform" method="post" action="shop/addProc.jsp" enctype="multipart/form-data">


<h2 style="color: white;">상품등록</h2>
<br>
	<table class="table table-bordered" style="width:700px;">
		<tr>
			<th>상품명</th>
			<td>
				<input type="text" class="form-control" style="width: 300px;" name="sang" required="required"
				placeholder="상품명을 기재해주세요">
			</td>
		</tr>
		<tr>
			<th>상품 설명</th>
			<td>
				<input type="text" class="form-control" name="sang_detail" placeholder="상품 상세설명란 입니다.">
			</td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td>
				<select style="width:150px;" name="sang_category">
					<option value="패키지">패키지
					<option value="콤보">콤보
					<option value="팝콘">팝콘
					<option value="음료">음료
				</select>
			</td>
		</tr>
		<tr>
			<th>상품 사진</th>
			<td>
				<input type="file" name="sang_photo" style="width: 300px;" onchange="readURL(this)">
			</td>
		</tr>
		<tr>
			<th>상품 가격</th>
			<td>
				<input type="text" name="sang_price" class="form-control" required="required"
				placeholder="상품 가격을 기재해주세요" style="width: 300px; float: left;">&nbsp;원
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" class="btn btn-danger" value="상품 등록" onclick="funcselec(); return false;">
				<input type="button" class="btn btn-success" value="상품 목록" onclick="location.href='index.jsp?main=shop/adminlist.jsp'">
			</td>
		</tr>
	</table>


</form>
<img alt="" src="" id="showimg" style=" max-width: 300px; float: right;position: absolute; top: 270px;right: 400px;">

</div>

</body>
</html>