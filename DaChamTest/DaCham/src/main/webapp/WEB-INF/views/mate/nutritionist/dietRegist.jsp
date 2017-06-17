<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="nutritionistNavi.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){        
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
			event.preventDefault();
						
			var count = parseInt(localStorage['count']);
			console.log(count);
			var sideDImg = $(this).attr('data-img');
			
			var sideDCode = $(this).attr('data-code');
			
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
			
			$(this).parent().remove();
			localStorage.removeItem(id+'_img');
			localStorage.removeItem(id+'_codes');
			
			--count;
			localStorage['count'] = count;
			
			v = count;
			cntChange(v);
		});
		
		$(document.body).on("mouseover",".nameClick",function(){
			var sideDCode = $(this).attr('data-code');
			console.log("이것은"+sideDCode);
			$.getJSON("nutriAjax/showKcal/"+sideDCode,function(data){
				$("#sideDName").text(data.sideDName);
				$("#kcal").text(data.kcal);
			});
			
		});
		
		$(".template a").on("click",function(){
			event.preventDefault();
			      
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
		
		$(document.body).on("click","#reset",function(){
			event.preventDefault();
			
			location.reload();                        
		});
		function Refresh(){
			var count = parseInt(localStorage['count']);
			$('.item').empty();	
		
		
			for(var i = 0; i<count; i++){
				var sideDImg = localStorage[i + "_img"];
				var sideDCode = localStorage[i + "_codes"];
				var item = $('<div></div>').addClass('item').attr('data-id',i);
				$('<input type = "hidden" name = "sideDCode" value = '+sideDCode + '>').appendTo(item);    
				$('<img src = "displayFile?fileName='+sideDImg+'" style= "width: 75px; height: 25px;">').addClass("sideDImg").appendTo(item);
				item.appendTo(".material");

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
   		position : relative;
   }
  #chart {
	  position: relative;
	  top: 50px;
	  left: 10px;
	}	
</style>
</head>
<body>
		<div class = "div1">
			<div class = "box2">
				<table>
					<tr>
						<th>반찬명&nbsp;&nbsp;</th>
						<th>영양정보&nbsp;&nbsp;</th>
					</tr>
					<tr>
						<td id = "sideDName"></td>
						<td id = "kcal"></td>
					</tr>
				</table>
			</div>
			<br><br><br><br><br><br>
			<div>
				<input type = "text" name = "search" id = "keyword" placeholder = "반찬 검색란">
				<button id = "search">검색</button>
				<button id=  "sideAll">전체목록</button><br>
				<table border = "1" class = "searchTable">
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
		<form id = "registForm" enctype = "multipart/form-data">
			<div class = "box1">
				<input type = "radio" name = "wizardCode" value = "1"> 고위험군 당뇨병<br>
				<input type = "radio" name = "wizardCode" value = "2"> 저위험 고지혈증<br>
				<input type = "radio" name = "wizardCode" value = "3"> 주의 신부전증
			</div>             
			<div> 
				<h3>선택한 반찬</h3>
				<div class = "material">
					
				</div>
				<hr align = "left" width = "80%">
			</div>
		
			<div class = "div2" style = "border-left:1px solid #000">
			    <h2>위자드 선택</h2>
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
					<div id = "View_area">
					</div>
					<input type = "file" name = "file" placeholder = "식단이미지 올리기" id = "profile_pt" onchange = "previewImage(this,'View_area')">
				</div>
				<div id = "spDietItem">
					<input type = "radio" name = "spDietItem" value = "0">특별식단
					<input type = "radio" name = "spDietItem" value = "1">일반식단
				</div>
				<div id = "body">
					<div id = "chart"></div>
					<div>
					<!-- 총 칼로리 양 표시 -->
					</div>
				</div>
			</div>
		</form>
	<button id = "regist">등록</button>
	<button id = "cancle">취소</button>
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
</body>
</html>