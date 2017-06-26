<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
		$("#wizard").addClass("w3-light-gray");
		$("#regist").click(function(){
			window.open("wizardMod", "", 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
		});
		
		$("#modify").click(function(){
			window.open("wizardTestGet", "", 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');		
		});
	});
</script>
<title>식단 위자드 관리</title>
</head>

<body>
<%@include file="nutritionistNavi.jsp" %>
	<div class = "container">   
		<div>
			<input type = "datetime" name = "datetime" placeholder = "최근 위자드 갱신일" readonly>
			<button id = "regist" class = "btn btn-default">위자드 등록</button>
			<button id = "modify" class = "btn btn-primary">위자드 수정(프로토 발표용)</button>
		</div>
	</div>
</body>
</html>