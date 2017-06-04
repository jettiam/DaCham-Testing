<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file = "deliverNavi.jsp" %>
<style>
	#submit{
		position : relative;
		align : right;
	}
</style>

<title>Insert title here</title>
</head>
<body>
	<form id = "foodStock">
		<table border = "2">
			<tr>
				<th>입고날짜</th>
				<td> <input type="date" name="exDate"></td>
				<th>단가(원)</th>
				<td><input type = "text" name = "price"></td>
			</tr>
			<tr>
				<td>식재료명</td>
				<td><input type = "text" name = "foodMName"></td>
				<td>식재료 이미지</td>
				<td><input type = "file" name = "foodMImg"></td>
			</tr>
			<tr>
				<td>코드번호</td>
				<td><input type = "text" name = "foodMCode"></td>
				<td>단위</td>
				<td><input type = "text" name = "outAmount"></td>
			</tr>
		</table>
		<button type = "submit" id = "submit">확인</button>
	</form>
	<br><br><br>
	<div>
		<select>
			<option>분류</option>
			<option>코드번호</option>
			<option>분류</option>
			<option>식재료명</option>
		</select>
		<input type = "text" name = "keyword" placeholder = "검색어 입력란">
		<button id = "search">검색</button>
	</div>
	<br><br>
	<div>
		<table>
			<tr>
				<th>코드번호</th>
				<th>이미지</th>
				<th>식재료명</th>
				<th>입고날짜</th>
				<th>단가</th>
				<th>단위</th>
				<th> </th>
			</tr>
			<tr>
				<td>A1</td>
				<td><img src="http://placehold.it/140x100"></td>
				<td>안창살</td>
				<td>2017.05.03</td>
				<td>50,000</td>
				<td>G</td>
				<td><button>입고예정</button></td>
			</tr>
		</table>
	</div>
</body>
</html>