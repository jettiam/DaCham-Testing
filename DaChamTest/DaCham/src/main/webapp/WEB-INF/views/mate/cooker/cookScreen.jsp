<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
   cookAll1();
   function cookAll1(){
      $.getJSON("cookAjax/readyScreen",function(data){
         $(".cookResult1").remove();
         var str = "";
      
         $(data).each(function(){
            
            str += "<tr id = 'cookResult1' data-code = '"+this.orderCode+"'>"+"<td>"+"<img src = 'displayCookFile?fileName='"+this.dietImg+"'>"+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.orderDate+"</td>"+"</tr>"
         });
         $(".cook1").append(str);
         
      });
   }
   cookAll2();   
   function cookAll2(){
      $.getJSON("cookAjax/cookScreen",function(data){
         $(".cookResult2").remove();
         var str = "";
         
         $(data).each(function(){
            str += "<tr id = 'cookResult2' data-code = '"+this.orderCode+"'>"+"<td>"+"<img src = 'displayCookFile?fileName='"+this.dietImg+"'>"+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.orderDate+"</td>"+"</tr>"
         });
         $(".cook2").append(str);
      });
   }
   cookAll3();
   function cookAll3(){
      $.getJSON("cookAjax/endScreen",function(data){
         $(".cookResult3").remove();
         var str = "";
         
         $(data).each(function(){
            str += "<tr id = 'cookResult3' data-code = '"+this.orderCode+"'>"+"<td>"+"<img src = 'displayCookFile?fileName='"+this.dietImg+"'>"+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.orderDate+"</td>"+"</tr>"
         });
         $(".cook3").append(str);   
      });   
   }
   $(document).ready(function(){
      $("#present").on("click",function(){
         window.location.href = "cook";
      });
      
      $("#list").on("click",function(){
         window.location.href = "cookList";
      });
   });
</script>
</head>
<%@include file = "cookerNavi.jsp" %>
<body>
	
   <div class = "container">
    <div>
         <button id = "present">현황</button>
         <button id = "list">조리목록</button>
    </div>
      <div>
         <h1>조리대기</h1>
         <table class = "cook1">
             <tr>            
                    <th>음식이미지&nbsp;&nbsp;&nbsp;</th>   
                    <th>식단이름&nbsp;&nbsp;&nbsp;</th>
                    <th>식단주문날짜&nbsp;&nbsp;&nbsp;</th>
                 </tr>
            <tr class = "cookResult1">     
            </tr>
         </table>
      </div>
      <div>
         <h1>조리중</h1>
         <table class = "cook2">
            <tr>
               <th>음식이미지&nbsp;&nbsp;&nbsp;</th>   
                  <th>식단이름&nbsp;&nbsp;&nbsp;</th>
                  <th>식단주문날짜&nbsp;&nbsp;&nbsp;</th>
            </tr>
            <tr class = "cookResult2">
               
            </tr>
         </table>
      </div>      
      <div>    
         <h1>조리완료</h1>
         <table class = "cook3">
            <tr>
               <th>음식이미지&nbsp;&nbsp;&nbsp;</th>   
                  <th>식단이름&nbsp;&nbsp;&nbsp;</th>
                  <th>식단주문날짜&nbsp;&nbsp;&nbsp;</th>
            </tr>
            <tr class = "cookResult3">
               
            </tr>
         </table>
      </div>
      
   </div>
</body>
</html>