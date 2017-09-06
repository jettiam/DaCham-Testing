<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>DaCham 다참</title>

<script>
	$(window).scroll(function() {
		$(".slideanim").each(function() {
			var pos = $(this).offset().top;

			var winTop = $(window).scrollTop();
			if (pos < winTop + 600) {
				$(this).addClass("slide");
			}
		});
	});

	$(document).ready(function() {
		$("#blockShrimp").hide();

		$("#divShrimp").on("click", function() {
			$("#blockShrimp").show("slow");
		})
		
		
	
	// When the user clicks on <span> (x), close the modal
	$("span.close").on("click", function() { 
	   $(".modal").attr("style", "display : none");
	});
	});
	
	
	
</script>
<!-- 메인페이지 기본 틀을 위한 임시 CSS -->
<style>
.container {
	padding: 30px;
}

.mainWrap {
	position: relative;
}

#mainContent {
	padding: 30px 50px;
}

.slideanim {
	visibility: hidden;
}

.slide {
	animation-name: slide;
	-webkit-animation-name: slide;
	animation-duration: 1s;
	-webkit-animation-duration: 1s;
	visibility: visible;
}

.carousel-inner {
	position: absolute;
	top: 40%;
}

.item div h3 {
	line-height: 1.375em
}

#myCarousel {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	opacity: 1;
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #fff;
}

.img_top {
	opacity: 0.7;
	filter: alpha(opacity = 70); /* For IE8 and earlier */
	display: block;
}

@
keyframes slide { 0% {
	opacity: 0;
	transform: translateY(70%);
}

100%
{
opacity






:



 



1;
transform






:



 



translateY






(0%);
}
}
@
-webkit-keyframes slide { 0% {
	opacity: 0;
	-webkit-transform: translateY(70%);
}

100%
{
opacity






:



 



1;
-webkit-transform






:



 



translateY






(0%);
}
}
@media screen and (max-width: 768px) {
	.col-sm-4 {
		text-align: center;
		margin: 25px 0;
	}
	.btn-lg {
		width: 100%;
		margin-bottom: 35px;
	}
}

@media screen and (max-width: 480px) {
	.logo {
		font-size: 150px;
	}
}


.column {
	float: left;
	margin: 0 2.5% 1em 0;
	width: 22.5%;
	
}
.column:hover {opacity: 0.7;}
.column:nth-child(4n) {
	margin-right: 0;
}

.column:nth-child(4n+1) {
	clear: left;
}

#blockShrimp{	
}

.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}
.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 100; /* Sit on top */
    padding-top: 40px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
  
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}
.modal-content{
	 margin: auto;
    display: block;
    width: 100%;
    max-width: 656px;
}


</style>
</head>
<body>
	<%@include file="clientNavi.jsp"%><!-- 네비게이션 삽입 -->
	<div class="mainWrap">
		<img class="img_top" src='resources/customerImage/mainTop.jpg' />
		<div id="myCarousel" class="carousel  slide text-center hidden-xs"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<div>
						<h3>
							"질환 상태에 맞는 맞춤식단"<br>
							<p>다참의 식단 위자드를 사용한 맞춤식단 제공</p>
						</h3>
					</div>
				</div>
				<div class="item">
					<div>
						<h3>
							"직접 만드는 건강한 식단"<br>
							<p>전문 영양사가 작성한 식단에서 원하는 음식으로 변경</p>
						</h3>
					</div>
				</div>
				<div class="item">
					<div>
						<h3>
							"조리부터 배송까지"<br>
							<p>건강한 재료를 엄선하여 정성을 다해 만듭니다</p>
						</h3>
					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>



	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<img src="resources/customerImage/egg.png" class="">
			</div>
			<div class="col-sm-4">
				<h3>살충제 달걀 걱정 NO!</h3>
				<br>
				<p class="lead">저희 다참은 살충제 성분이 검출되지 않은 농장에서 직접 달걀을 구매하고있습니다.</p>
			</div>

			<div class="col-sm-4">
				<img src="resources/customerImage/dachamlogo.png" class="slideanim">
			</div>
		</div>
	</div>
	<!-- <div class="container">	
		<div class="row">
		    <div class="col-sm-4">
		      <img src="resources/customerImage/dachamlogo.png" class="slideanim">
		    </div>
		    <div class="col-sm-8">
		      <h3>다참</h3><br>
		     
		    </div>
		 </div>
	</div> -->

	<div id="mainContent" class="container"></div>

	<!-- 인스타그램 영역 -->
	<div class="container">
		<div class="row">
			<a target="_blank" href="https://www.instagram.com/dacham_official/">
				<img class="img-responsive" src="resources/dacham_insta.png"
				style="width: 254px; margin-bottom: 5px;" />
			</a>
		</div>
		<div class="row">

			<div class="columns">
				<div id="divShrimp" class="column">
					<img src="resources/insta/shrimp.jpg" />
				</div>
				<div class="column">
					<img src="resources/insta/shrimp.jpg" />
				</div>
				<div class="column">
					<img src="resources/insta/shrimp.jpg" />
				</div>
				<div class="column">
					<img src="resources/insta/shrimp.jpg" />
				</div>
			</div>
		</div>
		
		
		<div id="blockShrimp" class="modal">
		<span class="close">x</span>
		<span class="modal-content">
		<blockquote class="instagram-media" data-instgrm-captioned
			data-instgrm-version="7"
			style="background: #FFF; border: 0; border-radius: 3px; box-shadow: 0 0 1px 0 rgba(0, 0, 0, 0.5), 0 1px 10px 0 rgba(0, 0, 0, 0.15); margin: 1px; max-width: 658px; padding: 0; width: 99.375%; width: -webkit-calc(100% - 2px); width: calc(100% - 2px);">
			<div style="padding: 8px;">
				<div
					style="background: #F8F8F8; line-height: 0; margin-top: 40px; padding: 50.0% 0; text-align: center; width: 100%;">
					<div
						style="background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAMAAAApWqozAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAMUExURczMzPf399fX1+bm5mzY9AMAAADiSURBVDjLvZXbEsMgCES5/P8/t9FuRVCRmU73JWlzosgSIIZURCjo/ad+EQJJB4Hv8BFt+IDpQoCx1wjOSBFhh2XssxEIYn3ulI/6MNReE07UIWJEv8UEOWDS88LY97kqyTliJKKtuYBbruAyVh5wOHiXmpi5we58Ek028czwyuQdLKPG1Bkb4NnM+VeAnfHqn1k4+GPT6uGQcvu2h2OVuIf/gWUFyy8OWEpdyZSa3aVCqpVoVvzZZ2VTnn2wU8qzVjDDetO90GSy9mVLqtgYSy231MxrY6I2gGqjrTY0L8fxCxfCBbhWrsYYAAAAAElFTkSuQmCC); display: block; height: 44px; margin: 0 auto -44px; position: relative; top: -22px; width: 44px;"></div>
				</div>
				<p style="margin: 8px 0 0 0; padding: 0 4px;">
					<a href="https://www.instagram.com/p/BYabscWDJEW/"
						style="color: #000; font-family: Arial, sans-serif; font-size: 14px; font-style: normal; font-weight: normal; line-height: 17px; text-decoration: none; word-wrap: break-word;"
						target="_blank">다참과 함께 하는 건강한 식생활 🎶 다참 가족 여러분은 새우의 효능에 대해
						아시나요? . 새우는 특히 고혈압 예방과 동맥경화 방지에 좋습니다. 새우는 종류가 매우 다양한데요~ ㅎㅎ
						고단백❗️저지방❗️당질 제로❗️랍니다. . . (그렇지만 통풍의 원인인 요산을 증가시키는 퓨린을 많이 만들기 때문에
						요산 수치가 높은사람은 주의 해 주세요!) . . 🚫다참은 정식 런칭된 서비스가 아닌 컴퓨터정보계열 캡스톤 디자인
						프로젝트 입니다.</a>
				</p>
				<p
					style="color: #c9c8cd; font-family: Arial, sans-serif; font-size: 14px; line-height: 17px; margin-bottom: 0; margin-top: 8px; overflow: hidden; padding: 8px 0 7px; text-align: center; text-overflow: ellipsis; white-space: nowrap;">
					다참(@dacham_official)님의 공유 게시물님,
					<time
						style="font-family: Arial, sans-serif; font-size: 14px; line-height: 17px;"
						datetime="2017-08-30T09:31:57+00:00">2017 8월 30 오전 2:31 PDT</time>
				</p>
			</div>
		</blockquote>
		</span>
		<script async defer src="//platform.instagram.com/en_US/embeds.js"></script>		
		</div>
	</div>

	
	
	
	
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
</body>
</html>