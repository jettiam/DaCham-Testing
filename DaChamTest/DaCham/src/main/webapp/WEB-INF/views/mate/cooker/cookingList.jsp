<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file = "cookerNavi.jsp" %>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#button").on("click",function(){
			window.location.href = "cook";
		});
	});
</script>
</head>
<body>
	<h1>조리 목록</h1>
	<div>
		<table>
			<tr>
				<th>음식명</th>
				<th>조리량</th>
				<th>조리상태</th>
			</tr>
			<c:forEach items = "${list }" var = "b">
				<tr>
					<td><a href = "#">${b.sideDName }</a></td>
					<td>${b.dietAmount }</td>
					<td>${b.orderItemCode}</td>
				</tr>
			</c:forEach>		
		
		</table>
	</div>
	<button id = "button">조리시작</button>
</body>
</html>
