package Dto;

import java.sql.Timestamp;

public class AnswerDto {
   
   private String idx; //시퀀스 
   private String num; //특정영화별 댓글이랑 연결하려고 movie_table의 mv_no랑 연결함
   private String myid; //member_table의 myid랑 연결
   private String content; //댓글 내용
   private String star;  //1~5점까지의 별점
   private Timestamp writeday; //작성일
   private int chu;
   private int bchu;
   
   public String getIdx() {
      return idx;
   }
   public void setIdx(String idx) {
      this.idx = idx;
   }
   public String getNum() {
      return num;
   }
   public void setNum(String num) {
      this.num = num;
   }
   public String getMyid() {
      return myid;
   }
   public void setMyid(String myid) {
      this.myid = myid;
   }
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getStar() {
      return star;
   }
   public void setStar(String star) {
      this.star = star;
   }
   public Timestamp getWriteday() {
      return writeday;
   }
   public void setWriteday(Timestamp writeday) {
      this.writeday = writeday;
   }
   public int getChu() {
      return chu;
   }
   public void setChu(int chu) {
      this.chu = chu;
   }
   public int getBchu() {
      return bchu;
   }
   public void setBchu(int bchu) {
      this.bchu = bchu;
   }
   
   
}