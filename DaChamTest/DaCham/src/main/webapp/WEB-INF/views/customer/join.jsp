<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>다참 회원가입</title>
<style>
.h1Join{
	padding:20px;
}
#idCheck{
	color:red;
}
#trueId{
	color:black;
}
</style>
<script>
	$(document).ready(function() {
		$("#id").blur(function(){
			//alert("블러 돌아감")
			var id = $("#id").val();
			if(id==""){
				$("#idCheck").html("아이디를 입력해주세요.");
			}else{
				$.getJSON("idCheck/"+id, function(data){					
					var idCheck = data.idCheck
					console.log(idCheck);
					if(idCheck==1){
						$("#idCheck").html("사용 중인 아이디입니다.");
					}else{
						$("#idCheck").html("<span id='trueId' data-id='true'>사용할 수 있는 아이디입니다.</span>");
					}
				});
			}			
		});
		$("#password").blur(function(){
			var passwdLength = $("#password").val().length;
			if(passwdLength<6 || passwdLength>18){
				$("#passwd").css("color","red");
				$("#passwd").attr("data-passwd","false");
			}else{
				$("#passwd").css("color","black");
				$("#passwd").attr("data-passwd","true");
			}
		});
	});
</script>
</head>
<body>
	<%@include file="../clientNavi.jsp"%>
	<div class="container">
	<h1 class="text-center h1Join">다참 회원가입</h1>	
		<form action="join" method="post" class="form-horizontal">
			<div class="form-group">
				<label for="id" class="control-label col-sm-2 col-sm-offset-1">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id" class="form-control ">
				</div>
				<div class="col-sm-4" id="idCheck"></div>
			</div>
			<div class="form-group">
				<label for="password" class="control-label col-sm-2 col-sm-offset-1">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="password" name="passwd" class="form-control ">
				</div>
				<div class="col-sm-4" id="passwd" data-passwd="false">비밀번호 길이 6~18자</div>
			</div>
			<div class="form-group">
				<label for="RePassword" class="control-label col-sm-2 col-sm-offset-1">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" id="rePassword" name="rePasswd" class="form-control ">
				</div>
				<div class="col-sm-4" id="passwdCheck">비밀번호가 틀립니다.</div>
			</div>
			<div class="form-group">
				<label for="name" class="control-label col-sm-2 col-sm-offset-1">성명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control ">
				</div>				
			</div>
			<div class="form-group">
				<label for="tel" class="control-label col-sm-2 col-sm-offset-1">휴대폰번호</label>
				<div class="col-sm-3">
					<input type="tel" id="tel" name="tel" class="form-control ">
				</div>				
			</div>
			<div class="form-group">
				<label for="email" class="control-label col-sm-2 col-sm-offset-1">이메일</label>
				<div class="col-sm-3">
					<input type="email" id="email" name="email" class="form-control ">
				</div>				
			</div>
			<div class="form-group">
				<label for="adress" class="control-label col-sm-2 col-sm-offset-1">주소</label>
				<div class="col-sm-3">
					<input type="text" id="adress" name="adress" class="form-control ">
				</div>				
			</div>
			<div class="form-group text-center">
				<input type="submit" class="btn btn-primary" value="회원가입">
				<input type="button" class="btn btn-primary" value="취소">
			</div>
		</form>
		</div>
	
</body>
</html>