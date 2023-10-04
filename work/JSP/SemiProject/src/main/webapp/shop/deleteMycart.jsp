<%@page import="Dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String idx=request.getParameter("cidx");

ShopDao dao=new ShopDao();
dao.deleteMycart(idx);
%>