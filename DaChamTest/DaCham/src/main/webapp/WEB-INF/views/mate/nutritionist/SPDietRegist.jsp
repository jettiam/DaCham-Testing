<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#cancle").click(function(){
			window.location.href = "special";
		});
	});
</script>
</head>
<body>
<%@include file="nutritionistNavi.jsp" %>
	<div class = "container">
		<h1>특별식단 등록 페이지</h1>
		<div>
			<button>등록</button>
			<button id = "cancle">취소</button>
		</div>
	</div>
</body>
</html>