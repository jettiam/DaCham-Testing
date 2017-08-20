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
		<div>
		</div>
			<button id="regist" class="btn btn-default">위자드 등록</button>
			<button id="modify" class="btn btn-primary">위자드 수정(프로토 발표용)</button>

	<div class="align_bottom">
	<img class="center-block" src="resources/bottom_bg.png"/>
	</div>
	<h1>안녕ㅇ하세요</h1>
	<h1>안녕ㅇ하세요</h1><h1>안녕ㅇ하세요</h1><h1>안녕ㅇ하세요</h1>
</body>
</html>