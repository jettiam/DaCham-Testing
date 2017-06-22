<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="nutritionistNavi.jsp" %>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src = "../../../dacham/resources/openAPIjs/radarchart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../../dacham/resources/bootstrap-filestyle.min.js"> </script>	
<script>
	$(document).ready(function(){     
		$('#body').hide();
		var v = 0;
		$("#sideAll").on("click",function(){
			sideAll();
		});
		$("#cancle").click(function(){
			if(window.confirm("정말로 취소하시겠습니까?")){
				window.location.href = "diet";	
			}
		});
		localStorage.clear();
		
		if(!localStorage['init'] || isNaN(localStorage['count']) == true){
			localStorage['init'] = "true";
			localStorage['count'] = 0;   
		}
		
		$(document.body).on("click",".nameClick",function(){
			$('#body').show();    
			event.preventDefault();
						
			var count = parseInt(localStorage['count']);
			console.log(count);
			var sideDImg = $(this).attr('data-img');
			
			var sideDCode = $(this).attr('data-code');

			$.getJSON("nutriAjax/allNutri/"+sideDCode,function(data){
				var subCount = count - 1;
				
				localStorage[subCount+'_kcal'] = data.kcal;
				localStorage[subCount+'_carbohydrate'] = data.carbohydrate;
				localStorage[subCount+'_protein'] = data.protein;
				localStorage[subCount+'_fat']= data.fat;
				localStorage[subCount+'_na'] = data.na;
				openAPI();
			});
			
			localStorage[count + '_img'] = sideDImg;
			localStorage[count + '_codes'] = sideDCode;
			
			++count;           
			
			localStorage['count'] = count;
			
			Refresh();
			v = count;
		});
		$(document.body).on('click','.sideDImg',function(){
			var count = parseInt(localStorage['count']);
			var id = $(this).parent().attr('data-id');
			
			$(this).remove();
			localStorage.removeItem(id+'_img');
			localStorage.removeItem(id+'_codes');
			localStorage.removeItem(id+'_kcal');
			localStorage.removeItem(id+'_carbohydrate');
			localStorage.removeItem(id+'_protein');
			localStorage.removeItem(id+'_fat');
			localStorage.removeItem(id+'_na');
			--count;
			localStorage['count'] = count;
			openAPI();
			v = count;
			cntChange(v);
		});
		
		$(document.body).on("mouseover",".nameClick",function(){
			var sideDCode = $(this).attr('data-code');
			console.log("이것은"+sideDCode);
			$.getJSON("nutriAjax/showKcal/"+sideDCode,function(data){
				$("#sideDName").text(data.sideDName);
				$("#kcal").text(data.kcal);
				$("#carbohydrate").text(data.carbohydrate);
				$("#protein").text(data.protein);
				$("#fat").text(data.fat);
				$("#na").text(data.na);
			});
		});
		
		$(".template a").on("click",function(){
			event.preventDefault();
			  
			$("#body").hide();
			var diseaseCode = $(this).attr("data-code");
	
			
			
			localStorage.clear();
			
		
			$.getJSON("nutriAjax/template/"+diseaseCode, function(data){
				console.log(data);
				var str = "";
				$(data).each(function(){
					str += "<img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width: 75px; height: 25px;'>" + "<input type = 'hidden' name = 'sideDCode' value = '"+this.sideDCode+"'>";
				});
				$(".material").html(str);
			});
			$.getJSON("nutriAjax/templateCount/"+diseaseCode,function(data){
				$("#cnt").val(data);
			});
		});
		
		function Refresh(){
			var count = parseInt(localStorage['count']);
			$('.material').empty();	
		
		
			for(var i = 0; i<count; i++){
				var sideDImg = localStorage[i + "_img"];
				var sideDCode = localStorage[i + "_codes"];
				
				$('<input type = "hidden" name = "sideDCode" class = "sideDCode" value = '+sideDCode + '>').appendTo('.material');    
				$('<img src = "displayFile?fileName='+sideDImg+'" style= "width: 75px; height: 25px;">').addClass("sideDImg").appendTo('.material');

			}
			
			v = count;

			cntChange(v);
		}
		Refresh();
		
		function cntChange(v){
			$.getJSON("nutriAjax/"+v,function(data){
				$("#cnt").val(data);
				
			});
		}
		
		$('<input type = "hidden" id = "cnt" name = "count" value = "'+v+'">').appendTo("#registForm");
		
		$("#regist").on("click",function(){
			$("#registForm").attr("method","post");
			$("#registForm").attr("action","diet");
			$("#registForm").submit();
		});
		
		$(".templateErase").on("click",function(){
			event.preventDefault();
			
			localStorage['count'] = 0;
			
			$(".material img").remove();
			$(".material input").remove();
		});
		
		$("#search").on("click",function(){
			$(".searchResult").remove();
			var search = $("#keyword").val(); 
			$.getJSON("nutriAjax/listSearch/"+search,function(data){
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'searchResult'><td><a class = 'nameClick' data-img = '"+this.sideDImg+"' data-code = '"+this.sideDCode+"'>"+this.sideDName+"</a></td>"+"<td>"+this.foodGName+"</td>"+"<td>"+this.cookMName+"</td></tr>"
				});
				$(".searchTable").append(str);
			});
		});
		
		function sideAll(){
			$(".searchResult").remove();
			$.getJSON("nutriAjax/sideAll",function(data){
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'searchResult'><td><a class = 'nameClick' data-img = '"+this.sideDImg+"' data-code = '"+this.sideDCode+"'>"+this.sideDName+"</a></td>"+"<td>"+this.foodGName+"</td>"+"<td>"+this.cookMName+"</td></tr>"
				});
				$(".searchTable").append(str);
			});
		}
	});
	
</script>

<title>Insert title here</title>
<style>
 .box1 {
  float:left;  }
  
 .box2 {
  display:inline-block;  margin-left:10px; position : absolute;}
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
   		margin-left : 700px;          	
   		margin-bottom : 500px;                
   }
  #chart {
	  position: absolute;
	  top: 50px;
	  left: 10px;
	}	
</style>
</head>
<body>
	<div class = "container">
		<div class = "div1">
			<div class = "box2">
				<table>
					<tr>
						<th>반찬명&nbsp;&nbsp;</th>
						<th>열량&nbsp;&nbsp;</th>
						<th>탄수화물&nbsp;&nbsp;</th>
						<th>단백질&nbsp;&nbsp;</th>
						<th>지방&nbsp;&nbsp;</th>
						<th>나트륨&nbsp;&nbsp;</th>
					</tr>
					<tr>
						<td id = "sideDName"></td>
						<td id = "kcal"></td>
						<td id = "carbohydrate"></td>
						<td id = "protein"></td>
						<td id = "fat"></td>
						<td id = "na"></td>
					</tr>
				</table>
			</div>
			<br><br><br><br><br><br>
			<div>
				<input type = "text" name = "search" id = "keyword" placeholder = "반찬 검색란">
				<button id = "search" class = "btn btn-primary">검색</button>
				<button id=  "sideAll" class = "btn btn-primary">전체목록</button><br>
				<table class = "searchTable table table-hover">          
					<tr>    
						<th>반찬명</th>
						<th>식품군</th>
						<th>조리방법</th>
					</tr>
						<tr class = "searchResult">
							
						</tr>
						
				</table>
			</div>
		</div>
		<input type = "hidden" name = "kcal" id = "kcal">
		<input type = "hidden" name = "carbohydrate" id = "carbohydrate">
		<input type = "hidden" name = "protein" id = "protein">
		<input type = "hidden" name = "fat" id = "fat">
		<input type = "hidden" name = "na"  id = "na">
		<div id = "body">
						<div id = "chart"></div>     
						<div>
						<!-- 총 칼로리 양 표시 -->
						</div>
		</div>     	
		<form id = "registForm" enctype = "multipart/form-data" style = "position:relative; margin-left : 300px;">              
			<div>                                
				<h3>선택한 반찬</h3>
				<div class = "material" style = "margin-bottom:50px; position:absolute;">   
					
				</div>
			</div>
		
			<div class = "div2" style = "border-left:1px solid #000; position:absolute; margin-top : 45px;"> 
			    <h2>위자드 선택</h2>
			   
				    <input type = "radio" name = "wizardCode" value = "1"> 고위험군 당뇨병<br>
					<input type = "radio" name = "wizardCode" value = "2"> 저위험 고지혈증<br>
					<input type = "radio" name = "wizardCode" value = "3"> 주의 신부전증
				       
				<hr align = "left" width = "40%">
				
				<div class = "template">
					질환별 식단 목록<br>
					- <a data-code = "1">당뇨병</a><br>
					- <a data-code = "4">신부전증</a><br>     
					- <a class = "templateErase">템플릿 초기화</a>
				</div>
				
				<br><br><br>
				<div id = "test">
					<select name = "diseaseCode">
						<c:forEach items = "${overList }" var = "v">
							<option value = "${v.diseaseCode }">${v.diseaseName }, ${v.judgement}</option>
						</c:forEach>
					</select>
				</div>
				<div id = "dietName">
					<!-- 식단의 이름을 지어줌 -->
					<input type = "text" name = "dietName" placeholder = "식단 이름 짓기">
				</div>
				<div id = "price">
					<!-- 식단의 가격을 지어줌 -->
					<input type = "number" name = "price" placeholder = "식단 가격 짓기">
				</div>
				<div id = "dietImg">
					<input type = "file" class = "filestyle" data-input = "false" name = "file" placeholder = "식단이미지 올리기" id = "profile_pt" onchange = "previewImage(this,'View_area')">
					<div id = "View_area">      
					</div>
				</div>
				<div id = "spDietItem">
					<input type = "radio" name = "spDietItem" value = "0">특별식단
					<input type = "radio" name = "spDietItem" value = "1">일반식단
				</div>
				
			</div>
		</form>
		<div style = "margin-left: 500px; margin-top : 500px; position : absolute;">      	   
			
			<button id = "regist" class = "btn btn-danger">등록</button>
			<button id = "cancle" class = "btn btn-warning">취소</button>      
		</div>
		
	</div>
	<script>
	//이미지를 업로드하면 미리 볼 수 있는 기능
	function previewImage(targetObj, View_area){
		var preview = document.getElementById(View_area);
		
		var files  = targetObj.files
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
	<script src = "../../../dacham/resources/openAPIjs/APIQuery.js"></script>
</body>
</html>