<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

<style>
	#submit{
		position : relative;
		align : right;
	}
</style>
<script>
	$(document).ready(function(){
		var currentPage = 1;
		
		$(".action2").hide();
		
		showDeliverAll();
		
		showDeliver('t','감자');
		
		var searchType = $(".searchType").val();
		var keyword = $(".keyword").val();
		
		$("#deliverFood").addClass("w3-light-gray");
		$("#regist").on("click",function(){
			$("#foodStockForm").attr("method","post");
			$("#foodStockForm").attr("action","deliverRegist");
			$("#foodStockForm").submit();
			alert("등록완료");      
		});
		
		
		$("#changer").on("click",function(){
			var length = $(".action1 tbody .actionResult").length;             
			console.log("길이:"+length);   
			$("form").append("<input type = 'hidden' id = 'length' name = 'length' value = '"+length+"'>");
			
			var foodMStatus = $(".foodMStatus").attr('data-value');
			alert("상태:"+foodMStatus);
			if(foodMStatus == 0){
				alert("nope! This can't be activited!");
			}
			else if(length == 0){
				alert("식재료를 발주받으세요");
			}
			else{
				$("form").attr("action","changer");
				$("form").attr("method","post");
				$("form").submit();	
			}
			  
		});
		$(document.body).on("click",".statusButton",function(){
			var foodMICode = $(this).attr('data-vcode');
			$.ajax({
				type : "PUT",
				url : "deliverAjax/overButton/"+foodMICode,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				success : function(data){
					if(data == "SUCCESS"){
						alert("입고처리입니다.");
					}
				},
				error : function(){
					alert("오류 발생");
				}
			});
		});
		
		$("#search").on("click",function(){
			$(".actionResult").remove();
			searchType = $(".searchType").val();
			keyword = $(".keyword").val();
			/* alert("검색값:"+search); */
			showDeliver(searchType,keyword);
		});
		
		function showDeliverAll(){
			$(".actionResult").remove();
			$.getJSON("deliverAjax/showDeliverAll",function(data){
				var str = "";
				
				$(data).each(function(){
					
						str += "<tr class = 'actionResult'><td><input type = 'hidden' class = 'orderCode' name = 'orderCode' value = '"+this.orderCode+"'>"+"<input type = 'hidden' class = 'foodMICode' name = 'foodMICode' value = '"+this.foodMICode+"'>"+this.foodMICode+"</td><td>"+this.foodMName+"</td><td>"+this.orderDate+"</td><td>"+this.inAmount+"</td><td>"+this.unit+"</td><td>"+"<button class = 'statusButton' data-vcode = '"+this.foodMICode+"'>입고하기</button>"+"</td></tr>";
				});
				$(".action1").append(str);                 
			});
		}
		
		function showDeliver(searchType,keyword){
			
			$(".actionResult").remove();
			
			$.getJSON("deliverAjax/showDeliver/"+searchType+"/"+keyword,function(data){
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'actionResult'><td>"+this.foodMCode+"</td><td>"+this.foodMName+"</td><td>"+this.orderDate+"</td><td>"+this.inDate+"</td><td>"+this.unit+"</td><td>"+this.orderItemName+"</td></tr>";
				});
				$(".action1").append(str);
				
			});                                        
			
		}   
		$(".pagination").on("click","li a",function(){
	         event.preventDefault();
	         var replyPage = $(this).attr("href");
	         completeAll(replyPage);
	      });
		
		$("#completeAll").on("click",function(){
			$("#changer").hide();
			alert("입고 목록");
			completeAll(1);
		});
		function completeAll(page){
			$(".action1").hide();
			$(".actionResult2").remove();
			$(".action2").show();
			
			$.getJSON("deliverAjax/completeAll/"+page,function(data){
				var str = "";
				$(data.list).each(function(){
					str += "<tr class = 'actionResult2'><td><input type = 'hidden' class = 'orderCode' name = 'orderCode' value = '"+this.orderCode+"'>"+this.foodMCode+"</td><td>"+this.foodMName+"</td><td>"+this.inDate+"</td><td>"+this.inAmount+"</td><td>"+this.unit+"</td><td>"+this.orderItemName+"</td></tr>";   
				});
				$(".action2").append(str);
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
			$(".pagination").html(str);
		}
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<%
		long time = System.currentTimeMillis(); 
	
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
	
		String str = dayTime.format(new Date(time));
	%>
	<%@include file = "deliverNavi.jsp" %>
	<div class = "container">
<!-- 		<form id = "foodStockForm"> -->
			
<!-- 			<table class = "table table-hover"> -->
<!-- 				<tr> -->
<!-- 					<th>입고날짜</th> -->
<%-- 					<td> <input type="date" name="inDate" value = "<%=str%>"></td> --%>
<!-- 					<th>단가(원)</th>      -->
<!-- 					<td><input type = "text" name = "price"></td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>입고량</td> -->
<!-- 					<td><input type = "text" name = "inAmount"></td> -->
<!-- 					<td>식재료이름</td> -->
<!-- 					<td> -->
<!-- 						<select name = "foodMCode"> -->
<%-- 							<c:forEach items = "${list }" var = "v"> --%>
<%-- 								<option value = "${v.foodMCode }">${v.foodMName }</option> --%>
<%-- 							</c:forEach> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>단위</td> -->
<!-- 					<td><input type = "text" name = "uint"></td>     -->
<!-- 					<td>출고날짜</td> -->
<!-- 					<td><input type = "date" name = "exDate"></td>           -->
<!-- 				</tr>                      -->
<!-- 			</table> -->
<!-- 			<button id = "regist" class = "btn btn-danger">확인</button> -->
<!-- 		</form> -->        
		<br><br><br>
	
<!-- 			<div> -->
<!-- 				<select name = "searchType" class = "searchType"> -->
<!-- 					<option value = "n" -->
<%-- 		   			<c:out value="${deliver.searchType==null?'selected':'' }"/>> --%>
<!-- 		   			분류 -->
<!-- 		   			</option> -->
<!-- 		   			<option value = "t" -->
<%-- 		   			<c:out value="${deliver.searchType eq 't'?'selected':'' }"/>> --%>
<!-- 		   			코드번호 -->
<!-- 		   			</option> -->
<!-- 		   			<option value = "c" -->
<%-- 		   			<c:out value="${deliver.searchType eq 'c'?'selected':'' }"/>> --%>
<!-- 		   			식재료명 -->
<!-- 		   			</option> -->
<!-- 				</select> -->
<!-- 				<input type = "text" class = "keyword" name = "keyword" placeholder = "검색어 입력란"> -->
<!-- 				<button id = "search" class = "btn btn-warning">검색</button> -->
<!-- 			</div> -->
			<div>
				<button id = "changer" class = "btn btn-success">식재료입고</button>
				<button id = "completeAll" class = "btn btn-warning">입고된 목록</button>                  
			</div>
			<br><br>
			<form>
				<div>
					<table class = "action1 table table-hover">
						<tr>
							<th>코드번호&nbsp;</th>
							      
							<th>식재료명&nbsp;</th>
							<th>주문날짜&nbsp;</th>
							
							<th>수량&nbsp;</th>
							<th>단위&nbsp;</th>
							<th>입고여부&nbsp;</th>
						</tr>
						
							<tr class = "actionResult">
							</tr>
						
					</table>
					<table class = "action2 table table-hover">
						<tr>
							<th>코드번호</th>
							<th>식재료명</th>
							<th>입고날짜</th>
							<th>수량</th>
							<th>단위</th>
							<th>입고여부</th>
						</tr>
						<tr class = "actionResult2">
						</tr>
					</table>
					<ul class = "pagination">
					</ul>       
				</div>
			</form>
		</div>
</body>
</html>