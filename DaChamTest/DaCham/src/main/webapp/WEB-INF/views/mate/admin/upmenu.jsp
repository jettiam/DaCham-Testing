<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.bg {
	background-color: lightgray;
	margin-top: 20px;
}

.box {
	display: inline-block;
	height: 50px;
	padding: 0 20px;
	font-size: 25px;
}
</style>
</head>
<body>
	<!-- 고객 메인 -->
	<!-- 상단 메뉴바 -->
	<div class="bg">
		<ul type="none" class="">
			${EmpName }
			<!-- 메뉴 리스트 -->
			<li class="box"><a href="adminMain" id="adminMain">로고</a></li>
			<li class="box"><a href="orderList" id="orderList">주문내역</a></li>
			<li class="box"><a href="statistics" id="statistics">통계</a></li>
			<li class="box"><a href="foodStock" id="foodStock">식재료</a></li>
			<li class="box"><a href="dietManagement" id="dietManagement">식단관리</a></li>
			<li class="box"><a href="emp" id="emp">사원관리</a></li>
			<li class="box"><a href="customer" id="customer">회원관리</a></li>

		</ul>

	</div>
</body>
</html>