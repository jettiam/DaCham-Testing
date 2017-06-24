<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file = "deliverNavi.jsp" %>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		var currentPage = 1;
		var currentItemCode = "";
		all(1,5);
		$("#button").on("click",function(){
			
			var orderCode = $('input:radio[name="chk"]:checked').val();     
			var data = $(".transportNum"+orderCode).val();
			alert("def:"+data);
			
				$.ajax({
					type : "put",	
					url : "deliverAjax/"+ orderCode,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					dataType : 'text',
					data : JSON.stringify({
						"transportNum" : data
					}),
					success : function(result){
						if(result == "SUCCESS"){
							alert("수정되었습니다.");
							all(currentPage,5);   
						}
					}
				});
			
		});
		$("#search").on("click",function(){
			$(".searchResult").remove();
			var searchType = $('.searchType').val();
			var keyword = $("#keyword").val();
			
			$.getJSON("deliverAjax/"+searchType+"/"+keyword,function(data){
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'chk' value = '"+this.orderCode+"' class = 'check'>"+"</td>"+"<td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.address+"</td>"+"<td>"+"<input type = 'text' class = 'transportNum"+this.orderCode+"' name = 'transportNum'>"+"</td>"+"<td>"+this.orderItemName+"</td>"+"</tr>";
				});
				$(".searchTable").append(str);
			});
		});
		$("#all").on("click",function(){
			all(1,5);
		});
		$("#button1").on("click",function(){
			all(1,5);
		});
		$("#button2").on("click",function(){
			all(1,7);
		});
		$(".pagination").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			all(replyPage,currentItemCode);
		});
		function all(page,orderItemCode){
			$.getJSON("deliverAjax/all/"+page+"/"+orderItemCode,function(data){
				currentPage = page;
				currentItemCode = orderItemCode;
				$(".searchResult").remove();
				var str = "";
				$(data.list).each(function(){
					if(orderItemCode == 5){
						str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'chk' value = '"+this.orderCode+"' class = 'check'>"+"</td>"+"<td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.address+"</td>"+"<td>"+"<input type = 'text' class = 'transportNum"+this.orderCode+"' name = 'transportNum'>"+"</td>"+"<td>"+this.orderItemName+"</td>"+"</tr>";
					}
					else{
						str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'chk' value = '"+this.orderCode+"' class = 'check'>"+"</td>"+"<td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.address+"</td>"+"<td>"+"<input type = 'text' class = 'transportNum"+this.orderCode+"' name = 'transportNum' value = '"+this.transportNum+"' readonly>"+"</td>"+"<td>"+this.orderItemName+"</td>"+"</tr>";
					}
				});
				$(".searchTable").append(str);
				printPaging(data.criteria);
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
			$(".pagination").html(str);
		}
	});
	
</script>
</head>
<body>
	<div class = "container">
		<div>
		 
			<select name = "searchType" class = "searchType">
				<option value = "n"
	   			<c:out value="${orderList.searchType==null?'selected':'' }"/>>
	   			분류
	   			</option>
	   			<option value = "t"
	   			<c:out value="${orderList.searchType eq 't'?'selected':'' }"/>>
	   			주문번호
	   			</option>
	   			<option value = "c"
	   			<c:out value="${orderList.searchType eq 'c'?'selected':'' }"/>>
	   			고객id
	   			</option>
			</select>
			<input type = "text" name = "keyword" placeholder = "검색어 입력란" id = "keyword">
			<button id = "search" class = "btn btn-warning">검색</button>
			<button id = "all" class = "btn btn-warning">전체목록</button>
		</div>
		<br><br><br><br>
	
		<div>
		<button id = "button" class = "btn btn-primary">배송</button>
		<div style = "float:right;">
			<button id = "button1" class = "btn btn-danger">조리목록</button>
			<button id = "button2" class = "btn btn-danger">배송목록 확인</button>       
		</div>
			<table class = "searchTable table table-hover">   
				<tr>
					<th>   </th>
					<th>주문번호</th>
					<th>고객 아이디</th>
					<th>식단명</th>
					<th>주소</th>
					<th>운송장번호</th>
					<th>배송상태</th>
				</tr>
					<tr class = "searchResult">
						
					</tr>
			</table>
			<ul class = "pagination">
			</ul>
			
		</div>
	
		
	</div>
</body>
</html>
