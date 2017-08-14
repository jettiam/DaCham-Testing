<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
#dietCode{
display:block;
}
.sideDImg{
	height:118px;
}
.dImg{
max-width:200px;
}
.disease{
margin-top:20px;
}
.dName{
margin:20px;
}
#dietList{
/* position:absolute;*/
margin-top:20px;
display:none; 
}
.dietListTab{
margin-top:20px;
}

@media screen and (max-width: 768px) {

	.dImg{
	max-width:120px;
	}
	.sideDImg{
	height:39px;
	}
}
</style>

<script>
	$(document).ready(function(){
		$("#dietOrder").addClass("w3-gray");
		$("#wizardOrder").click(function(){
			window.location.href = "dietOrderWizard";
		});
		$(document).on("click","#dietList",function(){
			$("#dietOrderNav").toggle();
			$("#dietList").toggle();
			$(".dietListTab").remove();
		});
		$("#sugarBlood").on("click",function(){
			$("#dietOrderNav").toggle();
			$("#dietList").toggle();			
			var diseaseCode = $(this).attr("data-code");
			dietListCall(diseaseCode);
		});	
		$("#renalFailure").on("click",function(){
			$("#dietOrderNav").toggle();
			$("#dietList").toggle();			
			var diseaseCode = $(this).attr("data-code");
			dietListCall(diseaseCode);
		});	
		$("#heartFailure").on("click",function(){
			$("#dietOrderNav").toggle();
			$("#dietList").toggle();			
			var diseaseCode = $(this).attr("data-code");
			dietListCall(diseaseCode);
		});	
		$("#hyperlipidemia").on("click",function(){
			$("#dietOrderNav").toggle(); 
			$("#dietList").toggle();			
			var diseaseCode = $(this).attr("data-code");
			dietListCall(diseaseCode);
		});	
		
		$("#dietList").on("click",'.dietCode',function(){
			console.log("클릭됨");
			var dietCode = $(this).attr("data-dietcode");
			console.log(dietCode);
			$(".container").remove();			
			window.location.href="detailOrder?dietCode="+dietCode;
		});
		
		function dietListCall(diseaseCode){
		$.getJSON("customerAjax/dietList/"+diseaseCode,function(data){
			var a = data.list;
			console.log(a);
			console.log(data.list.length);
			console.log(data.list[0].dietName);
			var dietCode=0;
			var trCount=0;
			var tdCount=0;
			var divCount=0;
			for(var i = 0; i<data.list.length; i++){					
				if(dietCode == 0){
					$("#dietList").append("<div class='dietListTab col-sm-4 col-xs-6 d"+divCount+"'></div>");						
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
					$("#dietList>.d"+divCount).append("<a class='dietCode btn btn-warning' href=# data-dietcode='"+dietCode+"'>"+data.list[i-1].dietName+"</a>");					
					divCount++;
					trCount=0;						
					dietCode = data.list[i].dietCode;
					$("#dietList").append("<div class='dietListTab col-sm-4 col-xs-6 d"+divCount+"'></div>");
					$("#dietList>.d"+divCount).append("<table class='dietTable"+dietCode+" table'><tr class='dietTr"+trCount+"'>");
					console.log(dietCode+"테이블 염");
					console.log("tr카운트 염" + trCount);
					$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img class='img-responsive sideDImg' src='displayFile?fileName="+data.list[i].sideDImg+"' alt='이미지'></td>");
					//$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img src='displayFile?fileName="+data.list[i].sideDImg+" alt='이미지'></td>");
					tdCount=1;
					console.log("이미지찍음 " +i);	
				}
				
			}
			$("#dietList>.d"+divCount).append("<a class='dietCode btn btn-warning' href=# data-dietcode='"+dietCode+"'>"+data.list[i-1].dietName+"</a>");
			divCount++;
		});
		}
	});
</script>
<title>DaCham 식단주문</title>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<div class="container">
<div class="row">
<div class="wizardSelectWrap text-center">
<div class="wizardExplain block-center ">당신의 질환 상태에 맞는 식단을 추천받을 수 있습니다.</div>
<a href=# class="disease btn btn-danger" id="wizardOrder">위자드로 주문하기</a>
</div>
<div id="dietOrderNav" class="block-center text-center col-sm-12">	
		<div class="col-xs-6 col-lg-6 text-center disease"><a href=#  data-code="1" id="sugarBlood"><img class="img-responsive  dImg center-block" src="resources/customerImage/dang.png"><div class="dName">당뇨병</div></a></div>
		<div class="col-xs-6 col-lg-6 text-center disease"><a href=# data-code="4" id="renalFailure"><img class="img-responsive  dImg center-block" src="resources/customerImage/sin.png"><div class="dName">신부전증</div></a></div>
		<div class="col-xs-6 col-lg-6 text-center disease"><a href=# data-code="16" id="heartFailure"><img class="img-responsive  dImg center-block" src="resources/customerImage/sim.png"><div class="dName">심부전증</div></a></div>
		<div class="col-xs-6 col-lg-6 text-center disease"><a href=# data-code="13" id="hyperlipidemia"><img class="img-responsive  dImg center-block" src="resources/customerImage/go.png"><div class="dName">고지혈증</div></a></div>	
</div>  
<div id="dietList" class="text-center col-sm-12">	
</div>
</div> 
</div>
<footer>
	<%@include file="../../footer.jsp" %>
</footer>
</body>
</html>