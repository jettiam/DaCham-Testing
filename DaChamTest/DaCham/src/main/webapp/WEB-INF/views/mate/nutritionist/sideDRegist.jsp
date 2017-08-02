<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>반찬 등록 페이지</title>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src = "resources/openAPIjs/radarchart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/bootstrap-filestyle.min.js"> </script>
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
<style>
	.box1 {
  display:inline-block;  margin-left:20px;  }
 .box2 {
  display:inline-block;  margin-left:10px;}           
  .div1 {   
  float:left; width: 600px; }   
 .div2 {
  display:inline-block;  margin-left:10px;} 
  #body{
  	display : inline-block;
  	
  } 
</style>
</head>
<body>
<%@include file="nutritionistNavi.jsp" %>
	<div class = "container" style = "width:1530px;">  
		<div class = "div1">
		
				<div>
					<input type = "text" name = "search" placeholder = "식재료 검색어 입력란" id = "keyword"> 
					<button id = "search" class = "btn btn-warning"> 검색 </button>
					<input type = "button" value = "전체목록" class = "btn btn-warning" id = "listAll">    
				</div>
			
		
	
				<table class = "searchTable table table-hover">
					<tr>
						<th>코드번호&nbsp;&nbsp;</th>   
						<th>식재료명&nbsp;&nbsp;</th>
					</tr>
					
						<tr class = "searchResult">
							
						</tr>
					
				</table>
				<ul class = "pagination">
				</ul>
		</div>
		
	<input type = "hidden" id = "foodMName" name = "foodMName2">
	<input type = "hidden" id =  "protein" name = "protein">
	<input type = "hidden" id = "fat" name = "fat">
	<input type = "hidden" id = "na" name = "na">
	<input type = "hidden" id = "carbohydrate" name = "carbohydrate">
	<input type = "hidden" id =  "fe" name = "fe">
	<form id = "registForm" class = "registFrom" enctype = "multipart/form-data" style = "margin-bottom:100px;">
		<div class = "div2">	
			<br><br>
			<div class = "box1">
				<h4>지우려면 이름 클릭</h4>
				<table class = "material" style = "position:absolute;">          
					<tr>   
						<th></th>  
						<th>식재료&nbsp;&nbsp;  </th>
						<th>양(g)&nbsp;&nbsp;   </th>
					</tr>
				</table>
		
		<div class = "box2">
				<h2>반찬 사진</h2>
				<div id = "View_area">
					<img id = "prev_View_area" src="http://placehold.it/100x100">
				</div>
				
				<input type = "file" class = "filestyle" data-input = "false" name = "file" placeholder = "식단이미지 올리기" id = "profile_pt" onchange = "previewImage(this,'View_area')">
				
				
		</div>
			<div id = "body">
				
				<div id = "chart"></div>       
			</div>
			<div style = "margin-bottom : 1px;">
				<h2>반찬 레시피</h2>
				<textarea placeholder = "레시피 입력란" name = "recipe"></textarea>
				<br>
				반찬 이름<input type = "text" name = "sideDName">
			
				<table>
					<tr>
						<th>식품군</th>
						<th>조리방법</th>
					</tr>
					<tr>
						<td>
							<select name = "foodGCode">
								<option value = "01">밥</option>
								<option value = "02">국</option>
								<option value = "03">메인메뉴1</option>
								<option value = "04">메인메뉴2</option>
								<option value = "05">메인메뉴3</option>
								<option value = "06">메인메뉴4</option>
							</select>
						</td>
						<td>
							<select name = "cookMCode">	
								<option value = "01">튀김</option>
								<option value = "02">구이</option>
								<option value = "03">조림</option>
								<option value = "04">찜</option>
								<option value = "05">초벌</option>
								<option value = "06">무침</option>
								<option value = "07">탕</option>								
							</select>
						</td>
					</tr>
				</table> 	
			</div>       
		  </div> 
		</div>
	</form>
		<div style = "margin-left:1000px; margin-bottom : 1px;">                   
			<button id = "regist" class = "btn btn-success">등록</button>
			<button id = "cancle" class = "btn btn-success">취소</button>
		</div>
	</div>
	<script>

		$(document).ready(function(){
			var currentPage = 1;
			$("#side").addClass("w3-light-gray");
			openAPI();
			
			var v = 0;
			$("#listAll").on("click",function(){
				materialAll(1);
			});
			$(".pagination").on("click","li a",function(){
				event.preventDefault();
				var replyPage = $(this).attr("href");
				
				materialAll(replyPage);
			});
			
			$("#regist").on("click",function(){
				if(!localStorage['init'] || isNaN(localStorage['cnt'])==true || localStorage['cnt'] == 0){
					alert("등록할 식재료를 선택하세요");
					event.preventDefault();
				}
				else if($("#prev_View_area").attr("src") == "http://placehold.it/100x100"){
					alert("이미지 좀 선택하세요");
				}		
				else if($(".foodMAmountClass").val() == ""){
					alert("식재료량을 기재하세요!!");
				}
				else{ 
					$("#registForm").attr("method","post");
					$("#registForm").attr("action","side");
					$("#registForm").submit();	
				}
			});
			
			localStorage.clear();
			if(!localStorage['init'] || isNaN(localStorage['cnt']) == true){
				localStorage['init'] = "true";
				localStorage['cnt'] = 0;              
			}
			
			
			$("#cancle").click(function(){
				if(confirm("정말로 취소하시겠습니까?")){
					window.location.href = "side";	
				}
			});
			
			$(document.body).on("focusout",".foodMAmountClass",function(){
				var cnt = parseInt(localStorage['cnt']);
				
				var foodMAmount = $(this).val();
				
				localStorage[cnt + '_amount'] = foodMAmount;
				
				
			});
			$(document.body).on("click",".nameClick",function(){
				event.preventDefault();
				
				var cnt = parseInt(localStorage['cnt']);
				
				var foodMName = $(this).attr('data-src');
				
				var foodMCode = $(this).attr('data-code');
				
				localStorage[cnt + '_name'] = foodMName;
				localStorage[cnt + '_code'] = foodMCode;
				
				++cnt;
				
				localStorage['cnt'] = cnt;
				$(this).parent().parent().hide();
				Refresh();
				v = cnt;
				$.getJSON("nutriAjax/show/"+foodMCode,function(data){
					var subCount = cnt - 1;
					localStorage[subCount+"_kcal"] = data.kcal;
					localStorage[subCount+"_carbohydrate"] = data.carbohydrate;
					localStorage[subCount+"_protein"] = data.protein;
					localStorage[subCount+"_fat"] = data.fat;
					localStorage[subCount+"_na"] = data.na;
					
					openAPI();
				});
			});
			$(document.body).on('click','.foodMName',function(){
				var cnt = parseInt(localStorage['cnt']);
				var id = $(this).parent().attr('data-id');
				var foodMName = $(this).attr('data-name');
				
				var prev = $(this).attr('data-name');
				console.log("ㅇㅇㅇ"+prev);
				$('.nameClick[data-src="'+prev+'"]').parent().parent().show();
				$(this).parent().remove();
				localStorage.removeItem(id+'_name');    
				localStorage.removeItem(id+'_code');
				
				--cnt;
				localStorage['cnt'] = cnt;
				
				v = cnt;
				cntChange(v);
				openAPI();
			});
			
			
			
			function Refresh(){
				var cnt = parseInt(localStorage['cnt']);
				$('.item').empty();	
			
			
				for(var i = 0; i<cnt; i++){
					var foodMName = localStorage[i + "_name"];
					var foodMCode = localStorage[i + "_code"];
					var item = $('<tr></tr>').addClass('item').attr('data-id',i);
					$('<td></td>').html('<input type = "hidden" name = "foodMCode" value = '+foodMCode + '>').appendTo(item);    
					$('<td>'+foodMName+'</td>').addClass("foodMName").attr('name','foodMName').attr('data-name',foodMName).appendTo(item);
					$('<td></td>').append('<input type ="text" class = "foodMAmountClass" name = "foodMAmount" maxlength="4" size="1" >').appendTo(item);
					item.appendTo(".material");
					
				}
				
				v = cnt;

				cntChange(v);
				
			}
			Refresh();
			
			function cntChange(v){
				$.getJSON("nutriAjax/"+v,function(data){
					$("#cnt").val(data);
					
				});
			}
			
		
			$('<input type = "hidden" id = "cnt" name = "cnt" value = "'+v+'">').appendTo(".registFrom");
			
			$("#search").on("click",function(){
				$(".searchResult").remove();
				var search = $("#keyword").val();
				/* alert("검색값:"+search); */
				$.getJSON("nutriAjax/searching/"+search,function(data){
					var str = "";
					$(data).each(function(){
						str += "<tr class = 'searchResult'><td>"+this.foodMCode+"</td>"+"<td>"+"<a class = 'nameClick' data-src = '"+this.foodMName+"' data-code = '"+this.foodMCode+"'>"+this.foodMName+"</a></td></tr>";
					});
					$(".searchTable").append(str);
					/* alert(str); */
				});
			});
			
			function materialAll(page){
				currentPage = page;
				$(".searchResult").remove();
				$.getJSON("nutriAjax/materialAll/"+page,function(data){
					var str = "";
					$(data.list).each(function(){
						str += "<tr class = 'searchResult'><td>"+this.foodMCode+"</td>"+"<td>"+"<a class = 'nameClick' data-src = '"+this.foodMName+"' data-code = '"+this.foodMCode+"'>"+this.foodMName+"</a></td></tr>";
					});
					$(".searchTable").append(str);
					printPaging(data.criteria);
				});
			}
			function printPaging(criteria){
				var str = "";
						
				if(criteria.prev){
					str += "<li><a href='"+(criteria.startPage-1)+"'>" + "<<"+"</a></li>";
				}
				for(var i = criteria.startPage; i<=criteria.endPage; i++){
					var strClass = criteria.page == i?"class = 'active'":"";
					str += "<li "+strClass+"><a href ='"+i+"'>"+i + "</a></li>";
				}
				if(criteria.next){
					str += "<li><a href='"+(criteria.endPage+1)+"'>" + ">>"+"</a></li>";   
				}
				$(".pagination").html(str);
			}
		});
	</script>
	<script src = "resources/openAPIjs/APIQuery2.js"></script>
</body>
</html>