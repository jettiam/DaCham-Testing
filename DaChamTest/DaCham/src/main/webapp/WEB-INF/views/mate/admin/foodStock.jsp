<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../admin/upmenu.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<title>Insert title here</title>
<script>
function all(){
	$.getJSON("adminSub/foodStockAll",function(data){
		console.log(data); 
		$(".foodStock").remove(); 
		var str = "";
		for(var i =0; i<data.length; i++){
			str += "<tr class='foodStock'>"+"<td>"+data[i].foodMICode+"</td>"+"<td>"+data[i].foodMName+"</td>"+"<td>"+data[i].price+"</td>"+"<td>"+data[i].uint+"</td>"+"<td>"+data[i].inAmount+"</td>"+"<td>"+data[i].outAmount+"</td>"+"<td>"+data[i].stock+"</td> </tr>"		 
		}
		console.log(str);
		$(".tables").append(str); 
	});  
} 
	$(document).ready(function() {
		all();''
		$("#foodOrder").on("click", function() {
			window.location.href = "foodOrder"
		});
	})
</script>
</head>
<body>
	<div class="container">
	<div class="form-group row">  
	<div class="col-xs-2"> 
		<select name="searchType" class= "searchType form-control"> 
			<option value="n"
				<c:out value="${foodMInven.searchType==null?'selected':'' }"/>>
				전체</option>
			<option value="t"
				<c:out value="${foodMInven.searchType eq 't'?'selected':'' }"/>>
				코드번호</option>
			<option value="c"
				<c:out value="${foodMInven.searchType eq 'c'?'selected':'' }"/>>
				식재료명</option>
		</select>
		</div>
		<div class="col-xs-3"> 
		<input type="text" name="keyword" class="form-control">
		</div>
		<button id="search" class = "btn btn-default">검색</button>
	</div>
	<div>
		<table width="600" class="tables table table-condensed">
			<tr>
				<th>코드번호</th>
				<th>식재료명</th>
				<th>단가</th>
				<th>단위</th>
				<th>입고량</th>
				<th>출고량</th>
				<th>재고량</th>

			</tr>
			<%-- <c:forEach items="${list}" var="board">
				<tr>
					<td>${board.foodMICode}&nbsp;&nbsp;&nbsp;</td>
					<td>${board.foodMName}</td>
					<td>${board.price}&nbsp;&nbsp;</a></td>
					<td>${board.uint }&nbsp;&nbsp;</td>
					<td>${board.inAmount}</td>
					<td>${board.outAmount}</td>
					<td>${board.stock}</td>
				</tr>
			</c:forEach> --%>
		</table>
	</div>
	<button id="foodOrder" class = "btn btn-default">식재료주문</button> 
	</div>
</body>
</html>