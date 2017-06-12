<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="nutritionistNavi.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#regist").click(function(){
			window.location.href = "sideDRegist";
		});
	});
</script>
<title>Insert title here</title>
<style>
	.box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:10px;}
</style>
</head>
<body>
	<div class = "box1">
		<select>
			<option>분류</option>
			<option>식품군</option>
			<option>조리법</option>
		</select>
		<input type = "text" name = "search">
		<div>
			반찬 검색창<br>
			(옵션, 카테고리 사용)
		</div>
		<button id = "search">검색</button>
	</div>
	<div class = "box2">
		<div>
			<button id = "regist">반찬 등록</button>
			<button>반찬 수정</button>
			<button>반찬 삭제</button>
		</div>
		<div>
			<table>
				<tr>
					<th>&nbsp;&nbsp;</th>
					<th>이미지</th>
					<th>반찬명</th>
					<th>질량</th>
				</tr>
				<tr>
					<td><input type = "radio"></td>
					<td>꺅두기</td>
					<td>10g</td>
					<td>정상</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>