<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.wdb3a.dacham.bean.OrderList"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Bootstrap core CSS     -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />

<!--  Material Dashboard CSS    -->
<link href="resources/assets/css/material-dashboard.css"
	rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="resources/assets/css/demo.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Jeju Gothic',"Nanum Gothic", sans-serif !important;
} 
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
	   <br>
	   	<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="card">
			<div class="card-header" data-background-color="orange">
				<h3 class="title text-center" >조리대기</h3>
				</div>
	      <div class="card-content table-responsive">
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
	   </div>
	   </div>
	   	<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="card">
			<div class="card-header" data-background-color="orange">
				<h3 class="title text-center" >식재료 재고</h3>
				</div>
	   		  <div class="card-content table-responsive">
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
	  </div>
</body>
</html>