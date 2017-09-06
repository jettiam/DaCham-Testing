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
 
 
 .love-hate {
  display: inline-block;
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  position: relative;
  padding: 20px;
  border: none;
  font: normal 100px/1 "Oswald", Helvetica, sans-serif;
  color: #e74c3c;
  text-align: center;
  -o-text-overflow: ellipsis;
  text-overflow: ellipsis;
  letter-spacing: 15px;
  text-shadow: 1px 1px 1px rgba(0,0,0,0.2) ;
}

.love-hate::after {
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  z-index: -1;
  position: absolute;
  content: "WizardManual";
  top: 34px;
  left: 28px;
  padding: 20px;
  border: none;
  font: normal 77px/1 "Oswald", Helvetica, sans-serif;
  color: rgba(255,255,255,0.2);
  text-align: center;
  -o-text-overflow: ellipsis;
  text-overflow: ellipsis;
  letter-spacing: 23px;
  text-shadow: 1px 1px 1px rgba(0,0,0,0.2) ;
  -webkit-transform: rotateX(50deg)   skewX(-30deg);
  transform: rotateX(50deg)   skewX(-30deg);
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
	<div class="text-center">
	<div class="text-center love-hate">WizardManual</div>
	</div>
	
	<link async href="http://fonts.googleapis.com/css?family=Oswald" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>
	
	
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