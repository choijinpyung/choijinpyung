<%@page import="Dto.ReservationDto"%>
<%@page import="Dao.ReservationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
* {
  box-sizing: border-box;
}

body {
  /* background-color: #242333; */
  display: flex;
  flex-direction: column;
  color: gray;
  align-items: center;
  justify-content: center;
  height: 100vh;
  /* font-family: 'Lato', 'sans-serif'; */
}

.movie-container{
   margin: 20px 0; 
}

.movie-container select {
   margin-right: 20px;
  /* background-color: #fff; */
  border: 1;
  border-radius: 5px;
  font-size: 14px;
  margin-left: 10px;
  padding: 5px 15px 5px 15px;
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
}

.seat {
  background-color: #444451;
  height: 12px;
  width: 15px;
  margin: 3px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.seat.selected {
  background-color: red;
}

.seat.occupied {
  background-color: #fff;
}

.seat:nth-of-type(2) {
  margin-right: 18px;
}

.seat:nth-last-of-type(2) {
  margin-left: 18px;
}

.seat:not(.occupied):hover {
  cursor: pointer;
  transform: scale(1.2);
}

.showcase {
  background-color: gray;
  padding: 5px 10px;
  border-radius: 5px;
  color: white;
  list-style-type: none;
  display: flex;
  justify-content: space-between;
}

.showcase li {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 10px;
}

.showcase li small {
  margin-left: 10px;
}

.screen {
  background-color: black;
  height: 70px;
  width: 100%;
  margin: 15px 0;
  transform: rotateX(-45deg);
  box-shadow: 0 3px 10px gray;
}

.container {
  perspective: 1000px;
  margin-bottom: 30px;
}

.seat {
  background-color: gray;
  height: 12px;
  width: 15px;
  margin: 3px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.row {/* 좌석 가운데 정렬*/
  display: flex;
  justify-content: center;
}

/*영화정보css*/
#select_info{

position:absolute;
border:2px solid gray;
top:750px;
left:200px;
width:1200px;
height:300px;
}

div.poster{
 
 width:200px;
 height:250px;
 position:absolute;
 top:25px;
 left:25px;
}

div.mvinfo{
position:absolute;
top:25px;
left:250px;
width:250px;
height:100px;

}

div.clickinfo{
position:absolute;
top:25px;
left:570px;
width:200px;
height:100px;

}
</style>
</head>
<body>
<div class="movie-container">
      <label>성인:</label>
      <select id="adult">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
      
      <label>청소년:</label>
      <select id="teen">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
      
       <label>아동:</label>
      <select id="child">
       <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
      </select>
    </div>
    
    <ul class="showcase">
      <li>
        <div class="seat"></div>
        <small>N/A</small>
      </li>

      <li>
        <div class="seat selected"></div>
        <small>Selected</small>
      </li>

      <li>
        <div class="seat occupied"></div>
        <small>Occupied</small>
      </li>
    </ul>
    
   <div class="container">
    <div class="screen"></div>
    <table class="table table-bordered">
    <%
       for(int i=65; i<75; i++){%>
       <div class="row">
       <%
          for(int j=1; j<9; j++){%>
             <div class="seat"><%=(char)i %><%=j %></div>
          <%}
       %>
       </div>
       <%}
    %>
    </table>
   </div>
    
     <p class="text">
      선택 좌석: <span id="count">0</span>&nbsp; 가격: &nbsp;<span id="total">0</span>원
    </p>

<%
   ReservationDao dao = new ReservationDao();
   int num = dao.maxNum();
   //System.out.println(num);
   ReservationDto dto = dao.getData(num);
%>

<form action="#" method="post">
<div id="select_info">

<div class="poster" id="poster"><%=dto.getRev_poster() %></div>

<div class="mvinfo">
<span>영화명<b id="mvtitle" class="mvtitle"><%=dto.getRev_title() %></b></span>
<br><br>
<span>관람연령</span>&nbsp;<img src="<%=dto.getRev_age() %>" id="mvage">
</div>

<span style="border: 1px solid gray;height:250px;position: absolute;top: 25px;left: 410px;" ></span>


<div class="clickinfo">
<span>극장&nbsp;<b>'3'CINE&nbsp;</b><b id="mvcinema"><%=dto.getRev_name() %></b></span>
<br><br>
<span>일시&nbsp;&nbsp;</span><b id="mvdate"><%=dto.getRev_date() %></b>
<br><br>
<span>상영관&nbsp;&nbsp;<b id="mvplace"><%=dto.getRev_place() %></b></span>
<br><br>
<span>인원&nbsp;&nbsp;<b>인원</b></span>
</div>

<span style="border: 1px solid gray;height:250px;position: absolute;top: 25px;left: 410px;" ></span>

<input type="button" value="좌석선택" class="btn btn-outline-success" id="seatBtn" style="float: right; width: 150px; height: 150px; margin: 20px;">
</div>

</form>
</body>
</html>