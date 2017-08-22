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
 
</style>
<script>
	$(document).ready(function(){
		readyCook1(1);
		foodStockAll(1);
		$(".turbo2").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			
			foodStockAll(replyPage);
		});         
		$(".turbo1").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			readyCook1(replyPage);
		});
		
		function readyCook1(page){
			$.getJSON("cookAjax/anotherSelectCookingItem3/"+page,function(data){
				$(".tableResult").remove();
				var str = "";
				$(data.list).each(function(){
					str += "<tr class = 'tableResult'><td>"+this.orderCode+"</td><td>"+this.sideDCode+"</td><td>"+"<img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width:50px; height : 50px;'>"+"</td><td>"+this.sideDName+"</td><td>"+this.orderItemName+"</td><td>"+this.cookingAmount+"</td></tr>"
				});
				$(".overTable").append(str);
				printPaging0(data.criteria);
			});
		}
		function foodStockAll(page){
			$.getJSON("cookAjax/foodStockAll/"+page,function(data){
				$(".dualResult").remove();
				var str = "";
				$(data.list).each(function(){
					str += "<tr class = 'dualResult'><td>"+this.foodMName+"</td><td>"+this.foodMAmount+"</td><td>"+this.unit+"</td></tr>";
				});
				$(".dualTable").append(str);
				printPaging(data.criteria);
			});
		}
		function printPaging0(criteria){
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
			$(".turbo1").html(str);
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
			$(".turbo2").html(str);
		}
	});
</script>
</head>
<body>
<%@include file = "cookerNavi.jsp" %>
	<div class = "container">
<!-- 	   <div> -->
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
<!-- 	               <td>조리팀장</td> -->
<!-- 	               <td>2017.05.05</td> -->
<!-- 	               <td>0</td> -->
<!-- 	            </tr> -->
<!-- 	         </table> -->
<!-- 	         <button id = "noticeList" class = "btn btn-primary">목록</button> -->
<!-- 	      </div> -->
<!-- 	   </div> -->
	   
	   <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	   <br><br><br><br><br><br>
	   <div>
	      <h1>조리 대기</h1>
	      <div>
	         <table class = "overTable table table-hover">
	            <tr>
				<th>주문번호</th>
				<th>반찬번호</th>
				<th>반찬이름</th>
				<th>주문안의 반찬진행상태</th>
				<th>조리량</th>
				</tr>
	            <tr class = "tableResult">
	            </tr>
	         </table>
	         <ul class = "turbo1 pagination">
	   			</ul>
	      </div>
	   </div>
	   <div>
	   		<h2>식재료 재고</h2>
	   		<div>
	   			<table class = "dualTable table table-hover">              
	   				<tr>
	   					<th>식재료명</th>               
	   					<th>재고량</th>
	   					<th>단위</th>
	   				</tr>
	   				<tr class = "dualResult">
	   				</tr>
	   			</table>
	   			<ul class = "turbo2 pagination">
	   			</ul>
	   		</div>
	   </div>
	  </div>
</body>
</html>