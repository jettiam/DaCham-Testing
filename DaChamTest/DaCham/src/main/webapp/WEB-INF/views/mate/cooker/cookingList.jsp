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
		
		$("#startCookBtn").on("click", function(){
			window.open("cookScreen", "", "height=1024, width=1366, fullscreen=yes");
		})
	});
</script>
</head>
<body>
	<%@include file = "cookerNavi.jsp" %>
	<div class = container>
	<h1>조리 대기</h1>
		<button id = "startCookBtn" class = "btn btn-primary btn-lg">조리시작</button>
		<table class ="table table-hover">
			<tr>
				<th>주문번호</th>
				<th>반찬번호</th>
				<th>반찬이미지</th>
				<th>반찬이름</th>
				
				<th>주문안의 반찬진행상태</th>
				<th>조리량</th>
			</tr>
			<c:forEach items = "${list }" var = "b">
				<tr>
					<td>${b.orderCode}</td>
				<td>${b.sideDCode}</td>
				<td><img src = "displayFile?fileName=${b.sideDImg}" style = "width:50px; height : 50px;"></td>
				<td>${b.sideDName}</td>
				
				<td>${b.orderItemName}</td>
				<td>${b.cookingAmount}</td>
				</tr>
			</c:forEach>			
		</table>
	<h1>조리 완료</h1>
		<table class = "table table-hover">
			<tr>
				<th>주문번호</th>
				<th>반찬번호</th>
				<th>반찬이미지</th>
				<th>반찬이름</th>
				
				<th>주문안의 반찬진행상태</th>
				<th>조리량</th>
			</tr>
			<c:forEach items = "${list2 }" var ="y">
			<tr>
				<td>${y.orderCode}</td>
				<td>${y.sideDCode}</td>
				<td><img src = "displayFile?fileName=${y.sideDImg}" style = "width:50px; height : 50px;"></td>
				<td>${y.sideDName}</td>
				               
				<td>${y.orderItemName}</td>   
				<td>${y.cookingAmount}</td>   
			</tr>
			</c:forEach>
		</table>
			
	</div>
</body>
</html>
