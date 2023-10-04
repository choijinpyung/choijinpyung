<%@page import="Dao.AnswerDao"%>
<%@page import="java.util.List"%>
<%@page import="Dto.MemberDto"%>
<%@page import="Dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.MovieDto"%>
<%@page import="Dao.MovieDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Moirai+One&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<title>detail</title>
<style>
/* 스타일은 위에서 내려오는 순으로 적음 추가시 같은 위치쪽 삽입 */
b{
   color: white;
}

/* 디테일 큰 div */
.detailblock{
   width: 100%;
   height: 3750px;
}

/* 디테일 내부 라인 div */
.detailall{
   position: absolute;
   right: 13.2%;
   left: 13.2%;
   width: 73.6%;
   height: 3650px;
   margin-top: 50px;
}

/* 영화 포스터 div */
.detailposter{
   position: relative;
   left: 270px;
   width: 300px;
   height: 400px;
}

.detailposter img{
   width: 290px;
   height: 400px;
}

/* 영화 이름 div */
.detailtitle{
   position:absolute;
   top: 0px;
   left: 600px;
   width: 500px;
   height: 50px;
   font-size: 1.5em;
}

/* 영화 예매율 div border-bottom: 1px white; 추가 */
.detailreserve{
   color: white;
   position:absolute;
   top: 50px;
   left: 600px;
   width: 500px;
   height: 50px;
}

/* 장르, 개봉 div */
.detailinfo{
   color: white;
   position: absolute;
   top: 100px;
   left: 600px;
   width: 500px;
   height: 50px;
}
/*평점*/
.averageRating{
 color: white;
   position: absolute;
   top: 150px;
   left: 600px;
   width: 500px;
   height: 50px;
}
/* 스토리 */
.detailstory{
   color: white;
   position: absolute;
   top: 500px;
   left: 270px;
   width: 830px;
   height: 300px;
}
/* 예매하기 버튼 */
#detailbtn1{
   position: absolute;
   top: 355px;
   left: 600px;
   color: white;
   background-color: #DF3E49;
   width: 100px;
   height: 45px;
   border: none;
   border-radius: 20px;
   font-weight: 500;
}
/* 이전으로 버튼 */
#detailbtn2{
   position: absolute;
   top: 355px;
   left: 710px;
   color: black;
   background-color: white;
   width: 100px;
   height: 45px;
   border: none;
   border-radius: 20px;
   font-weight: 500;
}

/* 버거킹 광고배너*/
.mushroom{
position: absolute;
width: 100%;
top:850px;
}
#mushroom{
cursor:pointer;
}

/* 예매선호율 */
.bunpo{
   position:absolute;
   top:1900px;
   left:270px;
}

/* 스틸컷*/

.swiper-slide {
   text-align: center;
   font-size: 18px;
   background: black;
   /* 이미지들을 수평으로 배치 */
   display: flex;
   /* 수직 가운데 정렬 */
   align-items: center;
   /* 수평 가운데 정렬 */
   justify-content: center;

}

/*메소드연기*/
.method{
position: absolute;
left:270px;
top: 2300px;
height:50px;
width:830px;
}

/*댓글입력창*/
.detailcomment{
   position: absolute;
   top: 2750px;
   left: 270px;
}
/*댓글출력창*/
.detailresult{
   position: absolute;
   top: 3150px;
   left: 270px;
   width: 830px;
   height: 500px;
}

i.penguin{
font-size: 23pt;
}
#writer{
color: magenta;
font-size: 18pt;
}
#starimage{
width: 30px;
height: 30px;
}
.starscore{
width: 18px;
height: 18px;
}
#btnadd{
	background-color: white;
	border-radius: 20px;
	font-weight: bold;
	font-size: 0.9em;
	width: 80px;
	height: 40px;
	color: black;
}


#btnadd:hover{
	background-color: black;
	border: 1px solid silver;
	color: white;
}

.chu{
font-size: 15px;
}
.bchu{
font-size: 15px;
}
.button-first {
  background: linear-gradient(to right, #e55d87, #5fc3e4);
  box-shadow: 0 2px 25px rgba(229, 93, 135, 0.5);
}
</style>
<%
   //절대경로잡기
   String root = request.getContextPath();
   
   
//쿼리 파라미터에서 포스터 ID를 가져옵니다.
String mv_no = request.getParameter("mv_no");
String mv_title = request.getParameter("mv_title");
String mv_poster = request.getParameter("mv_poster");
String mv_st = request.getParameter("mv_st");
String mv_genre = request.getParameter("mv_genre");
String mv_opendate = request.getParameter("mv_opendate");

//String num = (String)session.getAttribute("num");// num-answer 
String idx = request.getParameter("idx");
String num = request.getParameter("mv_no"); //member-mvno
String content = request.getParameter("content");//댓글 내용
String star = request.getParameter("star"); //별점
String writeday = request.getParameter("writeday"); //작성일 가져옴
String myid = (String)session.getAttribute("myid");
   
   //무비테이블
   MovieDao dao = new MovieDao();
   MovieDto dto = dao.getData(mv_no); //영화번호 가져온다
   
   //댓글테이블
   AnswerDao adao=new AnswerDao();
   
   //임의의 아이디사용, ref)회원탈퇴시 회원이 작성한 댓글이 자동으로 삭제될려면 member의 sequence번호가 필요함 but 선택사항
   /* String myid = (String)session.getAttribute("myid"); */
   
%>
<script>
function back(){
      history.back();
   }
   
//전역변수
var currentPage=1;
var totalPage="";

//리스트별 페이징 처리를 위한 변수 선언
//1.list, 2.listchu, 3.listday
var list_num=1;

$(function(){
   
   
   list(currentPage);
   
    // 댓글 추가 
    
    $("#btnadd").click(function(){
        var content = $("#content").val();
        var star = $("#star").val();
        var num =  $("#num").val();
        
        $.ajax({
            type: "post",
            dataType: "html",
            url: "answer/addanswer.jsp",
            data: {"content": content, "star": star, "num": <%=num%>},
            success: function(res){
               
               
               
                //인서트 후 초기화
                $("#content").val("");
                $("#star").val("");
                
                
                //다시 리스트 호출
                list(currentPage);
             // ratingText와 stars 업데이트
                updateRatingAndStars();
            }
        });
    });

    // 댓글 삭제 - sweetalert 쓸거
    $(document).on("click", ".btndel", function() {
        var idx = $(this).data("idx");
        
        Swal.fire({
            title: "댓글 삭제",  
            text: "이 댓글을 삭제하시겠습니까?",  
            icon: "question",  
            showCancelButton: true,  
            confirmButtonColor: "#3085d6",  
            cancelButtonColor: "#d33",  
            confirmButtonText: "삭제",  
            cancelButtonText: "취소"  
        }).then((result) => {  
            if (result.isConfirmed) {  
                $.ajax({
                    type: "get",
                    dataType: "html",
                    url: "answer/deleteanswer.jsp",
                    data: { "idx": idx },  
                    success: function() {
                       list(currentPage);
                    // ratingText와 stars 업데이트
                       updateRatingAndStars();
                        
                    }
                });
            }
        });
    });

    // 댓글 수정 - modal 쓸거
    $(document).on("click", ".btnup", function() {
        var idx = $(this).data("idx");  
        var content = $(this).data("content");
        var star = $(this).data("star");
        
        $("#updatecontent").val(content);
        $("#updatestar").val(star);
        
        $("#updatemodal").modal("show");
        
        //modal창의 수정버튼 누르면 
        $("#updatebtn").click(function() {
            // 수정한 내용을 가져옵니다.
            var updatecontent = $("#updatecontent").val();
            var updatestar = $("#updatestar").val();
            
            // 서버로 수정 내용을 전송합니다.
            $.ajax({
                type: "post",
                dataType: "html",
                url: "answer/updateanswer.jsp",
                data: { "idx": idx, "content": updatecontent, "star": updatestar },
                success: function() {
                    // 수정 후 모달을 닫고 댓글 목록을 업데이트합니다.
                    $("#updatemodal").modal("hide");
                    list(currentPage);
                 // ratingText와 stars 업데이트
                    updateRatingAndStars();
                }
            });
        });

        // 모달이 닫힐 때 입력 내용 초기화
        $('#updatemodal').on('hidden.bs.modal', function() {
            $("#updatecontent").val('');
            $("#updatestar").val('');
        });
    });
    
    
    $(document).on("click",".chu",function(){
       var idx=$(this).attr("idx");
      //alert(idx);
      var tag=$(this);
       $.ajax({   
             type:"get",
             dataType:"json",
             url:"answer/chu.jsp",
             data:{"idx":idx},
             success:function(data){
                //alert(data.chu);
                //alert(tag.text(data.chu));
                tag.text(data.chu);
             
                //추천클릭시 하트 커지고 끝나면 다시 0px;
                tag.animate({"font-size":"50px"},1000,function(){
                   $(this).css("font-size","15px");
                }); 
             
                 
             }
       });
  
   });   
       
    $(document).on("click",".bchu",function(){
       var idx=$(this).attr("idx");
      alert(idx);
      var tag=$(this);
       $.ajax({   
             type:"get",
             dataType:"json",
             url:"answer/bchu.jsp",
             data:{"idx":idx},
             success:function(data){
                //alert(data.bchu);
                //alert(tag.text(data.bchu));
                tag.text(data.bchu);
             
                //추천클릭시 하트 커지고 끝나면 다시 0px;
                tag.animate({"font-size":"50px"},1000,function(){
                   $(this).css("font-size","15px");
                }); 
             
                 
             }
       });
  
   });   
    
    //페이징처리 on이벤트
    
    // 이전 버튼 클릭 이벤트 핸들러
    $('.detailresult').on('click', '.prev', function(){
        if (currentPage > 1) {
            currentPage -= 1; // 현재 페이지를 감소시킴
            
            if(list_num==1){
               list(currentPage);// 페이지를 다시 불러옴
               currentPage=1;
            }
            else if(list_num==2){
               listchu(currentPage);
               currentPage=1;
            }else{
               listday(currentPage);
               currentPage=1;
            }
         
        }
    });
    
    // 페이지번호 클릭 이벤트 핸들러
    $('.detailresult').on('click', '.paging', function(){
        currentPage = $(this).text().trim();
        
        if(list_num==1){
           list(currentPage);// 페이지를 다시 불러옴
           currentPage=1;
        }
        else if(list_num==2){
           listchu(currentPage);
           currentPage=1;
        }else{
           listday(currentPage);
           currentPage=1;
        }
        
    });
    
    // 다음 버튼 클릭 이벤트 핸들러
    $('.detailresult').on('click', '.next', function(){
        if (currentPage < totalPage) {
            currentPage += 1; // 현재 페이지를 증가시킴
            
            if(list_num==1){
               list(currentPage);// 페이지를 다시 불러옴
               currentPage=1;
            }
            else if(list_num==2){
               listchu(currentPage);
               currentPage=1;
            }else{
               listday(currentPage);
               currentPage=1;
            }
            
        }
    });
    
    
    
})

   // 추천순 눌렀을 때
    $(document).on("click", ".listchu", function() {
     
        listchu(currentPage);
    });

    // 작성순 눌렀을 때
    $(document).on("click", ".listday", function() {

        listday(currentPage);
    });
    
    
 
 
//list 함수에서 pagination 컨트롤을 그리고 데이터를 가져오도록 수정
function list(currentPage) {
   
   list_num=1;
   
    $.ajax({
        type: "get",
        url: "answer/listboard.jsp",
        data: {"num": <%=num%>, "currentPage": currentPage},
        dataType: "json",
        success: function(data){
            var startPage = "";
            var endPage = "";
            var totalPage = "";
            var perPage = "";
            var commentNumber = "";
            
            updateRatingAndStars();

            var s = "<div>";
            s += "<table class='table' id='tableone' style='width: 820px; height: 100px;'>";
            
         
            if (data.length == 0) {
                s += "<tr>";
                s += "<td colspan='4' align='center'>";
                s += "<b style='color: white;'>댓글이 없습니다</b>";
                s += "</td></tr>";
            } else {
                $.each(data, function(i, item){
                    startPage = item.startPage;
                    endPage = item.endPage;
                    totalPage = item.totalPage;
                    perPage = item.perPage;
                    commentNumber = (currentPage - 1) * 2 + i + 1;

                    var starimage = "";

                    if (item.star == "1") {
                        starimage = "<img src='image/angry.png' id='starimage' alt='1 Star'>";
                    } else if (item.star == "2") {
                        starimage = "<img src='image/sad.png' id='starimage' alt='2 Star'>";
                    } else if (item.star == "3") {
                        starimage = "<img src='image/laughing.png' id='starimage' alt='3 Star'>";
                    } else if (item.star == "4") {
                        starimage = "<img src='image/smile.png' id='starimage' alt='4 Star'>";
                    } else if (item.star == "5") {
                        starimage = "<img src='image/love.png' id='starimage' alt='5 Star'>";
                    }
                    s += "<tr>";
                    s += "<td align='center' valign='middle' style='width:50px; height:54px;'>" + starimage + "</td>";
                    s += "<td valign='middle' style='width:70px; height:54px;'><b style='color: blue;'>" + (item.myid ? item.myid : "비회원") + "</b></td>";
                    s += "<td valign='middle' style='width:400px;'>"+item.content;
                    s += "<br>";
                    s +="<i class='bi bi-hand-thumbs-up-fill chu' idx='"+item.idx+"' style='color: blue; cursor: pointer;'>"+item.chu+"</i>";
                    s += "\t";
                    s +="<i class='bi bi-hand-thumbs-down-fill bchu' idx='"+item.idx+"' style='color: red; cursor: pointer;'>"+item.bchu+"</i>";
                    s += "<b style='color:gray; font-size:8pt; float:right; border-radius:100%;'>"+item.writeday+ "</b>";
                    s += "<td align='right'><button type='button' class='btn btn-outline-success btnup' data-idx='" + item.idx + "' data-content='" + item.content + "' data-star='" + item.star + "'><i class='bi bi-pencil-square'></i></button> ";
                    s += "\t";
                    s += "<button type='button' class='btn btn-outline-danger btndel' data-idx='" + item.idx + "'><i class='bi bi-trash3-fill'></i></button></td>";
                    s += "</tr>";
                });
            }

            s += "</table>";
            s += "</div>";

         // pagination 컨트롤을 그리는 코드
            s += "<div style='width: 820px; text-align: center;'>";
            s += "<ul class='pagination justify-content-center'>";

            // 이전 버튼
            if (startPage>=1 && currentPage > 1) {
                s += "<li class='page-item active'>";
                s += "<a class='page-link'><i class='bi bi-arrow-left prev' style='cursor:pointer;'></i></a>";
                s += "</li>";
                
                /* // 이전 버튼 클릭 이벤트 핸들러
                $('.detailresult').on('click', '.prev', function(){
                    if (currentPage > 1) {
                        currentPage -= 1; // 현재 페이지를 감소시킴
                        list(currentPage); // 페이지를 다시 불러옴
                    }
                }); */
            }

            //숫자페이지
            for (var pp = startPage; pp <= endPage; pp++) {
                if (pp == currentPage) {
                    s += "<li class='page-item active'>";
                    s += "<a class='page-link paging' style='cursor:pointer;'>"+pp+"</a>";
                    s += "</li>";
                } else {
                    s += "<li class='page-item'>";
                    s += "<a class='page-link paging' style='cursor:pointer;'>"+pp+"</a>";
                    s += "</li>";
                }
                
                /* // 페이지번호 클릭 이벤트 핸들러
                $('.detailresult').on('click', '.paging', function(){
                    currentPage = $(this).text().trim();
                    list(currentPage); // 페이지를 다시 불러옴
                }); */
                
            }

            // 다음 버튼
            if (endPage<=totalPage && currentPage<totalPage) {
                s += "<li class='page-item active'>";
                s += "<a class='page-link'><i class='bi bi-arrow-right next' style='cursor:pointer;'></i></a>";
                s += "</li>";
                
             /* // 다음 버튼 클릭 이벤트 핸들러
                $('.detailresult').on('click', '.next', function(){
                    if (currentPage < totalPage) {
                        currentPage += 1; // 현재 페이지를 증가시킴
                        list(currentPage); // 페이지를 다시 불러옴
                    }
                }); */
            }

            s += "</ul>";
            s += "</div>";
            
            //alert("hi");
            $(".detailresult").html(s);
            
       
            

        }
        
    });
}

//list 추천순
function listchu(currentPage) {
   
   
   list_num=2;
   
   alert(currentPage);
    $.ajax({
        type: "get",
        url: "answer/listboardchu.jsp",
        data: {"num": <%=num%>, "currentPage": currentPage},
        dataType: "json",
        success: function(data){
            var startPage = "";
            var endPage = "";
            var totalPage = "";
            var perPage = "";
            var commentNumber = "";
            
            updateRatingAndStars();

            var s = "<div>";
            s += "<table class='table' id='tableone' style='width: 650px; height: 100px;'>";
            
         
            if (data.length == 0) {
                s += "<tr>";
                s += "<td colspan='4' align='center'>";
                s += "<b>댓글이 없습니다</b>";
                s += "</td></tr>";
            } else {
                $.each(data, function(i, item){
                    startPage = item.startPage;
                    endPage = item.endPage;
                    totalPage = item.totalPage;
                    perPage = item.perPage;
                    commentNumber = (currentPage - 1) * 2 + i + 1;

                    var starimage = "";

                    if (item.star == "1") {
                        starimage = "<img src='image/angry.png' id='starimage' alt='1 Star'>";
                    } else if (item.star == "2") {
                        starimage = "<img src='image/sad.png' id='starimage' alt='2 Star'>";
                    } else if (item.star == "3") {
                        starimage = "<img src='image/laughing.png' id='starimage' alt='3 Star'>";
                    } else if (item.star == "4") {
                        starimage = "<img src='image/smile.png' id='starimage' alt='4 Star'>";
                    } else if (item.star == "5") {
                        starimage = "<img src='image/love.png' id='starimage' alt='5 Star'>";
                    }
                    s += "<tr>";
                    s += "<td align='center' valign='middle' style='width:50px; height:54px;'>" + starimage + "</td>";
                    s += "<td valign='middle' style='width:70px; height:54px;'><b style='color: blue;'>" + (item.myid ? item.myid : "비회원") + "</b></td>";
                    s += "<td valign='middle' style='width:400px;'>"+item.content;
                    s += "<br>";
                    s +="<i class='bi bi-hand-thumbs-up-fill chu' idx='"+item.idx+"' style='color: blue; cursor: pointer;'>"+item.chu+"</i>";
                    s += "\t";
                    s +="<i class='bi bi-hand-thumbs-down-fill bchu' idx='"+item.idx+"' style='color: red; cursor: pointer;'>"+item.bchu+"</i>";
                    s += "<b style='color:gray; font-size:8pt; float:right; border-radius:100%;'>"+item.writeday+ "</b>";
                    s += "<td align='right'><button type='button' class='btn btn-outline-success btnup' data-idx='" + item.idx + "' data-content='" + item.content + "' data-star='" + item.star + "'><i class='bi bi-pencil-square'></i></button> ";
                    s += "\t";
                    s += "<button type='button' class='btn btn-outline-danger btndel' data-idx='" + item.idx + "'><i class='bi bi-trash3-fill'></i></button></td>";
                    s += "</tr>";
                });
            }

            s += "</table>";
            s += "</div>";

         // pagination 컨트롤을 그리는 코드
            s += "<div style='width: 600px; text-align: center;'>";
            s += "<ul class='pagination justify-content-center'>";

            // 이전 버튼
            if (startPage>=1 && currentPage > 1) {
                s += "<li class='page-item active'>";
                s += "<a class='page-link'><i class='bi bi-arrow-left prev' style='cursor:pointer;'></i></a>";
                s += "</li>";
                
             // 이전 버튼 클릭 이벤트 핸들러
               /*  $('.detailresult').on('click', '.prev', function(){
                    if (currentPage > 1) {
                        currentPage -= 1; // 현재 페이지를 감소시킴
                        listchu(currentPage); // 페이지를 다시 불러옴
                    }
                }); */
            }

            //숫자페이지
            for (var pp = startPage; pp <= endPage; pp++) {
                if (pp == currentPage) {
                    s += "<li class='page-item active'>";
                    s += "<a class='page-link paging' style='cursor:pointer;'>"+pp+"</a>";
                    s += "</li>";
                } else {
                    s += "<li class='page-item'>";
                    s += "<a class='page-link paging' style='cursor:pointer;'>"+pp+"</a>";
                    s += "</li>";
                }
                
             // 페이지번호 클릭 이벤트 핸들러
                /* $('.detailresult').on('click', '.paging', function(){
                    currentPage = $(this).text().trim();
                    listchu(currentPage); // 페이지를 다시 불러옴
                }); */
            }

            // 다음 버튼
            if (endPage<=totalPage && currentPage<totalPage) {
                s += "<li class='page-item active'>";
                s += "<a class='page-link'><i class='bi bi-arrow-right next' style='cursor:pointer;'></i></a>";
                s += "</li>";
                
             // 다음 버튼 클릭 이벤트 핸들러
                /* $('.detailresult').on('click', '.next', function(){
                    if (currentPage < totalPage) {
                        currentPage += 1; // 현재 페이지를 증가시킴
                        listchu(currentPage); // 페이지를 다시 불러옴
                    }
                }); */
            }

            s += "</ul>";
            s += "</div>";
            
            //alert("hi");
            $(".detailresult").html(s);
            
       
            

        }
        
    });
}

//list 작성순
function listday(currentPage) {
   
   list_num=3;
   
    $.ajax({
        type: "get",
        url: "answer/listboardday.jsp",
        data: {"num": <%=num%>, "currentPage": currentPage},
        dataType: "json",
        success: function(data){
            var startPage = "";
            var endPage = "";
            var totalPage = "";
            var perPage = "";
            var commentNumber = "";
            
            updateRatingAndStars();

            var s = "<div>";
            s += "<table class='table' id='tableone' style='width: 650px; height: 100px;'>";

            
         
            if (data.length == 0) {
                s += "<tr>";
                s += "<td colspan='4' align='center'>";
                s += "<b>댓글이 없습니다</b>";
                s += "</td></tr>";
            } else {
                $.each(data, function(i, item){
                    startPage = item.startPage;
                    endPage = item.endPage;
                    totalPage = item.totalPage;
                    perPage = item.perPage;
                    commentNumber = (currentPage - 1) * 2 + i + 1;

                    var starimage = "";

                    if (item.star == "1") {
                        starimage = "<img src='image/angry.png' id='starimage' alt='1 Star'>";
                    } else if (item.star == "2") {
                        starimage = "<img src='image/sad.png' id='starimage' alt='2 Star'>";
                    } else if (item.star == "3") {
                        starimage = "<img src='image/laughing.png' id='starimage' alt='3 Star'>";
                    } else if (item.star == "4") {
                        starimage = "<img src='image/smile.png' id='starimage' alt='4 Star'>";
                    } else if (item.star == "5") {
                        starimage = "<img src='image/love.png' id='starimage' alt='5 Star'>";
                    }
                    s += "<tr>";
                    s += "<td align='center' valign='middle' style='width:50px; height:54px;'>" + starimage + "</td>";
                    s += "<td valign='middle' style='width:70px; height:54px;'><b style='color: blue;'>" + (item.myid ? item.myid : "비회원") + "</b></td>";
                    s += "<td valign='middle' style='width:400px;'>"+item.content;
                    s += "<br>";
                    s +="<i class='bi bi-hand-thumbs-up-fill chu' idx='"+item.idx+"' style='color: blue; cursor: pointer;'>"+item.chu+"</i>";
                    s += "\t";
                    s +="<i class='bi bi-hand-thumbs-down-fill bchu' idx='"+item.idx+"' style='color: red; cursor: pointer;'>"+item.bchu+"</i>";
                    s += "<b style='color:gray; font-size:8pt; float:right; border-radius:100%;'>"+item.writeday+ "</b>";
                    s += "<td align='right'><button type='button' class='btn btn-outline-success btnup' data-idx='" + item.idx + "' data-content='" + item.content + "' data-star='" + item.star + "'><i class='bi bi-pencil-square'></i></button> ";
                    s += "\t";
                    s += "<button type='button' class='btn btn-outline-danger btndel' data-idx='" + item.idx + "'><i class='bi bi-trash3-fill'></i></button></td>";
                    s += "</tr>";
                });
            }

            s += "</table>";
            s += "</div>";

         // pagination 컨트롤을 그리는 코드
            s += "<div style='width: 600px; text-align: center;'>";
            s += "<ul class='pagination justify-content-center'>";

            // 이전 버튼
            if (startPage>=1 && currentPage > 1) {
                s += "<li class='page-item active'>";
                s += "<a class='page-link'><i class='bi bi-arrow-left prev' style='cursor:pointer;'></i></a>";
                s += "</li>";
                
             // 이전 버튼 클릭 이벤트 핸들러
                /* $('.detailresult').on('click', '.prev', function(){
                    if (currentPage > 1) {
                        currentPage -= 1; // 현재 페이지를 감소시킴
                        list(currentPage); // 페이지를 다시 불러옴
                    }
                }); */
            }

            //숫자페이지
            for (var pp = startPage; pp <= endPage; pp++) {
                if (pp == currentPage) {
                    s += "<li class='page-item active'>";
                    s += "<a class='page-link paging' style='cursor:pointer;'>"+pp+"</a>";
                    s += "</li>";
                } else {
                    s += "<li class='page-item'>";
                    s += "<a class='page-link paging' style='cursor:pointer;'>"+pp+"</a>";
                    s += "</li>";
                }
                
             /* // 페이지번호 클릭 이벤트 핸들러
                $('.detailresult').on('click', '.paging', function(){
                    currentPage = $(this).text().trim();
                    list(currentPage); // 페이지를 다시 불러옴
                }); */
            }

            // 다음 버튼
            if (endPage<=totalPage && currentPage<totalPage) {
                s += "<li class='page-item active'>";
                s += "<a class='page-link'><i class='bi bi-arrow-right next' style='cursor:pointer;'></i></a>";
                s += "</li>";
                
             /* // 다음 버튼 클릭 이벤트 핸들러
                $('.detailresult').on('click', '.next', function(){
                    if (currentPage < totalPage) {
                        currentPage += 1; // 현재 페이지를 증가시킴
                        list(currentPage); // 페이지를 다시 불러옴
                    }
                }); */
            }

            s += "</ul>";
            s += "</div>";
            
            //alert("hi");
            $(".detailresult").html(s);
            
       
            

        }
        
    });
}

function updateRatingAndStars() {
    $.ajax({
        type: "get",
        url: "answer/calculate.jsp",
        data: { "num": <%=num%> },
        dataType: "json",
        success: function(data) {
            if (data.length > 0) { // data가 배열인지 확인
                var avgrate = data[0].avgrate.toFixed(1);
                var totalcomment = data[0].totalcomment;
                var totalrate = data[0].totalrate;
                var stars="";

                if (totalcomment > 0) {
                    var ratingText = "관람객 평점: " + avgrate + "\t(총\t" + totalcomment + "명이 평가해주셨습니다.)";
                    var pointText = totalcomment + "명의 관람객이 평가해주셨습니다."
                 
                    // 별 이미지 출력을 위한 변수 
                    var stars = "";

                    // 별 이미지를 조건에 따라 설정
                    if (avgrate == 5) {
                        for (var i = 1; i <= 5; i++) {
                           stars += "<img src='image/onestar.png' class='starscore'>";
                        }
                    } else if (avgrate >= 4.5) {
                        for (var i = 1; i <= 4; i++) {
                           stars += "<img src='image/onestar.png' class='starscore'>";
                        }
                        stars += "<img src='image/halfstar.png' class='starscore'>";
                    } else if (avgrate >= 4) {
                        for (var i = 1; i <= 4; i++) {
                           stars += "<img src='image/onestar.png' class='starscore'>";
                        }
                    } else if (avgrate >= 3.5) {
                        for (var i = 1; i <= 3; i++) {
                           stars += "<img src='image/onestar.png' class='starscore'>";
                        }
                        stars += "<img src='image/halfstar.png' class='starscore'>";
                    } else if (avgrate >= 3) {
                        for (var i = 1; i <= 3; i++) {
                           stars += "<img src='image/onestar.png' class='starscore'>";
                        }
                    } else if (avgrate >= 2.5) {
                        for (var i = 1; i <= 2; i++) {
                           stars += "<img src='image/onestar.png' class='starscore'>";
                        }
                        stars += "<img src='image/halfstar.png' class='starscore'>";
                    } else if (avgrate >= 2) {
                        for (var i = 1; i <= 2; i++) {
                           stars += "<img src='image/onestar.png' class='starscore'>";
                        }
                    } else if (avgrate >= 1.5) {
                       stars += "<img src='image/onestar.png' class='starscore'>";
                       stars += "<img src='image/halfstar.png' class='starscore'>";
                    } else if (avgrate >= 1) {
                       stars += "<img src='image/onestar.png' class='starscore'>";
                    }
                    
                    $("div.averageRating").html(ratingText + "<br>" + stars);
                    $("b.answerpoint1").html(pointText);
                } else {
                    $("div.averageRating").text("관람객 평점: 아직 평가 없음");
                }
            }
        }

    });
}


</script>

</head>
<body>
<!-- 큰 div 영역 -->
<div class="detailblock">
   <!-- 출력할 컨텐츠 영역 -->
   <div class="detailall">
      <div class="detailposter"><b><img src="<%=dto.getMv_poster()%>"></b></div>
      <div class="detailtitle"><b>영화제목 : <%=dto.getMv_title() %></b></div>
      <div class="detailreserve"><b>예매율 : 93%</b></div>
      <div class="detailinfo">장르 : <%=dto.getMv_genre() %><br>개봉 : <%=dto.getMv_opendate() %></div>
      <div class="averageRating text-white" ></div>
      
      <b style="color:white; font-size:20pt; position:absolute; top:450px; left:270px;" >줄거리</b>
      <div class="detailstory"><%=dto.getMv_st() %></div>
      <button type="button" id="detailbtn1" onclick="location='<%=root%>/index.jsp?main=Movie_reserve/movielist.jsp'">예매하기</button>
      <button type="button" id="detailbtn2" onclick="back()">이전으로</button>
    
      <!-- 내부 요소 재배치 -->
      <div style="height: 1400px;">
      <div class="bunpo">
      <b style="font-size:20pt;">예매선호율</b>
      <br>
      <img src="image/bunpo1.png" style="width:830px; height:300px; margin-top: 10px;">
      </div>
      
      
         <div class="steelcut" style="width: 100%; height: 500px; margin-top: 950px;">
      <b style="color:white; font-size:20pt; position:absolute; top:1300px; left:300px;" >스틸컷</b>
         <div class="swiper mySwiper">
            <div class="swiper-wrapper">
               <div class="swiper-slide">
                  <img src="image/op1.jpeg">
               </div>
               <div class="swiper-slide">
                  <img src="image/op2.jpeg">
               </div>
               <div class="swiper-slide">
                  <img src="image/op3.jpeg">
               </div>
               <div class="swiper-slide">
                  <img src="image/op4.jpeg">
               </div>
               <div class="swiper-slide">
                  <img src="image/op5.jpeg">
               </div>
               <div class="swiper-slide">
                  <img src="image/op6.jpeg">
               </div>
               <div class="swiper-slide">
                  <img src="image/op7.jpeg">
               </div>
               <div class="swiper-slide">
                  <img src="image/op8.jpeg">
               </div>
               <div class="swiper-slide">
                  <img src="image/op9.jpeg">
               </div>
               <div class="swiper-slide">
                  <img src="image/op10.jpeg">
               </div>
            </div>
         </div>
      </div><!-- 스틸컷 닫는 div -->
      
      <div class="method">
      <hr style="border: 3px solid white;">
      <b>배우들의 연기가 메소드급인</b>
      <br>
      <b>몰입하여 보게되는 영화</b>
       
      <br><br>
      <img src="image/emotionpoint1.png" style="width:830px; height:300px;">
      
      </div>
   
      <!-- 댓글 입력 -->
      <div class="detailcomment">   
      <form>
         <input type="hidden" id="num" value="<%=num %>">
         <input type="hidden" id="idx" value="<%=idx %>">
         
         
         <table class="table table-striped" id="tabletwo">
         <caption align="top"><b style="color:snowhite; font-size:22pt;">영화감상평 남기기</b></caption>
         
            <tr>
                  <td valign="middle"><b style="color: black; font-size: 0.9em;">작성자:</b> 
                  <b style="color: blue;">
                  <%
            if (myid == null || myid == "") {
             myid = "비회원";
            }
            %>
            
           <%= myid %>
               </b>
                  &nbsp;&nbsp;&nbsp;&nbsp;
               <b style="color: black; font-size: 0.9em;">별점</b>
               
               <select name="star" id="star" style="width:110px; color: gold;">
                  <option value="1" >★</option>
                  <option value="2" >★★</option>
                  <option value="3" >★★★</option>
                  <option value="4" >★★★★</option>
                  <option value="5" selected>★★★★★</option>
               </select>
               
               &nbsp;&nbsp;&nbsp;&nbsp;
               <button type="button" id="btnadd" style="width: 50px; height: 30px;">등록</button>
               </td>
               
            </tr>
            
            <tr>
               
               <td valign="middle">
               <textarea id="content" class="form-control" style="width: 810px; height:200px;"
               placeholder="영화 본 감상을 입력해주세요"></textarea>
               </td>
                 
            </tr>
         </table>
      </form>
      </div>
      
      <div class="detailresult">
         <div style="overflow: auto; height: 400px;">

         </div>
         </div>
   </div>
</div>
<div class="mushroom">
      <img src="image/mushroom.png" id="mushroom" style="height: 300px; width: 100%; position: absolute; top: 320px;"
       onclick="location.href='https://www.burgerking.co.kr/#/home'">
     </div>
</div><!-- 재배치 닫는 태그-->
<!-- 모달 창 -->
<div class="modal fade" id="updatemodal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel">댓글 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 수정할 내용을 입력할 폼 -->
                <form>
                    <div class="mb-3">
                        <label for="updatecontent" class="form-label">댓글 내용</label>
                        <textarea class="form-control" id="updatecontent" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="updatestar" class="form-label">별점</label>
                        <select class="form-select" id="updatestar">
                            <option value="1">★</option>
                            <option value="2">★★</option>
                            <option value="3">★★★</option>
                            <option value="4">★★★★</option>
                            <option value="5">★★★★★</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-info" id="updatebtn">수정</button>
            </div>
        </div>
    </div>
</div>

<script>
      
      var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      });

    </script>

</body>
</html>