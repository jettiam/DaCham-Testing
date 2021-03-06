<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>DaCham 영양정보</title>
<script>
	$(document).ready(function() {
		$("#nutritionInfo").addClass("w3-gray");
	});
</script>
<style>
#nutriInfoWrap {
	width: 1080px;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}

.nutriInfoContainer {
	position: relative;
	margin: 0 auto;
}

#nutriInfoImg {
	margin-top: 5px;
	display: block;
	width: 300px;
	height: 300px;
	backface-visibility: hidden;
}

.overlay {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	height: 300px;
	width: 300px;
	opacity: 0;
	transition: .5s ease;
	background-color: rgba(211, 112, 168, 0.3);
}

.nutriInfoContainer:hover .overlay {
	opacity: 1;
}

.nutriInfoContainer:hover .nutriInfoImg {
	opacity: 0.5;
}

.nutriInfoContainer:hover .text {
	opacity: 1;
}

.text {
	color: white;
	font-size: 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

#nutriInfotable {
	margin: auto
}

@media screen and (max-width: 768px) {

	.col-sm-4{
	padding-top:20px;
	}
	.overlay {
	position: absolute;	
	top: 24px;
	bottom: 0;
	left: 0;
	right: 0;
	height: 300px;
	width: 300px;
	opacity: 1;
	transition: .5s ease;
	background-color: rgba(211, 112, 168, 0.1);
	}
}
</style>
</head>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<div class="container">
		<div class="row">
			<h1 class="text-center">영양소개</h1>
			<div class="col-sm-12 text-center">
				<p class="lead">
					건강에 대한 유용한 정보를 알려드립니다.<br> 일상에서 쉽게 활용할 수 있는 정보만을 드릴게요.<br>
					다참과 함께 건강한 생활 하세요
				</p>
			</div>
		</div>
		<table id="nutriInfotable" class="hidden-xs">
			<tr>
				<td>
					<div class="nutriInfoContainer">
						<a href="nutritionInfoDetail?detail=1">
							<div id="nutriInfoImgList">
								<img src="resources/customerImage/tomato.jpg" id="nutriInfoImg">

								<div class="overlay">
									<div class="text text-center">'방울 토마토'의 효능과 요리</div>
								</div>
							</div>
						</a>
					</div>
				</td>
				<td>
					<div class="nutriInfoContainer">
						<a href="nutritionInfoDetail?detail=2">
							<div id="nutriInfoImgList">
								<img src="resources/customerImage/broccoli.jpg"
									id="nutriInfoImg">

								<div class="overlay">
									<div class="text text-center">미세먼지 기승, 녹차・브로콜리로 예방하세요!</div>

								</div>
							</div>
						</a>
					</div>

				</td>
				<td>

					<div class="nutriInfoContainer">
						<a href="nutritionInfoDetail?detail=3">
							<div id="nutriInfoImgList">
								<img src="resources/customerImage/shutterstock.jpg"
									id="nutriInfoImg">

								<div class="overlay">
									<div class="text text-center">'야채와 건강'</div>
								</div>
							</div>
						</a>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div class="nutriInfoContainer">
						<a href="nutritionInfoDetail?detail=4">
							<div id="nutriInfoImgList">
								<img src="resources/customerImage/fruit.jpg" id="nutriInfoImg">

								<div class="overlay">
									<div class="text text-center">'당뇨와 과일'</div>
								</div>
							</div>
						</a>
					</div>
				</td>

				<td>
					<div class="nutriInfoContainer">
						<a href="nutritionInfoDetail?detail=5">
							<div id="nutriInfoImgList">
								<img src="resources/customerImage/gusal.jpg" id="nutriInfoImg">

								<div class="overlay">
									<div class="text text-center">'질병과 현미'</div>
								</div>
							</div>
						</a>
					</div>
				</td>

				<td>
					<div class="nutriInfoContainer">
						<a href="nutritionInfoDetail?detail=6">
							<div id="nutriInfoImgList">
								<img src="resources/customerImage/salmon.jpg" id="nutriInfoImg">

								<div class="overlay">
									<div class="text text-center">'슈퍼푸드 연어'</div>
								</div>
							</div>
						</a>
					</div>
				</td>
			</tr>
		</table>
		<div class="visible-xs">
			<div class="nutriInfoContainer col-sm-4">
				<a href="nutritionInfoDetail?detail=1">
					<div id="nutriInfoImgList">
						<img class="center-block" src="resources/customerImage/tomato.jpg" id="nutriInfoImg">

						<div class="overlay center-block">
							<div class="text text-center">'방울 토마토'의 효능과 요리</div>
						</div>
					</div>
				</a>
			</div>
			<div class="nutriInfoContainer col-sm-4">
				<a href="nutritionInfoDetail?detail=2">
					<div id="nutriInfoImgList">
						<img class="center-block" src="resources/customerImage/broccoli.jpg" id="nutriInfoImg">
						<div class="overlay center-block">
							<div class="text text-center">미세먼지 기승, 녹차・브로콜리로 예방하세요!</div>

						</div>
					</div>
				</a>
			</div>
			<div class="nutriInfoContainer col-sm-4">
				<a href="nutritionInfoDetail?detail=3">
					<div id="nutriInfoImgList">
						<img class="center-block" src="resources/customerImage/shutterstock.jpg"
							id="nutriInfoImg">

						<div class="overlay center-block">
							<div class="text text-center">'야채와 건강'</div>
						</div>
					</div>
				</a>
			</div>

			<div class="nutriInfoContainer col-sm-4">
				<a href="nutritionInfoDetail?detail=4">
					<div id="nutriInfoImgList">
						<img class="center-block"  src="resources/customerImage/fruit.jpg" id="nutriInfoImg">

						<div class="overlay center-block">
							<div class="text text-center">'당뇨와 과일'</div>
						</div>
					</div>
				</a>
			</div>
		
		<div class="nutriInfoContainer col-sm-4">
			<a href="nutritionInfoDetail?detail=5">
				<div id="nutriInfoImgList">
					<img class="center-block" src="resources/customerImage/gusal.jpg" id="nutriInfoImg">

					<div class="overlay center-block">
						<div class="text text-center">'질병과 현미'</div>
					</div>
				</div>
			</a>
		</div>
		<div class="nutriInfoContainer col-sm-4">
			<a href="nutritionInfoDetail?detail=6">
				<div id="nutriInfoImgList">
					<img class="center-block" src="resources/customerImage/salmon.jpg" id="nutriInfoImg">

					<div class="overlay center-block">
						<div class="text text-center">'슈퍼푸드 연어'</div>
					</div>
				</div>
			</a>
		</div>
		</div> 
	</div>


	<footer>
		<%@include file="../../footer.jsp"%>
	</footer>


</body>
</html>