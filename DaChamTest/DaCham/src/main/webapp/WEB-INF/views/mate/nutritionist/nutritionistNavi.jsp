<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<!-- 상단 내비게이션 표시를 위한 임시 CSS -->
<style>
.naviBox {
	background-color: lightgray;
	margin-top: 10px;
}

.box {
	display: inline-block;
	height: 50px;
	padding: 0 20px;
	font-size: 25px;
}

</style>
<!-- 상단 내비게이션 표시를 위한 임시 CSS -->

</head>
<body>
	<div id="headerBox">
		<!-- 로고 -->
		<div id="logo">
			<!-- 로고박스 -->
			<a href="main"><img src="http://placehold.it/100x100"></a>

			<div id="infoBox">
				<!-- 이름 출력. 로그아웃 -->
				<h4>
					${EmpName }
				</h4>
				영양사 로그아웃
			</div>
		</div>
	</div>
	<!-- 상단 메뉴바 -->
	<div class="naviBox">
		<ul type="none" class="">
			<!-- 메뉴 리스트 -->
			<li class="box"><a href="wizard" id="dachamInfo">식단위자드 관리</a></li>
			<li class="box"><a href="diet" id="dietOrder">식단관리</a></li>
			<li class="box"><a href="side" id="menuShow">반찬관리</a></li>
			<li class="box"><a href="special" id="nutritionInfo">특별식단 작성</a></li>
		</ul>
	</div>
</body>
</html>