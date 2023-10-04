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
<form action="addAction.jsp" method="post">
	<table class="table table-bordered" style="width: 300px;">
	
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="intro_name"
			required="required" style="width: 180px;" placeholder="이름 입력">
		</td>
	</tr>
		
	<tr>
		<th>혈액형</th>
		<td>
			<input type="radio" name="intro_blood" value="A형">A형
			<input type="radio" name="intro_blood" value="B형">B형
			<input type="radio" name="intro_blood" value="O형">O형
			<input type="radio" name="intro_blood" value="AB형">AB형
		</td>
	</tr>
	
	<tr>
		<th>핸드폰 번호</th>
		<td>
			<select name="intro_hp1">
			<option value="010">010</option>
			<option value="013">013</option>
			<option value="017">017</option>
			<option value="018">018</option>
			</select>
			-
			<input type="text" name="intro_hp2" style="width: 50px;">
			-
			<input type="text" name="intro_hp3" style="width: 50px;">
		</td>
	</tr>
	
	<tr>
		<th>지역</th>
		<td>
			<input type="radio" name="intro_city" value="서울">서울
			<input type="radio" name="intro_city" value="경기">경기
			<input type="radio" name="intro_city" value="제주">제주
			<input type="radio" name="intro_city" value="부산">부산
		</td>
	</tr>
	
	<tr>
         <td colspan="2" align="center">
            <button type="submit">전송</button>
            <button type="button" onclick="location.href='list.jsp'">목록</button>
         </td>
    </tr>

	</table>
</form>
</body>
</html>