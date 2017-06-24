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
		$("#button").on("click",function(){
			window.location.href = "cook";
		});
	});
</script>
</head>
<body>
	<%@include file = "cookerNavi.jsp" %>
	<div class = container>
	<h1>조리 목록</h1>
		<button id = "button" class = "btn btn-primary">조리시작</button>
		<table class ="table table-hover">
			<tr>
				<th>음식명</th>
				<th>조리량</th>
				<th>조리상태</th>
			</tr>
			<c:forEach items = "${list }" var = "b">
				<tr>
					<td><a href = "#">${b.sideDName }</a></td>
					<td>${b.dietAmount }</td>
					<td>${b.orderItemName}</td>
				</tr>
			</c:forEach>			
		</table>
	<h1>조리 완료</h1>
		<table class = "table table-hover">
			<tr>
				<th>음식명</th>
				<th>조리량</th>
				<th>조리상태</th>
			</tr>
			<c:forEach items = "${list2 }" var ="y">
			<tr>
				<td><a href ="#">${y. sideDName }</a></td>
				<td>${y.dietAmount }</td>
				<td>${y.orderItemName }</td>
			</tr>
			</c:forEach>
		</table>
			
	</div>
</body>
</html>
