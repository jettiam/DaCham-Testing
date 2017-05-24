<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file = "counselorNavi.jsp" %>
<title>Insert title here</title>
<style>
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:20px;}  
</style>
</head>
<body>
   <div class = "box1">
      <div>
         <span>고객id</span>
         <input type = "text" name = "keyword">
         <button id = "search"> 검색 </button>
      </div>
      <div>
        <span>연락처</span>
         <input type = "text" name = "keyword">
         <button id = "search"> 검색 </button>
      </div>
      <div>
      <table border ="1">
         <tr>
            <th>아이디</th>
            <td>아이디 디비값</td>  
         </tr>
         <tr>
            <th>이름</th>
            <td>이름디비값</td>  
         </tr>
         <tr>
            <th>생년월일</th>
            <td>생년월일 디비</td>  
         </tr>
         <tr>
            <th>핸드폰</th>
            <td>핸드폰 디비</td>  
         </tr>
         <tr>
            <th>자택번호</th>
            <td>자택번호디비</td>  
         </tr>
          <tr>
            <th>E-mail</th>
            <td>이멜 디비</td>  
         </tr>
         <tr>
            <th>주소</th>
            <td>주소 디비</td>  
         </tr>  
         </tr>
      </table>
      
       <select>
	            <option>등록자</option>
	            <option>제목</option>
	            <option>내용</option>
	      </select>
	         <input type = "text" name = "keyword">
	         <button id = "search"> 검색 </button>
      </div>
      
      <div>
	     
         <table>
            <tr>
               <th>번호</th>
               <th>제목</th>
               <th>등록자</th>
               <th>등록일</th>
               <th>조회수</th>
            </tr>
            <tr>
               <td>1</td>
               <td>영양관리주간목록</td>
               <td>배송팀장</td>
               <td>2017.05.05</td>
               <td>0</td>
            </tr>
         </table>
      </div>
   </div>
   <div class = "box2">
      
   </div>
   <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
   <br><br><br><br><br><br>
  
</body>
</html>