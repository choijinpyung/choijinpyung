<%@page import="java.text.NumberFormat"%>
<%@page import="Dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<%
ShopDao dao = new ShopDao();
List<ShopDto> list = dao.getAllData();
%>
<script>
	$(function() {

		$("a.detailpage")
				.click(
						function() {

							var num = $(this).attr("shopnum");
							//alert(a);
							location.href = "index.jsp?main=shop/shopdetail.jsp?shopnum="
									+ num;
						})

	})
</script>



<style>
.indexcolor {
	color: white;
}

.shoplistlayoutall {
	width: 100%;
	height: 1800px;
	color: white;
}

.shoplistlayout {
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start; /* 변경: 아이템을 왼쪽에서 오른쪽으로 정렬 */
}

.shoplistlayout .shoplistitem {
	width: calc(25% - 15px);
	/* 4개의 열을 표시하려면 100% / 4 = 25%, 간격을 고려하여 -15px */
	margin-bottom: 20px;
	padding: 10px;
	text-align: center;
}

.shoplistlayout img {
	width: 100%;
	height: auto;
	max-width: 100px;
	max-height: 100px;
}
</style>
<body>
	<!-- 전체 틀 잡아주기 -->
	<div class="shoplistlayoutall">
		<div class="container">
			<hr style="border: 5px solid white;">
			<h2 style="color: white;">스토어</h2>
			<hr style="border: 5px solid white;">
			<br>
			<!-- Nav pills -->
			<ul class="nav nav-pills" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-bs-toggle="pill" href="#home">전체보기</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
					href="#menu1">패키지</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
					href="#menu2">팝콘</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
					href="#menu3">음료</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="pill"
					href="#menu4">콤보</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div id="home" class="container tab-pane active">
					<br>
					<h3 class="indexcolor">전체 보기</h3>

					<!-- 내부요소 정리 -->
					<div class="shoplistlayout">
						<%
						NumberFormat nf1 = NumberFormat.getCurrencyInstance();
						for (int i = 0; i < list.size(); i++) {
							ShopDto dto = list.get(i);
						%>
						<div class="shoplistitem">
							<a shopnum=<%=dto.getShop_num()%> style="cursor: pointer;"
								class="detailpage"> <img
								src="shopimg/<%=dto.getShop_photo()%>"></a><br>
							<h4><%=dto.getShop_sangpum()%></h4>
							<h5><%=dto.getShop_detail()%></h5>
							<h6><%=nf1.format(dto.getShop_price())%>원
							</h6>
							</a>
						</div>
						<%
						if (i % 4 == 3 && i != list.size() - 1) {
						%>
						<div style="width: 100%; height: 20px;"></div>
						<!-- 아이템 간 간격 조절 -->
						<%
						}
						}
						%>
					</div>
				</div>



				<div id="menu1" class="container tab-pane fade lay">
					<br>
					<h3 class="indexcolor">패키지</h3>
					<div class="shoplistlayout">
						<%
        NumberFormat nf2 = NumberFormat.getCurrencyInstance();
        int packageItemCount = 0; // 아이템 개수를 세기 위한 변수 추가
        for (int i = 0; i < list.size(); i++) {
            ShopDto dto = list.get(i);
            if (dto.getShop_category().equals("패키지")) {
        %>
						<div class="shoplistitem"
							style="float: left; width: 25%; margin-right: 1%;">
							<!-- float: left; 및 margin 추가 -->
							<a shopnum=<%=dto.getShop_num()%> style="cursor: pointer;"
								class="detailpage"> <img
								src="shopimg/<%=dto.getShop_photo()%>"></a><br>
							<h4><%=dto.getShop_sangpum()%></h4>
							<h5><%=dto.getShop_detail()%></h5>
							<h6><%=nf2.format(dto.getShop_price())%>원
							</h6>

						</div>
						<%
        packageItemCount++; // 아이템 개수 증가

        if (packageItemCount % 4 == 0 && i != list.size() - 1) {
        %>
						<div style="width: 100%; height: 20px; clear: both;"></div>
						<!-- 아이템 간 간격 조절 및 float 해제 -->
						<%
        }
        }
        }
        %>
					</div>
				</div>


				<div id="menu2" class="container tab-pane fade lay">
					<br>
					<h3 class="indexcolor">팝콘</h3>
					<div class="shoplistlayout">
						<%
						NumberFormat nf3 = NumberFormat.getCurrencyInstance();
						for (int i = 0; i < list.size(); i++) {
							ShopDto dto = list.get(i);
							if (dto.getShop_category().equals("팝콘")) {
						%>
						<div class="shoplistitem">
							<a shopnum=<%=dto.getShop_num()%> style="cursor: pointer;"
								class="detailpage"> <img
								src="shopimg/<%=dto.getShop_photo()%>"></a><br>
							<h4><%=dto.getShop_sangpum()%></h4>
							<h5><%=dto.getShop_detail()%></h5>
							<h6><%=nf3.format(dto.getShop_price())%>원
							</h6>

						</div>
						<%
						}

						}
						%>
					</div>
				</div>





				<div id="menu3" class="container tab-pane fade lay">
					<br>
					<h3 class="indexcolor">음료</h3>
					<div class="shoplistlayout">
						<%
						NumberFormat nf4 = NumberFormat.getCurrencyInstance();
						for (int i = 0; i < list.size(); i++) {
							ShopDto dto = list.get(i);
							if (dto.getShop_category().equals("음료")) {
						%>
						<div class="shoplistitem">
							<a shopnum=<%=dto.getShop_num()%> style="cursor: pointer;"
								class="detailpage"> <img
								src="shopimg/<%=dto.getShop_photo()%>"></a><br>
							<h4><%=dto.getShop_sangpum()%></h4>
							<h5><%=dto.getShop_detail()%></h5>
							<h6><%=nf4.format(dto.getShop_price())%>원
							</h6>

						</div>
						<%
						}

						}
						%>
					</div>
				</div>





				<div id="menu4" class="container tab-pane fade lay">
					<br>
					<h3 class="indexcolor">콤보</h3>
					<div class="shoplistlayout">
						<%
        NumberFormat nf = NumberFormat.getCurrencyInstance();
        int comboItemCount = 0; // 아이템 개수를 세기 위한 변수 추가
        for (int i = 0; i < list.size(); i++) {
            ShopDto dto = list.get(i);
            if (dto.getShop_category().equals("콤보")) {
        %>
						<div class="shoplistitem"
							style="float: left; width: 25%; margin-right: 1%;">
							<!-- float: left; 및 margin 추가 -->
							<a shopnum=<%=dto.getShop_num()%> style="cursor: pointer;"
								class="detailpage"> <img
								src="shopimg/<%=dto.getShop_photo()%>"></a><br>
							<h4><%=dto.getShop_sangpum() %></h4>
							<h5><%=dto.getShop_detail() %></h5>
							<h6><%=nf.format(dto.getShop_price()) %>원
							</h6>

						</div>
						<%
        comboItemCount++; // 아이템 개수 증가

        if (comboItemCount % 4 == 0 && i != list.size() - 1) {
        %>
						<div style="width: 100%; height: 20px; clear: both;"></div>
						<!-- 아이템 간 간격 조절 및 float 해제 -->
						<%
        }
        }
        }
        %>
					</div>
				</div>





			</div>

		</div>
	</div>

</body>
</html>
