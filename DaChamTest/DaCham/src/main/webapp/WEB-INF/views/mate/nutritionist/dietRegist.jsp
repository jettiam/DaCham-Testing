<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="nutritionistNavi.jsp" %>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src = "../../../dacham/resources/openAPIjs/radarchart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#cancle").click(function(){
			if(window.confirm("정말로 취소하시겠습니까?")){
				window.location.href = "diet";	
			}
		});
	});
	function check(){
		cbox = input_form.chk;
		if(cbox.length){
			for(var i = 0; i < cbox.length; i++){
				cbox[i].checked = input_form.all.checked;
			}
		}
		else{
			cbox.checked = input_form.all.checked;
		}
	}
</script>

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
  body {
		  overflow: hidden;
		  margin: 0;
		  font-size: 14px;
		 
	}
   #body{
   		position : relative;
   }
  #chart {
	  position: relative;
	  top: 50px;
	  left: 10px;
	}	
</style>
</head>
<body>
	<form name = "input_form">
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
						<th><input type = "checkbox" name = "all" onclick="check();"></th>
						<th>반찬명</th>
						<th>식품군</th>
						<th>조리방법</th>
					</tr>
					<c:forEach items = "${list }" var = "b">
						<%int i = 1; %>
						<tr>
							<td><input type = "checkbox" name = "chk" value = "<%=i %>"></td>
							<td>${b.sideDName }</td>
							<td>${b.foodGName }</td>
							<td>${b.cookMName }</td>
						</tr>
						<%i = i + 1;  %>
					</c:forEach>
				</table>
			</div>
		</form>
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
			<div id = "dietName">
				<!-- 식단의 이름을 지어줌 -->
				<input type = "text" name = "dietName">
				<button id = "search">선정</button>
			</div>
			<div id = "body">
				<div id = "chart"></div>
				<div>
				ㅇ<!-- 총 칼로리 양 표시 -->
				</div>
			</div>
		</div>
	<button id = "regist" type = "submit">등록</button>
	<button id = "cancle">취소</button>
	<script src = "../../../dacham/resources/openAPIjs/APIQuery.js"></script>
</body>
</html>