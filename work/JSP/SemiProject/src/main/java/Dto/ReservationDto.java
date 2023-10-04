package Dto;

import java.sql.Timestamp;

public class ReservationDto {
   
   private String rev_no;
   private String mem_id;//member_table 외래키
   private String rev_title;
   private String rev_poster;
   private String rev_age;
   private String rev_name;//극장이름
   private String rev_date;//영화관람일
   private String rev_place;//상영관
   private Timestamp rev_regdate;//예매일
   public String getRev_no() {
      return rev_no;
   }
   public void setRev_no(String rev_no) {
      this.rev_no = rev_no;
   }
   public String getMem_id() {
      return mem_id;
   }
   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }
   public String getRev_title() {
      return rev_title;
   }
   public void setRev_title(String rev_title) {
      this.rev_title = rev_title;
   }
   public String getRev_poster() {
      return rev_poster;
   }
   public void setRev_poster(String rev_poster) {
      this.rev_poster = rev_poster;
   }
   public String getRev_age() {
      return rev_age;
   }
   public void setRev_age(String rev_age) {
      this.rev_age = rev_age;
   }
   public String getRev_name() {
      return rev_name;
   }
   public void setRev_name(String rev_name) {
      this.rev_name = rev_name;
   }
   public String getRev_date() {
      return rev_date;
   }
   public void setRev_date(String rev_date) {
      this.rev_date = rev_date;
   }
   public String getRev_place() {
      return rev_place;
   }
   public void setRev_place(String rev_place) {
      this.rev_place = rev_place;
   }
   public Timestamp getRev_regdate() {
      return rev_regdate;
   }
   public void setRev_regdate(Timestamp rev_regdate) {
      this.rev_regdate = rev_regdate;
   }
   
   
}