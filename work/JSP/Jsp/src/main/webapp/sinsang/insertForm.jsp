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
</head>
<body>
<form action="insertAction.jsp" method="post">
	<table class="table table-bordered" style="width:400px;">
		<tr>
			<th>이름</th>
			<td>
			<input type="text" name="name" style="width:250px;" placeholder="이름입력"
			required="required" class="form-control">
			</td>
		</tr>
		
		<tr>
			<th>주소</th>
			<td>
			<input type="text" name="addr" style="width:250px;" placeholder="이름입력"
			required="required" class="form-control">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="전송" class="btn btn-info">
				<input type="button" value="목록" onclick="location.href='list.jsp'"
				class="btn btn-success">
			</td>
		</tr>
	</table>
</form>
</body>
</html>