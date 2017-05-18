<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- 메인페이지 기본 틀을 위한 임시 CSS -->
<style>
#mainImgBox {
	positon: absolute;
	top: 0;
	left: 20px;
}

@media all and (min-width: 960px) {
	#mainContent {
		width: 100%;
		height: 100%;
		background-color: black;
	}
	#mainImgBox {
		
	}
}

#mainMenuImgs {
	position: absolute;
	top: 372px;
	left: 852px;
}

.mainMenuImg1 {
	
}

#mainNutriBox {
	position: absolute;
	top: 640px;
	left: 852px;
	width: 280px;
	height: 130px;
	background-color: gray;
}
</style>
</head>
<body>
	<div>
		<%@include file="clientNavi.jsp"%><!-- 네비게이션 삽입 -->
	</div>

	<div id="mainContent">
		<div id="mainImgBox">
			<!-- 메인페이지 메인이미지 -->
			<img src="http://placehold.it/850x600">
		</div>
		<div id="mainMenuImgs">
			<!-- 로그인박스 하단 작은 사이즈 식단 이미지 -->
			<table>
				<tr>
					<td><img src="http://placehold.it/140x90" class="mainMenuImg1">
					</td>
					<td><img src="http://placehold.it/140x90" class="mainMenuImg2"></td>
				</tr>

				<tr>
					<td><img src="http://placehold.it/140x90" class="mainMenuImg3"></td>
					<td><img src="http://placehold.it/140x90" class="mainMenuImg4"></td>
				</tr>

				<tr>
					<td><img src="http://placehold.it/140x90" class="mainMenuImg5"></td>
					<td><img src="http://placehold.it/140x90" class="mainMenuImg6"></td>
				</tr>


				
				
			</table>
		</div>

		<div id="mainNutriBox">
			<!-- 각 식단의 간략한 영양정보 -->

		</div>

	</div>
</body>
</html>