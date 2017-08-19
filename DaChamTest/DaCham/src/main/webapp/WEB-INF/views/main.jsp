<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>DaCham 다참</title>
<script>
$(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
</script>
<!-- 메인페이지 기본 틀을 위한 임시 CSS -->
<style>
.container{
	padding:30px;
}
	.mainWrap{
	position:relative;
	}
 #mainContent{
      padding: 30px 50px;
  }
 .slideanim {visibility:hidden;}
 .slide {
      animation-name: slide;
      -webkit-animation-name: slide;
      animation-duration: 1s;
      -webkit-animation-duration: 1s;
      visibility: visible;
  }
  .carousel-inner{
  	position: absolute;
  	top:40%;
  }
  .item div h3{
  	line-height: 1.375em
  }
 #myCarousel{
	position: absolute;
	top: 0 ;
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
    filter: alpha(opacity=70); /* For IE8 and earlier */
    display: block;
	}
@keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
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
</style>
</head>
<body>
<%@include file="clientNavi.jsp"%><!-- 네비게이션 삽입 -->
	<div class="mainWrap">
		<img class="img_top" src='resources/customerImage/mainTop.jpg'/>
		<div id="myCarousel" class="carousel  slide text-center hidden-xs" data-ride="carousel">
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
        <h3>"질환 상태에 맞는 맞춤식단"<br><p>다참의 식단 위자드를 사용한 맞춤식단 제공</p></h3>
        </div>
      </div>
      <div class="item">
      	<div>
          <h3>"직접 만드는 건강한 식단"<br><p>전문 영양사가 작성한 식단에서 원하는 음식으로 변경</p></h3>
        </div>
      </div>
      <div class="item">
      	<div>
          <h3>"조리부터 배송까지"<br><p>건강한 재료를 엄선하여 정성을 다해 만듭니다</p></h3>
        </div>
      </div>     
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
	</div>
  

	
	<div class="container">	
		<div class="row">
		  
		    <div class="col-sm-8">
		      <h3>살충제 달걀 걱정 NO!</h3><br>
		      <p class="lead">저희 다참은 살충제 성분이 검출되지 않은 농장에서 직접 달걀을 구매하고있습니다.<br>
		      안심하시고 드셔도 됩니다.</p>
		      
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

	<div id="mainContent" class="container">
	</div>
	<footer>
		<%@include file="footer.jsp"%>
	</footer>
</body>
</html>