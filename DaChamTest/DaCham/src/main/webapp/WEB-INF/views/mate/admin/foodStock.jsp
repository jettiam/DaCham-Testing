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
<title>Insert title here</title>
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
					<th>재고량</th>
					<th>요쳥량</th>
				</tr>
				<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.foodMICode}&nbsp;&nbsp;&nbsp;</td>
						<td>${board.foodMCode  }</td>
						<%-- <td>${board.dietName}&nbsp;&nbsp;</td> --%>
						<td><a href="#" data-src="${board.orderCode}"  class="orderCode">${board.dietName}&nbsp;&nbsp;</a></td>
					
						<td>${board.orderDate }&nbsp;&nbsp;</td>
						<td>${board.price}</td>
						<td>${board.orderItem}</td>
						<td>${board.transportNum}</td>

					</tr>

				</c:forEach>
	</div> 
</body>
</html>