<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:10px;}
  .div1 {
  float:left;  }
 .div2 {
  display:inline-block;  margin-left:10px;}    
</style>
</head>
<body>
	<div class = "div1">
		<div class = "box1">
			<h2>위자드 선택</h2>
			<hr align = "left" width = "20%">
			<input type = "checkbox"> 고위험군 당뇨병<br>
			<input type = "checkbox"> 저위험 고지혈증
		</div>
		<div class = "box2">
			<table>
				<tr>
					<th></th>
					<th>반찬명</th>
					<th>영양정보</th>
				</tr>
				<tr>
					<td></td>
					<td>깍두기</td>
					<td>kcal</td>
				</tr>
			</table>
		</div>
		<br><br><br><br><br><br>
		<div>
			<input type = "text" name = "search">
			<button id = "search">검색</button><br>
			<table border = "1">
				<tr>
					<th><input type = "checkbox"></th>
					<th>반찬명</th>
					<th>식품군</th>
					<th>조리방법</th>
				</tr>
				<tr>
					<td><input type = "checkbox"></td>
					<td>깍두기</td>
					<td>채소류</td>
					<td>절임</td>
				</tr>
			</table>
		</div>
		<div>
			<h3>선택한 반찬</h3>
			<hr align = "left" width = "80%">
		</div>
	</div>
	<div class = "div2" style = "border-left:1px solid #000">
		<div>
			질환별 식단 목록<br>
			- <a>당뇨병</a><br>
			- <a>고지혈증</a>
		</div>
		<br><br><br>
		<div>
			그래프가 들어갈 영역<br>
			그래프 open API
		</div>
		<br><br><br>
		<button id = "regist" type = "submit">등록</button>
	</div>
</body>
</html>