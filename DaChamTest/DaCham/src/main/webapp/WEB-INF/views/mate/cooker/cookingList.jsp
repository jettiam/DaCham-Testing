<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#cookList").addClass("w3-light-gray");
		$("#button").on("click",function(){
			window.location.href = "cookScreen";
		});
		orderList1(1);  
		orderList2(1);
		$("#startCookBtn").on("click", function(){
			window.open("cookScreen", "", "height=1024, width=1366, fullscreen=yes");
		});
		
		$(".turbo1").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			orderList1(replyPage);
		});
		$(".turbo2").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			orderList2(replyPage);
		});
		
		function orderList1(page){
			$(".sourceResult").remove();
			$.getJSON("cookAjax/anotherSelectCookingItem3/"+page,function(data){
				var str = "";
				$(data.list).each(function(){
					str += "<tr class = 'sourceResult'><td>"+this.orderCode+"</td><td>"+this.sideDCode+"</td><td>"+"<img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width:50px; height : 50px;'>"+"</td><td>"+this.sideDName+"</td><td>"+this.orderItemName+"</td><td>"+this.cookingAmount+"</td></tr>"
				});
				$(".sourceTable").append(str);
				printPaging(data.criteria);
			});             
		}
		function orderList2(page){
			$(".codeResult").remove();
			$.getJSON("cookAjax/anotherSelectCookingItem5/"+page,function(data){
				var str = "";
				$(data.list).each(function(){
					str += "<tr class = 'codeResult'><td>"+this.orderCode+"</td><td>"+this.sideDCode+"</td><td>"+"<img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width:50px; height : 50px;'>"+"</td><td>"+this.sideDName+"</td><td>"+this.orderItemName+"</td><td>"+this.cookingAmount+"</td></tr>"
				});
				$(".codeTable").append(str);
				printPaging2(data.criteria);
			});             
		}
		function printPaging(criteria){
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
			$(".turbo1").html(str);
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
			$(".turbo2").html(str);
		}
	});
</script>
</head>
<body>
	<%@include file = "cookerNavi.jsp" %>
	<div class = container>
	<h1>조리 대기</h1>
		<button id = "startCookBtn" class = "btn btn-primary btn-lg">조리시작</button>
		
		<input type = "hidden" name = "page" value = "${criteria.page }">
   		<input type = "hidden" name = "recordsPerPage" value = "${criteria.recordsPerPage }">
		<table class ="sourceTable table table-hover">
			<tr>
				<th>주문번호</th>
				<th>반찬번호</th>
				<th>반찬이미지</th>
				<th>반찬이름</th>
				<th>주문안의 반찬진행상태</th>
				<th>조리량</th>
			</tr>
			<tr class = "sourceResult">
			</tr>		
		</table>
		
		<div class="container">
         <ul class="turbo1 pagination">
            <c:if test="${criteria.prev}">
               <li><a href="${criteria.startPage-1 }">&laquo;</a></li>
            </c:if>
            <c:forEach begin="${criteria.startPage}" end="${criteria.endPage}"
               var="idx">
               
               <li <c:out value="${idx==criteria.page?'class=active':''}"/>> <!-- <li class="active"> -->
                  <a href="${idx}">${idx}</a>
               </li>
            </c:forEach>
            <c:if test="${criteria.next}">
               <li><a href="${criteria.endPage+1}">&raquo;</a></li>
            </c:if>
         </ul>
      </div>
	<h1>조리 완료</h1>
		
		<input type = "hidden" name = "page" value = "${criteria2.page }">
   		<input type = "hidden" name = "recordsPerPage" value = "${criteria2.recordsPerPage }">
		<table class = "codeTable table table-hover">
			<tr>
				<th>주문번호</th>
				<th>반찬번호</th>
				<th>반찬이미지</th>
				<th>반찬이름</th>
				
				<th>주문안의 반찬진행상태</th>
				<th>조리량</th>
			</tr>
			
			<tr class = "codeResult">
				
			</tr>
			
		</table>
	
		<div class="container">
         <ul class="turbo2 pagination">
            <c:if test="${criteria2.prev}">
               <li><a href="${criteria2.startPage-1 }">&laquo;</a></li>
            </c:if>
            <c:forEach begin="${criteria2.startPage}" end="${criteria2.endPage}"
               var="idx">
               
               <li <c:out value="${idx==criteria2.page?'class=active':''}"/>> <!-- <li class="active"> -->
                  <a href="${idx}">${idx}</a>
               </li>
            </c:forEach>
            <c:if test="${criteria2.next}">
               <li><a href="${criteria2.endPage+1}">&raquo;</a></li>
            </c:if>
         </ul>
      </div>	
	</div>
</body>
</html>
