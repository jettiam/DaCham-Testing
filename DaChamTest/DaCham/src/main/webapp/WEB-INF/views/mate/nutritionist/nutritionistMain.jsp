<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/favicon/N.ico">
<%@include file="nutritionistNavi.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		orderList();
		thisMonth();
		function orderList(){
			$(".orderResult").remove();
			$.getJSON("nutriAjax/orderList",function(data){
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'orderResult'><td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.orderDate+"</td>"+"<td>"+this.price+"</td>"+"</tr>"
				});
				$(".orderTable").append(str);          
			});             
		}
		function thisMonth(){
			$(".monthResult").remove();
			$.getJSON("nutriAjax/thisMonth",function(data){
				var str = "";
				$(data).each(function(){
					str += "<ul class = 'monthResult'>"+"<li>"+"<img src = 'displayFile?fileName="+this.dietImg+"' style = 'width: 75px; height: 25px;'>"+"</li>"+"</ul>";
				});
				$(".thisMonth").append(str);
			});
		}
	});
</script>

<title>영양사</title>
<style>
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:10px;}  
</style>
</head>
<body>
   <div class = "box1">
      <div>
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
               <td>영양사장</td>
               <td>2017.05.05</td>
               <td>0</td>
            </tr>
         </table>
         <button id = "noticeList">목록</button>
      </div>
   </div>
   <div class = "box2">
      <table class = "orderTable">
         <tr>
            <th>번호&nbsp;&nbsp;&nbsp;</th>
            <th>고객id&nbsp;&nbsp;&nbsp;</th>
            <th>식단명&nbsp;&nbsp;&nbsp;</th>
            <th>주문접수일&nbsp;&nbsp;&nbsp;</th>
            <th>금액&nbsp;&nbsp;&nbsp;</th>
         </tr>
         <tr class = "orderResult">
            
         </tr>
      </table>
   </div>
   <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
   <br><br><br><br><br><br>
   <div class = "thisMonth">
      <h1> 월의 판매 식단</h1>
      <hr align = "left" width = "20%">
     <ul class = "monthResult">
     	<li></li>
     </ul>
   </div>
</body>
</html>