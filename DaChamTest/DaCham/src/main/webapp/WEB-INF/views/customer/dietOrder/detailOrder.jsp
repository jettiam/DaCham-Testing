<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-light-green.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
.dietImg{
/* max-width:650px;
max-height:350px; */
}
.sideDImg{
/* max-width:250px;
mat-height:200px; */
}
.nutriTable{
text-align: center !important;
}
.nutriChart{
	margin:auto;
	width:80%;
}
.fa-chevron-down{
	display:none;
}
.fa-chevron-up{
	display:none;
}
@media only screen and (max-width: 768px){
	.nutriChart{
		margin:auto;
		width:100%;
	}
	.sideDThumbnail{
		display:none;
	}
	.sideDNutri{
		display:none;
	}
	.fa-chevron-down{
	display:inline-block;
	}
	.fa-chevron-up{
		display:inline-block;
	}
}
</style>
<title>DaCham 식단상세보기</title>
<script>
var kcal0=0;
var carbo0=0;
var protein0=0;
var fat0=0;
var na0=0;
var k0=0;
var count = 0;
$(document).ready(function() {
	$("#dietOrder").addClass("w3-gray");
	$("#foodGList").on("click", ".foodGSideD", function(){
		var foodGCode= $(this).parent().parent().attr("data-foodgcode");
		//console.log("식품군:"+foodGCode);
		
		$(this).siblings().removeClass("w3-theme-l4");
		$(this).addClass("w3-theme-l4");
		var img = $(this).children("img").attr("src");
		//console.log(img);
		var sideDName=$(this).children("h5").text();			
		//console.log("반찬명:"+sideDName);
		$(".defaultFood[data-foodGCode='"+foodGCode+"']>img").attr("src",img);
		$(".defaultFood[data-foodGCode='"+foodGCode+"']>.defaultSideDName").text(sideDName);
		console.log($(".defaultFood[data-foodGCode='"+foodGCode+"']>img"));
		count=0;
		//반응형 JQ
		//$(".foodGSideD i").removeClass("fa-chevron-down fa-chevron-up").addClass("fa-chevron-down");
		/* $(".foodGSideD .sideDThumbnail").toggle(); 
		$(".foodGSideD .sideDNutri").toggle(); */ 
		var window_size = $(window).width();
		if(window_size<=768){
			//console.log($(".foodGSideD").not($(this)));
			var notThis = $(".foodGSideD").not($(this));
			notThis.find(".sideDThumbnail").hide();
			notThis.find(".sideDNutri").hide();
			notThis.find("i").removeClass("fa-chevron-up").addClass("fa-chevron-down");
			var checkToggle=$(this).find("i").attr("class"); 
			//console.log(checkToggle);
			if(checkToggle=="fa fa-chevron-down"){
				$(this).find("i").removeClass("fa-chevron-down").addClass("fa-chevron-up");			
			}else{
				$(this).find("i").removeClass("fa-chevron-up").addClass("fa-chevron-down");			
			};
			$(this).find(".sideDNutri").insertAfter($(this).find("h5"));
			$(this).find(".sideDThumbnail").insertAfter($(this).find("h5"));
			$(this).find(".sideDThumbnail").toggle();
			$(this).find(".sideDNutri").toggle();
		}

		
		//영양 차트
		$(".chartjs-hidden-iframe").remove();
		$("#nutriChart").remove();
		$(".nutriChart").append('<canvas id="nutriChart"></canvas>');
		drawNutriChart(nutriInsert(count));
		//activeRadio($(this));
	});	

	
	
	$("#dietAmount").keyup(function() {
		var a = $("#dietAmount").val();
		var price = $("#dietPrice").attr("data-basicPrice");
		console.log("수량" + a);
		console.log("가격" + price);
		console.log(a * price);
		$("#dietPrice").text(a * price);
	});
	$("#dietAmount").mouseup(function() {
		var a = $("#dietAmount").val();
		var price = $("#dietPrice").attr("data-basicPrice");
		console.log("수량" + a);
		console.log("가격" + price);
		console.log(a * price);
		$("#dietPrice").text(a * price);
	});
	$("#doOrder").on("click", function() {
		var login = $("#sessionName").text()+""; 
		console.log(login);
		if(login!=""){			
			getCheckedList();			
			$("#setDietName").val($("#dietName").text());
			$("#setPrice").val($("#dietPrice").text());
			$("#setDietAmount").val($("#dietAmount").val());
			$("#setDietImg").val($(".dietImg").attr("data-dietImg"));			
			$("#orderForm").attr("action", "doOrder");
			$("#orderForm").submit();
		}else{
			alert("로그인 후에 이용해주세요.");
		}
	});
	$("#goMyCart").on("click", function() {
		var login = $("#sessionName").text()+""; 
		console.log(login);
		if(login!=""){
			getCheckedList();			
			$("#setDietName").val($("#dietName").text());
			$("#setPrice").val($("#dietPrice").text());
			$("#setDietAmount").val($("#dietAmount").val());
			//$("#sideDish").val();
			$("#orderForm").attr("action", "goMyCart");
			$("#orderForm").submit();
			
		}else{
			alert("로그인 후에 이용해주세요.");
		}
	});
	
	
	function getDish(div, foodGCode){
		var foodGCode= foodGCode;
		var dietCode = $("#setDietCode").val();
		$.getJSON("customerAjax/getfoodG/"+foodGCode+"/"+dietCode, function(data){
			for(var i=0; i<data.list.length; i++){
				var kcal = data.list[i].kcal.toFixed(0);
				var carbo = data.list[i].carbohydrate.toFixed(0);
				var protein = data.list[i].protein.toFixed(0);
				var fat = data.list[i].fat.toFixed(0);
				var na = data.list[i].na.toFixed(0);
				var k = data.list[i].k.toFixed(0);
				if(i==0){
					kcal0+=Number(kcal);
					console.log(kcal0);
					carbo0+=Number(carbo);
					protein0+=Number(protein);
					fat0+=Number(fat);
					na0+=Number(na);
					k0+=Number(k);
					count++;
					console.log(count);
					if(count==6){
						drawNutriChart(nutriInsert(count));
					}					
				div.append(
							"<div class='column foodGSideD w3-theme-l4' data-sideDCode='"+data.list[i].sideDCode+"'>"							
							+"<img class='thumbnail sideDThumbnail' src='displayFile?fileName="+data.list[i].sideDImg+"'>"
							+"<h5 style='text-align:center'>"+data.list[i].sideDName+"&nbsp;&nbsp;<i class='fa fa-chevron-down'></i></h5>"
							+"<table class='table sideDNutri' >"
							+"<tr><th>칼로리</th><td class='kcal'>"+kcal+"</td></tr>"
							+"<tr><th>탄수화물</th><td class='carbo'>"+carbo+"</td></tr>"
							+"<tr><th>단백질</th><td class='protein'>"+protein+"</td></tr>"
							+"<tr><th>지방</th><td class='fat'>"+fat+"</td></tr>"
							+"<tr><th>나트륨</th><td class='na'>"+na+"</td></tr>"
							+"<tr><th>칼륨</th><td class='k'>"+k+"</td></tr>"
							+"</table>"							
							//+"<a class='sideButton button hollow tiny expanded'>선택 하기</a>"								
							+"</div>"
						);
				}else{
					div.append(
							"<div class='column foodGSideD' data-sideDCode='"+data.list[i].sideDCode+"'>"		
							+"<img class='thumbnail sideDThumbnail' src='displayFile?fileName="+data.list[i].sideDImg+"'>"
							+"<h5 style='text-align:center'>"+data.list[i].sideDName+"&nbsp;&nbsp;<i class='fa fa-chevron-down'></i></h5>"
							+"<table class='table sideDNutri' >"
							+"<tr><th>칼로리</th><td class='kcal'>"+kcal+"</td></tr>"
							+"<tr><th>탄수화물</th><td class='carbo'>"+carbo+"</td></tr>"
							+"<tr><th>단백질</th><td class='protein'>"+protein+"</td></tr>"
							+"<tr><th>지방</th><td class='fat'>"+fat+"</td></tr>"
							+"<tr><th>나트륨</th><td class='na'>"+na+"</td></tr>"
							+"<tr><th>칼륨</th><td class='k'>"+k+"</td></tr>"
							+"</table>"							
							//+"<a class='sideButton button hollow tiny expanded'>선택 하기</a>"
							+"</div>"
						);
				}				
			}							
			
		});
		
		//;
		
	}
	for(var i=1;i<7;i++){
		getDish($("#panel"+i+">div"), "0"+i);
		
/* 		getDish($("#panel1>div"), "01");
		getDish($("#panel2>div"),"02");
		getDish($("#panel3>div"), "03");
		getDish($("#panel4>div"),"04");
		getDish($("#panel5>div"), "05");
		getDish($("#panel6>div"),"06");	 */
	}
	
	
});	
	/* function getDishList(a) {
		a
				.children()
				.each(
						function() {
							var foodGCode = $(this).attr("data-foodGCode");
							var b = $(this);
							$
									.getJSON(
											"customerAjax/getfoodG/"
													+ foodGCode, //controller를 통해 요청.
											function(data) { //데이터 받아옴 data.list로 사용
												for (var i = 0; i < data.list.length; i++) {
													b
															.append("<label><div class='' data-sideDCode='"+data.list[i].sideDCode+"'>"
																	+ "<input type='radio' style='display:none' name='"+data.list[i].foodGCode+"' value='"+data.list[i].sideDCode+"' />"
																	 + "<img src='http://via.placeholder.com/150x150'>" 
																	+"<img class='sideDImg' src='displayFile?fileName="	+ data.list[i].sideDImg+"'>"
																	+ data.list[i].sideDName
																	+ "  <table><tr><td>칼로리</td><td>탄수화물</td><td>단백질</td><td>지방</td><td>나트륨</td></tr><tr><td>"
																	+ data.list[i].kcal
																			.toFixed(0)
																	+ "kcal</td><td>"
																	+ data.list[i].carbohydrate
																			.toFixed(0)
																	+ "g</td><td>"
																	+ data.list[i].protein
																			.toFixed(0)
																	+ "g</td><td>"
																	+ data.list[i].fat
																			.toFixed(0)
																	+ "g</td><td>"
																	+ data.list[i].na
																			.toFixed(0)
																	+ "mg</td></tr></table>"
																	+ "</div></label>");
												}
											})
						});
	}
	 */
	// div : panel id
	// foodGCode : 각각 판넬에 들어가게 될 반찬들의 GCode(그룹코드)
	
	
/* 	function activeRadio(btn){		
		//alert("클릭되었습니다."); 
		var inputBtn = btn.find("input:radio");
		inputBtn.attr("checked", true);
	} */
	function getCheckedList() {
		$(".w3-theme-l4").each(function(){
			var sideDCode = $(this).attr("data-sideDcode");
			console.log(sideDCode);
			$("#orderForm").append("<input id='sideDish' type='hidden' name='sideDish' value='"+sideDCode+"'>");
		});
		/* var arrInx = 0;
		var sideDish = [];
		a.children().each(
				function() {
					var name = $(this).attr("data-foodGCode");
					var checkedValue = $(
							'input:radio[name="' + name + '"]:checked').val(); //벨류가 반찬 코드		
					if (checkedValue != undefined) {
						sideDish[arrInx] = checkedValue;
						arrInx++;
					}
					console.log(sideDish);
				});
		$("#orderForm>#sideDish").remove();
		for (i = 0; i < arrInx; i++) {
			$("#orderForm")
					.append(
							"<input id='sideDish' type='hidden' name='sideDish' value='"+sideDish[i]+"'>");
		} */
		
		
	}
	
	
	//영양정보 받아오는 함수
	function nutriInsert(count){
		var nutriValue = new Array();
		var kcal=0;
		var carbo=0;
		var protein=0;
		var fat=0;
		var na=0;
		var k=0;
		console.log($(".w3-theme-l4").length);
		for(var i=0;i<$(".w3-theme-l4").length;i++){
			kcal+=Number($(".w3-theme-l4 .kcal:eq("+i+")").text());
			carbo+=Number($(".w3-theme-l4 .carbo:eq("+i+")").text());
			protein+=Number($(".w3-theme-l4 .protein:eq("+i+")").text());
			fat+=Number($(".w3-theme-l4 .fat:eq("+i+")").text());
			na+=Number($(".w3-theme-l4 .na:eq("+i+")").text());
			k+=Number($(".w3-theme-l4 .k:eq("+i+")").text());
		}				
		console.log("칼로리:"+kcal+",탄수화물:"+carbo+",단백질:"+protein+",지방:"+fat+",나트륨:"+na+",칼륨"+k);
			if(count==6){
				/* nutriValue = [carbo0,protein0,fat0,na0/1000, k0/1000];  */
				
				var KcalDay = parseInt(kcal0/2000*100);
				var CDay = parseInt(carbo0/325*100);
				var PDay = parseInt(protein0/40*100);
				var FDday = parseInt(fat0/35*100);
				var NaDay = parseInt(na0/2000*100);
				var KDay = parseInt(k0/3500*100);
				nutriValue = [KcalDay,CDay,PDay,FDday,NaDay, KDay];
				$(".nutriInfoTable").append("<td class='kcalSign w3-green'>"+kcal0+"</td><td class='carboSign w3-green'>"+carbo0+"</td><td class='proteinSign w3-green'>"+protein0+"</td><td class='fatSign w3-green'>"+fat0+"</td><td class='naSign w3-green'>"+na0+"</td><td class='kSign w3-green'>"+k0+"</td>")
				/* 
				<td>남자</td><td id="MKcal">2400</td><td id="MCarbo">405</td><td id="MProtein">50</td><td id="MFat">40</td><td id="MNa">2000</td><td id="MK">3500</td></tr>
				<td>여자</td><td id="WMKcal">1900</td><td id="WMCarbo">325</td><td id="WMProtein">40</td><td id="WMFat">35</td><td id="WMNa">2000</td><td id="WMK">3500</td></tr> */
				$("#MKcal").html("2500<br>("+parseInt(kcal0/2500*100)+"%)");//여기부터
				$("#MCarbo").html("405<br>("+parseInt(carbo0/405*100)+"%)");
				$("#MProtein").html("50<br>("+parseInt(protein0/50*100)+"%)");
				$("#MFat").html("40<br>("+parseInt(fat0/40*100)+"%)");
				$("#MNa").html("2000<br>("+parseInt(na0/2000*100)+"%)");
				$("#MK").html("3500<br>("+parseInt(k0/3500*100)+"%)");
				
				$("#WMKcal").html("2000<br>("+parseInt(kcal0/2000*100)+"%)");
				$("#WMCarbo").html("325<br>("+parseInt(carbo0/325*100)+"%)");
				$("#WMProtein").html("40<br>("+parseInt(protein0/40*100)+"%)");
				$("#WMFat").html("35<br>("+parseInt(fat0/35*100)+"%)");
				$("#WMNa").html("2000<br>("+parseInt(na0/2000*100)+"%)");
				$("#WMK").html("3500<br>("+parseInt(k0/3500*100)+"%)"); 
				
				localStorage.clear();
				localStorage['kcal']=kcal0;
				localStorage['carbo']=carbo0;
				localStorage['protein']=protein0;
				localStorage['fat']=fat0;
				localStorage['na']=na0;
				localStorage['k']=k0;
				
				
			}else{
				/* nutriValue = [carbo,protein,fat,na/1000,k/1000]; */
				var KcalDay = parseInt(kcal/2000*100);
				var CDay = parseInt(carbo/325*100);
				var PDay = parseInt(protein/40*100);
				var FDday = parseInt(fat/35*100);
				var NaDay = parseInt(na/2000*100);
				var KDay = parseInt(k/3500*100);
				nutriValue = [KcalDay,CDay,PDay,FDday,NaDay, KDay];
				
				$(".nutriInfoTable td").remove();
				$(".fatSign").removeClass("w3-orange");
				$(".fatSign").removeClass("w3-red");
				$(".kSign").removeClass("w3-orange");
				$(".kSign").removeClass("w3-red");
				$(".naSign").removeClass("w3-orange");
				$(".naSign").removeClass("w3-red");
				$(".proteinSign").removeClass("w3-orange");
				$(".proteinSign").removeClass("w3-red");
				$(".carboSign").removeClass("w3-orange");
				$(".carboSign").removeClass("w3-red");
				$(".kcalSign").removeClass("w3-orange");
				$(".kcalSign").removeClass("w3-red");

				$(".nutriInfoTable").append("<td class='kcalSign'>"+kcal+"</td><td class='carboSign'>"+carbo+"</td><td class='proteinSign'>"+protein+"</td><td class='fatSign'>"+fat+"</td><td class='naSign'>"+na+"</td><td class='kSign'>"+k+"</td>")
				$("#MKcal").html("2500<br>("+parseInt(kcal/2500*100)+"%)");//여기부터
				$("#MCarbo").html("405<br>("+parseInt(carbo/405*100)+"%)");
				$("#MProtein").html("50<br>("+parseInt(protein/50*100)+"%)");
				$("#MFat").html("40<br>("+parseInt(fat/40*100)+"%)");
				$("#MNa").html("2000<br>("+parseInt(na/2000*100)+"%)");
				$("#MK").html("3500<br>("+parseInt(k/3500*100)+"%)");
				
				$("#WMKcal").html("2000<br>("+parseInt(kcal/2000*100)+"%)");
				$("#WMCarbo").html("325<br>("+parseInt(carbo/325*100)+"%)");
				$("#WMProtein").html("40<br>("+parseInt(protein/40*100)+"%)");
				$("#WMFat").html("35<br>("+parseInt(fat/35*100)+"%)");
				$("#WMNa").html("2000<br>("+parseInt(na/2000*100)+"%)");
				$("#WMK").html("3500<br>("+parseInt(k/3500*100)+"%)"); 
				
				var kcalSign = Number(kcal)-Number(localStorage['kcal']);				
				var carboSign = Number(carbo)-Number(localStorage['carbo']);
				var proteinSign = Number(protein)-Number(localStorage['protein']);
				var fatSign = Number(fat)-Number(localStorage['fat']);
				var naSign = Number(na)-Number(localStorage['na']);
				var kSign = Number(k)-Number(localStorage['k']);
				console.log("칼로리차:"+kcalSign+" 탄수화물차:"+carboSign+" 단백질차:"+proteinSign+" 지방차:"+fatSign+" 나트륨차:"+naSign+" 칼륨차:"+kSign);
				if(kcalSign>=100 && kcalSign<200){
					$(".kcalSign").addClass("w3-orange");
				}else if(kcalSign>=200){
					$(".kcalSign").addClass("w3-red");
				}else{
					$(".kcalSign").addClass("w3-green");
				}
				if(carboSign>=50 && carboSign<100){
					$(".carboSign").addClass("w3-orange");
				}else if(carboSign>=100){
					$(".carboSign").addClass("w3-red");
				}else{
					$(".carboSign").addClass("w3-green");
				}
				if(proteinSign>=50 && proteinSign<100){
					$(".proteinSign").addClass("w3-orange");
				}else if(proteinSign>=100){
					$(".proteinSign").addClass("w3-red");
				}else{
					$(".proteinSign").addClass("w3-green");
				}
				if(na>=2000 && na<2500){
					$(".naSign").addClass("w3-orange");
				}else if(na>=2500){
					$(".naSign").addClass("w3-red");
				}else{
					$(".naSign").addClass("w3-green");
				}
				if(kSign>=100 && kSign<200){
					$(".kSign").addClass("w3-orange");
				}else if(kSign>=200){
					$(".kSign").addClass("w3-red");
				}else{
					$(".kSign").addClass("w3-green");
				}
				if(fatSign>=50 && fatSign<100){
					$(".fatSign").addClass("w3-orange");
				}else if(fatSign>=100){
					$(".fatSign").addClass("w3-red");
				}else{
					$(".fatSign").addClass("w3-green");
				}
				
			}
		
		console.log(nutriValue);
		var nutriData ={
				labels:["칼로리","탄수화물","단백질","지방","나트륨","칼륨"],
				 datasets: [{
					 label:"영양정보",					
				     backgroundColor:[
				    	 'rgba(255, 99, 132, 0.5)',
				    	 'rgba(120, 99, 132, 0.5)',
			             'rgba(54, 162, 235, 0.5)',
			             'rgba(255, 206, 86, 0.5)',
			             'rgba(75, 192, 192, 0.5)',
			             'rgba(153, 102, 255, 0.5)',
				     ],
				     data: nutriValue
				}]
		}
		return nutriData;
	}	
	
	//영양차트 함수
	function drawNutriChart(nutriData){
		var ctx = $("#nutriChart");
		var myChart = new Chart(ctx, {
		    type: 'polarArea',
		    data: nutriData
		    
		});		
	
	}	
	
</script>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<!-- Start Top Bar -->
	
	<!-- End Top Bar -->
	<br>
	<br>
	<br>
	<!-- You can now combine a row and column if you just need a 12 column row -->
	

	<div class="container">
		<div class="medium-6 columns">
			<img class="thumbnail dietImg" data-dietImg="${list[0].dietImg}" src='displayFile?fileName=${list[0].dietImg}'>
			<div class="row small-up-3">
				<!-- <img src="resources/customerImage/option_list.png"> -->
				<c:forEach items="${list}" var="list">
				<div class="column defaultFood" data-foodGCode='${list.foodGCode}'>
						
						<img class="thumbnail sideDImg" src='displayFile?fileName=${list.sideDImg}'>
					
					<div class="defaultSideDName">${list.sideDName}</div>
				</div>
				</c:forEach>
				<!-- 
				<div class="column">
					<img class="thumbnail t1"
						src="resources/customerImage/detail_option_img.png">
				</div>
				<div class="column">
					<img class="thumbnail t2" src="http://placehold.it/250x200">
				</div>
				<div class="column">
					<img class="thumbnail t3" src="http://placehold.it/250x200">
				</div>
				<div class="column">
					<img class="thumbnail t4" src="http://placehold.it/250x200">
				</div>
				<div class="column">
					<img class="thumbnail t5" src="http://placehold.it/250x200">
				</div>
				<div class="column">
					<img class="thumbnail t6" src="http://placehold.it/250x200">
				</div> -->				
			</div>
		</div>

		<!-- 우측 식단 정보 영역 -->
		<div class="medium-6 columns">
		<div>
			<h3 id="dietName">${list[0].dietName}</h3>

			<div class="row">
				<div class="small-3 columns">
					<label for="dietAmount" class="middle" name="dietAmount">수량</label>
					<label for="middle-label" class="middle">가격</label>
				</div>
				<div class="small-9 columns float-right">
					<input id="dietAmount" type="number" name="dietAmount" min="1"
						value="1"> <span id="dietPrice"
						data-basicPrice="${list[0].price}">${list[0].price}</span> <b>원</b>
				</div>
			</div>

			<!-- 장바구니, 주문하기 버튼 -->
			<div class="large secondary expanded button-group">
				
				<a href="#" class="button large expanded" id="goMyCart">Cart</a> <a href="#"
					class="button large expanded" id="doOrder">Buy Now</a>
			</div>
			</div>
			<!-- 영양차트 -->
			<div class="nutriChart">
				<h4 class="text-center">1일 영양성분 기준에 대한 비율(%)</h4>
				<canvas id="nutriChart"></canvas>				
			</div>				
			<div class="center-block table-responsive">
			<table class="table table-condensed">  
				<tr><td>성별</td><td>칼로리<br>(Kcal)</td><td>탄수화물<br>(g)</td><td>단백질<br>(g)</td><td>지방<br>(g)</td><td>나트륨<br>(g)</td><td>칼륨<br>(g)</td></tr>
				<tr><td>남자</td><td id="MKcal">2400</td><td id="MCarbo">405</td><td id="MProtein">50</td><td id="MFat">40</td><td id="MNa">2000</td><td id="MK">3500</td></tr>
				<tr><td>여자</td><td id="WMKcal">1900</td><td id="WMCarbo">325</td><td id="WMProtein">40</td><td id="WMFat">35</td><td id="WMNa">2000</td><td id="WMK">3500</td></tr>
			</table>
			</div>
			<div class="center-block table-responsive">
				<table class="table nutriTable">
					<tr><th class="kcalSign w3-green">칼로리<br>(Kcal)</th><th class="carboSign w3-green">탄수화물<br>(g)</th><th class="proteinSign w3-green">단백질<br>(g)</th><th class="fatSign w3-green">지방<br>(g)</th><th class="naSign w3-green">나트륨<br>(mg)</th><th class="kSign w3-green">칼륨<br>(mg)</th></tr>
					<tr class="nutriInfoTable"></tr>					
				</table>				
			</div>
		</div>
	</div>

	<!-- 반찬 선택창 -->
	<div id="foodGList"class="column row">
		<hr>
		<ul class="tabs" data-tabs id="example-tabs">
			<li class="tabs-title is-active"><a href="#panel1"
				aria-selected="true">밥</a></li>
			<li class="tabs-title"><a href="#panel2">국</a></li>
			<li class="tabs-title"><a href="#panel3">메인 메뉴1</a></li>
			<li class="tabs-title"><a href="#panel4">메인 메뉴2</a></li>
			<li class="tabs-title"><a href="#panel5">메인 메뉴3</a></li>
			<li class="tabs-title"><a href="#panel6">메인 메뉴4</a></li>
		</ul>
		<div class="tabs-content" data-tabs-content="example-tabs">
			<!-- 1번판넬 밥 -->
			<div class="tabs-panel is-active" id="panel1" data-foodGCode="01">
				<h4>밥</h4>
				<div class="row medium-up-3 large-up-5"></div>
			</div>

			<!-- 판넬2 국 -->
			<div class="tabs-panel" id="panel2" data-foodGCode="02">
				<h4>국</h4>
				<div class="row medium-up-3 large-up-5"></div>
			</div>

			<!-- 판넬3 메인 메뉴1 -->
			<div class="tabs-panel" id="panel3" data-foodGCode="03">
				<h4>메인 메뉴1</h4>
				<div class="row medium-up-3 large-up-5"></div>
			</div>

			<!-- 판넬4 메인 메뉴2 -->
			<div class="tabs-panel" id="panel4" data-foodGCode="04">
				<h4>메인 메뉴2</h4>
				<div class="row medium-up-3 large-up-5"></div>
			</div>

			<!-- 판넬5 메인 메뉴3 -->
			<div class="tabs-panel" id="panel5" data-foodGCode="05">
				<h4>메인 메뉴3</h4>
				<div class="row medium-up-3 large-up-5"></div>
			</div>
			
			<!-- 판넬6 메인 메뉴4 -->
			<div class="tabs-panel" id="panel6" data-foodGCode="06">
				<h4>메인 메뉴4</h4>
				<div class="row medium-up-3 large-up-5">
				</div>				
			</div>
		</div>
	</div>

	<div class="row column">
		<hr>
	</div>



	<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script
		src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
	<script>
		$(document).foundation();
	</script>



<%-- 	<div class="detailOrderWrap">
		<div class="row">
			<div class="col-sm-7">
				<img src="http://via.placeholder.com/150x150">
				<!--<img id="dietImg" data-dietImg="${list[0].dietImg}"
					src='displayFile?fileName=${list[0].dietImg}' /> -->
			</div>
			<div class="col-sm-5">
				<div id="dietName">
					<h2>${list[0].dietName}</h2>
				</div>
				<div>
					가격 <span id="dietPrice" data-basicPrice="${list[0].price}">${list[0].price}</span>원
				</div>
				<div>
					<label name="dietAmount">수량</label><input id="dietAmount"
						type="number" name="dietAmount" value="1">
				</div>
				<div>
					<button id="goMyCart">장바구니</button>
					<button id="doOrder">주문하기</button>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${list}" var="list">
				<div class="col-sm-2  sideDList" data-foodGCode='${list.foodGCode}'>
					<div>
						<img src="http://via.placeholder.com/150x150">
						<!-- img class="sideDImg" src='displayFile?fileName=${list.sideDImg}'> -->
					</div>
					<div>${list.sideDName}반찬군이름나와야됨.</div>
				</div>
			</c:forEach>
		</div>
		<!-- 반찬군별 식단의 반찬 리스트 노출 -->
		<div class="row" id="foodGList">
			<c:forEach items="${list}" var="list">
				<div id="${list.foodGCode}_foodGList"
					data-foodGCode="${list.foodGCode}">
					<h1>${list.foodGCode}안녕반찬이름...</h1>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- 가은 편집 반찬 선택창 입니다 :) -->
	<div>
		<section>
			<nav>
				<ul>
				</ul>
			</nav>
		</section>
	</div>
	<div>
		<img src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150">
	</div>
	<div>
		<h1>삭제할 공간입니다.</h1>
		<div id="testing"></div>
	</div> --%>


	<form id="orderForm" method="get">
		<input id="setDietCode" type="hidden" name="dietCode" value="${list[0].dietCode }"> 
			<input id="setPrice" type="hidden" name="price"> 
			<input id="setDietImg" type="hidden" name="dietImg">
			<input id="setDietAmount" type="hidden" name="dietAmount"> 
			<input id="setDietName" type="hidden" name="dietName"> 
			<input id="customerId" type="hidden" name="id" value="${customerId}">
			<input type="hidden" name="detailOrder" value="true">
		<!-- 디테일오더에서 넘어갔는지 유무 -->
	</form>

<footer>
	<%@include file="../../footer.jsp" %>
</footer>
</body>
</html>