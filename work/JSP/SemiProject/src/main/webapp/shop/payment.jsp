<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dto.CartDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ShopDao"%>
<%@page import="Dao.MemberDao"%>
<%@page import="Dto.MemberDto"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="Dao.ReservationDao"%>
<%@page import="Dto.ReservationDto"%>
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
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<%
	//로그인한 id를 가져옴
	String id = (String)session.getAttribute("myid");

	String cidx=request.getParameter("cidx_s");
	
	int totalPrice = 0;
	
	String [] cidxs=cidx.split(",");
	
	ShopDao dao=new ShopDao();
	
	List<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
	
	for(int i=0; i<cidxs.length; i++){
		list.add(dao.getCart(cidxs[i]));
	}
	
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	
	
%>

</head>

<body>

<br><br>
<div class="container" style="width: 1000px;">
<hr style="color: white;border: 3px solid white;">
<table class="table table-bordered">
	<tr>
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
			totalPrice+=eachtotal;
			
			%>

			<tr>
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
				총 금액:<b id="all"><%=nf.format(totalPrice) %></b>
			</td>
		</tr>
		<tr>
			<td colspan="4" style="text-align: center">
				<input type="button" value="카카오페이" class="btn btn-outline-success" id="payKakao">
				<input type="button" value="kG이니시스" class="btn btn-outline-success" id="kg">
			</td>
		</tr>
	
</table>
</div>

<script>
	
	
	//카카오페이 결제
	IMP.init("imp10502566");

	$("#payKakao").click(function(){
		//alert("test");
		IMP.request_pay({
			pg:"kakaopay.TC0ONETIME",
			pay_method:"card",
			merchant_uid : "3cine(1)"+ Date.now(),
			name:"<%=list.get(0).get("name")%>"+"<%=(list.size()!=1)?"외"+(list.size()-1)+"개":""%>",
			amount:<%=totalPrice%>,
			buy_name:"<%=list.get(0).get("m_name")%>"
		},function(rsp){
			
			if(rsp.success){
				var msg="결제가 완료되었습니다.";
				msg+="\n주문자명 :"+"<%=list.get(0).get("m_name")%>";
				msg+="\n연락처 : "+"<%=list.get(0).get("mem_ph")%>";
				msg+="\n상품명 : "+"<%=list.get(0).get("name")%>"+"<%=(list.size()!=1)?"외"+(list.size()-1)+"개":""%>";
				msg+="\n총 구매금액 : "+"<%=totalPrice%>"+
				
				alert(msg);
				location.href="index.jsp";
			}
			else{
				var msg = "결제에 실패하였습니다.\n";
				msg+=rsp.error_msg;
				
				
				//실패시 reload
				location.reload();
			}
			alert(msg);
		
		});
	});

	//kg이니시스 결제
	$("#kg").click(function(){
		//alert("test");
		IMP.request_pay({
			pg:"html5_inicis.INIBillTst",
			pay_method:"card",
			merchant_uid : "3cine(1)"+ Date.now(),
			name:"<%=list.get(0).get("name")%>"+"<%=(list.size()!=1)?"외"+(list.size()-1)+"개":""%>",
			amount:<%=totalPrice%>,
			buy_name:"<%=list.get(0).get("m_name")%>"
		},function(rsp){
			
			if(rsp.success){
				var msg="결제가 완료되었습니다.";
				msg+="\n주문자명 :"+"<%=list.get(0).get("m_name")%>";
				msg+="\n연락처 : "+"<%=list.get(0).get("mem_ph")%>";
				msg+="\n주문일자 :"+Date.now();
				msg+="\n상품명 : "+"<%=list.get(0).get("name")%>"+"<%=(list.size()!=1)?"외"+(list.size()-1)+"개":""%>";
				msg+="\n총 구매금액 : "+"<%=totalPrice%>"+
				
				alert(msg);
				location.href="index.jsp";
			}
			else{
				var msg = "결제에 실패하였습니다.\n";
				msg+=rsp.error_msg;
				
				
				//실패시 reload
				location.reload();
			}
			alert(msg);
		
		});
		
	});
	
</script>

</body>
</html>