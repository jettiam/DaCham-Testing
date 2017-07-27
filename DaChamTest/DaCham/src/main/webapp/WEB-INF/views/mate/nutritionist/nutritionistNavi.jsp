<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
	<c:if test="${not empty sessionScope.EmpName}">
		<div id="headerBox">
			<!-- 로고 -->
			<div class="w3-container">
				<!-- 로고박스 --> 
				<div class="w3-display-container col-sm-1">			
				<div class="w3-display-middle"><a href="nutriMain"><img src="resources/customerImage/dachamlogo.png" id="logo"></a>			
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
		  <a href="wizard" class="w3-bar-item w3-button w3-hover-light-gray" id="wizard">식단 위자드 관리</a>
		  <a href="diet" class="w3-bar-item w3-button w3-hover-light-gray" id="diet">식단 관리</a>	 
		 <a href="side"  class="w3-bar-item w3-button w3-hover-light-gray" id="side">반찬 관리</a>	
		 <a href="special"  class="w3-bar-item w3-button w3-hover-light-gray" id="special">특별식단 관리</a>
		</div>
		</div>
		
		</div>
	</c:if>
	<c:if test = "${empty sessionScope.EmpName }">
		<script>
			alert("영양사 정보로 로그인을 하셔야 합니다.")
			window.location.href = "main2";
		</script>
	</c:if>
</body>
