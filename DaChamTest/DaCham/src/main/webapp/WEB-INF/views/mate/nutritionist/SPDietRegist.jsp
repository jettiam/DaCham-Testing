<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="nutritionistNavi.jsp" %>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#cancle").click(function(){
			window.location.href = "special";
		});
	});
</script>
</head>
<body>
	<h1>특별식단 등록 페이지</h1>
	<div>
		<button>등록</button>
		<button id = "cancle">취소</button>
	</div>
</body>
</html>