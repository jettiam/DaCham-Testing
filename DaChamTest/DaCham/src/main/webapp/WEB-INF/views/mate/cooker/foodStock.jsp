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
</head>
<body>
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
			<button id = "search">검색</button>
		</form>
	</div>
	<br><br>
	<div>
		<table>
			<tr>
				<th>식재료명</th>
				<th>식재료량</th>
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
</body>
</html>
