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
<script type="text/javascript">
	$(function() {

		//id중복체크
		$("#btncheck").click(function() {

			//id읽기
			var id = $("#id").val();
			//alert(id);

			$.ajax({

				type : "get",
				url : "member/idsearch.jsp",
				dataType : "json",
				data : {
					"id" : id
				},
				success : function(data) {

					//alert(count);
					if (data.count == 1) {
						//alert("이미 가입된 아이디 입니다\n다시 입력해주세요");
						$("span.idsuccess").text("fail");
						$("#id").val("");
					}

					else {
						//alert("가입 가능한 아이디 입니다");
						$("span.idsuccess").text("success");
					}
				}
			})
		})

		$(document).ready(function() {
			// 선택 이메일 주소 넣기..혹은 직접입력
			$("#selemail").change(function() {
				if ($(this).val() === '-') {
					$("#email2").val("");
					$("#email2").focus();
				} else {
					$("#email2").val($(this).val());
				}
			});
		});
	})

	function check(f) {
		//alert(f.pass1.value);
		if (f.pass1.value != f.pass2.value) {
			alert("비밀번호가 서로 다릅니다.");
			f.pass1.value = "";
			f.pass2.value = "";

			return false; //액션이 호출되지 않는다.
		}
	}
</script>
</head>
<body>
	<form action="member/memberproc.jsp" method="post" onsubmit="return check(this)">
		<table class="table table-bordered" style="width: 450px; border: 1px solid black;
		margin: 0px 175px;">
			<caption align="top">
				<div align="center">
				<b style="color: black;"> 회원가입</b>
				</div>
			</caption>
			<tr>
				<th style="width: 100px;">아이디</th>
				<td><input type="text" name="id" id="id" class="form-group"
					required="required" style="width: 120px;">&nbsp;
					<button type="button" class="btn btn-outline-warning btn-sm"
						id="btncheck">중복체크</button> <span class="idsuccess"></span></td>
			</tr>

			<tr>
				<th style="width: 100px;">비밀번호</th>
				<td><input type="password" name="pass1" id="pass1"
					class="form-group" required="required" style="width: 120px;"
					placeholder="비밀번호">&nbsp; <input type="password"
					name="pass2" id="pass2" required="required" style="width: 120px;"
					placeholder="비밀번호 확인"></td>
			</tr>

			<tr>
				<th style="width: 100px;">회원명</th>
				<td><input type="text" name="name" id="name"
					required="required" style="width: 120px;" placeholder="이름">
				</td>
			</tr>

			<tr>
				<th style="width: 100px;">연락처</th>
				<td><input type="text" name="hp" id="hp" required="required"
					style="width: 170px;" placeholder="연락처"></td>
			</tr>

			<tr>
				<th style="width: 100px;">주소</th>
				<td><input type="text" name="addr" id="addr"
					required="required" style="width: 222px;" placeholder="주소">
				</td>
			</tr>

			<tr>
				<th style="width: 100px;">이메일</th>
				<td><input type="text" name="email1" id="email1"
					class="form-group" required="required" style="width: 100px;">
					<b>@</b> <input type="text" name="email2" id="email2"
					required="required" style="width: 100px;">&nbsp; <select
					id="selemail">
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="google.com">구글</option>
						<option value="nate.com">네이트</option>
						<option value="직접입력" selected="selected">직접입력</option>
				</select></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success"
						style="width: 100px;">회원가입</button>
					<button type="reset" class="btn btn-outline-danger"
						style="width: 100px;">초기화</button>
				</td>
			</tr>

		</table>

	</form>
</body>
</html>