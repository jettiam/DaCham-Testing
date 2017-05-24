<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<select>
			<option>분류</option>
			<option>식재료명</option>
			<option>식품군</option>
		</select>
		<input type = "text" name = "keyword" placeholder = "검색어 입력란">
		<button id = "search">검색</button>
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
			<tr>
				<td>삼겹살</td>
				<td>14</td>
				<td><input type = "text" style="width:30px;"></td>
				<td>kg</td>
			</tr>
			<tr>
				<td>콩기름</td>
				<td>5</td>
				<td><input type = "text" style="width:30px;"></td>
				<td>L</td>
			</tr>
			<tr>
				<td>참기름</td>
				<td>2</td>
				<td><input type = "text" style="width:30px;"></td>
				<td>L</td>
			</tr>
			<tr>
				<td>바질</td>
				<td>200</td>
				<td><input type = "text" style="width:30px;"></td>
				<td>g</td>
			</tr>
		</table>
	</div>
</body>
</html>
