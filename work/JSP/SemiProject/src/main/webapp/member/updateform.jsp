<%@page import="Dto.MemberDto"%>
<%@page import="Dao.MemberDao"%>
<%@page import="java.util.StringTokenizer"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Cute+Font&family=Diphylleia&family=Dongle:wght@300&family=Hi+Melody&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%
  String num=request.getParameter("num");
/*   String addr1=request.getParameter("addr1");
  String addr2=request.getParameter("addr2");
  String addr3=request.getParameter("addr3"); */

  MemberDao dao=new MemberDao();
  MemberDto dto=new MemberDto();
  
  dto=dao.getData(num);
  
  StringTokenizer st=new StringTokenizer(dto.getMem_email(),"@");
  String email1=st.nextToken();
  String email2=st.nextToken();
  
  StringTokenizer st2=new StringTokenizer(dto.getMem_ph(),"-");
  String phone1=st2.nextToken();
  String phone2=st2.nextToken();
  String phone3=st2.nextToken();
  
  StringTokenizer st3=new StringTokenizer(dto.getMem_addr(),"\t");
  String postnum=st3.nextToken();
  String addr1=st3.nextToken();
  String addr2=st3.nextToken();
  String addr3=st3.nextToken();
  
%>
<body>
<div style="margin: 80px 444px;  height:600px;">
      <form action="updateproc.jsp" method="post" class="form-inline" id="mfrm">
         <input type="hidden" name="num" value="<%=num%>">
         <table class="table table-bordered" style="width: 500px; position: absolute;">
            <caption align="top" style="color: silver; font-weight: bold;">회원정보수정</caption>
            <tr>
               <td style="width: 100px;" valign="middle" align="center">아이디</td>
               <td>
                  <%=dto.getMem_id() %>
               </td>
            </tr>
            
            <tr>
                 <td style="width: 100px;" valign="middle" align="center">비밀번호</td>
                 <td>
                 <input type="password" name="pass" placeholder="비밀번호"
                 required="required" style="width: 120px;" class="form-group">
                 <input type="password" name="pass2" placeholder="비밀번호확인"
                 required="required" style="width: 120px;" class="form-group">         
                 </td>
              </tr>
            
            <tr>
               <td style="width: 100px;" valign="middle" align="center">이름</td>
               <td>
                  <input type="text" class="form-control" style="width: 200px;"
                  name="name" required="required" value="<%=dto.getMem_name()%>">
               </td>
            </tr>
            <tr>
               <td style="width: 100px;" valign="middle" align="center">성별</td>
               <td>
                  <input type="radio"  name="gender" value="남자" <%=dto.getMem_gender().equals("남자")?"checked":"" %> required="required" >남자
                  <input type="radio"  name="gender" value="여자" <%=dto.getMem_gender().equals("여자")?"checked":"" %> required="required">여자
               </td>
            </tr>
            <tr>
               <td style="width: 100px;" valign="middle" align="center">생년월일</td>
               <td>
               <input type="date" name="birth" class="form-control" style="width: 200px" value="<%=dto.getMem_birth()%>">
               </td>
            </tr>
            <tr>
               <td style="width: 100px;" valign="middle" align="center">전화번호</td>
               <td>
               <select name="phone1" id="phone1">
                <option value="010" <%=phone1.equals("010")?"selected":"" %>>010</option>
                <option value="011" <%=phone1.equals("011")?"selected":"" %>>011</option>
                <option value="017" <%=phone1.equals("017")?"selected":"" %>>017</option>
                <option value="02" <%=phone1.equals("02")?"selected":"" %>>02</option>
               </select>
                <b>-</b>          
                  <input type="text" name="phone2" id="phone2" style="width:50px;" value="<%=phone2%>">
                <b>-</b>
               
                <script>
               $("#phone2").keyup(function(){
               
               if($(this).val().length==4)
               {
                  $("#phone3").focus();
               }
               })
               </script>
               
                  <input type="text" name="phone3" id="phone3" style="width:50px;" maxlength="4" value="<%=phone3%>">
               </td>
            </tr>
            <tr>
               <td style="width: 100px;" valign="middle" align="center">이메일</td>
               <td>
                  <input type="text" name="email1" class="form-group"
                    required="required" style="width: 120px;" value="<%=email1%>">
                    <b>@</b>
                    <input type="text" name="email2"  id="email2" class="form-group"
                    required="required" style="width: 120px;" value="<%=email2%>">
                    <select id="selemail" class="form-group">
                       <option value="-">직접입력</option>
                       <option value="naver.com" <%=email2.equals("naver.com")?"selected":"" %>>네이버</option>
                       <option value="daum.net" <%=email2.equals("daum.net")?"selected":"" %>>다음</option>
                       <option value="gmail.com" <%=email2.equals("gmail.com")?"selected":"" %>>구글</option>
                       <option value="nate.com" <%=email2.equals("nate.com")?"selected":"" %>>네이트</option>
                    </select>
               </td>
            </tr>
            <tr>
               <td style="width: 100px;" valign="middle" align="center">주소</td>
               <td>					
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="postnum" value="<%=postnum%>">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소" name="addr1" value="<%=addr1%>"><br>
					<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="addr2" value="<%=addr2%>">
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="addr3" value="<%=addr3%>">
					</td>
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <button type="submit" class="btn btn-outline-success" 
                  style="width: 100px;">수정</button>
                  <button type="reset" class="btn btn-outline-danger" 
                  style="width: 100px;">초기화</button>
               </td>
            </tr>
         </table>
      </form>
   </div>
   <script type="text/javascript">
		function openId() {
			
			window.open("idcheck.jsp","e","left=400px; top=100px,width=260px,height=185px");
		}	
	</script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
   <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>