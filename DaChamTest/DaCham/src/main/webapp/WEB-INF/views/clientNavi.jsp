<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->

<title>다참</title>
<!-- 상단 내비게이션 표시를 위한 임시 CSS -->
<style>


.liBox {
	
	font-size: 25px;
}
.loginWrap{
	margin-top:23px;
	margin-bottom:23px;
}
.logoBox{
	margin-bottom:15px;
}

#sideBox {
	float: right;
	margin-right: 10px;
	color: gray;
}

#infoBox {
	float: right;
	margin-right: 10px;
	color: gray;
}

#logo {
	margin-top: 10px;
	margin-left: 10px;
}


#infoBox a {
	color: #EDA900;
}

@media only screen and (max-width: 736px) {

}


</style>
<!-- 상단 내비게이션 표시를 위한 임시 CSS -->

</head>
<body>
	<div class="w3-row logoBox">
		<!-- 로고+고객정보 -->
		<div class="col-sm-2 hidden-xs" id="logo" >
			<!-- 로고박스 -->
			<a href="main"><img class="img-responsive block-center"
				src="resources/customerImage/dachamlogo.png"
				max-width="100px" max-height="100px"></a>
		</div>
		<!-- 고객 로그인 페이지 -->
		<c:if test="${empty sessionScope.memberName}">
			<div class="col-sm-4 col-sm-offset-5 loginWrap hidden-xs">
				<form method="post" action="main" class="loginBox">
					<div class="form-group col-sm-5">
						<input type="text" name="id" placeholder="ID"
							class="form-control">
					</div>
					<div class="form-group col-sm-5">
						<input type="password" name="pw" placeholder="Password"
							class="form-control">
					</div>
					<div class="form-group col-sm-2">
						<input type="submit" class="btn btn-warning" value="로그인">
					</div>
				</form>

			</div>
		</c:if>
		<c:if test="${not empty sessionScope.memberName}">
			<div id="infoBox" class="col-sm-4 col-sm-offset-5 loginWrap hidden-xs">
				<!-- 고객이름 출력. 로그아웃&마이인포 -->
				<h4>
					<b>${memberName}</b>님 반갑습니다.
				</h4>
				<a href="myPage?status=0">마이페이지</a> <a href="myPage?status=2">장바구니</a>
				<a href="memberLogout">로그아웃</a>
			</div>
		</c:if>
	</div>

	<!-- 고객 메인 -->
	<!-- 상단 메뉴바 -->
	
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="visible-xs" style="margin:5px;" href="main">
        <img style="display:blcok; width:48px; height:48px;"
				src="resources/customerImage/dachamlogo.png" ></a>            
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">    
      	<ul class="nav nav-bar nav-justified">			
			<li class="liBox"><a href="dachamInfo" id="dachamInfo">다참소개</a></li>
			<li class="liBox"><a href="dietOrder" id="dietOrder">식단주문하기</a></li>
			<li class="liBox"><a href="menuShow" id="menuShow">이달의메뉴</a></li>
			<li class="liBox"><a href="nutritionInfo" id="nutritionInfo">영양소개</a></li>
			<li class="liBox"><a href="counsel" id="counsel">문의하기</a></li>
		</ul>
	</div>
  </div>
</nav>
<input type="hidden" id="loginResult" value="${result}"/>

</body>
<!--로그인함수  -->
<script>
	$(document).ready(function() {

		var result = $("#loginResult").val();
		if (result == "0") {
			alert("비밀번호가 틀렸습니다. 다시 확인해주세요.");
		} else if (result == "-1") {
			alert("아이디가 존재하지 않습니다.");
		} else if (result == "1") {
			/* $('.loginBox').hide(); //로그인 성공하면 로그인 박스 숨기고 상단에 회원 정보 출력
			$('#infoBox').show(); */

		} else {

		}

		$("#naviMenuBtn").on("click", function() {
			$(".ulBox").toggle();
		});
	});
</script>







</html>