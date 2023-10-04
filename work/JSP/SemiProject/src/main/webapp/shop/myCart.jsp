<%@page import="java.util.Map"%>
<%@page import="Dto.CartDto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Dto.ShopDto"%>
<%@page import="Dao.MemberDao"%>
<%@page import="Dto.MemberDto"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
String myid=(String)session.getAttribute("myid"); //연결된 아이디 session 가져오기(로그인 했을 때만 장바구니 담을 수 있음)
ShopDao dao=new ShopDao();

List<HashMap<String,String>> list=dao.getCartList(myid);
MemberDao mdao=new MemberDao();

String name=mdao.getName(myid);

NumberFormat nf=NumberFormat.getCurrencyInstance();

int allmoney=0;

%>
<body>
<br><br>
<div class="container" style="width: 1000px;">
<h1 style="color: white;"><%=name %>님의 장바구니</h1>
<hr style="color: white;border: 3px solid white;">
<table class="table table-bordered">
	<tr>
		<th><input type="checkbox" id="allcheck"></th>
		<th>상품명</th>
		<th>상품금액</th>
		<th>수량</th>
		<th>결제금액</th>
	</tr>
	
		<%
		for(int i=0;i<list.size();i++){
			HashMap<String,String> map=list.get(i);
			
			String photo=map.get("photo");
			String sangpum=map.get("sangpum");
						
			//가격 형변환
			int price=Integer.parseInt(map.get("price"));
			//갯수 형변환
			int cnt=Integer.parseInt(map.get("cnt"));
			int eachtotal=price*cnt;
			allmoney+=eachtotal;
			
			%>
			<%-- <script>
			$(function(){
				var all=<%=allmoney%>
				$("#all").text(all);
			})
			
			
			</script> --%>
			<tr>
				<td><input type="checkbox" idx=<%=map.get("idx") %> class="eachcheck" id="eachclick" price=<%=eachtotal %>
				name="cidx" value=<%=map.get("idx") %>></td>
				<td><div class="sangpum" shopnum="<%= map.get("shopnum") %>">
					<img src="shopimg/<%=photo%>" style="width:200px;">상품명:<%=map.get("name") %>상품설명:<%=map.get("detail") %>
				</div></td>
				<td><%=price %></td>
				<td><%=cnt %></td>
				<td>
				<%=nf.format(eachtotal) %>
				</td>
			</tr>

		<%}%>
		<tr>
			<td colspan="5" style="text-align: right;">
				총 금액:<b id="all">0원</b>
			</td>
		</tr>
		<tr>
			<td colspan="5" style="text-align: center">
				<button type="button" class="btn btn-outline-danger" id="delbtn">선택 삭제</button>
				<button type="button" class="btn btn-outline-info" id="buybtn">구매하기</button>
			</td>
		</tr>
	
</table>
</div>
<script>
	
	$("#allcheck").click(function() {
		  var allcheck = $(this).is(":checked"); // 전체 체크 여부 확인
		  console.log(allcheck);

		  // 모든 개별 체크박스에 대해 상태 업데이트
		  $(".eachcheck").prop("checked", allcheck);

		  // 체크된 개별 체크박스들의 가격을 합산
		  var alltot = 0;

		  // 각 개별 체크박스 가격을 누적
		  $(".eachcheck:checked").each(function() {
		    alltot += parseInt($(this).attr("price"));
		  });

		  // 총 금액을 #all 요소에 업데이트
		  $("#all").text(alltot + "원");
		});

  // 각각의 체크박스가 변경될 때마다 실행되는 함수
  $(".eachcheck").change(function() {
    var total = 0; // 총 금액을 저장할 변수 초기화

    // 모든 선택된 체크박스 값을 누적
    $(".eachcheck:checked").each(function() {
      total += parseInt($(this).attr("price"));
    });

    // 총 금액을 #all 요소에 표시
    $("#all").text(total + "원");
  });

$("#delbtn").click(function(){
	
	var leng=$(".eachcheck:checked").length;
	//alert(leng);
	
	if(leng==0){
		
		alert("삭제할 상품을 선택해주세요");
		
	}else{
		
		var y=confirm(leng+"개의 상품을 삭제하시겠습니까?");
		//alert(y);
		if(y){

			$(".eachcheck:checked").each(function(idx){
				
				var cidx=$(this).val();
				del(cidx);
				
			})
			
		}
		
	}
	
	
})

$("#buybtn").click(function(){
	
	var leng=$(".eachcheck:checked").length;
	var cidx_s="";
	
	//alert(leng);
	
	$(".eachcheck:checked").each(function(idx){
		var cidx=$(this).val(); //체크한 상품들의 시퀀스 값 받아옴
		
		cidx_s+=cidx+",";
		
	})
	
	cidx_s=cidx_s.substring(0,cidx_s.length-1);
	
	alert(cidx_s);
	var buy=confirm(leng+"개의 상품을 구매하시겠습니까?");
	
	if(buy){
		location.href="index.jsp?main=shop/payment.jsp?cidx_s="+cidx_s;
	}
	
})

function del(cidx){

	$.ajax({
		
		type:"get",
		dataType:"html",
		url:"shop/deleteMycart.jsp",
		data:{"cidx":cidx},
		success:function(){
			location.reload();
		}
		
	})
	
	
}
</script>

</body>
</html>