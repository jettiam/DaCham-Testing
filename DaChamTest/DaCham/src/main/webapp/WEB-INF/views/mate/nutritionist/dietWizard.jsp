<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="nutritionistNavi.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<script>
	$(document).ready(function(){
		$("#regist").click(function(){
			window.open("wizardMod", "", 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
		});
		
		$("#modify").click(function(){
			window.open("wizardTestGet", "", 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');		
		});
	});
</script>
<title></title>
</head>

<body>

	<div>
		<input type = "datetime" name = "datetime" placeholder = "최근 위자드 갱신일" readonly>
		<button id = "regist">위자드 등록</button>
		<button id = "modify">위자드 수정(프로토 발표용)</button>
	</div>
</body>
</html>