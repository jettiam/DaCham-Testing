<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>DaCham 다참</title>
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
	height: 50px;
	background-color: #8A9D60;
}
#mainShowNutriTable{
margin: 0 auto;
display:none;
}

#mainRightWrap {
	position: relative;
	float: right;
}

#myNutriInfo {
	max-width: 280px;
	height: 140px;
	background-color: #EDA900;
}

img {
	max-width: 100%;
	height: auto;
}
td img{
	width:140px;
	height:120px;	
	}


@media only screen and (max-width: 500px) {
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
						<td><a href="detailOrder?dietCode=1"><img src="../../dacham/resources/customerImage/dietImg/d01.JPG"
							id=mainMenuImg class="mainMenuImg1"></a></td>
						<td><a href="detailOrder?dietCode=2"><img src="../../dacham/resources/customerImage/dietImg/d02.JPG"
							class="mainMenuImg2"></a></td>
					</tr>

					<tr>
						<td><a href="detailOrder?dietCode=3"><img src="../../dacham/resources/customerImage/dietImg/d03.JPG"
							class="mainMenuImg3"></a></td>
						<td><a href="detailOrder?dietCode=3"><img src="../../dacham/resources/customerImage/dietImg/d05.JPG"
							class="mainMenuImg4"></a></td>
					</tr>

					<tr>
						<td><a href="detailOrder?dietCode=2"><img src="../../dacham/resources/customerImage/dietImg/m16.JPG"
							class="mainMenuImg5"></a></td>
						<td><a href="detailOrder?dietCode=1"><img src="../../dacham/resources/customerImage/dietImg/d20.JPG"
							class="mainMenuImg6"></a></td>
					</tr>
				</table>
			</div>

			<div id="mainNutriBox">
				<!-- 각 식단의 간략한 영양정보 -->
				<table id = "mainShowNutriTable" class="table-bordered text-center mainNT1">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>

<table id = "mainShowNutriTable" class="table-bordered text-center mainNT2">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">583.3kcal</td>
<td class="NutriTable">57.2mg</td>
<td class="NutriTable">50.3g</td>
<td class="NutriTable">30.5g</td>
</tr>
</table>

<table id = "mainShowNutriTable" class="table-bordered text-center mainNT3">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">566.2kcal</td>
<td class="NutriTable">53.2mg</td>
<td class="NutriTable">56.3g</td>
<td class="NutriTable">18.5g</td>
</tr>
</table>

			</div>
		</div>
	</div>
	<script>
	$(function(){
		$('.mainMenuImg1').mouseover(function(){
			$('.mainNT1').show();
		});
		$('.mainMenuImg1').mouseout(function(){
			$('.mainNT1').hide();
		});
		$('.mainMenuImg2').mouseover(function(){
			$('.mainNT2').show();
		});
		$('.mainMenuImg2').mouseout(function(){
			$('.mainNT2').hide();
		});
		$('.mainMenuImg3').mouseover(function(){
			$('.mainNT3').show();
		});
		$('.mainMenuImg3').mouseout(function(){
			$('.mainNT3').hide();
		});
		
		$('.mainMenuImg4').mouseover(function(){
			$('.mainNT1').show();
		});
		$('.mainMenuImg4').mouseout(function(){
			$('.mainNT1').hide();
		});
		$('.mainMenuImg5').mouseover(function(){
			$('.mainNT2').show();
		});
		$('.mainMenuImg5').mouseout(function(){
			$('.mainNT2').hide();
		});
		$('.mainMenuImg6').mouseover(function(){
			$('.mainNT3').show();
		});
		$('.mainMenuImg6').mouseout(function(){
			$('.mainNT3').hide();	
		
		});
	});
	</script>
</body>
</html>