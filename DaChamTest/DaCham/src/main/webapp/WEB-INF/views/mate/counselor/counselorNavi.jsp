<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="resources/mateCSS/w3.css">
<link rel="stylesheet" href="resources/mateCSS/w3-theme-indigo.css">
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Jeju Gothic',"Nanum Gothic", sans-serif !important;
}
.w3-display-container{
height:180px;
}
#headerBox{
margin-bottom:20px;
}
#counselorList,#detail{
text-decoration: none;
}
</style>
<body>
	<c:if test = "${not empty sessionScope.EmpName }">
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
		  <a href="all" class="w3-bar-item w3-button w3-hover-light-gray" id="detail">상담내역</a>	 
		</div>
		</div>
		
		</div>
	</c:if>
	<c:if test = "${empty sessionScope.EmpName }">
		<script>
			alert("고객응대팀의 정보로 로그인을 하셔야 합니다.")
			window.location.href = "main2";
		</script>
	</c:if> 
	
</body>
