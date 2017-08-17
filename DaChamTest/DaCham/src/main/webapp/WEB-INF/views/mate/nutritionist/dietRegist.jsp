<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="resources/openAPIjs/radarchart.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="resources/bootstrap-filestyle.min.js">
	
</script>
<script>
	$(document)
			.ready(
					function() {
						$("#diet").addClass("w3-light-gray");
						var currentPage = 1;
						var currentGroup = "";
						var v = 0;

						sideAll(1, "01");
						$("#sideAll").on("click", function() {
							sideAll();
						});
						$("#cancle").click(function() {
							if (window.confirm("정말로 취소하시겠습니까?")) {
								window.location.href = "diet";
							}
						});
						localStorage.clear();
						
						if (!localStorage['init']
								|| isNaN(localStorage['count']) == true || isNaN(localStorage['count1']) == true || isNaN(localStorage['count2']) == true || isNaN(localStorage['count3']) == true || isNaN(localStorage['count4']) == true || isNaN(localStorage['count5']) == true || isNaN(localStorage['count6']) == true) {
							localStorage['init'] = "true";
							localStorage['count'] = 0;
							localStorage['count1'] = 0;
							localStorage['count2'] = 0;
							localStorage['count3'] = 0;
							localStorage['count4'] = 0;
							localStorage['count5'] = 0;
							localStorage['count6'] = 0;
							localStorage[0 + '_kcal1'] = 0;
							localStorage[0 + '_carbohydrate1'] = 0;
							localStorage[0 + '_protein1'] = 0;
							localStorage[0 + '_fat1'] = 0;
							localStorage[0 + '_na1'] = 0;
							localStorage[0 + '_kcal2'] = 0;
							localStorage[0 + '_carbohydrate2'] = 0;
							localStorage[0 + '_protein2'] = 0;
							localStorage[0 + '_fat2'] = 0;
							localStorage[0 + '_na2'] = 0;
							localStorage[0 + '_kcal3'] = 0;
							localStorage[0 + '_carbohydrate3'] = 0;
							localStorage[0 + '_protein3'] = 0;
							localStorage[0 + '_fat3'] = 0;
							localStorage[0 + '_na3'] = 0;
							localStorage[0 + '_kcal4'] = 0;
							localStorage[0 + '_carbohydrate4'] = 0;
							localStorage[0 + '_protein4'] = 0;
							localStorage[0 + '_fat4'] = 0;
							localStorage[0 + '_na4'] = 0;
							localStorage[0 + '_kcal5'] = 0;
							localStorage[0 + '_carbohydrate5'] = 0;
							localStorage[0 + '_protein5'] = 0;
							localStorage[0 + '_fat5'] = 0;
							localStorage[0 + '_na5'] = 0;
							localStorage[0 + '_kcal6'] = 0;
							localStorage[0 + '_carbohydrate6'] = 0;
							localStorage[0 + '_protein6'] = 0;
							localStorage[0 + '_fat6'] = 0;
							localStorage[0 + '_na6'] = 0;
						}
						openAPI();
						$(document.body)
								.on(
										"click",
										".nameClick",
										function() {
											$('#body').show();
											event.preventDefault();
											var foodGCode= $(this).attr("data-foodGCode");
											var foodGLength = $(".foodG"+foodGCode+" img").length;
											console.log("푸드그룹랭스 "+foodGLength);
											if(foodGLength>4){
												alert("다섯가지 이상 선택할 수 없습니다.");												
											}else{ 
											$(this).parent().parent().hide();
											var count = parseInt(localStorage['count']);
											console.log(count);
											var sideDImg = $(this).attr(
													'data-img');
										
											
// 											localStorage[count+"_sideDCode"] = sideDCode;
											
											var sideDName = $(this).attr('data-name');

// 											$
// 													.getJSON(
// 															"nutriAjax/allNutri/"
// 																	+ sideDCode,
// 															function(data) {
// 																var subCount = count - 1;

// 																localStorage[subCount
// 																		+ '_kcal'] = data.kcal;
// 																localStorage[subCount
// 																		+ '_carbohydrate'] = data.carbohydrate;
// 																localStorage[subCount
// 																		+ '_protein'] = data.protein;
// 																localStorage[subCount
// 																		+ '_fat'] = data.fat;
// 																localStorage[subCount
// 																		+ '_na'] = data.na;
// 																openAPI();
// 															});                         

											var foodGCode = $(this).attr('data-foodgcode');
											var sideDCode = $(this).attr('data-code');
											var length = $(".foodG"+foodGCode).children().length;
											var status = true;
											
											if(length == 0){
												++count;

												localStorage['count'] = count;
												Refresh(foodGCode, sideDImg, sideDCode, sideDName);
												v = count;
											}
											else{
												for(var i = 0; i < length; i++){
	 												console.log("콘솔:"+$(".foodG"+foodGCode).children().eq(i).children().eq(0).val());
	 												if($(".foodG"+foodGCode).children().eq(i).children().eq(0).val() == sideDCode){
	 													alert("중복된 반찬이 있습니다.");
	 													status = false;
	 													break;
													}
													else{
						
														
													}
												}
												if(status == true){
													++count;

													localStorage['count'] = count;
													Refresh(foodGCode, sideDImg, sideDCode, sideDName);
													v = count;
												}
											}
 											
											
											
											
											
											
											
//  											for(var i = 0; i<count;i++){
//  												for(var j = 0; j<i;j++){
//  													if(localStorage[i+'_sideDCode'] == localStorage[j + '_sideDCode']){
//  														alert("중복된 반찬을 선택하셨습니다.");
														
//  													}
//  													else{
//  														Refresh(foodGCode, sideDImg, sideDCode, sideDName);
//  														break;
//  													}
 				
//  												}
//  											}
											
										
											
											
											
											
											
											
											}
											});

						$(document.body)
								.on(
										'click',
										'.sideDImg',
										function() {
											var count = parseInt(localStorage['count']);
											var id = $(this).attr('data-id');

											var sideDCode = $('.sideDCode')
													.val();
											console.log("데이터:" + sideDCode);
											var prev = $(this).prev().val();
											console.log("element값:"+prev);
											$(
													'.nameClick[data-code = "'
															+ prev + '"]')
													.parent().parent().show();
											
											$(this).parent().remove();

											localStorage
													.removeItem(id + '_img');
											localStorage
											.removeItem(id + '_codes');
											localStorage
											.removeItem(id + '_foodGCode');
											localStorage
											.removeItem(id + '_sideDName');
											localStorage
											.removeItem(id + '_sideDCode');
// 											localStorage.removeItem(id
// 													+ '_codes');
// 											localStorage.removeItem(id
// 													+ '_kcal');
// 											localStorage.removeItem(id
// 													+ '_carbohydrate');
// 											localStorage.removeItem(id
// 													+ '_protein');
// 											localStorage
// 													.removeItem(id + '_fat');
// 											localStorage.removeItem(id + '_na');
											--count;
											localStorage['count'] = count;
											
											v = count;
											cntChange(v);
										});

						$(document.body).on(
								"mouseover",
								".nameClick",
								function() {
									var sideDCode = $(this).attr('data-code');
									console.log("이것은" + sideDCode);
									$.getJSON(
											"nutriAjax/allNutri/" + sideDCode,
											function(data) {
												$("#sideDName").text(
														data.sideDName);
												$("#kcal").text(data.kcal);
												$("#carbohydrate").text(
														data.carbohydrate);
												$("#protein")
														.text(data.protein);
												$("#fat").text(data.fat);
												$("#na").text(data.na);
											});
								});

						$(".template a")
								.on(
										"click",
										function() {
											event.preventDefault();

											$("#body").hide();
											var diseaseCode = $(this).attr(
													"data-code");

											localStorage.clear();

											$
													.getJSON(
															"nutriAjax/template/"
																	+ diseaseCode,
															function(data) {
																console
																		.log(data);
																var str = "";
																$(data)
																		.each(
																				function() {
																					str += "<img src = 'displayFile?fileName="
																							+ this.sideDImg
																							+ "' class='img-responsive'>"
																							+ "<input type = 'hidden' name = 'sideDCode' value = '"+this.sideDCode+"'>";
																				});
																$(".material")
																		.html(
																				str);
															});
											$.getJSON(
													"nutriAjax/templateCount/"
															+ diseaseCode,
													function(data) {
														$("#cnt").val(data);
													});
										});

						function Refresh(foodGCode, sideDImg, sideDCode, sideDName) {
							var count = parseInt(localStorage['count']);
							
							
								switch (foodGCode) {
								case "01":
									$(
											'<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG01" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'"><label for="'+sideDCode+'">'
													+ sideDName + '</label></div>').appendTo('.foodG01');
									
											
									break;
								case "02":
									$(
											'<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive sideDImg" data-id = "'+1+'" >'+'<input type="radio" name="foodG02" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'"><label for="'+sideDCode+'">'
													+ sideDName + '</label></div>').appendTo('.foodG02');
									break;
								case "03":
									
									$(
											'<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive sideDImg" data-id = "'+3+'" >'+'<input type="radio" name="foodG03" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'"><label for="'+sideDCode+'">'
													+ sideDName + '</label></div>').appendTo('.foodG03');
									break;
								case "04":
									
									$(
											'<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive sideDImg" data-id = "'+4+'" >'+'<input type="radio" name="foodG04" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'"><label for="'+sideDCode+'">'
													+ sideDName + '</label></div>').appendTo('.foodG04');
									break;
								case "05":
									
									$(
											'<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive sideDImg" data-id = "'+5+'" >'+'<input type="radio" name="foodG05" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'"><label for="'+sideDCode+'">'
													+ sideDName + '</label></div>').appendTo('.foodG05');
									break;
								case "06":
										
									$(
											'<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive sideDImg" data-id = "'+6+'" >'+'<input type="radio" name="foodG06" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'"><label for="'+sideDCode+'">'
													+ sideDName + '</label></div>').appendTo('.foodG06');
									break;
								}

							

							v = count;

							cntChange(v);
						}
						Refresh();

						function cntChange(v) {
							$.getJSON("nutriAjax/" + v, function(data) {
								$("#cnt").val(data);

							});
						}

						$(
								'<input type = "hidden" id = "cnt" name = "count" value = "'+v+'">')
								.appendTo("#registForm");
						
						var TKcal = 0;
						var TCarbohydrate = 0;
						var TProtein = 0;
						var TFat = 0;
						var TNa = 0;
						$(document.body).on("click","input:radio[name=foodG01]",function(){
							var sideDCode = $(this).attr("id");
							var count1 = parseInt(localStorage['count1']);
							$.getJSON("nutriAjax/allNutri/"+sideDCode,function(data){
								localStorage[count1 + '_kcal1'] = data.kcal;
								localStorage[count1 + '_carbohydrate1'] = data.carbohydrate;
								localStorage[count1 + '_protein1'] = data.protein;
								localStorage[count1 + '_fat1'] = data.fat;
								localStorage[count1 + '_na1'] = data.na;
								
								TKcal += data.kcal;
								TCarbohydrate += data.carbohydrate;
								TProtein += data.protein;
								TFat += data.fat;
								TNa += data.na;
								
								$("#TKcal").text(TKcal);
								$("#TCarbohydrate").text(TCarbohydrate);
								$("#TProtein").text(TProtein);
								$("#TFat").text(TFat);
								$("#TNa").text(TNa);
								
								count1++;
								openAPI();
							});
							
						});
						
						$(document.body).on("click","input:radio[name=foodG02]",function(){
							var sideDCode = $(this).attr("id");
							var count2 = parseInt(localStorage['count2']);
							$.getJSON("nutriAjax/allNutri/"+sideDCode,function(data){
								localStorage[count2 + '_kcal2'] = data.kcal;
								localStorage[count2 + '_carbohydrate2'] = data.carbohydrate;
								localStorage[count2 + '_protein2'] = data.protein;
								localStorage[count2 + '_fat2'] = data.fat;
								localStorage[count2 + '_na2'] = data.na;
								
								
								TKcal += data.kcal;
								TCarbohydrate += data.carbohydrate;
								TProtein += data.protein;
								TFat += data.fat;
								TNa += data.na;
								
								$("#TKcal").text(TKcal);
								$("#TCarbohydrate").text(TCarbohydrate);
								$("#TProtein").text(TProtein);
								$("#TFat").text(TFat);
								$("#TNa").text(TNa);
								
								count2++;
								openAPI();
							});
							
						});
						
						$(document.body).on("click","input:radio[name=foodG03]",function(){
							var sideDCode = $(this).attr("id");
							var count3 = parseInt(localStorage['count3']);
							$.getJSON("nutriAjax/allNutri/"+sideDCode,function(data){
								localStorage[count3 + '_kcal3'] = data.kcal;
								localStorage[count3 + '_carbohydrate3'] = data.carbohydrate;
								localStorage[count3 + '_protein3'] = data.protein;
								localStorage[count3 + '_fat3'] = data.fat;
								localStorage[count3 + '_na3'] = data.na;
								
								TKcal += data.kcal;
								TCarbohydrate += data.carbohydrate;
								TProtein += data.protein;
								TFat += data.fat;
								TNa += data.na;
								
								$("#TKcal").text(TKcal);
								$("#TCarbohydrate").text(TCarbohydrate);
								$("#TProtein").text(TProtein);
								$("#TFat").text(TFat);
								$("#TNa").text(TNa);
								
								
								count3++;
								openAPI();
							});
							
						});
						
						$(document.body).on("click","input:radio[name=foodG04]",function(){
							var sideDCode = $(this).attr("id");
							var count4 = parseInt(localStorage['count4']);
							$.getJSON("nutriAjax/allNutri/"+sideDCode,function(data){
								localStorage[count4 + '_kcal4'] = data.kcal;
								localStorage[count4 + '_carbohydrate4'] = data.carbohydrate;
								localStorage[count4 + '_protein4'] = data.protein;
								localStorage[count4 + '_fat4'] = data.fat;
								localStorage[count4 + '_na4'] = data.na;
								
								
								TKcal += data.kcal;
								TCarbohydrate += data.carbohydrate;
								TProtein += data.protein;
								TFat += data.fat;
								TNa += data.na;
								
								$("#TKcal").text(TKcal);
								$("#TCarbohydrate").text(TCarbohydrate);
								$("#TProtein").text(TProtein);
								$("#TFat").text(TFat);
								$("#TNa").text(TNa);
								
								count4++;
								openAPI();
							});
							
						});
						
						$(document.body).on("click","input:radio[name=foodG05]",function(){
							var sideDCode = $(this).attr("id");
							var count5 = parseInt(localStorage['count5']);
							$.getJSON("nutriAjax/allNutri/"+sideDCode,function(data){
								localStorage[count5 + '_kcal5'] = data.kcal;
								localStorage[count5 + '_carbohydrate5'] = data.carbohydrate;
								localStorage[count5 + '_protein5'] = data.protein;
								localStorage[count5 + '_fat5'] = data.fat;
								localStorage[count5 + '_na5'] = data.na;
								
								TKcal += data.kcal;
								TCarbohydrate += data.carbohydrate;
								TProtein += data.protein;
								TFat += data.fat;
								TNa += data.na;
								
								$("#TKcal").text(TKcal);
								$("#TCarbohydrate").text(TCarbohydrate);
								$("#TProtein").text(TProtein);
								$("#TFat").text(TFat);
								$("#TNa").text(TNa);
								
								
								count5++;
								openAPI();
							});
							
						});
						
						$(document.body).on("click","input:radio[name=foodG06]",function(){
							var sideDCode = $(this).attr("id");
							var count6 = parseInt(localStorage['count6']);
							$.getJSON("nutriAjax/allNutri/"+sideDCode,function(data){
								localStorage[count6 + '_kcal6'] = data.kcal;
								localStorage[count6 + '_carbohydrate6'] = data.carbohydrate;
								localStorage[count6 + '_protein6'] = data.protein;
								localStorage[count6 + '_fat6'] = data.fat;
								localStorage[count6 + '_na6'] = data.na;
								
								
								TKcal += data.kcal;
								TCarbohydrate += data.carbohydrate;
								TProtein += data.protein;
								TFat += data.fat;
								TNa += data.na;
								
								$("#TKcal").text(TKcal);
								$("#TCarbohydrate").text(TCarbohydrate);
								$("#TProtein").text(TProtein);
								$("#TFat").text(TFat);
								$("#TNa").text(TNa);
								
								count6++;
								openAPI();
							});
							
						});
						
						$("#regist").on("click", function() {
							var length1 = $(".foodG01 input[type ='hidden']").length;
							var length2 = $(".foodG02 input[type ='hidden']").length;
							var length3 = $(".foodG03 input[type ='hidden']").length;
							var length4 = $(".foodG04 input[type ='hidden']").length;
							var length5 = $(".foodG05 input[type ='hidden']").length;
							var length6 = $(".foodG06 input[type ='hidden']").length;
							var sideDLength = $(".material input[type='hidden']").length;
							$(".material input[type='radio']:checked").clone().appendTo("#registForm");							
							//checked 먼저 넣고 바꾸기							
							for(var i=0;i<$("#registForm .foodType:checked").length;i++){
								var sideDType=$("#registForm .foodType").eq(i).val().replace("_1","_0");
								$("#registForm .foodType").eq(i).val(sideDType);
							}
							$("#registForm .foodType").attr("type","hidden");
							
							/* for(var i=0;i<sideDLength;i++){
								var sideDCode = $(".material input[type='hidden']").eq(i).val();
								$("<input type='hidden' name='sideDCode'>").val(sideDCode).appendTo("#registForm");							
							} */
							$(".material input[type='radio']").clone().appendTo("#registForm");	
							$("#registForm .foodType:checked").remove();
							$("#registForm .foodType").attr("type","hidden");
							$("#registForm .foodType").attr("name","sideDType");
							
							
							if($("#dietNameText").val() == ""){
								alert("식단명을 지으셔야 합니다.");
							}
							else if($("#prev_View_area").attr("src") == "http://placehold.it/100x100"){
								alert("이미지를 선택하세요");
							}		
							else if($("#priceText").val() == ""){
								alert("식단가격을 정하셔야 합니다.");
							}
							else if((length1 <= 0) || (length2 <= 0) || (length3 <= 0) || (length4 <= 0) || (length5 <= 0) || (length6 <= 0)){
								alert("최소한 한 개 이상의 반찬은 선택하셔야 합니다.");
							}
							else if($(".diseaseCodeId option:selected").val() == '0' || $(".diseaseCodeId option:selected").val() == '-1'){
								alert("질병을 선택해 주세요");
							}
											
							else{
								$("#registForm").attr("method", "post");
								$("#registForm").attr("action", "diet");
								$("#registForm").submit();	
							}
							
						});

						$(".templateErase").on("click", function() {
							event.preventDefault();

							localStorage['count'] = 0;

							$(".material img").remove();
							$(".material input").remove();
						});

						$("#search")
								.on(
										"click",
										function() {
											$(".searchResult").remove();
											var search = $("#keyword").val();
											$
													.getJSON(
															"nutriAjax/listSearch/"
																	+ search,
															function(data) {
																var str = "";
																$(data)
																		.each(
																				function() {
																					str += "<tr class = 'searchResult'><td><a class = 'nameClick' data-foodGCode='"+this.foodGCode+"' data-img = '"+this.sideDImg+"' data-code = '"+this.sideDCode+"' data-name = '"+this.sideDName+"'>"        
																							+ this.sideDName                    
																							+ "</a></td>"
																							+ "<td>"
																							+ this.foodGName
																							+ "</td>"
																							+ "<td>"
																							+ this.cookMName
																							+ "</td></tr>"
																				});
																$(
																		".searchTable")
																		.append(
																				str);
															});
										});

						$(".pagination").on("click", "li a", function() {
							event.preventDefault();
							var replyPage = $(this).attr("href");
							sideAll(replyPage, currentGroup);
						});
						$("#rice").on("click", function() {
							sideAll(1, "01");
						});
						$("#soup").on("click", function() {
							sideAll(1, "02");
						});
						$("#main1").on("click", function() {
							sideAll(1, "03");
						});
						$("#main2").on("click", function() {
							sideAll(1, "04");
						});
						$("#main3").on("click", function() {
							sideAll(1, "05");
						});
						$("#main4").on("click", function() {
							sideAll(1, "06");
						});
						function sideAll(page, foodGCode) {
							$(".searchResult").remove();
							$
									.getJSON(
											"nutriAjax/sideAll/" + page + "/"
													+ foodGCode,
											function(data) {
												currentPage = page;
												currentGroup = foodGCode;
												console.log("이것만:" + foodGCode);
												var str = "";
												$(data.list)
														.each(
																function() {
																	str += "<tr class = 'searchResult'><td><a class = 'nameClick' data-foodGCode='"+currentGroup+"' data-img = '"+this.sideDImg+"' data-code = '"+this.sideDCode+"' data-name = '"+this.sideDName+"'>"
																			+ this.sideDName
																			+ "</a></td>"
																			+ "<td>"
																			+ this.foodGName
																			+ "</td>"
																			+ "<td>"
																			+ this.cookMName
																			+ "</td></tr>"
																});

												$(".searchTable").append(str);
												printPaging(data.criteria);
											});
						}
						function printPaging(criteria) {
							var str = "";

							if (criteria.prev) {
								str += "<li><a href=''"
										+ (criteria.startPage - 1) + "'>'"
										+ "<<" + "</a></li>";
							}
							for (var i = criteria.startPage; i <= criteria.endPage; i++) {
								var strClass = criteria.page == i ? "class = 'active'"
										: "";
								str += "<li "+strClass+"><a href ='"+i+"'>" + i
										+ "</a></li>";
							}
							if (criteria.next) {
								str += "<li><a href=''"
										+ (criteria.endPage + 1) + "'>'" + ">>"
										+ "</a></li>";
							}
							$(".pagination").html(str);
						}
					});
</script>

<title>식단 등록 페이지</title>
<!-- <style>
 .box1 {
  float:left;  }
  
 .box2 {
  display:inline-block;  margin-left:10px;}       
  .div1 {
  float:left;  }
 .div2 {
  display:inline-block;  margin-left:10px;}    
  body {
		  overflow: scroll;
		  margin: 0;
		  font-size: 14px;
		 
	}
   #body{
   		position : absolute;      
   		margin-left : 900px;          	
   		margin-bottom : 500px;                
   }
  #chart {
	  position: absolute;
	  top: 50px;
	  left: 10px;
	}	
</style> -->
<style>
.sideDImg {
	max-height: 80px;

	
}
label{
	display : inline;
}
.checkSideD{
	height : 150px;  
}

</style>
</head>
<body>
	<%@include file="nutritionistNavi.jsp"%>
	<div class="container">
		<div class="col-sm-6" style = "border: 1px solid gold;">
		<h3>선택된 반찬 목록</h3>        
		<div class="material">
			<div class="col-sm-12 h4">밥</div>
			<div class="foodG01 checkSideD"></div>
			<div class="col-sm-12  h4">국</div>
			<div class="foodG02 checkSideD"></div>
			<div class="col-sm-12 h4">메인메뉴1</div>
			<div class="foodG03 checkSideD"></div>
			<div class="col-sm-12 h4">메인메뉴2</div>
			<div class="foodG04 checkSideD"></div>
			<div class="col-sm-12 h4">메인메뉴3</div>
			<div class="foodG05 checkSideD"></div>
			<div class="col-sm-12 h4">메인메뉴4</div>
			<div class="foodG06 checkSideD"></div>
				
				
				
			</div>
<!-- 			<table class = "materialTable"> -->
<!-- 				<tr class = "foodG01"> -->
<!-- 					<td><h3>밥</h3></td> -->
										
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><h3>국</h3></td> -->
<!-- 					<td></td>					 -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><h3>메인 메뉴1</h3></td> -->
<!-- 					<td></td>					 -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><h3>메인 메뉴2</h3></td> -->
<!-- 					<td></td>					 -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><h3>메인 메뉴3</h3></td> -->
<!-- 					<td></td>					 -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td><h3>메인 메뉴4</h3></td> -->
<!-- 					<td></td>					 -->
<!-- 				</tr> -->
<!-- 			</table> -->
		</div>

		<div class="div1 col-sm-6">
			<div class="col-sm-12">
				<input type="text" name="search" id="keyword" placeholder="반찬 검색란">
				<button id="search" class="btn btn-primary">검색</button>
				<br>
				<button id="rice" class="btn btn-info">밥</button>
				<button id="soup" class="btn btn-info">국</button>
				<button id="main1" class="btn btn-info">메인 메뉴1</button>
				<button id="main2" class="btn btn-info">메인 메뉴2</button>
				<button id="main3" class="btn btn-info">메인 메뉴3</button>
				<button id="main4" class="btn btn-info">메인 메뉴4</button>
				<table class="searchTable table table-hover">
					<tr>
						<th>반찬명</th>
						<th>식품군</th>
						<th>조리방법</th>
					</tr>
					<tr class="searchResult">

					</tr>

				</table>
				<ul class="pagination">
				</ul>
			</div>
			<div class="box2 col-sm-12">
				<table class="table table-hover">
					<tr>
						<th>열량&nbsp;&nbsp;</th>
						<th>탄수화물&nbsp;&nbsp;</th>
						<th>단백질&nbsp;&nbsp;</th>
						<th>지방&nbsp;&nbsp;</th>
						<th>나트륨&nbsp;&nbsp;</th>
					</tr>
					<tr>
						<td id="kcal">&nbsp;&nbsp;&nbsp;</td>
						<td id="carbohydrate">&nbsp;&nbsp;&nbsp;</td>
						<td id="protein">&nbsp;&nbsp;&nbsp;</td>
						<td id="fat">&nbsp;&nbsp;&nbsp;</td>
						<td id="na">&nbsp;&nbsp;&nbsp;</td>
					</tr>
				</table>
				<div id="body">
					<div id="chart"></div>
					<div>
						<!-- 총 칼로리 양 표시 -->
					</div>
					<table class = "press table table-hover">
						<tr><td>칼로리<br>(Kcal)</td><td>탄수화물<br>(g)</td><td>단백질<br>(g)</td><td>지방<br>(g)</td><td>나트륨<br>(g)</td></tr>
            <tr><td id= "TKcal"></td><td id="TCarbohydrate"></td><td id="TProtein"></td><td id="TFat"></td><td id="TNa"></td></tr>
					</table>
					<table>
						<tr><td>성별</td><td>칼로리<br>(Kcal)</td><td>탄수화물<br>(g)</td><td>단백질<br>(g)</td><td>지방<br>(g)</td><td>나트륨<br>(g)</td><td>칼륨<br>(g)</td></tr>
            <tr><td>남자</td><td id="MKcal">2400</td><td id="MCarbo">405</td><td id="MProtein">50</td><td id="MFat">40</td><td id="MNa">2000</td><td id="MK">3500</td></tr>
            <tr><td>여자</td><td id="WMKcal">1900</td><td id="WMCarbo">325</td><td id="WMProtein">40</td><td id="WMFat">35</td><td id="WMNa">2000</td><td id="WMK">3500</td></tr>
					</table>
				</div>
			</div>
<input type="hidden" name="kcal" id="kcal"> <input
			type="hidden" name="carbohydrate" id="carbohydrate"> <input
			type="hidden" name="protein" id="protein"> <input
			type="hidden" name="fat" id="fat"> <input type="hidden"
			name="na" id="na">

		<div class="col-sm-12">
			<form id="registForm" enctype="multipart/form-data">
				<div class="div2">

<!-- 					<div class="template"> -->
<!-- 						질환별 식단 목록<br> - <a data-code="1">당뇨병</a><br> - <a -->
<!-- 							data-code="4">신부전증</a><br> - <a class="templateErase">템플릿 -->
<!-- 							초기화</a> -->
<!-- 					</div> -->


					<div id="test">
						<h5><b>질병을 선택하세요</b></h5>          
						<select name="diseaseCode"  class = "diseaseCodeId">
							<c:forEach items="${overList }" var="v">
								<option value="${v.diseaseCode }">${v.diseaseName },
									${v.judgement}</option>
							</c:forEach>
						</select>
					</div>
					<div id="dietName">
						<!-- 식단의 이름을 지어줌 -->
						<input type="text" id = "dietNameText" name="dietName" placeholder="식단 이름 짓기">
					</div>
					<div id="price">
						<!-- 식단의 가격을 지어줌 -->
						<input type="number" id = "priceText" name="price" placeholder="식단 가격 짓기">
					</div>
					<div id="dietImg">
						<input type="file" class="filestyle" data-input="false"
							name="file" placeholder="식단이미지 올리기" id="profile_pt"
							onchange="previewImage(this,'View_area')">
						<div id="View_area">
							<img id="prev_View_area" src="http://placehold.it/100x100">
						</div>
					</div>
					<div id="spDietItem">
						 <input type="hidden" name="spDietItem" value="1" checked>
					</div>

				</div>
			</form>

		</div>
		
			<div>

				<button id="regist" class="btn btn-danger">등록</button>
				<button id="cancle" class="btn btn-warning">취소</button>
			</div>
		</div>

	</div>
	<script>
		//이미지를 업로드하면 미리 볼 수 있는 기능
		function previewImage(targetObj, View_area) {
			var preview = document.getElementById(View_area);

			var files = targetObj.files
			for (var i = 0; i < files.length; i++) {
				var file = files[i];
				var imageType = /image.*/;
				if (!file.type.match(imageType)) {
					continue;
				}
				var prevImg = document.getElementById("prev_" + View_area);
				if (prevImg) {
					preview.removeChild(prevImg);
				}
				var img = document.createElement("img");
				img.id = "prev_" + View_area;
				img.classList.add("obj");
				img.file = file;
				img.style.width = '100px';
				img.style.height = '100px';
				preview.appendChild(img);
				if (window.FileReader) {
					var reader = new FileReader();
					reader.onloadend = (function(almg) {
						return function(e) {
							almg.src = e.target.result;
						};
					})(img);
					reader.readAsDataURL(file);
				}
			}
		}
	</script>
	<script src="resources/openAPIjs/APIQuery.js"></script>
</body>
</html>