<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
textarea {
	background-image: url(../image/bbang1.png);
	background-size: 50% 50%;
}

#main{
	background-image: url(../image/bbang.png);
	background-size: 100% 110%;
	height: 138px;
}
</style>
</head>
<body>
	<div>
		<form action="quizaction.jsp" method="post" enctype="multipart/form-data">
			<table class="table table-bordered" style="margin-left: 420px; margin-top: 60px;
			width: 430px; border: 2px solid black">
				<tr>
				<td colspan="2" id="main">
				</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" class="form-control"
						required="required" style="width: 150px;">
					</td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" class="form-control"
						required="required" style="width: 150px;">
					</td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td><textarea style="width: 200px; height: 80px;" class="form-control"
						required="required" name="content"></textarea>
					</td>
				</tr>
				
				<tr>
					<td>이미지</td>
					<td><input type="file" name="imgname"></td>
				</tr>
				
				
				<tr>
					<td colspan="2" align="right">
						<button type="submit" class="btn btn-outline-warning">전송</button>
           				<button type="button" class="btn btn-outline-success"
           				onclick="location.href='quizlist.jsp';">목록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>