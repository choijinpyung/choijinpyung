package db.ajaxboard;

import java.sql.Timestamp;

public class ajaxBoardDto {

   private String num;
   private String writer;
   private String subject;
   private String story;
   private String avata;
   private Timestamp writeday;
   public String getNum() {
      return num;
   }
   public void setNum(String num) {
      this.num = num;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public String getSubject() {
      return subject;
   }
   public void setSubject(String subject) {
      this.subject = subject;
   }
   public String getStory() {
      return story;
   }
   public void setStory(String story) {
      this.story = story;
   }
   public String getAvata() {
      return avata;
   }
   public void setAvata(String avata) {
      this.avata = avata;
   }
   public Timestamp getWriteday() {
      return writeday;
   }
   public void setWriteday(Timestamp writeday) {
      this.writeday = writeday;
   }
   
}