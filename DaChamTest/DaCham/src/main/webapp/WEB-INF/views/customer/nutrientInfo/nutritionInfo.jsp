<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DaCham 영양정보</title>
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
#nutriInfotable{margin-left:100px;}
</style>
</head>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<div id="nutriInfoWrap">
		<h1>영양소개</h1>
		건강에 대한 유용한 정보를 알려드립니다.<br> 일상에서 쉽게 활용할 수 있는 정보만을 드릴게요.<br> 다참과 함께 건강한 생활 하세요<br>
<table id="nutriInfotable">
<tr><td>
		<div class="nutriInfoContainer">

			<div id="nutriInfoImgList">
				<a href="nutritionInfoDetail"><img
					src="../../../dacham/resources/customerImage/tomato.jpg"
					id="nutriInfoImg">

					<div class="overlay">
						<div class="text">'방울 토마토'의 효능과 요리</div></a>
			</div>
		</div>
	</div>
</td>
<td>
	<div class="nutriInfoContainer">

		<div id="nutriInfoImgList">
			<a href="nutritionInfoDetail2"><img
				src="../../../dacham/resources/customerImage/broccoli.jpg"
				id="nutriInfoImg">

				<div class="overlay">
					<div class="text">미세먼지 기승, 녹차・브로콜리로 예방하세요!</div></a>
		</div>
	</div>
	</div>

</td>
<td>

	<div class="nutriInfoContainer">

		<div id="nutriInfoImgList">
			<a href="nutritionInfoDetail"><img
				src="../../../dacham/resources/customerImage/shutterstock.jpg"
				id="nutriInfoImg">

				<div class="overlay">
					<div class="text">'야채와 건강'</div></a>
		</div>
	</div>
	</div>
	</td>
	</tr>

<tr>
<td>
	<div class="nutriInfoContainer">

		<div id="nutriInfoImgList">
			<a href="nutritionInfoDetail"><img
				src="../../../dacham/resources/customerImage/fruit.jpg"
				id="nutriInfoImg">

				<div class="overlay">
					<div class="text">'당뇨와 과일'</div></a>
		</div>
	</div>
	</div>
</td>

<td>
	<div class="nutriInfoContainer">

		<div id="nutriInfoImgList">
			<a href="nutritionInfoDetail"><img
				src="../../../dacham/resources/customerImage/gusal.jpg"
				id="nutriInfoImg">

				<div class="overlay">
					<div class="text">'질병과 현미'</div></a>
		</div>
	</div>
	</div>
</td>

<td>
	<div class="nutriInfoContainer">

		<div id="nutriInfoImgList">
			<a href="nutritionInfoDetail"><img
				src="../../../dacham/resources/customerImage/salmon.jpg"
				id="nutriInfoImg">

				<div class="overlay">
					<div class="text">'슈퍼푸드 연어'</div></a>
		</div>
	</div>
	</div>
</td>
</tr>
</table>



	</div>





</body>
</html>