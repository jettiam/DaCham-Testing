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
#nutriInfoWrap{width: 1080px;
	height: 100%;
	margin: 0 auto;
	text-align: center;}
.container {
  position: relative;
  width: 50%;
}
#nutriInfoImg{
margin-top:5px;
display:block;
width:300px;
height:300px;
backface-visibility: hidden;
}
.overlay {
  position: absolute;
  top: 0;
  margin-top:5px;
  bottom: 0;
  left: 0;
  right: 0;
  height: 300px;
  width: 300px;
  opacity: 0;
  transition: .5s ease;
  background-color: rgba(211,112,168,0.3);
  margin-left:14px;
}

.container:hover .overlay {
  opacity: 1;
}
.container:hover .nutriInfoImg {
  opacity: 0.5;
}

.container:hover .text {
  opacity: 1;
}
.text {

  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}
</style>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<div id="nutriInfoWrap">
<h1>영양소개</h1>
건강에 대한 좋은 말씀 드릴게요<br>
건강에 대한 좋은 말씀 드릴게요<br>
건강에 대한 좋은 말씀 드릴게요<br>

<div class="container">

<div id="nutriInfoImgList">
<img src="../../../dacham/resources/customerImage/1.jpg" id="nutriInfoImg">
<div class="overlay">
<div class="text">방울 토마토</div>
</div>
</div>

<img src="http://placehold.it/300x300" id="nutriInfoImg2">
<img src="http://placehold.it/300x300" id="nutriInfoImg3"><br>
<img src="http://placehold.it/300x300" id="nutriInfoImg4">
<img src="http://placehold.it/300x300" id="nutriInfoImg5">
<img src="http://placehold.it/300x300" id="nutriInfoImg6">
</div>

</div>
</body>
</html>