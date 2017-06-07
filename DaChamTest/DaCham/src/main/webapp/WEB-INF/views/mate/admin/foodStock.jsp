<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../admin/upmenu.jsp" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script> 
<title>Insert title here</title>
<script >
	$(document).ready(function(){
		$("#foodOrder").click(function(){
			window.location.href = "foodOrder"; 
		});	
	});
	
</script>
</head>
<body>
<div>
		<select>
			<option>전체</option>
			<option>코드번호</option>
			<option>식재료명</option>
		</select>
		<input type="text"> 
		<button tpye="submit">검색</button>  
	</div>
	<div>
		<table width="600">
				<tr>
					<th>코드번호</th>
					<th>식재료명</th>
					<th>입고날짜</th>
					<th>단가</th>
					<th>단위</th>
					<th>입고량</th>
					<th>출고량</th>
					<th>재고량</th>
				
				</tr>
				<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.foodMICode}&nbsp;&nbsp;&nbsp;</td>
						<td>${board.foodMName}</td>
						<%-- <td>${board.dietName}&nbsp;&nbsp;</td> --%>
						<td>${board.inDate}&nbsp;&nbsp;</a></td>
						<td>${board.price }&nbsp;&nbsp;</td>
						<td>${board.uint}</td>
						<td>${board.inAmount}</td>
						<td>${board.outAmount}</td> 
						<td>${board.stock}</td>
					</tr>
				</c:forEach>
				</table> 
	</div> 
	<button id="foodOrder">식재료주문</button> 
</body>
</html>