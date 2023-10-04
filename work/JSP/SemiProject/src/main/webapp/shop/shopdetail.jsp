<%@page import="java.text.NumberFormat"%>
<%@page import="Dao.MemberDao"%>
<%@page import="Dto.MemberDto"%>
<%@page import="Dao.ShopDao"%>
<%@page import="Dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<style>
div.photo{

border: 2px solid white;
width: 600px;
height: 400px

}
.bi-cart{

color: white;
font-size: 15px;

}
</style>
<script>
function openPop(){
	window.open("shop/popup.html","nutrition","width=200px")
	
	
}

</script>
<body>

<%
//shoplist의 location.href에서 num값 넘겨주기
String shopnum=request.getParameter("shopnum");

//로그인 상태 가져오기
String loginok=(String)session.getAttribute("loginok");
//로그인 아이디 가져오기
String myid=(String)session.getAttribute("myid");

//사용자 ID로 로그인 시 멤버의 시퀀스 가져오기
MemberDao mdao=new MemberDao();
String num=mdao.getNum(myid);

ShopDao sdao=new ShopDao();
ShopDto sdto=sdao.getData(shopnum);

NumberFormat nf=NumberFormat.getCurrencyInstance();

%>

<form id="frm">
<input type="hidden" name="shop_num" value="<%=shopnum%>">
<input type="hidden" name="mem_no" value="<%=num%>">
<br><br>

<div class="container" style="width: 1000px;">
<div id="contents">
<h1 style="color: white;">스토어</h1>
<hr style="color: white;border: 3px solid white;">
 <!-- Nav pills -->
  <ul class="nav nav-pills" role="tablist">
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="pill" href="index.jsp?main=shop/shoplist.jsp">전체보기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="pill" href="#menu1">패키지</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="pill" href="#menu2">팝콘</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="pill" href="#menu3">음료</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-bs-toggle="pill" href="#menu4">콤보</a>
    </li>
  </ul>
<hr style="color: white;"><br><br>

<h2 style="color: white;"><b><%=sdto.getShop_sangpum() %></b></h2>
<hr style="color: white;">
<img src="shopimg/<%=sdto.getShop_photo() %>" style="width:300px;height: 300px;">
<span style="margin-top: 420px;margin-left: 100px;"><h3 style="color: white;"><%=nf.format(sdto.getShop_price())%></h3>
<hr style="color: white;width:470px;">
<h6 style="color: white;"><b>상품구성:</b><%=sdto.getShop_detail() %></h6>
<button type="button" class="btn btn-secondary btn-sm" onclick="openPop()">영양성분</button>
<hr style="color: white;width:470px;">
<input type="number" min="1" max="10" value="1" step="1" name="cnt" style="margin-right: 60px;" oninput="updateTotalPrice()" id="cnt">
<hr style="color: white;width:470px;">
<h4 style="color: white;">총 구매금액&nbsp;&nbsp;&nbsp;&nbsp;<b style="color: #ff6347" id="totalPrice"><%=nf.format(sdto.getShop_price())%></b></h4>
<div style="margin-left: 300px;">
<button type="button" class="btn btn-danger basket"><i class="bi bi-cart"></i></button>
<button type="button" class="btn btn-info">결제하기</button></div>
</span>

</div>
</div>
</form>
<br><br>
<script>
$(function(){
	$(".basket").click(function(){
		
		var loginstatus="<%=loginok%>";
		
		
		if(loginstatus==null){
			
			var logingo=confirm("로그인이 필요합니다.\n로그인 페이지로 이동하시겠습니까?");
			
			if(logingo){
				location.href="index.jsp?main=login/loginform.jsp";
			
			}
			return;
		}
		
		
		var frm=$("#frm").serialize(); //serilaize()를 통해 <input>에 있는 name들을 모두 받아온다.
		//alert(frm);
			$.ajax({
				
				type:"post",
				dataType:"html",
				url:"shop/cartProc.jsp",
				data:frm,
				success:function(){
					
					var cart=confirm("장바구니에 상품이 추가되었습니다.\n장바구니로 이동하시겠습니까?");
					
					if(cart){
						location.href="index.jsp?main=shop/myCart.jsp"
					}
					
				}
				
				
			})
		
		
	})
	
})
        // 숫자 입력 필드의 값이 변경될 때 호출되는 함수
        function updateTotalPrice() {
	
			var won = Intl.NumberFormat('ko-KR', {
	   		 style: 'currency',
	   		 currency: 'KRW',
			});
	
	
            // 입력 필드에서 숫자 값을 가져옴
            var cntValue = parseInt(document.getElementById('cnt').value);
            
            // 상품 가격 가져오기
            var shopPrice = parseFloat('<%=sdto.getShop_price()%>');
            
            // 총 구매금액 계산
            var totalPrice = cntValue * shopPrice;
            
            // 결과를 총 구매금액 요소에 업데이트
            document.getElementById('totalPrice').innerHTML = won.format(totalPrice);
            		
        }



</script>
</body>
</html>