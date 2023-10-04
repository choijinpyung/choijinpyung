package Dto;

import java.sql.Timestamp;

public class ShopDto {
	private String shop_num;
	private String shop_category;
	private String shop_sangpum;
	private String shop_detail;
	private String shop_photo;
	private int shop_price;
	private Timestamp shop_ipgoday;
	
	public String getShop_num() {
		return shop_num;
	}
	public void setShop_num(String shop_num) {
		this.shop_num = shop_num;
	}
	public String getShop_category() {
		return shop_category;
	}
	public void setShop_category(String shop_category) {
		this.shop_category = shop_category;
	}
	public String getShop_sangpum() {
		return shop_sangpum;
	}
	public void setShop_sangpum(String shop_sangpum) {
		this.shop_sangpum = shop_sangpum;
	}
	public String getShop_detail() {
		return shop_detail;
	}
	public void setShop_detail(String shop_detail) {
		this.shop_detail = shop_detail;
	}
	public String getShop_photo() {
		return shop_photo;
	}
	public void setShop_photo(String shop_photo) {
		this.shop_photo = shop_photo;
	}

	public Timestamp getShop_ipgoday() {
		return shop_ipgoday;
	}
	public void setShop_ipgoday(Timestamp shop_ipgoday) {
		this.shop_ipgoday = shop_ipgoday;
	}
	public int getShop_price() {
		return shop_price;
	}
	public void setShop_price(int shop_price) {
		this.shop_price = shop_price;
	}
}
