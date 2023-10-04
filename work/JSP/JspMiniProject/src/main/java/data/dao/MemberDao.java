package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.MemberDto;
import mysql.db.DBConnect;

public class MemberDao {
   
   DBConnect db=new DBConnect();
   
   //아이디체크
   public int isIdCheck(String id)
   {
      int isid=0;
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select count(*) from member where id=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, id);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            // if(rs.getInt(1)==1) isid=1;
               
            isid=rs.getInt(1);
         }
               
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      
      return isid;
   }
   
   //아이디에 따른 시퀀스반환(아이디에 해당하는 나의정보 반환하기 위함)
   public String getNum(String id)
   {
      String num="";
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from member where id=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, id);
         rs=pstmt.executeQuery();
         
         if(rs.next())
         {
            num=rs.getString("num");
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      
      return num;
   }
   
   //아이디에 따른 이름반환
   public String getName(String id)
   {
      String name="";
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from member where id=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs=pstmt.executeQuery();
         
         if(rs.next())
            name=rs.getString("name");
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      return name;
   }
   //insert
   public void insertMember(MemberDto dto)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="insert into member(name,id,pass,hp,addr,email,gaipday) values(?,?,?,?,?,?,now())";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, dto.getName());
         pstmt.setString(2, dto.getId());
         pstmt.setString(3, dto.getPass());
         pstmt.setString(4, dto.getHp());
         pstmt.setString(5, dto.getAddr());
         pstmt.setString(6, dto.getEmail());
         
         pstmt.execute();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   public List<MemberDto> getAllMembers() {
      
      List<MemberDto> list=new ArrayList<MemberDto>();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from member order by num desc";
      
      try {
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         while(rs.next())
         {
            MemberDto dto=new MemberDto();
            
            dto.setNum(rs.getString("num"));
            dto.setName(rs.getString("name"));
            dto.setId(rs.getString("id"));
            dto.setHp(rs.getString("hp"));
            dto.setAddr(rs.getString("addr"));
            dto.setEmail(rs.getString("email"));
            dto.setGaipday(rs.getTimestamp("gaipday"));
            
            list.add(dto);
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      
      return list;
   }
   
   public void deleteMember(String num)
   {
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="delete from member where num=?";
      
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
   
   //회원 dto 반환
   public MemberDto getMember(String num)
   {
      MemberDto dto=new MemberDto();
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from member where num=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, num);
         rs=pstmt.executeQuery();
         
         if(rs.next())
         {
            dto.setNum(rs.getString("num"));
            dto.setName(rs.getString("name"));
            dto.setId(rs.getString("id"));
            dto.setHp(rs.getString("hp"));
            dto.setAddr(rs.getString("addr"));
            dto.setEmail(rs.getString("email"));
            dto.setGaipday(rs.getTimestamp("gaipday"));
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      
      return dto;
   }
   
   //수정 ->이름,비번,핸드폰,주소,이메일
   public void updateMember(MemberDto dto)
   {
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      
      String sql="update member set name=?,pass=?,hp=?,addr=?,email=? where num=?";
      
      try {
         
         
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, dto.getName());
         pstmt.setString(2, dto.getPass());
         pstmt.setString(3, dto.getHp());
         pstmt.setString(4, dto.getAddr());
         pstmt.setString(5, dto.getEmail());
         pstmt.setString(6, dto.getNum());
         
         pstmt.execute();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(pstmt, conn);
      }
   }
   
   //로그인시 아이디,비밀번호 체크
   public boolean isIdPass(String id,String pass)
   {
      boolean b=false;
      
      Connection conn=db.getConnection();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      
      String sql="select * from member where id=? and pass=?";
      
      try {
         pstmt=conn.prepareStatement(sql);
         
         pstmt.setString(1, id);
         pstmt.setString(2, pass);
         
         rs=pstmt.executeQuery();
         
         if(rs.next())
            b=true;
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }finally {
         db.dbClose(rs, pstmt, conn);
      }
      
      return b;
   }
}