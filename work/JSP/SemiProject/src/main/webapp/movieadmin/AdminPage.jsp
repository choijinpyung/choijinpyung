<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<%
//절대경로잡기
String root = request.getContextPath();
%>
<style type="text/css">
.adminpage_div {
	width: 100%;
	height: 680px;
	display : flex;
	justify-content: center;
	align-items: center;
}

.adminpage_div img {
	width: 200px;
	height: 200px;
	margin-top: 50px;
}

.adminpage_div b {
	font-family: "Dongle";
	font-size: 30pt;
	color: white;
}


}
</style>
</head>
<body>
	<div class="adminpage_div">
		<div>
			<table>
				<tr>
					<td align="center">
						<div
							style="width: 300px; height: 320px; border-right: 1px solid silver; cursor: pointer; background-color: black;"
							onclick="location.href='../member/memberlist.jsp'" align="center">
							<img src="<%=root %>/image/memberedit.png"> <br> <b>회원관리</b>
						</div>
					</td>
					<td align="center">
						<div
							style="width: 300px; height: 320px; border-right: 1px solid silver; cursor: pointer; background-color: black;"
							onclick="location.href='listAdmin.jsp'" align="center">
							<img src="<%=root %>/image/movieicon.png"> <br> <b>영화관리</b>
						</div>
					</td>
					<td>
						<div
							style="width: 300px; height: 320px; cursor: pointer; background-color: black;"
							onclick="location.href='../shop/adminlist.jsp'" align="center">
							<img src="<%=root %>/image/shopedit.png"> <br> <b>매점관리</b>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>	