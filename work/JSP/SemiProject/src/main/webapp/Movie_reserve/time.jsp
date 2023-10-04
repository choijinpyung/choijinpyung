<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String [] time={"07:00","10:30","12:40","14:00","14:40","15:20","16:00","17:10","18:20","19:00","19:50","21:00","22:10","23:40"}; //랜덤으로 돌려서 sort

// 랜덤한 값 선택을 위한 Random 객체 생성
Random random = new Random();

//선택한 랜덤 값들을 저장할 리스트 생성
List<String> timelist=new ArrayList<String>();

for(String t:time){
timelist.add(t);
}

int num = random.nextInt(timelist.size()+1);

int idx;

TreeSet<String> treeSet = new TreeSet<>();
for(int i=0; i<num; i++){
idx=random.nextInt(timelist.size());
treeSet.add(timelist.get(idx));
}

Iterator iter = treeSet.iterator();//iterator-> 오름차순 treeset메서드

JSONArray arr = new JSONArray();

//ob.put(iter.next());
while(iter.hasNext()){
   JSONObject ob = new JSONObject();
   ob.put("time", iter.next());
   arr.add(ob);
}
%>
<%=arr.toString() %>