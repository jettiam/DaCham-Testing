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
			var sideDLength = $(".material input[type='hidden']").length;
			$(".material input[type='radio']:checked").clone().appendTo("form");	
			//checked 먼저 넣고 변경하기
			for(var i=0;i<$("form .groupRadio:checked").length;i++){
				var sideDType=$("form .groupRadio").eq(i).val().replace("_1","_0");
				$("form .groupRadio").eq(i).val(sideDType);
			}
			
			$("form .groupRadio").attr('type','hidden');
			
			$(".material input[type='radio']").clone().appendTo("form");
			$("form .groupRadio:checked").remove();
			$("form .groupRadio").attr("type","hidden");
			$("form .groupRadio").attr("name","sideDType");
			
			
			$('<input type = "hidden" id = "cnt" name = "count" value = "'+sideDLength+'">').appendTo("form");
			
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
				var str = "";
				str = "<tr class = 'groupResult1'><td><input type = 'hidden' name = 'sideDCode' value = "+sideDCode+"><input type = 'radio' class = 'groupRadio' name = 'foodG01' value = '"+sideDCode+"_1'></td><td><img src = 'displayFile?fileName="+sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+sideDName+"</td></tr>";
				$(".foodGroup1").append(str);      
			}
			else if(foodGCode == '02'){
				var str = "";
				str = "<tr class = 'groupResult2'><td><input type = 'hidden' name = 'sideDCode' value = "+sideDCode+"><input type = 'radio' class = 'groupRadio' name = 'foodG02' value = '"+sideDCode+"_1'></td><td><img src = 'displayFile?fileName="+sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+sideDName+"</td></tr>";
				$(".foodGroup2").append(str);      
			}
			else if(foodGCode == '03'){
				var str = "";
				str = "<tr class = 'groupResult3'><td><input type = 'hidden' name = 'sideDCode' value = "+sideDCode+"><input type = 'radio' class = 'groupRadio' name = 'foodG03' value = '"+sideDCode+"_1'></td><td><img src = 'displayFile?fileName="+sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+sideDName+"</td></tr>";
				$(".foodGroup3").append(str);      
			}
			else if(foodGCode == '04'){
				var str = "";
				str = "<tr class = 'groupResult4'><td><input type = 'hidden' name = 'sideDCode' value = "+sideDCode+"><input type = 'radio' class = 'groupRadio' name = 'foodG04' value = '"+sideDCode+"_1'></td><td><img src = 'displayFile?fileName="+sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+sideDName+"</td></tr>";
				$(".foodGroup4").append(str);      
			}
			else if(foodGCode == '05'){
				var str = "";
				str = "<tr class = 'groupResult5'><td><input type = 'hidden' name = 'sideDCode' value = "+sideDCode+"><input type = 'radio' class = 'groupRadio' name = 'foodG05' value = '"+sideDCode+"_1'></td><td><img src = 'displayFile?fileName="+sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+sideDName+"</td></tr>";
				$(".foodGroup5").append(str);      
			}
			else if(foodGCode == '06'){
				var str = "";
				str = "<tr class = 'groupResult6'><td><input type = 'hidden' name = 'sideDCode' value = "+sideDCode+"><input type = 'radio' class = 'groupRadio' name = 'foodG06' value = '"+sideDCode+"_1'></td><td><img src = 'displayFile?fileName="+sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+sideDName+"</td></tr>";
				$(".foodGroup6").append(str);      
			}
		});
		
		$(document.body).on("click",".sideDImg",function(data){
			$(this).parent().parent().remove();   
		});
		
		function groupSelector1(foodGCode,dietCode){
			$(".groupResult1").remove();
			$.getJSON("nutriAjax/groupSide/"+foodGCode+"/"+dietCode,function(data){
				var str = "";
				var code = new Array();
				$(data).each(function(i){         
					str += "<tr class = 'groupResult1'><td><input type = 'hidden' name = 'sideDCode' value = '"+this.sideDCode+"'><input type = 'radio' class = 'groupRadio' name = 'foodG01' value = '"+this.sideDCode+"_"+this.sideDType+"'></td><td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+this.sideDName+"</td></tr>";
					code[i] = this.sideDCode; 	
					console.log("식단코드배열:"+code[i]);
				});
				
				
				$(".foodGroup1").append(str);   
				
				for(var i = 0; i< $('.foodGroup1 input[type="hidden"]').length;i++){
					$(".groupRadio:input[value = '"+code[i]+"_0']").prop("checked",true);	
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
					str += "<tr class = 'groupResult2'><td><input type = 'hidden' name = 'sideDCode' value = '"+this.sideDCode+"'><input type = 'radio' class = 'groupRadio' name = 'foodG02' value = '"+this.sideDCode+"_"+this.sideDType+"'></td><td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+this.sideDName+"</td></tr>"
					code[i] = this.sideDCode; 	
					console.log("식단코드배열:"+code[i]);
				});
				$(".foodGroup2").append(str);
				for(var i = 0; i< $('.foodGroup2 input[type="hidden"]').length;i++){
					$(".groupRadio:input[value = '"+code[i]+"_0']").prop("checked",true);	
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
					str += "<tr class = 'groupResult3'><td><input type = 'hidden' name = 'sideDCode' value = '"+this.sideDCode+"'><input type = 'radio' class = 'groupRadio' name = 'foodG03' value = '"+this.sideDCode+"_"+this.sideDType+"'></td><td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+this.sideDName+"</td></tr>"
					code[i] = this.sideDCode; 	
					console.log("식단코드배열:"+code[i]);
				});
				$(".foodGroup3").append(str);
				for(var i = 0; i< $('.foodGroup3 input[type="hidden"]').length;i++){
					$(".groupRadio:input[value = '"+code[i]+"_0']").prop("checked",true);	
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
					str += "<tr class = 'groupResult4'><td><input type = 'hidden' name = 'sideDCode' value = '"+this.sideDCode+"'><input type = 'radio' class = 'groupRadio' name = 'foodG04' value = '"+this.sideDCode+"_"+this.sideDType+"'></td><td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+this.sideDName+"</td></tr>"
					code[i] = this.sideDCode;
				});
				 	
				$(".foodGroup4").append(str);
				for(var i = 0; i< $('.foodGroup4 input[type="hidden"]').length;i++){
					$(".groupRadio:input[value = '"+code[i]+"_0']").prop("checked",true);	
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
					str += "<tr class = 'groupResult5'><td><input type = 'hidden' name = 'sideDCode' value = '"+this.sideDCode+"'><input type = 'radio' class = 'groupRadio' name = 'foodG05' value = '"+this.sideDCode+"_"+this.sideDType+"'></td><td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+this.sideDName+"</td></tr>";
					code[i] = this.sideDCode;										
				});
				$(".foodGroup5").append(str);
				for(var i = 0; i< $('.foodGroup5 input[type="hidden"]').length;i++){
					$(".groupRadio:input[value = '"+code[i]+"_0']").prop("checked",true);	
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
					str += "<tr class = 'groupResult6'><td><input type = 'hidden' name = 'sideDCode' value = '"+this.sideDCode+"'><input type = 'radio' class = 'groupRadio' name = 'foodG06' value = '"+this.sideDCode+"_"+this.sideDType+"'></td><td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width:80px; height:60px;' class='img-responsive sideDImg center-block'></td><td>"+this.sideDName+"</td></tr>"
					code[i] = this.sideDCode;
				});
				$(".foodGroup6").append(str);
				for(var i = 0; i< $('.foodGroup6 input[type="hidden"]').length;i++){
					$(".groupRadio:input[value = '"+code[i]+"_0']").prop("checked",true);	
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
	<div class = "container">
		<h2>&nbsp;식단 수정 페이지입니다.</h2>
		<div class = "material">   
			<div class = "col-sm-2">
				<h2>밥</h2>
				<table class = "foodGroup1">
					<tr>
						<th>&nbsp;&nbsp;&nbsp;</th>
						<th>반찬사진&nbsp;&nbsp;&nbsp;</th>
						<th>반찬명&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr class = "groupResult1">
					</tr>
				</table>
			</div>  
			<div class = "col-sm-2">
				<h2>국</h2>
				<table class = "foodGroup2">
					<tr>
						<th>&nbsp;&nbsp;&nbsp;</th>
						<th>반찬사진&nbsp;&nbsp;&nbsp;</th>
						<th>반찬명&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr class = "groupResult2">
						
					</tr>
				</table>
			</div> 
			<div class = "col-sm-2">
				<h2>메인 메뉴1</h2>
				<table class = "foodGroup3">
					<tr>
						<th>&nbsp;&nbsp;&nbsp;</th>
						<th>반찬사진&nbsp;&nbsp;&nbsp;</th>
						<th>반찬명&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr class = "groupResult3">
						
					</tr>
				</table>
			</div>  
			<div class = "col-sm-2">
				<h2>메인 메뉴2</h2>
				<table class = "foodGroup4">   
					<tr>
						<th>&nbsp;&nbsp;&nbsp;</th>
						<th>반찬사진&nbsp;&nbsp;&nbsp;</th>
						<th>반찬명&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr class = "groupResult4">
						
					</tr>
				</table>
			</div>  
			<div class = "col-sm-2">
				<h2>메인 메뉴3</h2>
				<table class = "foodGroup5">
					<tr>
						<th>&nbsp;&nbsp;&nbsp;</th>
						<th>반찬사진&nbsp;&nbsp;&nbsp;</th>
						<th>반찬명&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr class = "groupResult5">
						
					</tr>
				</table>
			</div>  
			<div class = "col-sm-2">
				<h2>메인 메뉴4</h2>
				<table class = "foodGroup6">    
					<tr>
						<th>&nbsp;&nbsp;&nbsp;</th>
						<th>반찬사진&nbsp;&nbsp;&nbsp;</th>
						<th>반찬명&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr class = "groupResult6">
						
					</tr>
				</table>
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
		</div>
		<form enctype = "multipart/form-data">
			<input type = "hidden" name = "dietCode" value = "${nutritionist.dietCode }">
			
			<div class = "form-group">
				<label for = "diseaseCode">질병 선택</label>
				<select name = "diseaseCode" class = "form-control"> 
					<c:forEach var = "o" items = "${overList }">
						<option value="${o.diseaseCode }" <c:out value="${o.diseaseCode eq cloneDisease ? 'selected':''}"/>>${o.diseaseName }, ${o.judgement }</option>						
					</c:forEach>					
				</select>				
			</div>
			<div class = "form-group">
				<label for = "sideDName">식단의 이름</label>
				<input type = "text" name = "dietName" value = "${nutritionist.dietName }" class = "form-control">
			</div>
			<div class = "form-group">
				<label for = "price">식단의 가격</label>
				<input type = "number" name = "price" value = "${nutritionist.price }" class = "form-control">   
			</div>
			<div>
				<h2>식단 사진</h2>
					<div id = "View_area">
						<img id = "prev_View_area" src="http://placehold.it/100x100" style = "width:100px; height : 100px;">
					</div>
					
					<input type = "file" class = "filestyle" data-input = "false" name = "file" placeholder = "식단이미지 올리기" id = "profile_pt" onchange = "previewImage(this,'View_area')">
			</div>
		</form>
		<div>
			<button id="update" class="update btn btn-danger">수정</button>
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