<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>Insert title here</title>
<!-- 상단 내비게이션 표시를 위한 임시 CSS -->
<style>
.naviBox {
	background-color: #EAEAEA;
	margin-top: 10px;
	text-align:center;
}

.liBox {
	display: inline-block;
	height: 50px;
	padding: 0 20px;
	font-size: 25px;
}
#naviMenuBtn{
	display: none;
}
#sideBox {
	float:right;
	margin-right:10px;
	color:gray;
}


#infoBox {	
	float: right;
	margin-right:10px;
	color:gray;
}

#logo{margin-top:10px;
		margin-left:10px;
      }
      
@media only screen and (max-width: 500px) {
	.liBox {
	display: block;
	list-style:none;
	magin : 5px 0px;
	padding: 0px;
	font-size: 14px;
	height: 25px;
	}
	.ulBox{
		margin: 0px;
		padding: 0px;
		text-align:left;
		display:none;
	}
	#naviMenuBtn {
		display:block;
		padding: 10px;		
		font-size : 20px;		
	}
	.naviBox {	
	text-align:left;
}
}
.naviBox a{text-decoration: none;
color:#88b04b;
}
#headerBox a{color:#EDA900;}



</style>
<!-- 상단 내비게이션 표시를 위한 임시 CSS -->

</head>
<body>
	<div id="headerBox">
		<!-- 로고+고객정보 -->
		<div id="logo">
			<!-- 로고박스 -->
			<a href="main"><img src="../../dacham/resources/customerImage/dachamlogo.jpg" width="100px" height="100px"></a>
<!-- 고객 로그인 페이지 -->
<c:if test="${empty sessionScope.memberName}">
	<div id="sideBox">
		<form method="post" action="main" class="loginBox">

			아이디<br> 
			<input type="text" name="id"><br> 
			비밀번호<br>
			<input type="password" name="pw"> 
			<input type="submit" class="btn btn-warning" value="로그인">

		</form>

	</div>	
	</c:if>
	 <c:if test="${not empty sessionScope.memberName}">
			<div id="infoBox">
				<!-- 고객이름 출력. 로그아웃&마이인포 -->
				<h4>
					<b>${memberName}</b>님 반갑습니다. 오늘도 다참으로 건강한 하루~!
				</h4>
				<a href="myPage">마이페이지</a> <a href="myCart">장바구니</a> <a href="memberLogout">로그아웃</a>
			</div>
	</c:if>
		</div>
	</div>
	<!-- 고객 메인 -->
	<!-- 상단 메뉴바 -->
	<div class="naviBox">
		<div id="naviMenuBtn">
          <span class="glyphicon glyphicon-th-list"></span>
        </div>
		<ul class="ulBox">
			<!-- 메뉴 리스트 -->
			<li class="liBox"><a href="dachamInfo" id="dachamInfo">다참소개</a></li>
			<li class="liBox"><a href="dietOrder" id="dietOrder">식단주문하기</a></li>
			<li class="liBox"><a href="menuShow" id="menuShow">이달의메뉴</a></li>
			<li class="liBox"><a href="nutritionInfo" id="nutritionInfo">영양소개</a></li>
			<li class="liBox"><a href="counsel" id="counsel">문의하기</a></li>
		</ul>

	</div>	


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
		
		$("#naviMenuBtn").on("click",function(){
			$(".ulBox").toggle();
		});
	});
</script>







</html>