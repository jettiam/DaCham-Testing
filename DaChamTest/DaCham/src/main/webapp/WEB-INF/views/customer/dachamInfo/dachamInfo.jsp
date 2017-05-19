<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
#infoWrap {
	width: 1080px;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}

#dachamInfoMainImg {
	
}

#infoExplain {
	width:615px;
	height:200px;
  margin:0 auto;
position:relative; 
}

#infoExplainImgBox {float:left; background-color: white;
}
#infoExplainImg{
margin-right:5px;
}
#infoExplainText {

width:615px;
height:200px;
margin-left:5px;
background-color: gray;
color:white;
padding:20px;

}

img {
	max-width: 100%;
	height: auto;
}
</style>
</head>
<body>
	<%@include file="../../clientNavi.jsp"%>
<div id="dachamInfoMainImg">
			<!-- 다참인포 메인이미지 -->
			<img src="http://placehold.it/2000x200">
		</div>

	<div id="infoWrap">
		

		<div id="dachamInfoText">
			<h1>만성 질환 식단의 문제점</h1>
			<br> 만성질환 식단의 문제점은 뭘까요 저도 모르겠어요 살려주세요<br> 만성질환 식단의 문제점은 뭘까요
			저도 모르겠어요 살려주세요<br> 만성질환 식단의 문제점은 뭘까요 저도 모르겠어요 살려주세요<br>
			만성질환 식단의 문제점은 뭘까요 저도 모르겠어요 살려주세요<br><br>

			<h1>다참 서비스의 3 Step</h1><br>
			<div id="infoExplain">
			<div id="infoExplainImgBox">
			<img src="http://placehold.it/200x200" id="infoExplainImg"></div>
			<div id="infoExplainText">
			
			<h3><b>Step 1.</b> 알맞은 맞춤식단<br></h3>
			<h3><b>Step 2.</b> 비용절감, 시간절감<br></h3>
			<h3><b>Step 3.</b> 번거로움 해소<br></h3>
			
			</div>
			</div>
			<br>
			<br>
			<input type="button" id="moveOrder" value="주문하기"> 
		</div>

	</div>
	
	
</body>
<script>
	window.onload=function(){
		var button = document.getElementById('moveOrder');
		button.onclick=function(){
			window.location="dietOrder"
		};
	};
	</script>
</html>