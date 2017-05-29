<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- 메인페이지 기본 틀을 위한 임시 CSS -->
<style>
table,td,tr,tbody{
	margin:0;
	padding:0;
	border:0;
}
#mainContent {
	max-width: 1080px;
	height: 100%;
	margin: 0 auto;
}

#mainLeftWrap {
	float: left;
	max-width: 800px;
	/* height:640px; */
}

#mainMenuImgs {
	position: relative;
}

#mainNutriBox {
	position: relative;
	max-width: 280px;
	height: 140px;
	background-color: gray;
}

#mainRightWrap {
	position: relative;
	float: right;
}

#myNutriInfo {
	max-width: 280px;
	height: 123px;
	background-color: gray;
}

img {
	max-width: 100%;
	height: auto;
}
td img{
	width:140px;
	height:90px;	
	}


@media only screen and (max-width: 750px) {
	#mainNutriBox {
		position: relative;
		max-width: 500px;
		height: 140px;
		background-color: gray;
	}
	#mainRightWrap {
	max-width: 500px;
		position: relative;
		float: right;
	}
	#myNutriInfo {
		max-width: 500px;
		height: 123px;
		background-color: gray;
	}
	td img{
		width:250px;
		height : auto;
	}
}
</style>
</head>
<body>
	<div>
		<%@include file="clientNavi.jsp"%><!-- 네비게이션 삽입 -->
	</div>

	<div id="mainContent">
		<div id="mainLeftWrap">
			<!-- 메인페이지 메인이미지 -->
			<img src="../../dacham/resources/customerImage/dmain.jpg">
		</div>


		<div id="mainRightWrap">
			<div id="myNutriInfo"></div>
			<div id="mainMenuImgs">
				<!-- 로그인박스 하단 작은 사이즈 식단 이미지 -->
				<table>
					<tr>
						<td><img src="http://placehold.it/280x180"
							class="mainMenuImg1"></td>
						<td><img src="http://placehold.it/280x180"
							class="mainMenuImg2"></td>
					</tr>

					<tr>
						<td><img src="http://placehold.it/280x180"
							class="mainMenuImg3"></td>
						<td><img src="http://placehold.it/280x180"
							class="mainMenuImg4"></td>
					</tr>

					<tr>
						<td><img src="http://placehold.it/280x180"
							class="mainMenuImg5"></td>
						<td><img src="http://placehold.it/280x180"
							class="mainMenuImg6"></td>
					</tr>
				</table>
			</div>

			<div id="mainNutriBox">
				<!-- 각 식단의 간략한 영양정보 -->

			</div>
		</div>
	</div>
</body>
</html>