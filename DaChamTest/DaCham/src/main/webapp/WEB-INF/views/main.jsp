<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>DaCham 다참</title>
<!-- 메인페이지 기본 틀을 위한 임시 CSS -->
<style>
table,td,tr,tbody{
	margin:0;
	padding:0;
	border:0;
}
#mainImgWrap{
padding:0px;
}
#nutriInfoWrap{
padding:0px;}
#myNutriInfo{
padding:0px;
}
#mainMenuImgs{
padding:0px;
}
#mainNutriBox{
padding:0px;}
#mainShowNutriTable{
margin-top:10px;
display:none;}
</style>
</head>
<body>
	<div>
		<%@include file="clientNavi.jsp"%><!-- 네비게이션 삽입 -->
	</div>

	<div id="mainContent" class="container">
	<div class="row">
		<div class="col-sm-9" id="mainImgWrap">
			<!-- 메인페이지 메인이미지 -->
			<img class="img-responsive" src="../../dacham/resources/customerImage/dmain.jpg">
		</div>


		<div class="col-sm-3" id="nutriInfoWrap">		
			<div class="col-sm-12" id="myNutriInfo"></div>
			<div id="mainMenuImgs" class="col-sm-12">
				<!-- 로그인박스 하단 작은 사이즈 식단 이미지 -->
				<table>
					<tr>
						<td><a href="detailOrder?dietCode=1"><img src="../../dacham/resources/customerImage/dietImg/d01.JPG"
							id=mainMenuImg class="mainMenuImg1 img-responsive"></a></td>
						<td><a href="detailOrder?dietCode=2"><img src="../../dacham/resources/customerImage/dietImg/d02.JPG"
							class="mainMenuImg2 img-responsive"></a></td>
					</tr>

					<tr>
						<td><a href="detailOrder?dietCode=3"><img src="../../dacham/resources/customerImage/dietImg/d03.JPG"
							class="mainMenuImg3 img-responsive"></a></td>
						<td><a href="detailOrder?dietCode=3"><img src="../../dacham/resources/customerImage/dietImg/d05.JPG"
							class="mainMenuImg4 img-responsive"></a></td>
					</tr>

					<tr>
						<td><a href="detailOrder?dietCode=2"><img src="../../dacham/resources/customerImage/dietImg/m16.JPG"
							class="mainMenuImg5 img-responsive"></a></td>
						<td><a href="detailOrder?dietCode=1"><img src="../../dacham/resources/customerImage/dietImg/d20.JPG"
							class="mainMenuImg6 img-responsive"></a></td>
					</tr>
				</table>
			</div>

			<div id="mainNutriBox" class="col-sm-12">
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