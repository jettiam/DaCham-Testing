<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<%@include file = "deliverNavi.jsp" %>
<style>
	#submit{
		position : relative;
		align : right;
	}
</style>
<script>
	$(document).ready(function(){
		$("#regist").on("click",function(){
			$("#foodStockForm").attr("method","post");
			$("#foodStockForm").attr("action","deliverRegist");
			$("#foodStockForm").submit();
			alert("클릭됨");      
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<%
		long time = System.currentTimeMillis(); 
	
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
	
		String str = dayTime.format(new Date(time));
	%>
	<form id = "foodStockForm">
		<input type = "hidden" name = "exDate" value = "<%=str %>">
		<table border = 1>
			<tr>
				<th>입고날짜</th>
				<td> <input type="date" name="inDate"></td>
				<th>단가(원)</th>
				<td><input type = "text" name = "price"></td>
			</tr>
			<tr>
				<td>입고량</td>
				<td><input type = "text" name = "inAmount"></td>
				<td>코드번호</td>
				<td>
					<select name = "foodMCode">
						<c:forEach items = "${list }" var = "v">
							<option value = "${v.foodMCode }">${v.foodMName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>출고량</td>
				<td><input type = "text" name = "outAmount"></td>
				<td>단위</td>
				<td><input type = "text" name = "uint"></td>
			</tr>
			<tr>
				<td>식재료이름</td>
				<td><input type = "text" name = "foodMName"></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<button id = "regist">확인</button>
	</form>
	<br><br><br>
	<form id = "searchForm">
		<div>
			<select name = "searchType">
				<option value = "n"
	   			<c:out value="${deliver.searchType==null?'selected':'' }"/>>
	   			분류
	   			</option>
	   			<option value = "t"
	   			<c:out value="${deliver.searchType eq 't'?'selected':'' }"/>>
	   			코드번호
	   			</option>
	   			<option value = "c"
	   			<c:out value="${deliver.searchType eq 'c'?'selected':'' }"/>>
	   			식재료명
	   			</option>
			</select>
			<input type = "text" name = "keyword" placeholder = "검색어 입력란">
			<button id = "search">검색</button>
		</div>
		<br><br>
		<div>
			<table>
				<tr>
					<th>코드번호&nbsp;</th>
					<th>이미지&nbsp;</th>
					<th>식재료명&nbsp;</th>
					<th>입고날짜&nbsp;</th>
					<th>단가&nbsp;</th>
					<th>단위&nbsp;</th>
					<th> </th>
				</tr>
				<c:forEach items = "${overList }" var = "s">
					<tr>
						<td>${s.foodMCode }</td>
						<td><img src = "deliverDisplayFile?fileName=${s.foodMImg}" style= "width: 175px; height: 50px;"></td>
						<td>${s.foodMName }</td>
						<td>${s.inDate }</td>
						<td>${s.price }</td>
						<td>${s.uint }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
</body>
</html>