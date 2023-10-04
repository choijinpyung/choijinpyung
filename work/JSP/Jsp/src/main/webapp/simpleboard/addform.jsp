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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
textarea {
	background-image: url(../image/다운로드/bbang1.png);
	background-size: 50% 50%;
}
</style>
</head>
<body>
	<div style="margin: 30px 30px; width: 400px;">
		<form action="addaction.jsp" method="post">
			<table class="table table-bordered" style="border: 2px solid gray;">
				<caption align="top">
					<i class="bi bi-pencil-square">글쓰기</i>
				</caption>

				<tr>
					<th style="background: deeppink;">작성자</th>
					<td><input type="text" name="writer" class="form-control"
						required="required" autofocus="autofocus" style="width: 150px;">
					</td>
				</tr>

				<tr>
					<th style="background: deeppink;">비밀번호</th>
					<td><input type="password" name="pass" class="form-control"
						required="required" style="width: 250px;"></td>
				</tr>

				<tr>
					<th style="background: deeppink;">제목</th>
					<td><input type="text" name="subject" class="form-control"
						required="required" style="width: 250px;"></td>
				</tr>

				<tr>
					<td colspan="2"><textarea style="width: 400px; height: 120px;"
							class="form-control" required="required" name="story"></textarea>
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<!-- type이 image이거나 submit이면 기본이 submit --> <input type="image"
						src="../image/다운로드/submit.png" style="width: 155px;"> <input
						type="image" src="../image/다운로드/list.png"
						style="width: 150px; margin-bottom: 5px;"
						onclick="location.href='boardlist.jsp'; return false;">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>