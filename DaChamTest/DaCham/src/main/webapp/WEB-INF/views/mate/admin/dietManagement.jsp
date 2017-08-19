<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
     
<title>Insert title here</title>

</head>
<style>
.topMar{
	margin-top: 0.1cm;
}
.w3-card-4{
	margin-right: 25px; 
	margin-bottom : 20px;       
}
</style>
<body>
	<%@include file="../admin/upmenu.jsp"%>
	<div class="container"> 
	
		<div  class="col-sm-offset-1">
		<div class="w3-container ">         
				<div class="w3-card-4 w3-dark-grey w3-col m2">

					<div class="w3-container w3-center">
						<h4>당뇨 판매</h4>
						<div class="w3-section">
							<p id="str1"></p>
							<button class="active w3-button w3-green w3-center" id="Diabetes"
								data-code="1">당뇨</button>
						</div>
					</div>
				</div>
				<div class="w3-card-4 w3-dark-grey w3-col m2">
					<div class="w3-container w3-center">
						<h4>고지혈증 판매</h4>
						<div class="w3-section">
							<p id="str2"></p>
							<button class="active w3-button w3-green w3-center"
								id="Hyperlipidemia" data-code="2">고지혈증</button>
						</div>
					</div>
				</div>
				<div class="w3-card-4 w3-dark-grey w3-col m2">
					<div class="w3-container w3-center">
						<h4>심부전증 판매</h4>
						<div class="w3-section">
							<p id="str3"></p> 
							<button class="active w3-button w3-green" id="Hypertrophia"
								data-code="3">심부전증</button>
						</div>
					</div>
				</div>
				<div class="w3-card-4 w3-dark-grey w3-col m2">
					<div class="w3-container w3-center">
						<h4>신부전증 판매</h4>
						<div class="w3-section">
							<p id="str4"></p>
							<button class="active w3-button w3-green" id="Nephropathy" data-code="4">신부전증</button>
						</div>
					</div>
				</div>
				
				<div class="w3-card-4 w3-dark-grey w3-col m2"> 

					<div class="w3-container w3-center">
						<h4>기타 판매</h4> 
						<div class="w3-section">
							<p id="str5"></p>
							<button class="active w3-button w3-green" id="etc"
								data-code="5">기타</button>
						</div> 
					</div>

				</div>
				
			</div>  
		
		                                                    
		<!-- <ul class="nav nav-pills">    
			<li role="presentation" class="active"><a href="#" onclick="disease1();">당뇨</a></li>
			<li role="presentation" class="active"><a href="#" onclick="disease2();">고지혈증</a></li>
			<li role="presentation" class="active"><a href="#" onclick="disease3();">심부전증</a></li>
			<li role="presentation" class="active"><a href="#" onclick="disease4();">신부전증</a></li> 
		</ul> -->
		</div>
		<div class="topMar">
			<table class="tables table table-condensed" width="600">
				<tr>
					<th>선택</th>
					<th>식단명</th>
					<th>금액</th>
					<th>질환명</th>
					<th>질환 위험도</th>
					<th>상태</th>
				</tr>
			</table>
			<ul class="pagination" position="center">
					</ul>
		</div>
		<div class="col-sm-offset-10">
			<button id="dietSell" class="btn btn-default">판매</button>
			<button id="dietSellStop" class="btn btn-danger">판매중지</button>
		</div>
	</div>
	<div>
		<form id='dietSellForm' method='GET' action='dietSell'></form>
		<form id='dietSellStopForm' method='GET' action='dietSellStop'>
		</form>
	</div>
	
</body>
<script>
function fontColor1(){    
	var length = $('.dietAll').length;
	for(var i=0; i<length; i++){
		var font = $(".spDietItem").eq(i).text();
		if(font =="판매중지"){
			   
			$(".spDietItem").eq(i).css("color", "red");      
		}
	}
} 
function disease1(){
	$
	.getJSON(
			"adminSub/disease1",
			function(data) {
				console.log(data);
				$(".dietAll").remove();
				var str = "";
				for (var i = 0; i < data.length; i++) {
					if (data[i].spDietItem == 0) {
						data[i].spDietItem = "특별식단"
					} else if (data[i].spDietItem == 1) {
						data[i].spDietItem = "판매중"
					} else {
						data[i].spDietItem = "판매중지"
					}
					str += "<tr class='dietAll'>"
							+ "<td><input type='checkBox' name='dietCode' value='"+data[i].dietCode+"'></td>"
							+ "<td>"
							+ data[i].dietName
							+ "</td>"
							+ "<td><input type='text' value='" + data[i].price + "'>"
							+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data[i].dietCode+"'>가격수정</button>"
							+ "</td>"
							+ "<td>"
							+ data[i].diseaseName
							+ "</td><td>" 
							+ data[i].judgement
							+ "</td><td class='spDietItem'>"
							+ data[i].spDietItem
							+ "</td></tr>"
				}
				console.log(str);
				$(".tables").append(str);
				$(".pagination").empty();
				fontColor1();        
			});
}
function disease2(){
	$
	.getJSON(
			"adminSub/disease2",
			function(data) {
				console.log(data);
				$(".dietAll").remove();
				var str = "";
				for (var i = 0; i < data.length; i++) {
					if (data[i].spDietItem == 0) {
						data[i].spDietItem = "특별식단"
					} else if (data[i].spDietItem == 1) {
						data[i].spDietItem = "판매중"
					} else {
						data[i].spDietItem = "판매중지"
					}
					str += "<tr class='dietAll'>"
							+ "<td><input type='checkBox' name='dietCode' value='"+data[i].dietCode+"'></td>"
							+ "<td>"
							+ data[i].dietName
							+ "</td>"
							+ "<td><input type='text' value='" + data[i].price + "'>"
							+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data[i].dietCode+"'>가격수정</button>"
							+ "</td>"
							+ "<td>"
							+ data[i].diseaseName
							+ "</td><td>"
							+ data[i].judgement
							+ "</td><td class='spDietItem'>"
							+ data[i].spDietItem
							+ "</td></tr>"
				}
				console.log(str);
				$(".tables").append(str);
				$(".pagination").empty();
				fontColor1();
			});
}  
function disease3(){
	$
	.getJSON(
			"adminSub/disease3",
			function(data) {
				console.log(data);
				$(".dietAll").remove();
				var str = "";
				for (var i = 0; i < data.length; i++) {
					if (data[i].spDietItem == 0) {
						data[i].spDietItem = "특별식단"
					} else if (data[i].spDietItem == 1) {
						data[i].spDietItem = "판매중"
					} else {
						data[i].spDietItem = "판매중지"
					}
					str += "<tr class='dietAll'>"
							+ "<td><input type='checkBox' name='dietCode' value='"+data[i].dietCode+"'></td>"
							+ "<td>"
							+ data[i].dietName
							+ "</td>"
							+ "<td><input type='text' value='" + data[i].price + "'>"
							+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data[i].dietCode+"'>가격수정</button>"
							+ "</td>"
							+ "<td>"
							+ data[i].diseaseName
							+ "</td><td>"
							+ data[i].judgement
							+ "</td><td class='spDietItem'>"
							+ data[i].spDietItem
							+ "</td></tr>"
				}
				console.log(str);
				$(".tables").append(str);
				$(".pagination").empty();
				fontColor1();
			});
}
function disease4(){
	$
	.getJSON(
			"adminSub/disease4",
			function(data) {
				console.log(data);
				$(".dietAll").remove();
				var str = "";
				for (var i = 0; i < data.length; i++) {
					if (data[i].spDietItem == 0) {
						data[i].spDietItem = "특별식단"
					} else if (data[i].spDietItem == 1) {
						data[i].spDietItem = "판매중"
					} else {
						data[i].spDietItem = "판매중지"
					}
					str += "<tr class='dietAll'>"
							+ "<td><input type='checkBox' name='dietCode' value='"+data[i].dietCode+"'></td>"
							+ "<td>"
							+ data[i].dietName
							+ "</td>"
							+ "<td><input type='text' value='" + data[i].price + "'>"
							+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data[i].dietCode+"'>가격수정</button>"
							+ "</td>"
							+ "<td>"
							+ data[i].diseaseName
							+ "</td><td>"
							+ data[i].judgement
							+ "</td><td class='spDietItem'>"    
							+ data[i].spDietItem
							+ "</td></tr>"
				}
				console.log(str);
				$(".tables").append(str);
				$(".pagination").empty();
				fontColor1();
			});
	
}
function disease5(){
	$
	.getJSON(
			"adminSub/disease5",
			function(data) {
				console.log(data);
				$(".dietAll").remove();
				var str = "";
				for (var i = 0; i < data.length; i++) {
					if (data[i].spDietItem == 0) {
						data[i].spDietItem = "특별식단"
					} else if (data[i].spDietItem == 1) {
						data[i].spDietItem = "판매중"
					} else {
						data[i].spDietItem = "판매중지"
					}
					str += "<tr class='dietAll'>"
							+ "<td><input type='checkBox' name='dietCode' value='"+data[i].dietCode+"'></td>"
							+ "<td>"
							+ data[i].dietName
							+ "</td>"
							+ "<td><input type='text' value='" + data[i].price + "'>"
							+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data[i].dietCode+"'>가격수정</button>"
							+ "</td>"
							+ "<td>"
							+ data[i].diseaseName
							+ "</td><td>"
							+ data[i].judgement
							+ "</td><td class='spDietItem'>"    
							+ data[i].spDietItem
							+ "</td></tr>"
				}
				console.log(str);
				$(".tables").append(str);
				$(".pagination").empty();
				fontColor1();
			});
	
}
	$("#Diabetes").click(function(){
		disease1();
	})
	$("#Hyperlipidemia").click(function(){
		disease2();
	})
	$("#Hypertrophia").click(function(){
		disease3();
	})
	$("#Nephropathy").click(function(){
		disease4();
	})
	$("#etc").click(function(){
		disease5()
	})

	$(document)
			.ready(
					function() {
						$("#dietManagement").addClass("w3-light-gray");
						
						function fontColor(){
							var length = $('.dietAll').length;
							for(var i=0; i<length; i++){
								var font = $(".spDietItem").eq(i).text();
								if(font =="판매중지"){
									   
									$(".spDietItem").eq(i).css("color", "red");      
								}
							}
						}
						
						function all(page) {
							$
									.getJSON(
											"adminSub/dietAll/"+page,
											function(data) {
												console.log(data);
												$(".dietAll").remove();
												var str = "";
												for (var i = 0; i < data.list.length; i++) {
													if (data.list[i].spDietItem == 0) {
														data.list[i].spDietItem = "특별식단"
													} else if (data.list[i].spDietItem == 1) {
														data.list[i].spDietItem = "판매중"
													} else {
														data.list[i].spDietItem = "판매중지"
													}
													str += "<tr class='dietAll'>"
															+ "<td><input type='checkBox' name='dietCode' value='"+data.list[i].dietCode+"'></td>"
															+ "<td>"
															+ data.list[i].dietName
															+ "</td>"
															+ "<td><input type='text' value='" + data.list[i].price + "'>"
															+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data.list[i].dietCode+"'>가격수정</button>"
															+ "</td>"
															+ "<td>"
															+ data.list[i].diseaseName
															+ "</td><td>"  
															+ data.list[i].judgement
															+ "</td><td class='spDietItem'>"
															+ data.list[i].spDietItem
															+ "</td></tr>"
												}
												console.log(str);
												$(".tables").append(str);
												printPaging(data.criteria);
												fontColor();
											});
						}
						all(1)
						
						var Diabetes = 0; //당뇨
						var Hyperlipidemia = 0; //고지혈증
						var Hypertrophia = 0; //심부전증
						var Nephropathy = 0; //신부전증
						var etc = 0; //기타
						
						var DiabetesDanger = 0; //당뇨 위험 
						var HyperlipidemiaDanger = 0; //고지혈증위험 
						var HypertrophiaDanger= 0; //심부전증위험 
						var NephropathyDanger = 0; //신부전증위험 
						
						var DiabetesHighDanger = 0; //당뇨 고위험 
						var HyperlipidemiaHighDanger = 0; //고지혈증고위험 
						var HypertrophiaHighDanger= 0; //심부전증고위험 
						var NephropathyHighDanger = 0; //신부전증고위험 
						function orderAllCountTd() {
							$
									.getJSON(
											"adminSub/DietAllTdCount", 
											function(data) {

												$("#str1").empty();
												$("#str2").empty();
												$("#str3").empty();
												$("#str4").empty();
												$("#str5").empty();
												for (var i = 0; i < data.length; i++) {
													if (data[i].diseaseName == "당뇨") {
														if(data[i].spDietItem=="1")
															if(data[i].judgement=="주의"){
																Diabetes++;
															}else if(data[i].judgement=="위험"){
																DiabetesDanger++
															}else if(data[i].judgement=="고위험"){
																DiabetesHighDanger++
															}
														
													} else if (data[i].diseaseName == "고지혈증") {
														if(data[i].spDietItem=="1")
															if(data[i].judgement=="주의"){
																Hyperlipidemia++;
															}else if(data[i].judgement=="위험"){
																HyperlipidemiaDanger++
															}else if(data[i].judgement=="고위험"){
																HyperlipidemiaHighDanger++
															}
													} else if (data[i].diseaseName == "심부전증") {
														if(data[i].spDietItem=="1")
															if(data[i].judgement=="주의"){
																Hypertrophia++;
															}else if(data[i].judgement=="위험"){
																HypertrophiaDanger++
															}else if(data[i].judgement=="고위험"){
																HypertrophiaHighDanger++
															}
													} else if (data[i].diseaseName == "신부전증") {
														if(data[i].spDietItem=="1")
															if(data[i].judgement=="주의"){
																Nephropathy++;
															}else if(data[i].judgement=="위험"){
																NephropathyDanger++
															}else if(data[i].judgement=="고위험"){
																NephropathyHighDanger++
															}
													} else if(data[i].diseaseName == "기타"){ 
														etc++ 
													}

												}
												str1 = "<p id='str1'>주의  : "
														+ Diabetes + "건<br>위험 : "+DiabetesDanger +"건<br>고위험 : "+DiabetesHighDanger +"건</p>"
												str2 = "<p id='str2'>주의  : "
													+ Hyperlipidemia  + "건<br>위험 : "+HyperlipidemiaDanger  +"건<br>고위험 : "+HyperlipidemiaHighDanger  +"건</p>"
												str3 = "<p id='str3'>주의  : "
													+ Hypertrophia   + "건<br>위험 : "+HypertrophiaDanger  +"건<br>고위험 : "+HypertrophiaHighDanger  +"건</p>"
												str4 = "<p id='str4'>주의  : "
													+ Nephropathy   + "건<br>위험 : "+NephropathyDanger   +"건<br>고위험 : "+NephropathyHighDanger   +"건</p>" 
												str5 = "<p id='str5'>" + etc
														+ "건<br><br><br></p>" 

												$("#str1").append(str1);
												$("#str2").append(str2);
												$("#str3").append(str3);  
												$("#str4").append(str4);  
												$("#str5").append(str5);

											});
						}
						orderAllCountTd()
						$(".tables").on('click', '.priceUpdate', function() {
							//alert($(this).prev().val());
							var price = $(this).prev().val();
							var dietCode = ($(this).attr('data-price'));
							$.ajax({
								url : 'adminSub/priceUp',
								data : JSON.stringify({
									'price' : price,
									'dietCode' : dietCode
								}),
								dataType : 'text',
								type : 'put',
								headers : {
									"Content-Type" : "application/json",
									"X-HTTP-Method-Override" : "PUT"
								},
								success : function(data) {
									alert("가격수정되었습니다");
									all();
								},
								error : function() {
									alert("실패");
								}

							});
						});
						$("#dietSell")
								.on(
										'click',
										function() {
											var dietCode = "";
											var length = $('.tables input:checked').length;
										          
											
											if(length != 0){
											for (var i = 0; i < $('.dietAll').length; i++) { 
												if ($(
														'.dietAll:eq(' + i
																+ ') input')
														.prop('checked')) {
													dietCode = $(
															'.dietAll:eq(' + i
																	+ ') input')
															.val();
													//alert(dietCode);
													$("#dietSellForm")
															.append(
																	'<input type="hidden" value= "'+dietCode+'" name="dietCode">');
												}
											}
											//alert(JSON.stringify(dietinfo));     
											$("#dietSellForm").submit();
											}else{
												alert("식단을 선택하세요");
											}
										});

						$("#dietSellStop")
								.on(
										'click',
										function() {
											var dietCode = "";
											var length = $('.tables input:checked').length;
											if(length != 0){
											for (var i = 0; i < $('.dietAll').length; i++) {
												if ($(
														'.dietAll:eq(' + i
																+ ') input')
														.prop('checked')) {
													dietCode = $(
															'.dietAll:eq(' + i
																	+ ') input')
															.val();
													//alert(dietCode); 
													$("#dietSellStopForm")
															.append(
																	'<input type="hidden" value= "'+dietCode+'" name="dietCode">');
												}
											}
											//alert(JSON.stringify(dietinfo));   
											$("#dietSellStopForm").submit();
											}else{
												alert("식단을 선택하세요"); 
											}
										});
						
						
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

						var currentPage = 1;
						$(".pagination").on("click", "li a", function() {
							event.preventDefault();
							var replyPage = $(this).attr("href");
							all(replyPage);
						});   

				
						
						

					});
</script>
</html>