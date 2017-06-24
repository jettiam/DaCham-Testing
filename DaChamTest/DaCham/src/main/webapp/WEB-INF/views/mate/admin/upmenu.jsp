<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-indigo.css">
<style>
.w3-display-container{
height:180px;
}
#headerBox{
margin-bottom:20px;
}
</style>
<body>
	<div id="headerBox">
		<!-- 로고 -->
		<div class="w3-container">
			<!-- 로고박스 --> 
			<div class="w3-display-container col-sm-1">			
			<div class="w3-display-middle"><a href="adminMain"><img src="resources/customerImage/dachamlogo.jpg" id="logo"></a>			
			</div></div>			
			<div class="w3-display-container col-sm-2"><div class="w3-display-middle h1">${EmpDept}</div></div>
			<div class="col-sm-4"></div>
			<div class="w3-display-container col-sm-4">								
				<div class="w3-display-right h3">${EmpGrade} ${EmpName}<br><a href="empLogout">로그아웃</a></div>
			</div>
		</div>
	
	<!-- 상단 메뉴바 -->
	<div class="w3-bar w3-border w3-theme-d5 w3-xlarge">
	<div class="w3-container">
	  <a href="orderList" class="w3-bar-item w3-button w3-hover-light-gray" id="orderList">주문내역</a>
	  <a href="foodStock" class="w3-bar-item w3-button w3-hover-light-gray" id="foodStock">식재료</a>
	  <a href="dietManagement"class="w3-bar-item w3-button w3-hover-light-gray" id="dietManagement">식단관리</a>
	  <a href="emp"class="w3-bar-item w3-button w3-hover-light-gray" id="emp">사원관리</a>
	  <a href="customer" class="w3-bar-item w3-button w3-hover-light-gray" id="customer">회원관리</a>
	</div>
	</div>
	
	</div>
	
</body>