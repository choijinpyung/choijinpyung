<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>

</head>
<body>
	<div style="margin: 80px 444px;">
		<form action="addProc.jsp" method="post" enctype="multipart/form-data" class="form-inline" id="mfrm">
			<table class="table table-bordered" style="width: 400px;">
				<caption align="top"><h4>네이버 회원가입</h4></caption>
				<tr>
					<td style="width: 100px;" align="center">아이디</td>
					<td>
					<input type="text" class="form-control" name="id" style="width: 200px;"
					readonly="readonly" required="required" id="mid">&nbsp;&nbsp;
					<button type="button" class="btn btn-danger btn-sm"
					onclick="openId()" style="width: 80px;">아이디입력</button>
					</td>
				</tr>
				
				<tr>
					<td style="width: 100px;" align="center">비밀번호</td>
					<td>
						<input type="password" class="form-control" style="width: 200px;"
						name="pass" required="required">
					</td>
				</tr>
				
				<tr>
					<td style="width: 100px;" align="center">이름</td>
					<td>
						<input type="text" class="form-control" style="width: 200px;"
						name="name" required="required">
					</td>
				</tr>
				
				<tr>
					<td style="width: 100px;" align="center">핸드폰</td>
					<td>
						<input type="text" class="form-control" style="width: 200px;"
						name="hp" required="required">
					</td>
				</tr>
				
				<tr>
					<td style="width: 100px;" align="center">사진</td>
					<td>
						<input type="file" class="form-control" style="width: 300px;"
						name="photo">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-success btn lg" id="btnGaip"
						style="width: 100px;" onclick="location.href='memberList.jsp'">회원가입</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function openId() {
			
			window.open("idCheck.jsp","e","left=400px; top=100px,width=260px,height=185px");
		}	
	</script>
</body>
</html>