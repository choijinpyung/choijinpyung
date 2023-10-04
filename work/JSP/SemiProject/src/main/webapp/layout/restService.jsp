<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="org.codehaus.jackson.map.ObjectMapper" %>
<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>일별 박스오피스</title>
</head>
<%
	//절대경로잡기
	String root=request.getContextPath();
%>
<style>
.apicontentsbox>h3{
	margin-left: 24%;
	color: white;
	margin-bottom: 50px;
	font-weight: bold;
	left: -16.5%;
}

.apicontentsbox{
	position: relative;
	right: 13.2%;
	left: 13.2%;
	width: 73.6%;
	height: 45%;
	margin-top: 30px;
	font-size: 1.05em;
}

.moviead{
	position: absolute;
	left: 68.5%;
	top: 9.3%;
	cursor: pointer;
}

#ghost{
	position: absolute;
	top: -8%;
	right: -13%;
	transform: rotate(30deg);
	z-index: 1;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    padding-top: 0; /* 수정: 상단 여백 제거 */
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.7);
}

.modal-content {
    margin: auto;
    display: block;
    max-width: 100%; /* 수정: 최대 너비를 100%로 설정 */
    max-height: 100%; /* 수정: 최대 높이를 100%로 설정 */
}
</style>
<body>
<div class="apicontentsbox">
<h3>'3' CINE 박스오피스</h3>
<%
    // 조회일자
    String targetDt = request.getParameter("targetDt") == null ? "20230901" : request.getParameter("targetDt");
    // 결과 row수
    String itemPerPage = request.getParameter("itemPerPage") == null ? "10" : request.getParameter("itemPerPage");
    // "Y" : 다양성 영화, "N" : 상업 영화
    String multiMovieYn = request.getParameter("multiMovieYn") == null ? "" : request.getParameter("multiMovieYn");
    // "K" : 한국 영화, "F" : 외국 영화
    String repNationCd = request.getParameter("repNationCd") == null ? "" : request.getParameter("repNationCd");
    // "0105000000" 로서 조회된 지역코드
    String wideAreaCd = request.getParameter("wideAreaCd") == null ? "" : request.getParameter("wideAreaCd");

    // 발급키
    String key = "2cfb3c29245cd391017dd5c2fce6c752";
    // KOBIS 오픈 APIRest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

    // 일일 박스오피스 서비스 호출
    String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);

    // Json 라이브러리를 통해 Handling
    ObjectMapper mapper = new ObjectMapper();
    HashMap<String, Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
    
    request.setAttribute("dailyResult", dailyResult);
	
    // KOBIS 오픈 API Rest Client를 통해 코드 호출
    String codeResponse=service.getComCodeList(true, "0105000000");
    HashMap<String,Object> codeResult=mapper.readValue(codeResponse, HashMap.class);
    
    request.setAttribute("codeResult", codeResult);
    
%>

<table class="table table-dark table-striped table-hover" style="width: 67.8%; height: 800px; text-align: center; vertical-align: middle;">
    <tr>
        <td style="font-weight: bold; border-top-left-radius: 10px;">순위</td>
        <td style="font-weight: bold;">제목</td>
        <td style="font-weight: bold;">개봉일</td>
        <td style="font-weight: bold;">오늘의 관객수</td>
        <td style="font-weight: bold;">전일 대비 관객수</td>
        <td style="font-weight: bold; border-top-right-radius: 10px;">누적 관객수</td>
    </tr>

    <c:forEach var="boxoffice" items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" varStatus="loop">
    <tr>
        <c:choose>
            <c:when test="${loop.last}">
                <td style="border-bottom-left-radius: 10px; border-bottom: black;">
                    <c:out value="${boxoffice.rank}"/>
                </td>
            </c:when>
            <c:otherwise>
                <td><c:out value="${boxoffice.rank}"/></td>
            </c:otherwise>
        </c:choose>
        <td><c:out value="${boxoffice.movieNm}" /></td>
        <td><c:out value="${boxoffice.openDt}" /></td>
        <td><c:out value="${boxoffice.audiCnt}"/>명</td>
        <td><c:out value="${boxoffice.audiChange}" />%</td>
        <c:choose>
            <c:when test="${loop.last}">
                <td style="border-bottom-right-radius: 10px; border-bottom: black;">
                    <c:out value="${boxoffice.audiAcc}"/>명
                </td>
            </c:when>
            <c:otherwise>
                <td><c:out value="${boxoffice.audiAcc}"/>명</td>
            </c:otherwise>
        </c:choose>
    </tr>
</c:forEach>
</table>
<div class="moviead">
	<img alt="" src="<%=root %>/image/ad.png" style="width: 410px; height: 450px; border-radius: 5px;">
	<img alt="" src="<%=root %>/image/ad1.png" style="width: 410px; height: 341px; margin-top: 10px; border-radius: 5px;">
	<img alt="" src="<%=root %>/image/ghost1.png" style="width: 150px; height: 150px;" id="ghost">
	
	<script>
	// 이미지를 클릭하면 모달 창을 열고 자동으로 닫는 함수
    function openAndCloseModal() {
        const modal = document.createElement('div');
        modal.classList.add('modal');

        const modalContent = document.createElement('img');
        modalContent.src = '<%=root %>/image/zz.png';
        modalContent.classList.add('modal-content');

        modal.appendChild(modalContent);
        document.body.appendChild(modal);

        // 모달을 클릭하면 모달 창이 닫힘
        modal.addEventListener('click', () => {
            modal.style.display = 'none';
        });

        // 3초 후에 모달 창을 자동으로 닫음 (3000ms = 3초)
        setTimeout(() => {
            modal.style.display = 'none';
        }, 1000);

        // 모달 창을 표시
        modal.style.display = 'block';
    }

    // 이미지 클릭 이벤트 핸들러 등록
    const ghostImage = document.getElementById('ghost');
    ghostImage.addEventListener('click', openAndCloseModal);
    </script>
</div>
</div>
</body>
</html>