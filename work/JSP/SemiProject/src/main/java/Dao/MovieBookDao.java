package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Dto.MovieBookDto;
import mysql.db.DBConnect;

public class MovieBookDao {
	DBConnect db = new DBConnect();
	
	//insert
	
	public void insertMovieBook(MovieBookDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into movie_book(bo_no,bo_seat,mv_poster,mv_city,mv_date,";
		
	}
}
