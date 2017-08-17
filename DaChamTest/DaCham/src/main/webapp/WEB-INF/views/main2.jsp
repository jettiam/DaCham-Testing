<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>DaCham::다참</title>
<style>
.btn{
	height:80px;
}
@media (max-width:768px){
.btn{
	height:100%;
	
}
</style>
</head>
<body>
<div class="container">
	<div style='text-align: center;'>
		<h1>DaCham</h1>
		<h2>다참 관리자 페이지</h2>
	</div>
	
		<form action="empLogin" method="post" class="form-horizontal center-block" style="max-width:800px;margin-top:50px">	
			<div class="col-sm-8">
			<div class="form-group">
				<label class="control-label col-sm-4">아이디</label>
				<div class="col-sm-8">
				<input type="text" class="form-control" name="emp_id" placeholder="아이디">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4">비밀번호</label>
				<div class="col-sm-8">
				<input type="password" class="form-control" name="emp_pw" placeholder="비밀번호">
				</div>
			</div>
			</div>
			<div class="col-sm-4">
			<button type="submit" class="btn btn-primary col-sm-5">로그인</button>
			</div>	
		</form>
	</div>
	<input id="loginResult" type="hidden" value="${result}" />
</body>
<script>
	$(document).ready(function() {
		var result = $("#loginResult").val();
		if (result == "0") {
			alert("비밀번호가 틀렸습니다. 다시 확인해주세요.");
		} else if (result == "-1") {
			alert("아이디가 존재하지 않습니다.");
		} else {
		}
	});
</script>


</html>