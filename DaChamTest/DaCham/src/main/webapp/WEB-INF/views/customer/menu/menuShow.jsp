<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!document HTML>
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
<style> 
/* #menuShowWrap{
	max-width: 1080px;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}
#menuShowTableWrap{
position: relative;
	
	float: left;
	margin-left: 70px;
	margin-right: 70px;
	
}
#menuShowTextWrap {
position: relative;
	
	float: left;
	width:400px;
	height:100px;
	text-align: center;
	margin-left: 70px;
	margin-right: 70px;
	margin-bottom:10px;
}

#menuShowNutriTable{
position: relative;
	
	float: left;
	width:400px;
	height:100px;
	text-align: center;
	margin-left: 70px;
	margin-right: 70px;
	border : solid 1px black;
}
.NutriTable 
{
border : solid 1px black;
width:100px;
}
#menuShowList1{display:none;}
#menuShowList2{display:none;}
#menuShowList3{display:none;}
#menuShowList4{display:none;}
#menuShowImg
{width:200px;
 height:150px;
} */
</style>

<title>DaCham 이달의메뉴</title>
<script>
$(document).ready(function(){
	menuShow(0);
	$("#disease0").on("click",function(){
		menuShow(0);
	});
	$("#disease1").on("click",function(){
		menuShow(1);
	});
	$("#disease2").on("click",function(){
		menuShow(4);
	});
	$("#disease3").on("click",function(){
		menuShow(16);
	});
	$("#disease4").on("click",function(){
		menuShow(13);
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
				$("#dietList").append("<div class='dietListTab col-sm-6 d"+divCount+"'></div>");						
				dietCode = data.list[i].dietCode;
				console.log(dietCode+" 테이블 염");
				$("#dietList>.d"+divCount).append("<table class='dietTable"+dietCode+" table'><tr class='dietTr"+trCount+"'>");
				console.log("tr카운트 염" + trCount);						
			}					
			if(dietCode==data.list[i].dietCode){
				if(tdCount<2){
					console.log("티디카운트 " +tdCount);
					$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img class='img-responsive' src='displayFile?fileName="+data.list[i].sideDImg+"' alt='이미지'></td>");
					console.log("이미지찍음 " +i);	
					tdCount++;
					
				}else{
					console.log("tr카운트 닫음" + trCount);
					trCount++; 
					$(".dietTable"+dietCode).append("</tr><tr class='dietTr"+trCount+"'>");
					console.log("tr카운트 염" + trCount);
					$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img class='img-responsive' src='displayFile?fileName="+data.list[i].sideDImg+"' alt='이미지'></td>");
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
				$("#dietList").append("<div class='dietListTab col-sm-6 d"+divCount+"'></div>");
				$("#dietList>.d"+divCount).append("<table class='dietTable"+dietCode+" table'><tr class='dietTr"+trCount+"'>");
				console.log(dietCode+"테이블 염");
				console.log("tr카운트 염" + trCount);
				$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img class='img-responsive' src='displayFile?fileName="+data.list[i].sideDImg+"' alt='이미지'></td>");
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
</script>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>

<div class="container">
<div class="text-center">
	<h1>이달의 메뉴</h1>
	<input type="button" id="disease0" class="btn btn-warning" value="다참 베이직">
	<input type="button" id="disease1" class="btn btn-warning" value="당뇨">
	<input type="button" id="disease2" class="btn btn-warning" value="신부전증">
	<input type="button" id="disease3" class="btn btn-warning" value="심부전증">
	<input type="button" id="disease4" class="btn btn-warning" value="고지혈">
	</div>
	<div class="row" id="dietList">
		
	</div>
</div>


<footer>
	<%@include file="../../footer.jsp" %>
</footer>
</body>
</html>