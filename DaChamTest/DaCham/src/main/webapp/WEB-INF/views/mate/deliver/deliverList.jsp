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
<script>
	$(document).ready(function(){
		all();
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
							all();	
						}
					}
				});
			
		});
		$("#search").on("click",function(){
			$(".searchResult").remove();
			var searchType = $('.searchType').val();
			var keyword = $("#keyword").val();
			alert("Ord : "+searchType + " sde: "+keyword);
			$.getJSON("deliverAjax/"+searchType+"/"+keyword,function(data){
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'chk' value = '"+this.orderCode+"' class = 'check'>"+"</td>"+"<td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.address+"</td>"+"<td>"+"<input type = 'text' class = 'transportNum"+this.orderCode+"' name = 'transportNum'>"+"</td>"+"<td>"+this.orderItemName+"</td>"+"</tr>";
				});
				$(".searchTable").append(str);
			});
		});
		$("#all").on("click",function(){
			all();
		});
		function all(){
			$.getJSON("deliverAjax/all",function(data){
				$(".searchResult").remove();
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'chk' value = '"+this.orderCode+"' class = 'check'>"+"</td>"+"<td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.address+"</td>"+"<td>"+"<input type = 'text' class = 'transportNum"+this.orderCode+"' name = 'transportNum'>"+"</td>"+"<td>"+this.orderItemName+"</td>"+"</tr>";
				});
				$(".searchTable").append(str);
			});
		}
	});
	
</script>
</head>
<body>
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
			<button id = "search">검색</button>
			<button id = "all">전체목록</button>
		</div>
		<br><br><br><br>
	
		<div>
			<table border = "1" class = "searchTable">
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
			
		</div>
	
		<button id = "button">배송</button>
</body>
</html>
