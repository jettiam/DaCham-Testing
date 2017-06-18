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
		var foodGName = "";
		$(".category li a").on("click",function(){
			foodGName = $(this).attr("data-name");
		});
		$(".category2 li a").on("click",function(){
			var cookMName = $(this).attr("data-name");
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
		<nav>
			<ul class = "category">
				<li><a data-name = "곡류">곡류</a></li>
				<li><a data-name = "조미류">조미류</a></li>
				<li><a data-name = "채소류">채소류</a></li>
				<li><a data-name = "생선류">생선류</a></li>
				<li><a data-name = "고기류">고기류</a></li>
			</ul>
		</nav>
		<nav>
			<ul class = "category2">
				<li><a data-name = "튀김">튀김</a></li>
				<li><a data-name = "구이">구이</a></li>
				<li><a data-name = "조림">조림</a></li>
				<li><a data-name = "찜">찜</a></li>
				<li><a data-name = "초벌">초벌</a></li>
				<li><a data-name = "무침">무침</a></li>
				<li><a data-name = "탕">탕</a></li>
			</ul>
		</nav>
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