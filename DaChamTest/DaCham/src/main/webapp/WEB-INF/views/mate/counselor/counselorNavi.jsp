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
<div id="headerBox">
		<!-- 로고 -->
		<div id="logo">
			<!-- 로고박스 -->
			<a href="counselorMain" id="counselorMain">     
		    <img src="http://placehold.it/100x100"></a>

			<div id="infoBox">
				<!-- 이름 출력. 로그아웃 -->
				<h4>
					${EmpName }
				</h4>
				유체리 로그아웃
			</div>
		</div>
	</div>
	<!-- 상단 메뉴바 -->
	<div class="naviBox">
	<!-- 고객 메인 -->
	<!-- 상단 메뉴바 -->
	<div class="bg">
		<ul type="none" class="">
			<!-- 메뉴 리스트 -->
			<li class="box"><a href="counselorList" id="counselorList">고객상담</a></li>
			<li class="box"><a href="detail" id="counselorDetail">상담내역</a></li>
			
		</ul>

	</div>
</body>
</html>

