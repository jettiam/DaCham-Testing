<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="nutritionistNavi.jsp" %>
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
		<div>
			<input type = "text" placeholder = "식재료 검색어 입력란">
			<button id = "search"> 검색 </button>
		</div>
		<br><br>
		<div>
			<table>
				<tr>
					<th>코드번호</th>
					<th>이미지</th>
					<th>식재료명</th>
				</tr>
				<tr>
					<td>A1</td>
					<td></td>
					<td>안창살</td>
				</tr>
			</table>
		</div>
		<div>
			<br><br>
			<div class = "box1">
				<table>
					<tr>
						<th>식재료</th>
						<th>양</th>
					</tr>
					<tr>
						<td>배추</td>
						<td><input type = "text" maxlength = "10" style="width:30px;"></td>
					</tr>
				</table>
			</div>
			<div class = "box2">
				<h2>반찬 사진</h2>
				<input type = "file" name = "file">
				<button id = "upload">업로드</button>
				<div>
				</div>
			</div>
		</div>
	</div>
	<div class = "div2">
		<div>
			그래프가 들어갈
			open API영역
		</div>
		<div>
			<h2>반찬 레시피</h2>
			<textarea placeholder = "레시피 입력란"></textarea>
		</div>
		<div>
			<table>
				<tr>
					<th>식품군</th>
					<th>조리방법</th>
				</tr>
				<tr>
					<td>
						<select>
							<option>식품군</option>
							<option>곡류</option>
							<option>조미류</option>
							<option>포유류</option>
							<option>생선류</option>
							<option>고기류</option>
						</select>
					</td>
					<td>
						<select>	
							<option>조리방법</option>
							<option>튀김</option>
							<option>구이</option>
							<option>조림</option>
							<option>찜</option>
							<option>초벌</option>
						</select>
					</td>
				</tr>
			</table>
			<button id = "regist">등록</button>
		</div>
	</div>
</body>
</html>