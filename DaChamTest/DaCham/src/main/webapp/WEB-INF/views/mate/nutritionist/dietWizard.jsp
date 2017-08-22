<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
	.align_bottom{	
	width : 100%;
    position: fixed;
  	bottom: 0;
  	z-index: -100;
  	}
  	
  	
  	#wizardManual{
  		height: 300px;
  	}
  	
  	#wizardButton {
  		height: 300px;
  	}
  	.a {
  		margin-top: 70px;
  	}
  	
  	.a>div {		
  		font-size : 1.25em;
  	}
  	.a>div>h1{
  		text-align : center;
  	}
  	.wNum{
  		font-size: 2.3em;
  		color: #3B65E8;
  	}
  	.wb {
  		width: 300px;
  		height : 100px;
  	}
  	#title{
  		padding: 20px;
  		
  		color: #773E2D;
  		text-shadow: #000000 0px 0px 30px; /* for browsers without spread support */
  text-shadow: #000000 0px 0px 10px 30px; /* for browsers with spread support */
  		
  	}
  	#wizardButton{
  		text-align: center;
  	}
  	#wizardButton>button{
  		font-size: 1.125em;
  		margin: 20px;
  	}
 
#header {
  margin: 0;
  
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  background: black;
  color: #ccc;
}



#header::before,
#header::after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: .5vmin;
  height: .5vmin;
  border-radius: 50%;
  color: transparent;
}



#header::before {
  box-shadow: 30vw 90vh .2vmin rgba(190,200,255,.9),
              93vw 64vh .2vmin rgba(190,200,255,.9),
              75vw 80vh .2vmin rgba(190,200,255,.9),
              37vw 24vh .2vmin rgba(190,200,255,.9),
              83vw 58vh .2vmin rgba(190,200,255,.9),
              12vw 36vh .2vmin rgba(190,200,255,.9),
              62vw 82vh .2vmin rgba(190,200,255,.9),
              87vw 91vh .2vmin rgba(190,200,255,.9),
              9vw 2vh .2vmin rgba(190,200,255,.9),
              99vw 46vh .2vmin rgba(190,200,255,.9),
              39vw 86vh .2vmin rgba(190,200,255,.9),
              48vw 42vh .2vmin rgba(190,200,255,.9),
              53vw 24vh .2vmin rgba(190,200,255,.9),
              63vw 42vh .2vmin rgba(190,200,255,.9),
              2vw 53vh .2vmin rgba(190,200,255,.9),
              67vw 11vh .2vmin rgba(190,200,255,.9),
              32vw 44vh .2vmin rgba(190,200,255,.9),
              0vw 82vh .2vmin rgba(190,200,255,.9),
              51vw 47vh .2vmin rgba(190,200,255,.9),
              74vw 30vh .2vmin rgba(190,200,255,.9);
}

#header::after {
  box-shadow: 80vw 64vh .1vmin rgba(200,255,230,.7),
              32vw 45vh .1vmin rgba(200,255,230,.7),
              65vw 62vh .1vmin rgba(200,255,230,.7),
              22vw 55vh .1vmin rgba(200,255,230,.7),
              68vw 19vh .1vmin rgba(200,255,230,.7),
              54vw 34vh .1vmin rgba(200,255,230,.7),
              1vw 56vh .1vmin rgba(200,255,230,.7),
              95vw 1vh .1vmin rgba(200,255,230,.7),
              60vw 93vh .1vmin rgba(200,255,230,.7),
              14vw 82vh .1vmin rgba(200,255,230,.7),
              6vw 64vh .1vmin rgba(200,255,230,.7),
              19vw 12vh .1vmin rgba(200,255,230,.7),
              25vw 39vh .1vmin rgba(200,255,230,.7),
              21vw 36vh .1vmin rgba(200,255,230,.7),
              4vw 10vh .1vmin rgba(200,255,230,.7),
              85vw 70vh .1vmin rgba(200,255,230,.7),
              54vw 93vh .1vmin rgba(200,255,230,.7),
              9vw 46vh .1vmin rgba(200,255,230,.7),
              63vw 59vh .1vmin rgba(200,255,230,.7),
              48vw 28vh .1vmin rgba(200,255,230,.7);
}

#header>h1 {
  margin: 0;
  height: 12vmin;
  width: 120vmin;
  display: flex;
  justify-content: center;
  position: relative;
}

h1::before {
  content: "";
  display: block;
  position: absolute;
  z-index: -1;
  top: -26vmin;
  left: 29vmin;
  width: 62vmin;
  height: 62vmin;
  border-radius: 50%;
  border: 1.3vmin solid currentColor;
  box-sizing: border-box;
}

em {
  font-family: 'Josefin Sans', sans-serif;
  color: currentColor;
  font-size: 41px;
  position: relative;
  font-style: normal;
  width: 20vmin;
  text-align: center;
}

em.planet {
  -webkit-animation: planet-rotate 4s linear infinite;
  animation: planet-rotate 4s linear infinite;
  position: relative;
}

em.planet::before {
  content: "";
  position: absolute;
  top: -.5vmin;
  left: 3.5vmin;
  z-index: -1;
  width: 13vmin;
  height: 13vmin;
  border-radius: 50%;
  background: black;
}

em.planet.left {
  -webkit-transform-origin: 40vmin 5vmin;
  transform-origin: 40vmin 5vmin;
}

em.planet.right {
  -webkit-transform-origin: -20vmin 5vmin;
  transform-origin: -20vmin 5vmin;
}

@-webkit-keyframes planet-rotate {
  to {
    -webkit-transform: rotate(1turn);
  }
}

@keyframes planet-rotate {
  to {
    transform: rotate(1turn);
  }
}
</style>
<script>
	$(document).ready(function(){
		$("#wizard").addClass("w3-light-gray");
		$("#regist").click(function(){
			window.open("wizardMod", "", 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
		});
		
		$("#modify").click(function(){
			window.open("wizardTestGet", "", 'height=' + screen.height + ',width=' + screen.width + ', fullscreen=yes');		
		});
	});
</script>
<title>식단 위자드 관리</title>
</head>

<body>
	<%@include file="nutritionistNavi.jsp"%>	

			
	
	<div class="align_bottom">
	<img class="center-block" src="resources/bottom_bg.png"/>
	</div>
	
	
	<!-- 여기서 부터 내용 -->
	 <link href='https://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
	 <div id="header" >
	<h1>
  <em>WI</em>
  
  <em class="planet left">O</em>
  <em>Z</em>
  <em>A</em>
  <em class="planet right">O</em>
  <em>RD</em>
	</h1>
	</div>
	
	
	
	<h1 class="a" style="text-align : center;"><b id="title">위자드 제작 설명서</b></h1>
	
	<div class="container">
    <div class="a row">
        <div id="wizardManual" class="col-md-offset-1 col-md-6">
       
        	<h1><b>How To Use</b></h1> 
        	<br>
        	<span class="wNum">One.</span> Chrome으로 사용해주세요.<br>
        	<span class="wNum">Two.</span> 드래그앤드롭으로 조합 해 주세요.<br>
        	<span class="wNum">Three.</span> 그래프를 보며 빠진 질문지를 작성하세요.<br>
        </div>
        <div id="wizardButton" class="col-md-4">
        	<button id="regist" class="wb btn btn-warning btn-3d">위자드 등록</button>
			<button id="modify" class="wb btn btn-danger btn-3d">위자드 수정</button></div>
    </div>
</div>
	
</body>
</html>