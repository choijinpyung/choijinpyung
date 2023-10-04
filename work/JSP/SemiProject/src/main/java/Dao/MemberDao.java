package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dto.MemberDto;
import mysql.db.DBConnect;

public class MemberDao {

	DBConnect db=new DBConnect();
	
	//아이디존재하면 true
	
	public boolean isIdCheck(String id)
	{
		boolean flag=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member_table where Mem_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return flag;
	}
	
		//마이페이지에서 본인 정보만 확인가능하기위함
		public String getNum(String id)
		{
			String num="";
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from member_table where mem_id=?";
			
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
	
	//insert
	public void insertMember(MemberDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into member_table(Mem_id,Mem_pass,Mem_name,Mem_gender,Mem_birth,Mem_ph,Mem_email,Mem_regdate,Mem_addr)"
				+ "values(?,?,?,?,?,?,?,now(),?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMem_id());
			pstmt.setString(2, dto.getMem_pass());
			pstmt.setString(3, dto.getMem_name());
			pstmt.setString(4, dto.getMem_gender());
			pstmt.setString(5, dto.getMem_birth());
			pstmt.setString(6, dto.getMem_ph());
			pstmt.setString(7, dto.getMem_email());
			pstmt.setString(8, dto.getMem_addr());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	
	}
	
	//select(list)
	public List<MemberDto> getAllMembers()
	{
		List<MemberDto> list=new ArrayList<MemberDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member_table order by mem_no";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				MemberDto dto=new MemberDto();
				
				dto.setMem_no(rs.getString("mem_no"));
				dto.setMem_id(rs.getString("mem_id"));
				dto.setMem_pass(rs.getString("mem_pass"));
				dto.setMem_name(rs.getString("mem_name"));
				dto.setMem_gender(rs.getString("mem_gender"));
				dto.setMem_birth(rs.getString("mem_birth"));
				dto.setMem_ph(rs.getString("mem_ph"));
				dto.setMem_email(rs.getString("mem_email"));
				dto.setMem_regdate(rs.getTimestamp("mem_regdate"));
				dto.setMem_addr(rs.getString("mem_addr"));
				
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
	
	
	//아이디,비밀번호 비교	
	public boolean isEqualPass(String id,String pass)
	{
		boolean flag=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member_table where mem_id=? and mem_pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				flag=true;
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return flag;
		
	}
	
		//id로 이름값 얻어오기
		public String getName(String id)
		{
			String name="";
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from member_table where mem_id=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{					
					name=rs.getString("mem_name");	
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			return name;	
		}
		
		//num의 dto
		public MemberDto getData(String num)
		{
			MemberDto dto=new MemberDto();
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select * from member_table where mem_no=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, num);
				rs=pstmt.executeQuery();
								
				if(rs.next())
				{
					dto.setMem_no(rs.getString("mem_no"));
					dto.setMem_id(rs.getString("mem_id"));
					dto.setMem_pass(rs.getString("mem_pass"));
					dto.setMem_name(rs.getString("mem_name"));
					dto.setMem_gender(rs.getString("mem_gender"));
					dto.setMem_birth(rs.getString("mem_birth"));
					dto.setMem_ph(rs.getString("mem_ph"));
					dto.setMem_email(rs.getString("mem_email"));
					dto.setMem_regdate(rs.getTimestamp("mem_regdate"));
					dto.setMem_addr(rs.getString("mem_addr"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return dto;
		
		}
		
		public MemberDto getDataId(String id)
        {
           MemberDto dto=new MemberDto();
           
           Connection conn=db.getConnection();
           PreparedStatement pstmt=null;
           ResultSet rs=null;
           
           String sql="select * from member_table where mem_id=?";
           
           try {
              pstmt=conn.prepareStatement(sql);
              
              pstmt.setString(1, id);
              rs=pstmt.executeQuery();
                          
              if(rs.next())
              {
                 dto.setMem_no(rs.getString("mem_no"));
                 dto.setMem_id(rs.getString("mem_id"));
                 dto.setMem_pass(rs.getString("mem_pass"));
                 dto.setMem_name(rs.getString("mem_name"));
                 dto.setMem_gender(rs.getString("mem_gender"));
                 dto.setMem_birth(rs.getString("mem_birth"));
                 dto.setMem_ph(rs.getString("mem_ph"));
                 dto.setMem_email(rs.getString("mem_email"));
                 dto.setMem_regdate(rs.getTimestamp("mem_regdate"));
                 dto.setMem_addr(rs.getString("mem_addr"));
              }
           } catch (SQLException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
           } finally {
              db.dbClose(rs, pstmt, conn);
           }
           
           return dto;
        
        }
		
		//update		
		public void updateMember(MemberDto dto)
		{
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			
			String sql="update member_table set mem_pass=?,mem_name=?,mem_gender=?,mem_birth=?,mem_ph=?,mem_email=?,mem_addr=? where mem_no=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getMem_pass());
				pstmt.setString(2, dto.getMem_name());
				pstmt.setString(3, dto.getMem_gender());
				pstmt.setString(4, dto.getMem_birth());
				pstmt.setString(5, dto.getMem_ph());
				pstmt.setString(6, dto.getMem_email());
				pstmt.setString(7, dto.getMem_addr());
				pstmt.setString(8, dto.getMem_no());
				
				pstmt.execute();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(pstmt, conn);
			}
		}
		
	//delete
	public void deleteMember(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from member_table where mem_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.execute();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
}