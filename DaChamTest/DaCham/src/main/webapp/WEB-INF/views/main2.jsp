<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>DaCham::다참</title>
</head>
<body>
	<div style='text-align: center;'>
		<h1>DaCham</h1>
		<h2>다참 관리자 페이지</h2>
	</div>
	
		<form style='width: 500px; margin: auto;' action="empLogin" method="post">
			<div style='padding: 10px;'>
				<div style='margin: 0px; padding: 0px; float: left;'>
					<label style='width: 100px;' class="col-lg-2 control-label">아이디</label>
					<div style='width: 250px' class="col-lg-10">
						<input type="text" class="form-control" name="emp_id"
							placeholder="아이디">
					</div>
	
					</br> <label style='width: 100px;' class="col-lg-2 control-label">비밀번호</label>
					<div style='width: 250px' class="col-lg-10">
						<input type="password" class="form-control" name="emp_pw"
							placeholder="비밀번호">
					</div>
				</div>
				
				<span style='float: left;'>
					<button style='width: 70px; height: 70px;' type="submit"
						class="btn btn-primary">로그인</button>
				</span>
			</div>
		</form>
	
	<input id="loginResult" type="hidden" value="${result}"/>
</body>
<script>
	$(document).ready(function(){
		var result = $("#loginResult").val();
		if(result == "0"){
			alert("비밀번호가 틀렸습니다. 다시 확인해주세요.");
		}
		else if(result == "-1"){
			alert("아이디가 존재하지 않습니다.");
		}else{
		}
	});	
</script>


</html>