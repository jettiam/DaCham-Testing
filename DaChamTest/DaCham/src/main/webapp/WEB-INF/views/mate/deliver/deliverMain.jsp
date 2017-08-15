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
<script>
	$(document).ready(function(){
		showDeliverAll(1);      
		all(1,5);
		$(".pagination1").on("click","li a",function(){
	         event.preventDefault();
	         var replyPage = $(this).attr("href");
	         showDeliverAll(replyPage);
	      });
		$(".pagination2").on("click","li a",function(){
	         event.preventDefault();
	         var replyPage = $(this).attr("href");
	         all(replyPage,5);
	      });
		$("#deliverList").on("click",function(){
			window.location.href = "deliverFood";          
		}); 
		function showDeliverAll(page){
			$(".darkResult").remove();
			$.getJSON("deliverAjax/showDeliverAll/"+page,function(data){
				var str = "";
				
				$(data.list).each(function(){
					
						str += "<tr class = 'darkResult'><td><input type = 'hidden' class = 'orderCode' name = 'orderCode' value = '"+this.orderCode+"'>"+"<input type = 'hidden' class = 'foodMICode' name = 'foodMICode' value = '"+this.foodMICode+"'>"+this.foodMICode+"</td><td>"+this.foodMName+"</td><td>"+this.inAmount+"</td><td>"+this.unit+"</td><td>"+this.orderCode+"</td></tr>";
				});
				$(".darkTable").append(str);       
				printPaging(data.criteria);
			});
		}
		function all(page,orderItemCode){
	         $.getJSON("deliverAjax/all/"+page+"/"+orderItemCode,function(data){
	                  
	            $(".shinResult").remove();
	            var str = "";
	            $(data.list).each(function(){
	               if(orderItemCode == 5){
	                  str += "<tr class = 'shinResult'><td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td><td>"+this.name+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.address+"</td></tr>";
	               }
	               else{
	                  str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'checkBox' name = 'chk' value = '"+this.orderCode+"' class = 'check'>"+"</td>"+"<td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.address+"</td>"+"<td>"+"<input type = 'text' class = 'transportNum"+this.orderCode+"' name = 'transportNum' value = '"+this.transportNum+"' readonly>"+"</td>"+"<td>"+this.orderItemName+"</td>"+"</tr>";
	               }
	            });
	            $(".shinTable").append(str);
	            printPaging(data.criteria);
	         });
	      }
		function printPaging(criteria){
			var str = "";
					
			if(criteria.prev){
				str += "<li><a href='"+(criteria.startPage-1)+"'>" + "<<"+"</a></li>";
			}
			for(var i = criteria.startPage; i<=criteria.endPage; i++){
				var strClass = criteria.page == i?"class = 'active'":"";
				str += "<li "+strClass+"><a href ='"+i+"'>"+i + "</a></li>";
			}
			if(criteria.next){
				str += "<li><a href='"+(criteria.endPage+1)+"'>" + ">>"+"</a></li>";   
			}
			$(".pagination1").html(str);
		}
		 function printPaging2(criteria){
	         var str = "";
	               
	         if(criteria.prev){
	            str += "<li><a href=''"+(criteria.startPage-1)+"'>'" + "<<"+"</a></li>";
	         }
	         for(var i = criteria.startPage; i<=criteria.endPage; i++){
	            var strClass = criteria.page == i?"class = 'active'":"";
	            str += "<li "+strClass+"><a href ='"+i+"'>"+i + "</a></li>";
	         }
	         if(criteria.next){
	            str += "<li><a href=''"+(criteria.endPage+1)+"'>'" + ">>"+"</a></li>";
	         }
	         $(".pagination2").html(str);
	      }
	});
</script>
</head>
<body>
<%@include file = "deliverNavi.jsp" %>
	<div class = "container">
<!-- 	   <div class = "box1"> -->
<!-- 	      <div> -->
<!-- 	         <select> -->
<!-- 	            <option>등록자</option> -->
<!-- 	            <option>제목</option> -->
<!-- 	            <option>내용</option> -->
<!-- 	         </select> -->
<!-- 	         <input type = "text" name = "keyword"> -->
<!-- 	         <button id = "search" class = "btn btn-warning"> 검색 </button> -->
<!-- 	      </div> -->
<!-- 	      <div> -->
<!-- 	         <table class = "table table-hover"> -->
<!-- 	            <tr> -->
<!-- 	               <th>번호</th> -->
<!-- 	               <th>제목</th> -->
<!-- 	               <th>등록자</th> -->
<!-- 	               <th>등록일</th> -->
<!-- 	               <th>조회수</th> -->
<!-- 	            </tr> -->
<!-- 	            <tr> -->
<!-- 	               <td>1</td> -->
<!-- 	               <td>영양관리주간목록</td> -->
<!-- 	               <td>배송팀장</td> -->
<!-- 	               <td>2017.05.05</td> -->
<!-- 	               <td>0</td> -->
<!-- 	            </tr> -->
<!-- 	         </table> -->
<!-- 	         <button id = "noticeList" class = "btn btn-primary">목록</button> -->
<!-- 	      </div> -->
<!-- 	   </div> -->    
<!-- 	   <div class = "box2"> -->
<!-- 	      <table class = "table table-hover"> -->
<!-- 	         <tr> -->
<!-- 	            <th>주차 입고목록</th> -->
	            
<!-- 	         </tr> -->
<!-- 	         <tr> -->
<!-- 	            <td> </td> -->
<!-- 	            <td> </td> -->
<!-- 	            <td> </td> -->            
	            
<!-- 	         </tr> -->
<!-- 	      </table> -->
<!-- 	   </div> -->
	   <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	   <br><br><br><br><br><br>
	   <div>
	      <h1>입고목록</h1>
	      <div>
	         <table class = "darkTable table table-hover">
	            <tr>
	               <th>코드번호&nbsp;</th>
							      
					<th>식재료명&nbsp;</th>
					
							
					<th>수량&nbsp;</th>
					<th>단위&nbsp;</th>
					<th>주문번호</th>
				       
	            </tr>
	            <tr class = "darkResult">
	            </tr>  
	         </table>
	         <ul class = "pagination1 pagination">
	         </ul>
	           
	      </div>
	      <div>
	      		<h1>배송 목록</h1>
	      		<table class = "shinTable table table-hover">
	      			<tr>
	      			<th>주문번호</th>
		               <th>고객 아이디</th>
		               <th>고객 이름</th>
		               <th>식단명</th>
		               <th>주소</th>
		              
		            </tr>
		            <tr class = "shinResult">
		            	
		            </tr>
	      		</table>
	      		<ul class = "pagination2 pagination">
	      		</ul>
	      </div>
	   </div>
	  </div>
</body>
</html>