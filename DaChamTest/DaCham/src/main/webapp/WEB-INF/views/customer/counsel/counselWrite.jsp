<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
 #counselWriteWrap{ 
 
	width: 600px; 
	height: 100%; 
	margin: 0 auto; 
 	/*text-align: center;*/
 } 

</style>
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
	$(document).ready(function(){
		$("#insert").on("click",function(){			
			$("form").submit();
		});
		$("#cancle").on("click",function(){
			window.location.href = "counsel";
		});
	});
</script>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<div id="counselWriteWrap">
	 <div class="form-inline">
	<form method = "post" action="write" >
		<label for="exampleInputName2">문의분류</label>
		<select class="form-control" id="exampleInputName2" name = "counselItemCode">
			<option value="1">식단문의</option>
			<option value="2">특별식단</option>
			<option value="3">배송문의</option>
			<option value="4">기타문의</option>
		</select>
		
		<label for="exampleInputName2">아이디</label> 
		<input type = "text" class="form-control " id="exampleInputName2" name = "customer" value = "${sessionScope.customerId}" readonly><br><br>
		</div>
						
		<div class="col-sm-10">
		 <input type = "text" class="form-control" id="disabledInput"  name ="counselTitle" placeholder = "TITLE">
		<br>
		 <textarea name = "counselContent" class="form-control" rows="10"></textarea><br>
		
	</form>
	<div>
		<button id = "insert" class="btn btn-warning myPageBtn">등록</button>
		<button id = "cancle" class="btn btn-warning myPageBtn">취소</button>
		</div>
	</div>
	</div>
</body>
</html>