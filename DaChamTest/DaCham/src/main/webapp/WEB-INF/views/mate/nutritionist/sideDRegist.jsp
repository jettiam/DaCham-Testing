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
<%@include file="nutritionistNavi.jsp" %>
<title>Insert title here</title>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src = "../../../dacham/resources/openAPIjs/radarchart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
  float:left;  }
 .div2 {
  display:inline-block;  margin-left:10px;}  
</style>
</head>
<body>
	
		<div class = "div1">
		
				<div>
					<input type = "text" name = "search" placeholder = "식재료 검색어 입력란" id = "keyword"> 
					<button id = "search"> 검색 </button>
					<input type = "button" value = "전체목록" id = "listAll">    
				</div>
			
		
	
				<table class = "searchTable">
					<tr>
						<th>코드번호</th>
						<th>식재료명</th>
					</tr>
					
						<tr class = "searchResult">
							
						</tr>
					
				</table>
			</div>
	<input type = "hidden" id = "foodMName" name = "foodMName2">
	<input type = "hidden" id =  "protein" name = "protein">
	<input type = "hidden" id = "fat" name = "fat">
	<input type = "hidden" id = "na" name = "na">
	<input type = "hidden" id = "carbohydrate" name = "carbohydrate">
	<input type = "hidden" id =  "fe" name = "fe">
	<form id = "registForm" class = "registFrom" enctype = "multipart/form-data">
			
			<br><br>
			<div class = "box1">
				<table class = "material">
					<tr>
						<th></th>
						<th>식재료&nbsp;&nbsp;  </th>
						<th>양(g)&nbsp;&nbsp;   </th>
					</tr>
				</table>
			</div>
	
		<div class = "box2">
				<div id = "View_area">
				</div>
				<h2>반찬 사진</h2>
				<input type = "file" name = "file" id = "profile_pt" onchange = "previewImage(this,'View_area')">
				
				
		</div>
			
	
		<div class = "div2">
			<div id = "body">
				
				<div id = "chart"></div>       
			</div>
			<div>
				<h2>반찬 레시피</h2>
				<textarea placeholder = "레시피 입력란" name = "recipe"></textarea>
			</div>
			<div>
				반찬 이름<input type = "text" name = "sideDName">
			</div>
			<div>
				<table>
					<tr>
						<th>식품군</th>
						<th>조리방법</th>
					</tr>
					<tr>
						<td>
							<select name = "foodGCode">
								<option>식품군</option>
								<option value = "01">곡류</option>
								<option value = "02">조미류</option>
								<option value = "03">채소군</option>
								<option value = "04">생선류</option>
								<option value = "05">고기류</option>
							</select>
						</td>
						<td>
							<select name = "cookMCode">	
								<option>조리방법</option>
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
				<button id = "regist">등록</button>
			</div>
		</div>
	</form>
	<button id = "cancle">취소</button>
	<script>

		$(document).ready(function(){
			openAPI();
			
			var v = 0;
			$("#listAll").on("click",function(){
				materialAll();
			});
			$("#regist").on("click",function(){
				if(!localStorage['init'] || isNaN(localStorage['cnt'])==true || localStorage['cnt'] == 0){
					alert("등록할 식재료를 선택하세요");
					event.preventDefault();
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
			$(document.body).on("click",".nameClick",function(){
				event.preventDefault();
				
				var cnt = parseInt(localStorage['cnt']);
				
				var foodMName = $(this).attr('data-src');
				
				var foodMCode = $(this).attr('data-code');
				
				localStorage[cnt + '_name'] = foodMName;
				localStorage[cnt + '_code'] = foodMCode;
				
				++cnt;
				
				localStorage['cnt'] = cnt;
				
				Refresh();
				v = cnt;
			});
			$(document.body).on('click','.foodMName',function(){
				var cnt = parseInt(localStorage['cnt']);
				var id = $(this).parent().attr('data-id');
				
				$(this).parent().remove();
				localStorage.removeItem(id+'_name');
				localStorage.removeItem(id+'_code');
				
				--cnt;
				localStorage['cnt'] = cnt;
				
				v = cnt;
				cntChange(v);
			});
			
			$(document.body).on('mouseover','.foodMName',function(){
				var foodMName = $(this).attr('data-name');
				
				$.getJSON("nutriAjax/show/"+foodMName,function(data){
					$("#foodMName").val(data.foodMName);
					$("#protein").val(data.protein);
					$("#fat").val(data.fat);
					$("#na").val(data.na);
					$("#carbohydrate").val(data.carbohydrate);
					$("#fe").val(data.fe);
					openAPI(); 
				});
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
					$('<td></td>').html('<input type ="text" name = "foodMAmount" maxlength="4" size="1" >').appendTo(item);
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
				alert("검색값:"+search);
				$.getJSON("nutriAjax/searching/"+search,function(data){
					var str = "";
					$(data).each(function(){
						str += "<tr class = 'searchResult'><td>"+this.foodMCode+"</td>"+"<td>"+"<a class = 'nameClick' data-src = '"+this.foodMName+"' data-code = '"+this.foodMCode+"'>"+this.foodMName+"</a></td></tr>";
					});
					$(".searchTable").append(str);
					alert(str);
				});
			});
			
			function materialAll(){
				$(".searchResult").remove();
				$.getJSON("nutriAjax/materialAll",function(data){
					var str = "";
					$(data).each(function(){
						str += "<tr class = 'searchResult'><td>"+this.foodMCode+"</td>"+"<td>"+"<a class = 'nameClick' data-src = '"+this.foodMName+"' data-code = '"+this.foodMCode+"'>"+this.foodMName+"</a></td></tr>";
					});
					$(".searchTable").append(str);
				});
			}
		});
	</script>
	<script src = "../../../dacham/resources/openAPIjs/APIQuery2.js"></script>
</body>
</html>