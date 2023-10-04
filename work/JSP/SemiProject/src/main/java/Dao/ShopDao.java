package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import Dto.CartDto;
import Dto.ShopDto;
import mysql.db.DBConnect;

public class ShopDao {
   DBConnect db=new DBConnect();
   
   //상품등록 insert
   public void ShopInsert(ShopDto dto) {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="insert into shop values(null,?,?,?,?,?,now())";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, dto.getShop_category());
         pstmt.setString(2, dto.getShop_sangpum());
         pstmt.setString(3, dto.getShop_detail());
         pstmt.setString(4, dto.getShop_photo());
         pstmt.setInt(5, dto.getShop_price());
         
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         
         db.dbClose(pstmt, conn);
      }
      
   }
   
   //스토어에 전체 이미지 조회
   public List<ShopDto> getAllData(){
      
      List<ShopDto> list=new ArrayList<ShopDto>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from shop order by shop_num";
      
      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            
            ShopDto dto=new ShopDto();
            
            dto.setShop_num(rs.getString("shop_num"));
            dto.setShop_category(rs.getString("shop_category"));
            dto.setShop_sangpum(rs.getString("shop_sangpum"));
            dto.setShop_detail(rs.getString("shop_detail"));
            dto.setShop_photo(rs.getString("shop_photo"));
            dto.setShop_price(rs.getInt("shop_price"));
            dto.setShop_ipgoday(rs.getTimestamp("shop_ipgoday"));
            
            list.add(dto);
            
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      return list;
   }
   
   //delete dao
   public void deleteData(String num) {
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="delete from shop where shop_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, num);
         pstmt.execute();
         
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   //수정 클릭 시 num에 따른 값 가져옥
   public ShopDto getData(String num) {
      
      ShopDto dto=new ShopDto();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from shop where shop_num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, num);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            
            dto.setShop_category(rs.getString("shop_category"));
            dto.setShop_sangpum(rs.getString("shop_sangpum"));
            dto.setShop_detail(rs.getString("shop_detail"));
            dto.setShop_photo(rs.getString("shop_photo"));
            dto.setShop_price(rs.getInt("shop_price"));
            
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      return dto;
   }
   
   //cart에 상품 insert
   
   public void insertCart(CartDto dto) {
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="insert into cart values(null,?,?,?,now())";
      
      try {
         
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, dto.getShop_num());
         pstmt.setString(2, dto.getMem_no());
         pstmt.setInt(3, dto.getCnt());
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         
         db.dbClose(pstmt, conn);
      }
      
      
   }
   public List<HashMap<String, String>> getCartList(String myid){
      
      List<HashMap<String, String>> list=new ArrayList<HashMap<String,String>>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select c.cart_idx,s.shop_num,s.shop_sangpum,s.shop_photo,s.shop_detail,s.shop_price,c.cnt,c.cartday,m.mem_name,m.mem_ph "
            + "from cart c,shop s,member_table m "
            + "where c.shop_num=s.shop_num and m.mem_no=c.mem_no and m.mem_id=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, myid);
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            HashMap<String, String> map=new HashMap<String, String>();
            
            map.put("idx", rs.getString("cart_idx"));
            map.put("s_num", rs.getString("shop_num"));
            map.put("name", rs.getString("shop_sangpum"));
            map.put("detail", rs.getString("shop_detail"));
            map.put("photo", rs.getString("shop_photo"));
            map.put("price", rs.getString("shop_price"));
            map.put("cnt",rs.getString("cnt"));
            map.put("cartday", rs.getString("cartday"));
            map.put("m_name", rs.getString("mem_name"));
            map.put("mem_ph", rs.getString("mem_ph"));
            
            list.add(map);

         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      
      
      return list;
      
   }
   //delete cart
   
   public void deleteMycart(String num) {
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="delete from cart where cart_idx=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, num);
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   //select cart
   public HashMap<String, String> getCart(String cart_idx){
      
      HashMap<String, String> map=new HashMap<String, String>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select c.cart_idx,s.shop_num,s.shop_sangpum,s.shop_photo,s.shop_detail,s.shop_price,c.cnt,c.cartday,m.mem_name,m.mem_ph "
            + "from cart c,shop s,member_table m "
            + "where c.shop_num=s.shop_num and m.mem_no=c.mem_no and c.cart_idx=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, cart_idx);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            
            map.put("idx", rs.getString("cart_idx"));
            map.put("s_num", rs.getString("shop_num"));
            map.put("name", rs.getString("shop_sangpum"));
            map.put("detail", rs.getString("shop_detail"));
            map.put("photo", rs.getString("shop_photo"));
            map.put("price", rs.getString("shop_price"));
            map.put("cnt",rs.getString("cnt"));
            map.put("cartday", rs.getString("cartday"));
            map.put("m_name", rs.getString("mem_name"));
            map.put("mem_ph", rs.getString("mem_ph"));

         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      
      
      return map;
      
   }
}