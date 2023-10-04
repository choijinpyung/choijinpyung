<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div align="center">
<form action="insertAdminAction.jsp" method="post" enctype="multipart/form-data">
		
		<br>
		<h1>영화정보추가</h1>
		<br>
		<table class="table table-bordered" style="width: 500px; text-align: center;">
		<tr valign="middle">
			<th>영화제목</th>
			<td>
				<input type="text" name="title" style="width: 300px;" placeholder="영화제목"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		<tr valign="middle">
			<th>포스터</th>
			<td>
				<input type="file" name="poster" style="width: 300px;"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		<tr valign="middle">
			<th>감독</th>
			<td>
				<input type="text" name="director" style="width: 300px;" placeholder="감독"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		<tr valign="middle">
			<th>줄거리</th>
			<td>
				 <textarea style="width: 300px; height: 150px" name="st" class="form form-control"></textarea>
			</td>
		</tr>
		<tr valign="middle">
			<th>트레일러</th>
			<td>
				<input type="text" name="trailer" style="width: 300px;" placeholder="url"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		<tr valign="middle">
			<th>개봉일자</th>
			<td>
				<input type="date" name="opendate" style="width: 150px;"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		<tr valign="middle">
			<th>기본정보</th>
			<td>
				<input type="text" name="info" style="width: 300px;" placeholder="기본정보"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		<tr valign="middle">
			<th>장르</th>
			<td>
				<input type="text" name="genre" style="width: 300px;" placeholder="장르"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		<tr valign="middle">
			<th>배우</th>
			<td>
				<input type="text" name="name" style="width: 300px;" placeholder="배우"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		<tr valign="middle">
			<th>성인가격</th>
			<td>
				<input type="text" name="adult" style="width: 110px;" placeholder="성인가격"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		<tr valign="middle">
			<th>청소년가격</th>
			<td>
				<input type="text" name="teen" style="width: 110px;" placeholder="청소년가격"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		<tr valign="middle">
			<th>아동가격</th>
			<td>
				<input type="text" name="child" style="width: 110px;" placeholder="아동가격"
				 required="required" class="form form-control"> 
			</td>
		</tr>
		
		
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-outline-success">입력</button>
				<button type="button" class="btn btn-outline-primary"
				onclick="location.href = 'listAdmin.jsp'">목록</button>
			</td>
		</tr>
	</table>
</form>
	</div>
</body>
</html>