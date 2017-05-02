<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src = "http://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- 고객 로그인 전용 페이지 -->
	<h1>다참 고객 로그인 페이지032</h1>
	<form method="post" action = "memberLogin">
		아이디: <input type = "text" name = "id"><br>
		비밀번호: <input type = "password" name = "pw"><br>
		<input type = "submit" value = "로그인">
	</form>
	
	<input id="loginResult" type="hidden" value="${result}"/>
</body>
<!--  -->
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