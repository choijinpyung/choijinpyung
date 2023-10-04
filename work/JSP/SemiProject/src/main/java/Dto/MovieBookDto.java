package Dto;

import java.sql.Timestamp;

public class MovieBookDto {

	private String bo_no;
	private String bo_seat;
	private String mv_poster;
	private String mv_title;
	private String mv_city;
	private String mv_date;
	private String mv_time;
	private int bo_adultCnt;
	private int bo_teenCnt;
	private int bo_childCnt;
	private int bo_price;
	private Timestamp bo_regdate;
	public String getBo_no() {
		return bo_no;
	}
	public void setBo_no(String bo_no) {
		this.bo_no = bo_no;
	}
	public String getBo_seat() {
		return bo_seat;
	}
	public void setBo_seat(String bo_seat) {
		this.bo_seat = bo_seat;
	}
	public String getMv_title() {
		return mv_title;
	}
	public String getMv_poster() {
		return mv_poster;
	}
	public void setMv_poster(String mv_poster) {
		this.mv_poster = mv_poster;
	}
	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}
	public String getMv_city() {
		return mv_city;
	}
	public void setMv_city(String mv_city) {
		this.mv_city = mv_city;
	}
	public String getMv_date() {
		return mv_date;
	}
	public void setMv_date(String mv_date) {
		this.mv_date = mv_date;
	}
	public String getMv_time() {
		return mv_time;
	}
	public void setMv_time(String mv_time) {
		this.mv_time = mv_time;
	}
	public int getBo_adultCnt() {
		return bo_adultCnt;
	}
	public void setBo_adultCnt(int bo_adultCnt) {
		this.bo_adultCnt = bo_adultCnt;
	}
	public int getBo_teenCnt() {
		return bo_teenCnt;
	}
	public void setBo_teenCnt(int bo_teenCnt) {
		this.bo_teenCnt = bo_teenCnt;
	}
	public int getBo_childCnt() {
		return bo_childCnt;
	}
	public void setBo_childCnt(int bo_childCnt) {
		this.bo_childCnt = bo_childCnt;
	}
	public int getBo_price() {
		return bo_price;
	}
	public void setBo_price(int bo_price) {
		this.bo_price = bo_price;
	}
	public Timestamp getBo_regdate() {
		return bo_regdate;
	}
	public void setBo_regdate(Timestamp bo_regdate) {
		this.bo_regdate = bo_regdate;
	}
	
}
