<%@page import="Dto.MovieDto"%>
<%@page import="Dao.MovieDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>

<style>
img.photo{
    width: 200px;
    height: 300px;
    border: 1px solid gray;
    margin-bottom: 10px;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8"); // HTTP 요청의 문자 인코딩을 UTF-8로 설정
String search=request.getParameter("search");
MovieDao dao=new MovieDao();
System.out.println(search);
List<MovieDto> list=dao.getmovie(search);

System.out.println(list.size());
%>


<div class="container mt-3">
		<h2 style="color: silver;">장르별 영화목록</h2>
		<br>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="tab" href="#tabs-1">전체</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#tabs-2">애니메이션</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#tabs-3">드라마</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#tabs-4">코미디</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#tabs-5">스릴러</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#tabs-6">범죄</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#tabs-7">액션</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="#tabs-8">어드벤처</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="tabs-1" class="container tab-pane active" >
				<table class="table table-bordered" style="width: 700px;">
				<br>
				<p>
				
					<caption align="top">
						<b>전체영화목록</b>
					</caption>
					<%
		   	 int i = 0; // 이미지 개수를 세는 변수
		   	 for (MovieDto dto : list) {
	
		   		 String photo = dto.getMv_poster();
			
	    			%>
						
			<%
	        if (i % 5 == 0) {%>
				<tr>
				<!-- 새로운 행 시작 -->
		<%}
	        %>
				<td>
				<a movienum=<%=dto.getMv_no() %> style="cursor: pointer;" class="godetail" href="index.jsp?main=layout/detailpage.jsp?num=<%=dto.getMv_no()%>">
				<img alt="" src="<%=photo%>" class="photo">
				</a>
				
				<br><b><%=dto.getMv_title()%></b><br>
				 장르 : <%=dto.getMv_genre() %><br> 
				 개봉일 : <%=dto.getMv_opendate()%><br>
				<img src="./image/buttonyemae.png" style="border-radius: 7px; width: 120px; height: auto;">
				
				</td>
					
					<%
			        if (i % 5 == 4) {
			        %>
						</tr>
						<!-- 행 종료 -->
					<%
			        }
			        %>
			        
				    <%
			        i++;
		   	 }
			        %>
					</table>
	
					</p>
				</div>
					
			<div id="tabs-2" class="container tab-pane">
				<br>
				<p>
				<table class="table table-bordered" style="width: 700px;">
					<caption align="top">
						<b>애니메이션</b>
					</caption>
					<%
		   	 
			 i = 0; // 이미지 개수를 세는 변수
		   	 for (MovieDto dto : list) {
		   		if(dto.getMv_genre().contains("애니메이션"))
		    	{
		   		 String photo = dto.getMv_poster();
			
	    			%>
						
			<%
	        if (i % 5 == 0) {%>
				<tr>
				<!-- 새로운 행 시작 -->
		<%}
	        %>
				<td>
				<a movienum=<%=dto.getMv_no() %> style="cursor: pointer;" class="godetail" href="index.jsp?main=layout/detailpage.jsp?num=<%=dto.getMv_no()%>">
				<img alt="" src="<%=photo%>" class="photo">
				</a>
				
				<br><b><%=dto.getMv_title()%></b><br>
				 장르 : <%=dto.getMv_genre() %><br> 
				 개봉일 : <%=dto.getMv_opendate()%><br>
				<img src="./image/buttonyemae.png" style="border-radius: 7px; width: 120px; height: auto;">
				
				</td>
					
					<%
			        if (i % 5 == 4) {
			        %>
						</tr>
						<!-- 행 종료 -->
					<%
			        }
			        %>
			        
				    <%
			        i++;
		   	 }
			        }
			        %>
					</table>
	
					</p>
				</div>
				
				<div id="tabs-3" class="container tab-pane">
				<br>
				<p>
				<table class="table table-bordered" style="width: 700px;">
					<caption align="top">
						<b>드라마</b>
					</caption>
					<%
		   	 
			 i = 0; // 이미지 개수를 세는 변수
		   	 for (MovieDto dto : list) {
		   		if(dto.getMv_genre().contains("드라마"))
		    	{
		   		 String photo = dto.getMv_poster();
			
	    			%>
						
			<%
	        if (i % 5 == 0) {%>
				<tr>
				<!-- 새로운 행 시작 -->
		<%}
	        %>
				<td>
				<a movienum=<%=dto.getMv_no() %> style="cursor: pointer;" class="godetail" href="index.jsp?main=layout/detailpage.jsp?num=<%=dto.getMv_no()%>">
				<img alt="" src="<%=photo%>" class="photo">
				</a>
				
				<br><b><%=dto.getMv_title()%></b><br>
				 장르 : <%=dto.getMv_genre() %><br> 
				 개봉일 : <%=dto.getMv_opendate()%><br>
				<img src="./image/buttonyemae.png" style="border-radius: 7px; width: 120px; height: auto;">
				
				</td>
					
					<%
			        if (i % 5 == 4) {
			        %>
						</tr>
						<!-- 행 종료 -->
					<%
			        }
			        %>
			        
				    <%
			        i++;
		   	 }
			        }
			        %>
					</table>
	
					</p>
				</div>
				
				<div id="tabs-4" class="container tab-pane">
				<br>
				<p>
				<table class="table table-bordered" style="width: 700px;">
					<caption align="top">
						<b>코미디</b>
					</caption>
					<%
		   	
		   	 i = 0; // 이미지 개수를 세는 변수
		   	 for (MovieDto dto : list) {
		   		if(dto.getMv_genre().contains("코미디"))
		    	{
		   		 String photo = dto.getMv_poster();
			
	    			%>
						
			<%
	        if (i % 5 == 0) {%>
				<tr>
				<!-- 새로운 행 시작 -->
		<%}
	        %>
				<td>
				<a movienum=<%=dto.getMv_no() %> style="cursor: pointer;" class="godetail" href="index.jsp?main=layout/detailpage.jsp?num=<%=dto.getMv_no()%>">
				<img alt="" src="<%=photo%>" class="photo">
				</a>
				
				<br><b><%=dto.getMv_title()%></b><br>
				 장르 : <%=dto.getMv_genre() %><br> 
				 개봉일 : <%=dto.getMv_opendate()%><br>
				<img src="./image/buttonyemae.png" style="border-radius: 7px; width: 120px; height: auto;">
				
				</td>
					
					<%
			        if (i % 5 == 4) {
			        %>
						</tr>
						<!-- 행 종료 -->
					<%
			        }
			        %>
			        
				    <%
			        i++;
		   	 }
			        }
			        %>
					</table>
	
					</p>
				</div>
				
				<div id="tabs-5" class="container tab-pane">
				<br>
				<p>
				<table class="table table-bordered" style="width: 700px;">
					<caption align="top">
						<b>스릴러</b>
					</caption>
					<%
		   	 
		   	 i = 0; // 이미지 개수를 세는 변수
		   	 for (MovieDto dto : list) {
		   		if(dto.getMv_genre().contains("스릴러"))
		    	{
		   		 String photo = dto.getMv_poster();
			
	    			%>
						
			<%
	        if (i % 5 == 0) {%>
				<tr>
				<!-- 새로운 행 시작 -->
		<%}
	        %>
				<td>
				<a movienum=<%=dto.getMv_no() %> style="cursor: pointer;" class="godetail" href="index.jsp?main=layout/detailpage.jsp?num=<%=dto.getMv_no()%>">
				<img alt="" src="<%=photo%>" class="photo">
				</a>
				
				<br><b><%=dto.getMv_title()%></b><br>
				 장르 : <%=dto.getMv_genre() %><br> 
				 개봉일 : <%=dto.getMv_opendate()%><br>
				<img src="./image/buttonyemae.png" style="border-radius: 7px; width: 120px; height: auto;">
				
				</td>
					
					<%
			        if (i % 5 == 4) {
			        %>
						</tr>
						<!-- 행 종료 -->
					<%
			        }
			        %>
			        
				    <%
			        i++;
		   	 }
			        }
			        %>
					</table>
	
					</p>
				</div>
				
				<div id="tabs-6" class="container tab-pane">
				<br>
				<p>
				<table class="table table-bordered" style="width: 700px;">
					<caption align="top">
						<b>범죄</b>
					</caption>
					<%
		   	 
		   	 i = 0; // 이미지 개수를 세는 변수
		   	 for (MovieDto dto : list) {
		   		if(dto.getMv_genre().contains("액션"))
		    	{
		   		 String photo = dto.getMv_poster();
			
	    			%>
						
			<%
	        if (i % 5 == 0) {%>
				<tr>
				<!-- 새로운 행 시작 -->
		<%}
	        %>
				<td>
				<a movienum=<%=dto.getMv_no() %> style="cursor: pointer;" class="godetail" href="index.jsp?main=layout/detailpage.jsp?num=<%=dto.getMv_no()%>">
				<img alt="" src="<%=photo%>" class="photo">
				</a>
				
				<br><b><%=dto.getMv_title()%></b><br>
				 장르 : <%=dto.getMv_genre() %><br> 
				 개봉일 : <%=dto.getMv_opendate()%><br>
				<img src="./image/buttonyemae.png" style="border-radius: 7px; width: 120px; height: auto;">
				
				</td>
					
					<%
			        if (i % 5 == 4) {
			        %>
						</tr>
						<!-- 행 종료 -->
					<%
			        }
			        %>
			        
				    <%
			        i++;
		   	 }
			        }
			        %>
					</table>
	
					</p>
				</div>
				
				<div id="tabs-7" class="container tab-pane">
				<br>
				<p>
				<table class="table table-bordered" style="width: 700px;">
					<caption align="top">
						<b>액션</b>
					</caption>
					<%
		   	 
		   	 i = 0; // 이미지 개수를 세는 변수
		   	 for (MovieDto dto : list) {
		   		if(dto.getMv_genre().contains("어드벤처"))
		    	{
		   		 String photo = dto.getMv_poster();
			
	    			%>
						
			<%
	        if (i % 5 == 0) {%>
				<tr>
				<!-- 새로운 행 시작 -->
		<%}
	        %>
				<td>
				<a movienum=<%=dto.getMv_no() %> style="cursor: pointer;" class="godetail" href="index.jsp?main=layout/detailpage.jsp?num=<%=dto.getMv_no()%>">
				<img alt="" src="<%=photo%>" class="photo">
				</a>
				
				<br><b><%=dto.getMv_title()%></b><br>
				 장르 : <%=dto.getMv_genre() %><br> 
				 개봉일 : <%=dto.getMv_opendate()%><br>
				<img src="./image/buttonyemae.png" style="border-radius: 7px; width: 120px; height: auto;">
				
				</td>
					
					<%
			        if (i % 5 == 4) {
			        %>
						</tr>
						<!-- 행 종료 -->
					<%
			        }
			        %>
			        
				    <%
			        i++;
		   	 }
			        }
			        %>
					</table>
	
					</p>
				</div>
			<div id="tabs-8" class="container tab-pane">
				<br>
				<p>
				<table class="table table-bordered" style="width: 700px;">
					<caption align="top">
						<b>어드벤처</b>
					</caption>
					<%
		   	 
		   	 i = 0; // 이미지 개수를 세는 변수
		   	 for (MovieDto dto : list) {
		   		if(dto.getMv_genre().contains("어드벤처"))
		    	{
		   		 String photo = dto.getMv_poster();
			
	    			%>
						
			<%
	        if (i % 5 == 0) {%>
				<tr>
				<!-- 새로운 행 시작 -->
		<%}
	        %>
				<td>
				<a movienum=<%=dto.getMv_no() %> style="cursor: pointer;" class="godetail" href="index.jsp?main=layout/detailpage.jsp?num=<%=dto.getMv_no()%>">
				<img alt="" src="<%=photo%>" class="photo">
				</a>
				
				<br><b><%=dto.getMv_title()%></b><br>
				 장르 : <%=dto.getMv_genre() %><br> 
				 개봉일 : <%=dto.getMv_opendate()%><br>
				<img src="./image/buttonyemae.png" style="border-radius: 7px; width: 120px; height: auto;">
				
				</td>
					
					<%
			        if (i % 5 == 4) {
			        %>
						</tr>
						<!-- 행 종료 -->
					<%
			        }
			        %>
			        
				    <%
			        i++;
		    	}
			        }
			        %>
					</table>
						</p>
				</div>			
			</div>
		</div>
</body>
</html>