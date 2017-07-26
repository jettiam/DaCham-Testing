<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
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
			<div class="w3-display-middle"><a href="counselorMain"><img src="resources/customerImage/dachamlogo.png" id="logo"></a>			
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
	  <a href="counselorList" class="w3-bar-item w3-button w3-hover-light-gray" id="counselorList">고객상담</a>
	  <a href="#" id = "detail" class="w3-bar-item w3-button w3-hover-light-gray" id="detail">상담내역</a>	 
	</div>
	</div>
	
	</div>
	<script>
		$(document).ready(function(){
			$("#detail").on("click",function(){
				alert("메인으로 돌아가야 합니다.");
				window.location.href = "counselorMain";
			});
		});
	</script>
</body>
