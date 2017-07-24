<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
	$(document).ready(function () {
		$("#update").click(function () {
			$("#form").submit();
		});
	});
</script>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<div class="container">
<div id="counselWriteWrap">
<form method = "post" action="counselUpdate" id="form">
	 <div class="form-inline form-group">	
		<label for="counselItemCode">문의분류</label>
		<select class="form-control" id="counselItemCode" name = "counselItemCode">
			<option value="1">식단문의</option>
			<option value="2">특별식단</option>
			<option value="3">배송문의</option>
			<option value="4">기타문의</option>
		</select>
		
		<label for="customerId">아이디</label> 
		<input type = "text" class="form-control " id="exampleInputName2" name = "customerId" value = "${sessionScope.customerId}" readonly>
	</div>
					
		<div class="form-group">
		 <input type = "text" class="form-control" id="disabledInput"  name ="counselTitle" value="${read.counselTitle }">
		</div>
		<div class="form-group">
		 <textarea name = "counselContent" class="form-control" rows="10">${read.counselContent }</textarea><br>
		
		</div>
		<input type="hidden" name="counselCode" value="${read.counselCode }">
	</form>
	<div class="form-group">
		<button id = "update" class="btn btn-warning myPageBtn">등록</button>
		<button id = "cancle" class="btn btn-warning myPageBtn">취소</button>
	</div>
</div>
</div>
</body>
</html>