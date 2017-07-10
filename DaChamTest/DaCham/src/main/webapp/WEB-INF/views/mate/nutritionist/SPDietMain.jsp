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
		$("#update").click(function(){
			window.location.href = "SPRegist";
		});
	});
</script>
<style>
	.buttonBox{
		float:right;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<%@include file="nutritionistNavi.jsp" %>
	<div class = "container">    
		<div class = "buttonBox">
			<button id = "update">수정</button>
			<button>삭제</button>
			
		</div>
		<div>
				<table class = "table table-hover">
					<tr>
						<th>번호</th>
						<th>고객id</th>
						<th>상담명</th>
						<th>상담일</th>
						<th>금액</th>
						<th>상태여부</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
		</div>
	</div>
</body>
</html>