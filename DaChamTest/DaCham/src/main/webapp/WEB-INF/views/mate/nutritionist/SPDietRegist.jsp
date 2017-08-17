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
						$("#special").addClass("w3-light-gray");
						var currentPage = 1;
						var currentGroup = "";
						var v = 0;

						sideAll(1, "01");
						$("#sideAll").on("click", function() {
							sideAll();
						});
						$("#cancle").click(function(){
							var customer = '${counsel.customer}';
							if (window.confirm("정말로 취소하시겠습니까?")) {
								if(${counsel.counselItemCode} == 2){
									$.ajax({
										url : "nutriAjax/rollback/"+customer,
										type : "PUT",
										headers : {
											"Content-Type" : "application/json",
											"X-HTTP-Method-Override" : "PUT"
										},
										success : function(result){
											if(result == "SUCCESS"){
												
											}
										}
									});
								}
								window.location.href = "special";
							}
						});
						localStorage.clear();
						openAPI();
						if (!localStorage['init']
								|| isNaN(localStorage['count']) == true) {
							localStorage['init'] = "true";
							localStorage['count'] = 0;
						}

						$(document.body)
								.on(
										"click",
										".nameClick",
										function() {
											$('#body').show();
											event.preventDefault();
											var foodGCode= $(this).attr("data-foodGCode");
											var foodGLength = $(".foodG"+foodGCode+">img").length;
											console.log("푸드그룹랭스 "+foodGLength);
											if(foodGLength>0){
												alert("한가지 이상 선택할 수 없습니다.");												
											}else{ 
											$(this).parent().parent().hide();
											var count = parseInt(localStorage['count']);
											console.log(count);
											var sideDImg = $(this).attr(
													'data-img');
											var sideDCode = $(this).attr(
													'data-code');
											var foodGCode = $(this).attr(
													'data-foodGCode');
											var sideDName = $(this).text();

											$
													.getJSON(
															"nutriAjax/allNutri/"
																	+ sideDCode,
															function(data) {
																var subCount = count - 1;

																localStorage[subCount
																		+ '_kcal'] = data.kcal;
																localStorage[subCount
																		+ '_carbohydrate'] = data.carbohydrate;
																localStorage[subCount
																		+ '_protein'] = data.protein;
																localStorage[subCount
																		+ '_fat'] = data.fat;
																localStorage[subCount
																		+ '_na'] = data.na;
																openAPI();
															});

											localStorage[count + '_img'] = sideDImg;
											localStorage[count + '_codes'] = sideDCode;
											localStorage[count + '_foodGCode'] = foodGCode;
											localStorage[count + '_sideDName'] = sideDName;

											++count;

											localStorage['count'] = count;

											Refresh();
											v = count;
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
											console.log("ㄷㄷㄷ:"+prev);
											$(
													'.nameClick[data-code = "'
															+ prev + '"]')
													.parent().parent().show();
											$(this).prev().remove();
											$(this).next().next().remove();
											$(this).next().remove();
											$(this).remove();

											localStorage
													.removeItem(id + '_img');
											localStorage.removeItem(id
													+ '_codes');
											localStorage.removeItem(id
													+ '_kcal');
											localStorage.removeItem(id
													+ '_carbohydrate');
											localStorage.removeItem(id
													+ '_protein');
											localStorage
													.removeItem(id + '_fat');
											localStorage.removeItem(id + '_na');
											--count;
											localStorage['count'] = count;
											openAPI();
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

						function Refresh() {
							var count = parseInt(localStorage['count']);
							$('.material>div').empty();
							for (var i = 0; i < count; i++) {
								var sideDImg = localStorage[i + "_img"];
								var sideDCode = localStorage[i + "_codes"];
								var foodGCode = localStorage[i + "_foodGCode"];
								var sideDName = localStorage[i + "_sideDName"];
								switch (foodGCode) {
								case "01":
									$(
											'<input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '>')
											.appendTo('.foodG01');
									$(
											'<img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive">')
											.attr('data-id', i).addClass(
													"sideDImg center-block")
											.appendTo('.foodG01');
									$(
											'<input type="radio" name="foodG01" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'" checked><label for="'+sideDCode+'">'
													+ sideDName + '</label>')
											.appendTo('.foodG01');
									break;
								case "02":
									$(
											'<input type = "hidden" name ="sideDCode" class = "sideDCode" value = '+sideDCode + '>')
											.appendTo('.foodG02');
									$(
											'<img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive">')
											.attr('data-id', i).addClass(
													"sideDImg center-block")
											.appendTo('.foodG02');
									$(
											'<input type="radio" name="foodG02" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'" checked><label for="'+sideDCode+'">'
											+ sideDName + '</label>')
											.appendTo('.foodG02');
									break;
								case "03":
									$(
											'<input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '>')
											.appendTo('.foodG03');
									$(
											'<img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive">')
											.attr('data-id', i).addClass(
													"sideDImg center-block")
											.appendTo('.foodG03');
									$(
											'<input type="radio" name="foodG03" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'" checked><label for="'+sideDCode+'">'
											+ sideDName + '</label>')
											.appendTo('.foodG03');
									break;
								case "04":
									$(
											'<input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + ' >')
											.appendTo('.foodG04');
									$(
											'<img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive">')
											.attr('data-id', i).addClass(
													"sideDImg center-block")
											.appendTo('.foodG04');
									$(
											'<input type="radio" name="foodG04" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'" checked><label for="'+sideDCode+'">'
											+ sideDName + '</label>')
											.appendTo('.foodG04');
									break;
								case "05":
									$(
											'<input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + ' >')
											.appendTo('.foodG05');
									$(
											'<img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive">')
											.attr('data-id', i).addClass(
													"sideDImg center-block")
											.appendTo('.foodG05');
									$(
											'<input type="radio" name="foodG05" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+' "checked><label for="'+sideDCode+'">'
											+ sideDName + '</label>')
											.appendTo('.foodG05');
									break;
								case "06":
									$(
											'<input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '>')
											.appendTo('.foodG06');
									$(
											'<img src = "displayFile?fileName='
													+ sideDImg
													+ '" class="img-responsive">')
											.attr('data-id', i).addClass(
													"sideDImg center-block")
											.appendTo('.foodG06');
									$(
											'<input type="radio" name="foodG06" class="foodType" value="'+sideDCode+'_1" id="'+sideDCode+'" checked><label for="'+sideDCode+'">'
											+ sideDName + '</label>')
											.appendTo('.foodG06');
									break;
								}

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

						$("#regist").on("click", function() {
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
							$("#registForm").attr("method", "post");
							$("#registForm").attr("action", "SPDiet");
							$("#registForm").submit();
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
																	str += "<tr class = 'searchResult'><td><a class = 'nameClick' data-foodGCode='"+currentGroup+"' data-img = '"+this.sideDImg+"' data-code = '"+this.sideDCode+"'>"
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

<title>특별식단 등록 페이지</title>	
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
	max-height: 80px
}

.material {
	height: 250px
}
</style>
</head>
<body>
	<%@include file="nutritionistNavi.jsp"%>
	<div class = "container">
		<h3><b>고객 요청 리스트</b></h3>
		<input type = "hidden" name = "counselCode" value = "${counsel.counselCode }">
		<table class = "table table-hover">
			<tr>
				<td>고객id</td>
				<td id = "customer">${counsel.customer }</td>  
			</tr>
			<tr>
				<th>등록일</th>
				<td>${counsel.counselDate }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${counsel.address }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${counsel.tel }</td>
			</tr>
		</table>
		<div class = "form-group">
			<label for = "comment">상세내용:</label>
			<textarea class = "form-control" readonly = "readonly" rows = "5" id = "comment">${counsel.counselContent }</textarea>
		</div>
	</div>  
	
	<c:choose>
	<c:when test = "${counsel.counselItemCode == 2 }">     
	<div class="container">
		<div class="col-sm-12">
			<div class="col-sm-2 text-center h3">밥</div>
			<div class="col-sm-2 text-center h3">국</div>
			<div class="col-sm-2 text-center h3">메인메뉴1</div>
			<div class="col-sm-2 text-center h3">메인메뉴2</div>
			<div class="col-sm-2 text-center h3">메인메뉴3</div>
			<div class="col-sm-2 text-center h3">메인메뉴4</div>
			<div class="material">
				<div class="foodG01 col-sm-2 text-center">1</div>
				<div class="foodG02 col-sm-2 text-center">2</div>
				<div class="foodG03 col-sm-2 text-center">3</div>
				<div class="foodG04 col-sm-2 text-center">4</div>
				<div class="foodG05 col-sm-2 text-center">5</div>
				<div class="foodG06 col-sm-2 text-center">6</div>
			</div>
		</div>

		<div class="div1 col-sm-12">
			<div class="col-sm-6">
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
			<div class="box2 col-sm-6">
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
				</div>
			</div>


		</div>
		<input type="hidden" name="kcal" id="kcal"> <input
			type="hidden" name="carbohydrate" id="carbohydrate"> <input
			type="hidden" name="protein" id="protein"> <input
			type="hidden" name="fat" id="fat"> <input type="hidden"
			name="na" id="na">

		<div class="col-sm-12">
			<form id="registForm" enctype="multipart/form-data">
				<input type = "hidden" name = "counselCode" value = "${counsel.counselCode }">
				<input type = "hidden" name = "customer" value = "${counsel.customer }">
				<div class="div2">
					<div id="test">
						<select name="diseaseCode">
							<c:forEach items="${overList }" var="v">
								<option value="${v.diseaseCode }">${v.diseaseName },
									${v.judgement}</option>
							</c:forEach>
						</select>
					</div>
					<div id="dietName">
						<!-- 식단의 이름을 지어줌 -->
						<input type="text" name="dietName" placeholder="식단 이름 짓기">
					</div>
					<div id="price">
						<!-- 식단의 가격을 지어줌 -->
						<input type="number" name="price" placeholder="식단 가격 짓기">
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
						<input type="hidden" name="spDietItem" value="0" checked> 
					</div>

				</div>
			</form>
			<div>

				<button id="regist" class="btn btn-danger">등록</button>
				<button id="cancle" class="btn btn-warning">취소</button>
			</div>
		</div>

	</div>
	</c:when>
	<c:when test = "${counsel.counselItemCode == 5 }">
		<div class = "container">
			<div>
				<button id = "reRegist" class = "btn btn-danger">추가등록</button>
				<button id = "cancle" class = "btn btn-warning">작업취소</button>
			</div>
			<h1 id = "h1Text"></h1>
			<table class = "optional table table-hover">
				
			</table>             
			<div class = "text">
			</div>
			<table class = "optional2 table table-hover">
				<tr>
					<th>반찬</th>
					<th>식재료들</th>
				</tr>
				<tr class = "trText">
				</tr>
			</table>
			
		</div>
		
	</c:when>
	</c:choose>
	
	
	
	
	<script>
		//이미 등록된 특별식단의 반찬을 보여주는 기능
		$(document).ready(function(){
			var customer ='${counsel.customer}';
			
			optional(customer);
			console.log("빌려온 아이디:"+customer);  
			
			$("#reRegist").on("click",function(){
				$.ajax({
					url : "nutriAjax/reRegist/"+customer,
					type : "PUT",
					dataType : "jsonp",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					success : function(result){
						if(result == "SUCCESS"){
							
						}
					}
				});
				window.location.reload();
			});
			
			function optional(customer){
				var str = "";
				var stv = "";
				$.getJSON("nutriAjax/specialCode/"+customer,function(data){
					$(data).each(function(){
						stv += "<input type = 'text' class = 'SPDietCode' name = 'dietName' data-code = '"+this.dietCode+"'value = '"+this.dietName+"' readonly>";     
					});
					$(".optional").append(stv);        
				});
			}
			var dream = "";
			$(document.body).on("click",".SPDietCode",function(data){
				$(".trText").remove();
				$(".text").html("<h5>옆에 반찬명을 클릭하시면 식재료를 볼 수 있습니다.</h5>");
				dream = "";
				var dietCode = $(this).attr('data-code');  
				var str = "";
				
				
				console.log("스페셜 코드:"+dietCode);  
				$.getJSON("nutriAjax/specialToggle/"+customer+"/"+dietCode,function(data){   
					$(data).each(function(){
						str += "<tr class = 'trText'><td><a class = 'dream' data-code = '"+this.sideDCode+"'>"+this.sideDName+"</a></td><td class = 'summon"+this.sideDCode+"'>"+this.foodMName+"</td></tr>";
					});
					$(".optional2").append(str);
				});
				
			});
			
			$(document.body).on("click",".dream",function(data){
				dream = "";
				var sideDCode = $(this).attr('data-code');
				$(".summon"+sideDCode).empty();
				$.getJSON("nutriAjax/callName/"+sideDCode,function(data){
					$(data).each(function(){
						dream += this.foodMName + ", &nbsp;";
					});
					$(".summon"+sideDCode).append(dream);
				});
			});
		});
		
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