<%@page import="Dao.MovieDao"%>
<%@page import="Dto.MovieDto"%>
<%@page import="Dto.AnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="Dao.AnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
   MovieDto mdto=new MovieDto();
   AnswerDao adao=new AnswerDao();
   String num=request.getParameter("num");
   int currentPage = Integer.parseInt(request.getParameter("currentPage"));
   
   int totalCount=adao.getMvTotalCnt(num); //해당영화의 총댓글개수
   int totalPage; //총 페이지수
   int startPage; //각 블럭에서 보여질 시작페이지
   int endPage; //각 블럭에서 보여질 끝페이지
   int start; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
   int perPage=4; //한 페이지당 보여질 글의갯수
   int perBlock=5; //한 페이지당 보여질 페이지 갯수
   /* int currentPage; //현재 페이지 */
   int no; //각페이지당 출력할 시작번호
   int startNum; //각페이지에서 보여질 시작번호

   
   //현재페이지 읽기(단 null일경우는 1페이지로 준다)계산을 해야하므로 int로 형변환해줌
   if(request.getParameter("currentPage")==null)
      currentPage=1;

   else
         currentPage=Integer.parseInt(request.getParameter("currentPage"));

      //총 페이지수 구하기
      //총 글의갯수/한페이지당 보여질 개수로 나눔(7/5=1)
      //나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지)
   totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
      
      
      //각 블럭당 보여야할 시작페이지
      //perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
      //현재페이지 13 시작:11 끝:15
   startPage=(currentPage-1)/perBlock*perBlock+1; // (12/5)*5 +1=11

   endPage=startPage+perBlock-1;

      //총페이지가 23일경우 마지막블럭은 25가아니라 23이다
      if(endPage>totalPage)
      endPage=totalPage;

   //각페이지에서 보여질 시작번호
   //1페이지: 0, 2페이지 :5, 3페이지 :10...
   startNum=(currentPage-1)*perPage;

   //각페이지당 출력할 시작번호 구하기
   //총글개수가 23이면 1페이지 23, 2 페이지 18, 3페이지 13......
   //no=totalCount-(currentPage-1)*perPage;
   no=totalCount-startNum;
   
   List<AnswerDto> list=adao.getList(num, startNum, perPage);
   
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
   JSONArray arr=new JSONArray();
   for(AnswerDto dto:list)
   {
	  //System.out.println("리스트 보드에서 "+dto.getIdx());
      JSONObject ob=new JSONObject();
      ob.put("idx", dto.getIdx());
      ob.put("num", dto.getNum());
      ob.put("myid", dto.getMyid());
      ob.put("content", dto.getContent());
      ob.put("star", dto.getStar());
      ob.put("writeday", sdf.format(dto.getWriteday()));
      ob.put("currentPage",currentPage);
      ob.put("startPage",startPage);
      ob.put("endPage",endPage);
      ob.put("totalPage",totalPage);
      ob.put("perPage",perPage);
      ob.put("chu",dto.getChu());
      ob.put("bchu",dto.getBchu());
      ob.put("no",no);
      
      arr.add(ob);
   }
%>
<%=arr.toString()%> 