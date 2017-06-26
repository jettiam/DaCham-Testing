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
  display:inline-block;  margin-left:10px;}  
</style>
</head>
<body>
<%@include file = "deliverNavi.jsp" %>
	<div class = "container">
	   <div class = "box1">
	      <div>
	         <select>
	            <option>등록자</option>
	            <option>제목</option>
	            <option>내용</option>
	         </select>
	         <input type = "text" name = "keyword">
	         <button id = "search" class = "btn btn-warning"> 검색 </button>
	      </div>
	      <div>
	         <table class = "table table-hover">
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
	         <button id = "noticeList" class = "btn btn-primary">목록</button>
	      </div>
	   </div>
	   <div class = "box2">
	      <table class = "table table-hover">
	         <tr>
	            <th>주차 입고목록</th>
	            
	         </tr>
	         <tr>
	            <td> </td>
	            <td> </td>
	            <td> </td>
	            
	         </tr>
	      </table>
	   </div>
	   <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	   <br><br><br><br><br><br>
	   <div>
	      <div>
	         <select>
	            <option>분류</option>
	            <option>번호</option>
	            <option>고객id</option>
	            <option>식단명</option>
	         </select>
	         <input type = "text" name = "keyword">
	         <button id = "search" class = "btn btn-warning"> 검색 </button>
	      </div>
	      <div>
	         <table class = "table table-hover">
	            <tr>
	               <th>번호</th>
	               <th>고객id</th>
	               <th>식단명</th>
	               <th>주문접수일</th>
	               <th>주소</th>
	               <th>배송진행상태</th>
	            </tr>
	            
	         </table>
	         <button id = "deliverList" class = "btn btn-primary">목록</button>  
	      </div>
	   </div>
	  </div>
</body>
</html>