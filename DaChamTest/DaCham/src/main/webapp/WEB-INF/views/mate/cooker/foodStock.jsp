<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
<script> 
$(function(){
	$("#cookFood").addClass("w3-light-gray");
});
</script>
</head>
<body>
<%@include file = "cookerNavi.jsp" %>
	<div class = "container">
		<div>
			<form>
				<select name = "searchType">
					<option value = "n"
		   			<c:out value="${criteria.searchType==null?'selected':'' }"/>>
		   			분류
		   			</option>
		   			<option value = "t"
		   			<c:out value="${criteria.searchType eq 't'?'selected':'' }"/>>
		   			식재료명
		   			</option>
		   			<option value = "c"
		   			<c:out value="${criteria.searchType eq 'c'?'selected':'' }"/>>
		   			식재료량
		   			</option>
				</select>
				<input type = "text" name = "keyword" placeholder = "검색어 입력란">
				<button id = "search" class = "btn btn-warning">검색</button>
			</form>
		</div>
		<br><br>
		<div>
			<table class = "table table-hover">
				<tr>
					<th>식재료명</th>
					<th>추가된 입고량</th>
					<th>요청양</th>
					<th>단위</th>
				</tr>
				<c:forEach items = "${list }" var = "a">
					<tr>
						<td>${a.foodMName }</td>
						<td>${a.foodMAmount }</td>
						<td><input type = "text" style = "width:30px;"></td>
						<td>${a.uint }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
