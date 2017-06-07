<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
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
	list-style-type: none;
}
.mateInfoBox{
	float:right;
	margin:20px 20px 0 0;
	font-size:20px;
}
#logo{
	margin :5px;
}

</style>
<!-- 상단 내비게이션 표시를 위한 임시 CSS -->

</head>
<body>
	<div id="headerBox">
		<!-- 로고 -->
		<div class="mateNavi">
			<!-- 로고박스 -->
			<a href="counselorMain"><img src="http://placehold.it/100x100" id="logo"></a>
			<div class="mateInfoBox">
				<!-- 이름 출력. 로그아웃 -->	
				${EmpDept}<br>				
				${EmpGrade} ${EmpName} | <a href="empLogout">로그아웃</a>
			</div>
		</div>
	</div>
	<!-- 상단 메뉴바 -->
	<div class="naviBox">
		<ul class="">
			<!-- 메뉴 리스트 -->
			<li class="box"><a href="counselorList" id="counselorList">고객상담</a></li>
			<li class="box"><a href="detail" id="counselorDetail">상담내역</a></li>
		</ul>
	</div>
</body>
</html>