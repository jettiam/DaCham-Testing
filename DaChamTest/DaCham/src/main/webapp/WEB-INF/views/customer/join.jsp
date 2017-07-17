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
#idCheck,#nameCheck,#passwdCheck,#addressCheck{
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
						$("#idCheck").attr("data-idCheck","false");
					}else{
						$("#idCheck").html("<span id='trueId'>사용할 수 있는 아이디입니다.</span>");
						$("#idCheck").attr("data-idCheck","true");
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
		$("#rePassword").blur(function(){
			var password = $("#password").val();
			var rePassword=$("#rePassword").val();
			if(password == rePassword){
				$("#passwdCheck").html("");
				$("#passwdCheck").attr("data-passwdCheck","true");
			}else{
				$("#passwdCheck").html("비밀번호가 일치하지 않습니다.");
				$("#passwdCheck").attr("data-passwdCheck","false");
			}
		});
		$("#name").blur(function(){
			var name = $("#name").val();
			if(name==""){
				$("#nameCheck").html("이름을 입력하세요.");
				$("#nameCheck").attr("data-nameCheck","false");
			}else{
				$("#nameCheck").html("");
				$("#nameCheck").attr("data-nameCheck","true");
			}
		});
		$("#tel").blur(function(){
			var tel = $("#tel").val();			
			if(tel.match(/-/)=="-"){
				$("#telCheck").css("color","red");
				$("#telCheck").attr("data-telCheck","false");
			}else{
				$("#telCheck").css("color","black");
				$("#telCheck").attr("data-telCheck","true");
			}
		});
		
		$("#email").blur(function(){
			var tel = $("#email").val();			
			if(tel.match(/@/)!="@"){
				$("#emailCheck").html("이메일을 정확히 입력해주세요.");
				$("#emailCheck").css("color","red");
				$("#emailCheck").attr("data-emailCheck","false");
			}else{				
				$("#emailCheck").html("");
				$("#emailCheck").attr("data-emailCheck","true");
			}
		});
		
		$("#address").blur(function(){
			var name = $("#address").val();
			if(name==""){
				$("#addressCheck").html("주소를 입력하세요.");
				$("#addressCheck").attr("data-addressCheck","false");
			}else{
				$("#addressCheck").html("");
				$("#addressCheck").attr("data-addressCheck","true");
			}
		});		
		
		$("#joinRegist").click(function(){
			if($("#idCheck").attr("data-idCheck")=="false"){  
				alert("아이디를 확인해주세요.");
				return;
			}else if($("#passwd").attr("data-passwd")=="false" || $("#passwdCheck").attr("data-passwdCheck")=="false"){
				alert("비밀번호를 확인해주세요.");
				return;
			}else if($("#nameCheck").attr("data-nameCheck")=="false"){
				alert("이름을 확인해주세요.");
				return;
			}else if($("#telCheck").attr("data-telCheck")=="false"){
				alert("전화번호를 확인해주세요.");
				return;
			}else if($("#emailCheck").attr("data-emailCheck")=="false"){
				alert("이메일을 확인해주세요.");
				return;
			}else if($("#addressCheck").attr("data-addressCheck")=="false"){
				alert("주소를 확인해주세요.");
				return;
			}else{
				$("#joinForm").submit();
			}
		});
		$("#joinCancel").click(function(){
			window.location.href="main";
		});
	});
</script>
</head>
<body>
	<%@include file="../clientNavi.jsp"%>
	<div class="container">
	<h1 class="text-center h1Join">다참 회원가입</h1>	
		<form action="join" method="post" class="form-horizontal" id="joinForm">
			<div class="form-group">
				<label for="id" class="control-label col-sm-2 col-sm-offset-1">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id" class="form-control ">
				</div>
				<div class="col-sm-4" id="idCheck" data-idCheck="false"></div>
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
				<div class="col-sm-4" id="passwdCheck" data-passwdCheck="false"></div>
			</div>
			<div class="form-group">
				<label for="name" class="control-label col-sm-2 col-sm-offset-1">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control ">
				</div>
				<div class="col-sm-4" id="nameCheck" data-nameCheck="false"></div>				
			</div>
			<div class="form-group">
				<label for="tel" class="control-label col-sm-2 col-sm-offset-1">휴대폰번호</label>
				<div class="col-sm-3">
					<input type="tel" id="tel" name="tel" class="form-control ">
				</div>
				<div class="col-sm-4" id="telCheck" data-telCheck="false">"-" 입력하지 마세요.</div>				
			</div>
			<div class="form-group">
				<label for="email" class="control-label col-sm-2 col-sm-offset-1">이메일</label>
				<div class="col-sm-3">
					<input type="email" id="email" name="email" class="form-control ">
				</div>
				<div class="col-sm-4" id="emailCheck"></div>				
			</div>
			<div class="form-group">
				<label for="address" class="control-label col-sm-2 col-sm-offset-1">주소</label>
				<div class="col-sm-3">
					<input type="text" id="address" name="address" class="form-control ">
				</div>
					<div class="col-sm-4" id="addressCheck" data-addressCheck="false"></div>				
			</div>
			
		</form>
		<div class="text-center">
				<button id="joinRegist" class="btn btn-primary">회원가입</button>
				<button id="joinCancel" class="btn btn-primary">취소</button>
			</div>
		</div>
	
</body>
</html>