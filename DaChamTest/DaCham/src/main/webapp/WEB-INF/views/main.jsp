<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- 메인페이지 기본 틀을 위한 임시 CSS -->
<style>
#mainImgBox{
 positon:absolute;
 top:0;
 left:20px;  
}
#mainMenuImgs{position: absolute;
	top: 370px;
	left: 75%;}
	.mainMenuImg2{
	float:right;
	}
	.mainMenuImg4{
	float:right;
	}
	.mainMenuImg6{
	float:right;
	}
	#mainNutriBox{
	position: absolute;
	top: 640px;
	left: 75%;
	width: 280px;
	height: 130px;
	background-color:gray;
	}
</style>
</head>
<body>
<%@include file="clientNavi.jsp" %><!-- 네비게이션 삽입 -->
<div id="mainImgBox"> <!-- 메인페이지 메인이미지 -->
<img src="http://placehold.it/850x600">
</div>
<div id="mainMenuImgs"> <!-- 로그인박스 하단 작은 사이즈 식단 이미지 -->
<img src="http://placehold.it/140x90" class="mainMenuImg1">
<img src="http://placehold.it/140x90" class="mainMenuImg2">
<img src="http://placehold.it/140x90" class="mainMenuImg3">
<img src="http://placehold.it/140x90" class="mainMenuImg4">
<img src="http://placehold.it/140x90" class="mainMenuImg5">
<img src="http://placehold.it/140x90" class="mainMenuImg6">
</div>

<div id="mainNutriBox"> <!-- 각 식단의 간략한 영양정보 -->

</div>  
</body>
</html>