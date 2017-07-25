<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:20px;}  
</style>
<script>
$(function(){
   $("#detail").addClass("w3-light-gray");
});
</script>
</head>
<body>
<%@include file = "counselorNavi.jsp" %>
   <div class = "container">
      <div class = "box1">
         <div style = "border:1px solid gold;">
            <input type = "text" name = "category" value = "배송문의">
            <input type = "text" name = "title" value = "특별식을 주문했는데"><br>
            <textarea style = "width:400px;">  
               제가 5월 18일에 사정이 생겨서 받지 못하는데..
            </textarea>
         </div>
         <br><br>
         <div style = "border:1px solid gold;">
            <textarea placeholder = "답변내용 입력"></textarea>
            <button id = "answer">답변</button>
         </div>
         <br><br>
         <div style = "border:1px solid gold;">   
            <h4>강백호 님의 상담입력</h4><br>   
            <select>
               <option>제목</option>
               <option>내용</option>
            </select>
            <input type = "text" name = "keyword">
            <button id = "search">검색</button>
            <table class = "table table-hover">
               <tr>   
                  <th>번호</th>
                  <th>분류</th>
                  <th>제목</th>
                  <th>등록일</th>
                  <th>답변여부</th>
               </tr>
               <tr class = "answerResult">
                  <td>1</td>
                  <td>배송문의</td>
                  <td>적게 주문했는데요</td>
                  <td>2017.05.10</td>
                  <td>완료</td>
               </tr>
            </table>
         </div>
      </div>
      <div class = "box2">
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
         <div style = "border:1px solid gold;">
               <h4>강백호 님의 주문목록</h4><br>   
            <select>
               <option>제목</option>
               <option>내용</option>
            </select>   
            <input type = "text" name = "keyword">
            <button id = "search">검색</button>
            <table class = "table table-hover">
               <tr>   
                  <th>번호</th>
                  <th>식단명</th>
                  <th>주문일</th>
                  <th>질명</th>
                  <th>주문현황</th>
               </tr>
               <tr class = "answerResult">
                  <td>1</td>
                  <td>영양가득 당뇨식</td>
                  <td>2017.05.10</td>
                  <td>당뇨 주의</td>
                  <td>배송완료</td>
               </tr>
            </table>
         </div>
      </div>
      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <br><br><br><br><br><br>
   </div>  
</body>
</html>