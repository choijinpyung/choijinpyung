<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="Dao.ShopDao"/>
<jsp:useBean id="cdto" class="Dto.CartDto"/>
<jsp:setProperty property="*" name="cdto"/> <!-- setProperty 사용 시 dto에 있는 이름을 name과 동일하게 일치시켜야 넘어간다. -->

<%

dao.insertCart(cdto);

%>