<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>DaCham 다참소개</title>
<style>
#infoWrap {
	width: 1080px;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}

#infotop {
		display: block;
	}
#infotop_m{
	display:none;
}

#infoExplain {
	width: 615px;
	height: 200px;
	margin: 0 auto;
	position: relative;
}

#infoExplainImgBox {
	float: left;
	background-color: white;
}

#infoExplainImg {
	margin-right: 5px;
}

#infoExplainText {
	width: 615px;
	height: 197px;
	margin-left: 5px;
	background-color: gray;
	color: white;
	padding: 20px;
}

img {
	max-width: 100%;
	height: auto;
}

@media only screen and (max-width: 500px) {
	#infotop {
		display: none;
	}
	#infotop_m{
	display:block;
	}
	#infoWrap {
		width: 100%;
		height: 100%;
		margin: 0 auto;
		text-align: center;
		
	}
	#dachamInfoText>h1 {
		font-size: 30px;
	}
	#infoExplain {
		width: 100%;
		height: auto;
		margin: 0 auto;
		position: relative;
	}
	#infoExplainImgBox {
		display: none;
	}
	#infoExplainText {
	width: 100%;
	height: auto;
	margin-left: 0px;
	background-color: gray;
	color: white;
	padding: 20px;
	}
}
</style>
</head>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<div id="dachamInfoMainImg">
		<!-- 다참인포 메인이미지 -->
		<img id="infotop" src="resources/customerImage/dinfotop.jpg">
		<img id="infotop_m" src="resources/customerImage/dinfotop_m.png">
	</div>

	<div id="infoWrap">
		<div id="dachamInfoText">
			<h1>만성질환 식단의 문제점</h1>
			<br> 시중에 판매되고 있는 제품만으로는 <br>만성질환의 식단을 완벽하게 해결하기는 매우 어렵습니다.<br>  
			질환식이 아직 대중화되어 있지 않은 우리 사회에서는<br> 질환환자나 질환을 가지고 있는 가정에서 질환식을 준비하기에는<br>
			비용의 문제도 있고 번거로움 또한 만만치 않습니다.<br> 
			그런 고민들을 한번에 해결한 건강하고 편리한 맞춤 질환식을 다참이 준비했습니다.<br><br>

			<h1>다참 서비스의 3 Step</h1>
			<br>
			<div id="infoExplain">
				<div id="infoExplainImgBox">
					<img src="resources/customerImage/dinfob.jpg"
						id="infoExplainImg">
				</div>
				<div id="infoExplainText">

					<h3>
						<b>Step 1.</b> 알맞은 맞춤식단<br>
					</h3>
					<h3>
						<b>Step 2.</b> 비용절감, 시간절감<br>
					</h3>
					<h3>
						<b>Step 3.</b> 번거로움 해소<br>
					</h3>

				</div>
			</div>
			<br> <br> <input type="button" id="moveOrder"  class="btn btn-warning" value="주문하기">
		</div>

	</div>
<footer>
	<%@include file="../../footer.jsp" %>
</footer>

</body>
<script>
	window.onload = function() {
		var button = document.getElementById('moveOrder');
		button.onclick = function() {
			window.location = "dietOrder"
		};
	};
</script>
</html>