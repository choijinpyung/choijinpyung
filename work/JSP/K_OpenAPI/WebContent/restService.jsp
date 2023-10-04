<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>
<%@ page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@ page
	import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>일별 박스오피스</title>
</head>
<body>
	<h1>일별 박스오피스</h1>
	<%
	//값이 안뜬다면 jar,xml 파일 확인

    // 조회일자 2023년 09월 11일의 데이터
    String targetDt = request.getParameter("targetDt") == null ? "20230901" : request.getParameter("targetDt");
    // 결과 row수
    String itemPerPage = request.getParameter("itemPerPage") == null ? "10" : request.getParameter("itemPerPage");
    // "Y" : 다양성 영화, "N" : 상업 영화
    String multiMovieYn = request.getParameter("multiMovieYn") == null ? "" : request.getParameter("multiMovieYn");
    // "K" : 한국 영화, "F" : 외국 영화
    String repNationCd = request.getParameter("repNationCd") == null ? "" : request.getParameter("repNationCd");
    // "0105000000" 로서 조회된 지역코드
    String wideAreaCd = request.getParameter("wideAreaCd") == null ? "" : request.getParameter("wideAreaCd");

    // 발급키 변경 절대 금지!!!!!!!!!!
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

	<table class="table table-bordered">
		<tr>
			<td>영화순위</td>
			<td>영화제목</td>
		</tr>

		<c:forEach var="boxoffice"
			items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}">
			<tr>
				<td><c:out value="${boxoffice.rank}" /></td>
				<td><c:out value="${boxoffice.movieNm}" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>