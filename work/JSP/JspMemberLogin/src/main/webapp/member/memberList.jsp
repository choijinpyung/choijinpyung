<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.model.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function funcdel(num)
	{
		//alert(num);
		$("#btnmdel").attr("num",num);
		$("#myModal").modal();
		$("#btnmdel").click(function(){
			
			//버튼에 있는 num값 읽어오기
			var num=$(this).attr("num");
			//이동
			location.href="../member/deleteAction.jsp?num="+num;
				
		})
	}
</script>

<style>
	table,h2,h4{
		font-size: 1.1em;
	}
	
	h2{
		font-size: 2em;
	}
	
	table{
		border: solid 3px black;
	}
	
	td img{
		border-radius: 10px;
	}
	
	body{
		font-family: 'KCCChassam';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/KCCChassam.woff2') format('woff2');
    	font-weight: normal;
    	font-style: normal;
	}
</style>
<%
MemberDao dao=new MemberDao();
ArrayList<MemberDto> list=dao.getAllmember();
%>
</head>
<body>
	<table class="table table-bordered" style="width: 1000px; margin-left: 140px;">
		<h2>
		<img src="../image/다운로드/naver.png" style="width: 100px; margin-left: 130px; margin-top: 55px;">
		<img src="../image/html_img/naver.gif" style="border: 2px green; margin-top: 20px; margin-left: 250px;">
		</h2><br>
		<h4 align="right" style="margin-right: 145px;">총 <%=list.size() %>명의 멤버가 있습니다 ^-^</h4><br>
		<tr>
			<td align="center" width="50">회원 번호</td>
			<td align="center" width="80">아이디</td>
			<td align="center" width="80">이름</td>
			<td align="center" width="100">전화번호</td>
			<td align="center" width="100">사진</td>
			<td align="center" width="100">가입일</td>
			<td align="center" width="80">편집</td>
		</tr>
		<%
		if(list.size()==0)
		{%>
		<script>
		$(function(){
			alert("등록된 회원이 없습니다");
		})
		</script>	
		<%}
		else
		{
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일");
			
			for(int i=0; i<list.size(); i++)
			{
				MemberDto dto=list.get(i);
				%>
				
				<tr>
					<td align="center"><%=i+1%></td>
					<td align="center"><%=dto.getId() %></td>
					<td align="center"><%=dto.getName() %></td>
					<td align="center"><%=dto.getHp() %></td>
					<td align="center"><img alt="" src="<%=dto.getImage()%>" style="width: 50px" height="50px"></td>
					<td align="center"><%=sdf.format(dto.getGaip()) %></td>
					<td align="center">
					<%
						/* 로그인한 본인꺼만 수정/삭제 보이도록... */
						String loginok=(String)session.getAttribute("loginok");
						String id=(String)session.getAttribute("idok");
						
						//로그인한 본인꺼만 나오도록
						if(loginok != null && dto.getId() != null && dto.getId().equals(id))
						{%>
							<input type="button" value="수정"
								onclick="location.href='../member/updateForm.jsp?num=<%=dto.getNum() %>'"
								class="btn btn-warning btn-sm">
							<input type="button" value="삭제"
								onclick="funcdel(<%=dto.getNum() %>)"
								class="btn btn-danger btn-sm"></td>
						<%}
						
						else
						{%>
							<h4>권한 없음</h4>
						<%}
					%>
					
				</tr>
			<%}
		}
		%>
	</table>
	<input type="button" style="margin-left: 1019px;" value="가입"
	onclick="location.href='../member/addForm.jsp'"
	class="btn btn-success btn-sm">
	<input type="button" style="margin-left: 1px;" value="로그아웃"
	onclick="location.href='../login/logoutAction.jsp'"
	class="btn btn-danger btn-sm">
	
	
	<!-- modal -->
	
	<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">회원탈퇴</h4>
      </div>
      <div class="modal-body">
        <p>회원탈퇴를 원하시면 탈퇴확인을 눌러주세요</p>
        <button type="button" class="btn btn-outline-danger"
        id="btnmdel">탈퇴확인</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
	</div>

  </div>
</div>
</html>