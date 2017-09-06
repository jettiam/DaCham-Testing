<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri  ="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.wdb3a.dacham.bean.Nutritionist" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="resources/bootstrap-filestyle.min.js"></script>
<script>
	$(document).ready(function(){
		
	
		var currentPage = 1;
		var currentGroup = "";
		var dietCode = ${nutritionist.dietCode}
		var v = 0;
		sideAll(1, "01");
		  
		groupSelector1("01",dietCode);
		groupSelector2("02",dietCode);
		groupSelector3("03",dietCode);
		groupSelector4("04",dietCode);
		groupSelector5("05",dietCode);
		groupSelector6("06",dietCode);
		
		
		
		$("#sideAll").on("click", function() {
			sideAll();
		});
		$("#cancle").click(function() {
			if (window.confirm("정말로 취소하시겠습니까?")) {
				window.location.href = "diet";
			}
		});
		$(".update").on("click",function(){
			var dc = $(".diseaseCodeId").val();
			$("#diseaseCode").val(dc);
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
			$('<input type = "hidden" id = "cnt" name = "count" value = "'+sideDLength+'">').appendTo("#registForm");
			$("#registForm .foodType:checked").remove();
			$("#registForm .foodType").attr("type","hidden");
			$("#registForm .foodType").attr("name","sideDType");
			if($("#prev_View_area").attr("src") == "http://placehold.it/100x100"){
				alert("이미지를 변경하세요");
			}	
			else if(window.confirm("정말로 수정하시겠습니까?")){
				
				
				$("form").attr("action","dietModify");
				$("form").attr("method","post");
				$("form").submit();
			}
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
															str += "<tr class = 'searchResult'><td><a class = 'nameClick' data-foodGCode='"+this.foodGCode+"' data-img = '"+this.sideDImg+"' data-code = '"+this.sideDCode+"'>"
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
		$(document.body).on("click",".nameClick",function(){
			var foodGCode = $(this).attr("data-foodgcode");
			var sideDImg = $(this).attr('data-img');
			var sideDName = $(this).attr('data-name');
			var sideDCode = $(this).attr('data-code');
			$(this).parent().parent().remove();
			if(foodGCode == '01'){
				var foodGLength = $(".foodG"+foodGCode+" img").length;
				console.log("푸드그룹랭스 "+foodGLength);
				if(foodGLength>4){
					alert("다섯가지 이상 선택할 수 없습니다.");												
				}
				else{
					var length = $(".foodG"+foodGCode).children().length;
					var status = true;
					
					if(length == 0){
					
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
							var str = "";
							str = '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
							+ sideDImg
							+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG01" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'">&nbsp;<label for="'+sideDCode+'">'
							+ sideDName + '</label></div>';
						}
					}
					$(".foodG01").append(str);      
				}
				
			}
			else if(foodGCode == '02'){
				var foodGLength = $(".foodG"+foodGCode+" img").length;
				console.log("푸드그룹랭스 "+foodGLength);
				if(foodGLength>4){
					alert("다섯가지 이상 선택할 수 없습니다.");												
				}
				else{
					var length = $(".foodG"+foodGCode).children().length;
					var status = true;
					
					if(length == 0){
					
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
							var str = "";
							str = '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
							+ sideDImg
							+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG02" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'">&nbsp;<label for="'+sideDCode+'">'
							+ sideDName + '</label></div>';
						}
					}
					$(".foodG02").append(str);      
				}
				
			}
			else if(foodGCode == '03'){
				var foodGLength = $(".foodG"+foodGCode+" img").length;
				console.log("푸드그룹랭스 "+foodGLength);
				if(foodGLength>4){
					alert("다섯가지 이상 선택할 수 없습니다.");												
				}
				else{
					var length = $(".foodG"+foodGCode).children().length;
					var status = true;
					
					if(length == 0){
					
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
							var str = "";
							str = '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
							+ sideDImg
							+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG03" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'">&nbsp;<label for="'+sideDCode+'">'
							+ sideDName + '</label></div>';
						}
					}
					$(".foodG03").append(str);   
				}
				   
			}
			else if(foodGCode == '04'){
				var foodGLength = $(".foodG"+foodGCode+" img").length;
				console.log("푸드그룹랭스 "+foodGLength);
				if(foodGLength>4){
					alert("다섯가지 이상 선택할 수 없습니다.");												
				}
				else{
					var length = $(".foodG"+foodGCode).children().length;
					var status = true;
					
					if(length == 0){
					
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
							var str = "";
							str = '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
							+ sideDImg
							+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG04" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'">&nbsp;<label for="'+sideDCode+'">'
							+ sideDName + '</label></div>';
						}
					}
					$(".foodG04").append(str);   
				}
				   
			}
			else if(foodGCode == '05'){
				var foodGLength = $(".foodG"+foodGCode+" img").length;
				console.log("푸드그룹랭스 "+foodGLength);
				if(foodGLength>4){
					alert("다섯가지 이상 선택할 수 없습니다.");												
				}
				else{
					var length = $(".foodG"+foodGCode).children().length;
					var status = true;
					
					if(length == 0){
					
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
							var str = "";
							str = '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
							+ sideDImg
							+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG05" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'">&nbsp;<label for="'+sideDCode+'">'
							+ sideDName + '</label></div>';
						}
					}
					$(".foodG05").append(str);   
				}
				   
			}
			else if(foodGCode == '06'){
				var foodGLength = $(".foodG"+foodGCode+" img").length;
				console.log("푸드그룹랭스 "+foodGLength);
				if(foodGLength>4){
					alert("다섯가지 이상 선택할 수 없습니다.");												
				}
				else{
					var length = $(".foodG"+foodGCode).children().length;
					var status = true;
					
					if(length == 0){
					
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
							var str = "";
							str = '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '><img src = "displayFile?fileName='
							+ sideDImg
							+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG06" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'">&nbsp;<label for="'+sideDCode+'">'
							+ sideDName + '</label></div>';
						}
					}
					$(".foodG06").append(str);      
				}
			}
				
		});
		
		$(document.body).on("click",".sideDImg",function(data){
			$(this).parent().remove();         
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

		
		function groupSelector1(foodGCode,dietCode){
			$(".groupResult1").remove();
			$.getJSON("nutriAjax/groupSide/"+foodGCode+"/"+dietCode,function(data){
				var str = "";
				var code = new Array();
				$(data).each(function(i){         
					str += '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+this.sideDCode + '><img src = "displayFile?fileName='
					+ this.sideDImg
					+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG01" class="foodType" value="'+this.sideDCode+'_'+this.sideDType+'" id="'+this.sideDCode+'">&nbsp;<label for="'+this.sideDCode+'">'
					+ this.sideDName + '</label></div>';
					code[i] = this.sideDCode; 	
					console.log("식단코드배열:"+code[i]);
				});
				
				
				$(".foodG01").append(str);     
				
				for(var i = 0; i< $('.foodG01 input[type="hidden"]').length;i++){
					$(".foodType:input[value = '"+code[i]+"_0']").prop("checked",true);	
					console.log("코드배열2: "+code[i]);
				}        
			});
		}
		function groupSelector2(foodGCode,dietCode){
			$(".groupResult2").remove();
			$.getJSON("nutriAjax/groupSide/"+foodGCode+"/"+dietCode,function(data){
				var str = "";
				var code = new Array();
				$(data).each(function(i){
					str += '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+this.sideDCode + '><img src = "displayFile?fileName='
					+ this.sideDImg
					+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG02" class="foodType" value="'+this.sideDCode+'_'+this.sideDType+'" id="'+this.sideDCode+'">&nbsp;<label for="'+this.sideDCode+'">'
					+ this.sideDName + '</label></div>';
					code[i] = this.sideDCode; 	
					console.log("식단코드배열:"+code[i]);
				});
				$(".foodG02").append(str);
				for(var i = 0; i< $('.foodG02 input[type="hidden"]').length;i++){
					$(".foodType:input[value = '"+code[i]+"_0']").prop("checked",true);	
					console.log("코드배열2: "+code[i]);
				}        
			});
		}
		function groupSelector3(foodGCode,dietCode){
			$(".groupResult3").remove();
			$.getJSON("nutriAjax/groupSide/"+foodGCode+"/"+dietCode,function(data){
				var str = "";
				var code = new Array();
				$(data).each(function(i){
					str += '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+this.sideDCode + '><img src = "displayFile?fileName='
					+ this.sideDImg
					+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG03" class="foodType" value="'+this.sideDCode+'_'+this.sideDType+'" id="'+this.sideDCode+'">&nbsp;<label for="'+this.sideDCode+'">'
					+ this.sideDName + '</label></div>';
					code[i] = this.sideDCode; 	
					console.log("식단코드배열:"+code[i]);
				});
				$(".foodG03").append(str);
				for(var i = 0; i< $('.foodG03 input[type="hidden"]').length;i++){
					$(".foodType:input[value = '"+code[i]+"_0']").prop("checked",true);	
					console.log("코드배열2: "+code[i]);
				}     
			});
		}
		function groupSelector4(foodGCode,dietCode){
			$(".groupResult4").remove();
			$.getJSON("nutriAjax/groupSide/"+foodGCode+"/"+dietCode,function(data){
				var str = "";
				var code = new Array();
				$(data).each(function(i){
					str += '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+this.sideDCode + '><img src = "displayFile?fileName='
					+ this.sideDImg
					+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG04" class="foodType" value="'+this.sideDCode+'_'+this.sideDType+'" id="'+this.sideDCode+'">&nbsp;<label for="'+this.sideDCode+'">'
					+ this.sideDName + '</label></div>';
					code[i] = this.sideDCode;
				});
				 	
				$(".foodG04").append(str);
				for(var i = 0; i< $('.foodG04 input[type="hidden"]').length;i++){
					$(".foodType:input[value = '"+code[i]+"_0']").prop("checked",true);	
					console.log("코드배열2: "+code[i]);
				}   
			});
		}
		function groupSelector5(foodGCode,dietCode){
			$(".groupResult5").remove();
			$.getJSON("nutriAjax/groupSide/"+foodGCode+"/"+dietCode,function(data){
				var str = "";
				var code = new Array();
				$(data).each(function(i){
					str += '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+this.sideDCode + '><img src = "displayFile?fileName='
					+ this.sideDImg
					+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG05" class="foodType" value="'+this.sideDCode+'_'+this.sideDType+'" id="'+this.sideDCode+'">&nbsp;<label for="'+this.sideDCode+'">'
					+ this.sideDName + '</label></div>';
					code[i] = this.sideDCode;										
				});
				$(".foodG05").append(str);
				for(var i = 0; i< $('.foodG05 input[type="hidden"]').length;i++){
					$(".foodType:input[value = '"+code[i]+"_0']").prop("checked",true);	
					console.log("코드배열2: "+code[i]);
				}   
			});
		}
		function groupSelector6(foodGCode,dietCode){
			$(".groupResult6").remove();
			$.getJSON("nutriAjax/groupSide/"+foodGCode+"/"+dietCode,function(data){
				var str = "";
				var code = new Array();
				$(data).each(function(i){
					str += '<div class = "col-sm-2"><input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+this.sideDCode + '><img src = "displayFile?fileName='
					+ this.sideDImg
					+ '" class="img-responsive sideDImg" data-id = "'+2+'" >'+'<input type="radio" name="foodG06" class="foodType" value="'+this.sideDCode+'_'+this.sideDType+'" id="'+this.sideDCode+'">&nbsp;<label for="'+this.sideDCode+'">'
					+ this.sideDName + '</label></div>';
					code[i] = this.sideDCode;
				});
				$(".foodG06").append(str);
				for(var i = 0; i< $('.foodG06 input[type="hidden"]').length;i++){
					$(".foodType:input[value = '"+code[i]+"_0']").prop("checked",true);	
					console.log("코드배열6: "+code[i]);
				}   
			});
			         
		}
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
		
		
		function cntChange(v) {
			$.getJSON("nutriAjax/" + v, function(data) {
				$("#cnt").val(data);

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
<title>식단 수정 페이지</title>
<style>
.sideDImg {
	max-height: 80px
}

.material {
	height: 450px         
}
</style>             
</head>
<body>
	<div class="container-fluid">
		<h3><b>식단 수정 페이지입니다.</b></h3>
		
		<br><br><br>
		<div class="col-sm-6" >
			<div class="form-inline">
						<h4 style="display:inline-block;"><b>질환 선택 </b> </h4>         
						<select name = "diseaseCode" class = "diseaseCodeId form-control"> 
							<c:forEach var = "o" items = "${overList }">
								<option value="${o.diseaseCode }" <c:out value="${o.diseaseCode eq cloneDisease ? 'selected':''}"/>>${o.diseaseName }, ${o.judgement }</option>						
							</c:forEach>					
						</select>	
					</div>
		<h3 style="margin-top:15px; padding-bottom:8px; border-bottom:solid #777 5px;">선택된 반찬 목록</h3>        
		<div class="material">
			<div class="col-sm-12 h4 foodGStyle">밥</div>
			<div class="foodG01 checkSideD"></div>
			<div class="col-sm-12  h4 foodGStyle">국</div>
			<div class="foodG02 checkSideD"></div>
			<div class="col-sm-12 h4 foodGStyle">메인메뉴1</div>
			<div class="foodG03 checkSideD"></div>
			<div class="col-sm-12 h4 foodGStyle">메인메뉴2</div>
			<div class="foodG04 checkSideD"></div>
			<div class="col-sm-12 h4 foodGStyle">메인메뉴3</div>
			<div class="foodG05 checkSideD"></div>
			<div class="col-sm-12 h4 foodGStyle">메인메뉴4</div>
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
				<div style="margin-bottom:10px;">
				<input type="text" name="search" id="keyword" placeholder="반찬 검색란">&nbsp;
				<button id="search" class="btn btn-primary">검색</button>
				</div>
				<div style="margin-bottom:10px;">
				<button id="rice" class="btn btn-info">밥</button>
				<button id="soup" class="btn btn-info">국</button>
				<button id="main1" class="btn btn-info">메인 메뉴1</button>
				<button id="main2" class="btn btn-info">메인 메뉴2</button>
				<button id="main3" class="btn btn-info">메인 메뉴3</button>
				<button id="main4" class="btn btn-info">메인 메뉴4</button>
				</div>
				<div style="height:300px;">
				<table class="searchTable table table-hover">
					<tr>
						<th>반찬명</th>
						<th>식품군</th>
						<th>조리방법</th>
					</tr>
					<tr class="searchResult">

					</tr>
				</table>
				</div>
				<ul class="pagination">
				</ul>
			</div>
			<div class="box2 col-sm-12">
				<div class="h4">반찬 영양정보</div>
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
				
			</div>
<input type="hidden" name="kcal" id="kcal"> <input
			type="hidden" name="carbohydrate" id="carbohydrate"> <input
			type="hidden" name="protein" id="protein"> <input
			type="hidden" name="fat" id="fat"> <input type="hidden"
			name="na" id="na">

		<div class="col-sm-12 form-inline" style="margin-bottom:15px;">
			<form id="registForm" enctype="multipart/form-data" class="form-group">
				<input type = "hidden" name = "dietCode" value = "${nutritionist.dietCode }">
				<div class="div2">

<!-- 					<div class="template"> -->
<!-- 						질환별 식단 목록<br> - <a data-code="1">당뇨병</a><br> - <a -->
<!-- 							data-code="4">신부전증</a><br> - <a class="templateErase">템플릿 -->
<!-- 							초기화</a> -->
<!-- 					</div> -->
					
					<input type="hidden" id="diseaseCode" name="diseaseCode">
					<div id="View_area">
							<img id="prev_View_area" src="http://placehold.it/100x100">
						</div> 
						
						<input type="file" class="filestyle" data-input="false"
							name="file" placeholder="식단이미지 올리기" id="profile_pt"
							onchange="previewImage(this,'View_area')">
						<!-- 식단의 이름을 지어줌 -->
						<input type="text" id = "dietNameText" name="dietName" placeholder="식단명" value = "${nutritionist.dietName }"class="form-control">
					
					
						<!-- 식단의 가격을 지어줌 -->
						<input type="number" id = "priceText" name="price" placeholder="식단 가격" value = "${nutritionist.price }" class="form-control">
						<input type="hidden" id="diseaseCode" name="diseaseCode">
						
						
					
					<div id="spDietItem">
						 <input type="hidden" name="spDietItem" value="${nutritionist.spDietItem }">
					</div>

				</div>
			</form>

		</div>
		
			

				<button id="regist" class="update btn btn-danger">수정</button>
				<button id="cancle" class="btn btn-warning">취소</button>
			
			
		</div>

	</div>
</body>
<script>
	//이미지를 업로드하면 미리 볼 수 있는 기능
	function previewImage(targetObj, View_area){
		var preview = document.getElementById(View_area);
		
		var files  = targetObj.files;
		for(var i = 0; i<files.length; i++){
			var file = files[i];
			var imageType = /image.*/;
			if(!file.type.match(imageType)){
				continue;
			}
			var prevImg = document.getElementById("prev_"+View_area);
			if(prevImg){
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img");
			img.id = "prev_"+View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '100px';
			img.style.height = '100px';
			preview.appendChild(img);
			if(window.FileReader){
				var reader = new FileReader();
				reader.onloadend = (function(almg){
					return function(e){
						almg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			}
		}
	}
</script>
</html>