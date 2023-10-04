<?xml version="1.0" encoding="UTF-8"?>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="oracle.db.DBConnect"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<data>
	<%
      DBConnect db=new DBConnect();
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null; //SQL문 전달자
      ResultSet rs=null;
      String sql="select * from team order by num";
      SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); //날짜 형식을 바꿔주는 것
         
      try{
      pstmt=conn.prepareStatement(sql);
      rs=pstmt.executeQuery();
      
      while(rs.next())
      {
         String num=rs.getString("num");
         String name=rs.getString("name");
         String addr=rs.getString("addr");
         String writeday=sdf.format(rs.getTimestamp("writeday"));
         
         %>
         <team num="<%=num %>">
            <name><%=name %></name>
            <addr><%=addr %></addr>
            <writeday><%=writeday %></writeday>
         </team>   
    <%}
      
      }catch(SQLException e){
         
      }finally{
         db.dbClose(rs, pstmt, conn);
      }
	%>
</data>