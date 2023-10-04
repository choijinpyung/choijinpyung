package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Dto.ReservationDto;
import mysql.db.DBConnect;

public class ReservationDao {
   DBConnect db = new DBConnect();
   
   //insert
   public void insertReservation(ReservationDto dto) {
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      
      String sql = "insert into reservation values(null,?,?,?,?,?,?,?,now())";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, dto.getMem_id());
         pstmt.setString(2, dto.getRev_title());
         pstmt.setString(3, dto.getRev_poster());
         pstmt.setString(4, dto.getRev_age());
         pstmt.setString(5, dto.getRev_name());
         pstmt.setString(6, dto.getRev_date());
         pstmt.setString(7, dto.getRev_place());
         
         pstmt.execute();
         
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   //maxNum
   public int maxNum() {
      int max = 0;
      Connection conn = db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "select max(rev_no) max from reservation";
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            max=rs.getInt(1);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      return max;
   }
   
   //getData
   public ReservationDto getData(int num) {
      ReservationDto dto = new ReservationDto();
      
      Connection conn =db.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      String sql = "select * from reservation where rev_no=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setInt(1, num);
         
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            dto.setRev_no(rs.getString(1));
            dto.setMem_id(rs.getString(2));
            dto.setRev_title(rs.getString(3));
            dto.setRev_poster(rs.getString(4));
            dto.setRev_age(rs.getString(5));
            dto.setRev_name(rs.getString(6));
            dto.setRev_date(rs.getString(7));
            dto.setRev_place(rs.getString(8));
            dto.setRev_regdate(rs.getTimestamp(9));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      
      return dto;
   }
   
}