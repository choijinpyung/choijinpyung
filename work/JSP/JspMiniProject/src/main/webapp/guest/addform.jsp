<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
    
    	$("i.camara").click(function() {
       
    	$("#photo").trigger("click");
    	})
    })
	
	function readURL(input) {
		if(input.files && input.file[0]) {
			var reader =new FileReader();
			reader.onload=function (e){
				
				$("#showimg").attr('src'. e.target.result);
			}
			reader.readAsDataURL(input.file[0]);
		}
	}
</script>
</head>
<body>
	<!-- 이미지 미리보기 -->
	<img alt="" src="" id="showimg" style="position: absolute; left:800px; top:100px;
	max-width: 200px;">
	<form action="guest/addproc.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 600px; margin-left: 100px;">
			<caption align="top"><b>방명록 등록</b>
			<i class="bi bi-camera-fill"></i>
			<input type="file" name="photo" id="photo" style="visibility: hidden;"
			onchange="readURL(input)">
			</caption>
			
			<tr height="100">
				<td width="520">
				<textarea style="width: 500px; height: 100px;"
				name="content" required="required"></textarea>
				</td>
				
				<td>
					<button type="submit" class="btn btn-outline-warning"
					style="">등록</button>
				</td>
				
			</tr>
		</table>
	</form>
</body>
</html>