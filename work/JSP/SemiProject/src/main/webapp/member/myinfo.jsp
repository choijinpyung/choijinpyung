<%@page import="Dto.MemberDto"%>
<%@page import="Dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style>
.myinfo_div {
    width: 100%;
    height: 670px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.myinfo_div_table {
    position: absolute;
    width: 600px;
    height: 450px;
}

.myinfo_div_table btn {
    width: 100%;
    height: auto;
    max-width: 100px;
    max-height: 50px;
}
</style>
<script type="text/javascript">
   $(function(){
      
      $(".btndelete").click(function() {
         
         var num=$(this).attr("num");
         alert(num);
         
         var ans=confirm("정말 탈퇴하시겠습니까?");
         
         if(ans){
            
            location.href="member/deleteme.jsp?num"+num;
         }
         
      })
   })
</script>
</head>
<%
MemberDao dao=new MemberDao();
List<MemberDto> list=dao.getAllMembers();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
/* 로그인한 본이꺼만 수정/삭제 보이도록....*/
String loginok=(String)session.getAttribute("loginok");
String id=(String)session.getAttribute("myid");

%>
<body>

<div class="myinfo_div">
<div class="myinfo_div_table">
<table class="table table-dark table-striped table-hover" style="width: 600px; height: 450px;">
<%
for(MemberDto dto:list)
{%>
<% 

//로그인한 본인꺼만 나오도록
if(loginok!=null && dto.getMem_id().equals(id))
{%>

   <tr>
     <td>이름: <%=dto.getMem_name() %></td>
   </tr>
   <tr>
     <td>아이디: <%=dto.getMem_id() %></td>
   </tr>
   <tr>
     <td>성별: <%=dto.getMem_gender() %></td>
   </tr>
   <tr>
     <td>생년월일: <%=dto.getMem_birth() %></td>
   </tr>
   <tr>
     <td>핸드폰: <%=dto.getMem_ph() %></td>
   </tr>
   <tr>
     <td>주소: <%=dto.getMem_addr() %></td>
   </tr>
   <tr>
     <td>이메일: <%=dto.getMem_email() %></td>
   </tr>
   <tr>
     <td>가입일: <%=sdf.format(dto.getMem_regdate()) %></td>
   </tr>
   <tr>
   <td align="center" colspan="2" style="height: 50px;">
        <button type="button" class="btn" style="background-color: deepskyblue; color: white;"
        onclick="location.href='index.jsp?main=member/updateform.jsp?num=<%=dto.getMem_no()%>'">회원정보수정</button>
        <button type="button" class="btn btn-danger btndelete" num="<%=dto.getMem_no()%>">회원탈퇴</button>
        <%
         if(id.equals("admin"))
         {
         %>
         
        <%}
         %>
    </td>
    </tr> 
<%}
}
%>   
</table>
</div>
</div>
</body>
</html>