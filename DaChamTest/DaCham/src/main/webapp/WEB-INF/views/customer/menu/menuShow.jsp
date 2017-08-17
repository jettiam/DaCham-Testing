<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype HTML>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://www.w3schools.com/lib/w3.js"></script>
<style> 
.sideDImg{  
height:118px;
}
.sideWrap{
	position:fixed;
	top:270px;
	left:5%;  
	width:210px; 
}
.sideUl{
margin:0px;
padding:0px;
border:0px;
}
.sideUl li{
 list-style: none;
 padding:15px;
 border-bottom:0.5px solid #999;
}
.sideUl li>a{
	cursor: pointer;
}
.sideUl li:HOVER {
	background-color: #eee; 
}
@media only screen and (max-width: 1440px) {
	.sideWrap{
	position:fixed;
	top:270px;
	left:1%;  
	width:120px; 
}	
@media screen and (max-width: 768px) {

	.sideDImg{
	height:110px;
	}
}
</style>

<title>DaCham 이달의메뉴</title>
<script>
$(document).ready(function(){
	$("#menuShow").addClass("w3-gray");
	menuShow(0);
	$(".disease0").on("click",function(){
		menuShow(0);
		$("#disease").text("다참 베이직");
	});
	$(".disease1").on("click",function(){
		menuShow(1);
		$("#disease").text("당뇨");
	});
	$(".disease2").on("click",function(){
		menuShow(4);
		$("#disease").text("신부전증");
	});
	$(".disease3").on("click",function(){
		menuShow(16);
		$("#disease").text("심부전증");
	});
	$(".disease4").on("click",function(){
		menuShow(13);
		$("#disease").text("고지혈증");
	});
	$("#dietList").on("click",'.dietCode',function(){
		console.log("클릭됨");
		var dietCode = $(this).attr("data-dietcode");
		console.log(dietCode);
		$(".container").remove();			
		window.location.href="detailOrder?dietCode="+dietCode;
	});
	function menuShow(diseaseCode){
		$.getJSON("customerAjax/menuShow/"+diseaseCode,function(data){
		var a = data.list;
		console.log(a);
		console.log(data.list.length);
		$(".dietListTab").remove();
		var dietCode=0;
		var trCount=0;
		var tdCount=0;
		var divCount=0;
		for(var i = 0; i<data.list.length; i++){					
			if(dietCode == 0){
				$("#dietList").append("<div class='dietListTab col-sm-4 d"+divCount+"'></div>");						
				dietCode = data.list[i].dietCode;
				console.log(dietCode+" 테이블 염");
				$("#dietList>.d"+divCount).append("<table class='dietTable"+dietCode+" table'><tr class='dietTr"+trCount+"'>");
				console.log("tr카운트 염" + trCount);						
			}					
			if(dietCode==data.list[i].dietCode){
				if(tdCount<2){
					console.log("티디카운트 " +tdCount);
					$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img class='img-responsive sideDImg' src='displayFile?fileName="+data.list[i].sideDImg+"' alt='이미지'></td>");
					console.log("이미지찍음 " +i);	
					tdCount++;
					
				}else{
					console.log("tr카운트 닫음" + trCount);
					trCount++; 
					$(".dietTable"+dietCode).append("</tr><tr class='dietTr"+trCount+"'>");
					console.log("tr카운트 염" + trCount);
					$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img class='img-responsive sideDImg' src='displayFile?fileName="+data.list[i].sideDImg+"' alt='이미지'></td>");
					console.log("이미지찍음 " +i);							
					tdCount = 1;
				}						
				
			}else{
				$(".dietTable"+dietCode).append("</tr>");
				console.log("tr카운트 닫음" + trCount);
				$("#dietList>.d"+divCount).append("</table>");						
				console.log(dietCode+"테이블 닫기");						
				$("#dietList>.d"+divCount).append("<div class='text-center h3'><a class='dietCode' href=# data-dietcode='"+dietCode+"'>"+data.list[i-1].dietName+"</a></div>");					
				$("#dietList>.d"+divCount).append("<table class='table'><tr><td>칼로리<br>(Kcal)</td><td>탄수화물<br>(g)</td><td>단백질<br>(g)</td><td>지방<br>(g)</td><td>나트륨<br>(mg)</td><td>칼륨<br>(mg)</td></tr><tr><td>"+parseInt(data.list[i-1].kcal)+"</td><td>"+parseInt(data.list[i-1].carbohydrate)+"</td><td>"+parseInt(data.list[i-1].protein)+"</td><td>"+parseInt(data.list[i-1].fat)+"</td><td>"+parseInt(data.list[i-1].na)+"</td><td>"+parseInt(data.list[i-1].k)+"</td></tr></table");
				divCount++;
				trCount=0;						
				dietCode = data.list[i].dietCode;
				$("#dietList").append("<div class='dietListTab col-sm-4 d"+divCount+"'></div>");
				$("#dietList>.d"+divCount).append("<table class='dietTable"+dietCode+" table'><tr class='dietTr"+trCount+"'>");
				console.log(dietCode+"테이블 염");
				console.log("tr카운트 염" + trCount);
				$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img class='img-responsive sideDImg' src='displayFile?fileName="+data.list[i].sideDImg+"' alt='이미지'></td>");
				//$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img src='displayFile?fileName="+data.list[i].sideDImg+" alt='이미지'></td>");
				tdCount=1;
				console.log("이미지찍음 " +i);	
			}
			
		}
		$("#dietList>.d"+divCount).append("<div class='text-center h3'><a class='dietCode' href=# data-dietcode='"+dietCode+"'>"+data.list[i-1].dietName+"</a></div>");
		$("#dietList>.d"+divCount).append("<table class='table'><tr><td>칼로리<br>(Kcal)</td><td>탄수화물<br>(g)</td><td>단백질<br>(g)</td><td>지방<br>(g)</td><td>나트륨<br>(mg)</td><td>칼륨<br>(mg)</td></tr><tr><td>"+parseInt(data.list[i-1].kcal)+"</td><td>"+parseInt(data.list[i-1].carbohydrate)+"</td><td>"+parseInt(data.list[i-1].protein)+"</td><td>"+parseInt(data.list[i-1].fat)+"</td><td>"+parseInt(data.list[i-1].na)+"</td><td>"+parseInt(data.list[i-1].k)+"</td></tr></table");
		divCount++;
	});
	};
});
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>
</head>
<body>
<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none;z-index:5" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>
		<a class="w3-bar-item w3-button disease0" onclick="w3_close()" href="#">다참 베이직</a>
		<a class="w3-bar-item w3-button disease1" onclick="w3_close()" href="#">당뇨</a>
		<a class=" w3-bar-item w3-button disease2" onclick="w3_close()" href="#">신부전증</a>
		<a class="w3-bar-item w3-button disease3" onclick="w3_close()" href="#">심부전증</a>
		<a class="w3-bar-item w3-button disease4" onclick="w3_close()" href="#">고지혈증</a>
		
</div>
<%@include file="../../clientNavi.jsp" %>
<!-- Page Content -->
<div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>
<button class="w3-button w3-white visible-xs visible-sm visible-md h3" onclick="w3_open()">&#9776; <span id="disease">다참 베이직</span></button>

	<!-- 데스크탑 사이드바 -->
	<div class="w3-card-4 hidden-xs hidden-sm hidden-md sideWrap">
	<header class="w3-container btn-warning">
	   <h5 class=""><b>이달의 메뉴</b></h5>
	</header>
	
	<ul class="sideUl">
	  	<li><a class="disease0">다참 베이직</a></li>
	  	<li><a class="disease1">당뇨</a></li>
	  	<li><a class="disease2">신부전증</a></li>
	  	<li><a class="disease3">심부전증</a></li>
	  	<li><a class="disease4">고지혈증</a></li>
	  		
	</ul>

</div>

<div class="container">
<div class="text-center" style="margin-bottom:20px;"> 
	<h1>이달의 메뉴</h1>	
</div>
	<div class="row" id="dietList">
		
	</div>
</div>


<footer>
	<%@include file="../../footer.jsp" %>
</footer>
</body>
</html>