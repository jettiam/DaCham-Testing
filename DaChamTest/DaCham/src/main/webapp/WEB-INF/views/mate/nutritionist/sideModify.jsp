<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/bootstrap-filestyle.min.js"> </script>
<script>
	$(document).ready(function(){
		var w = 0;
		var v = 0;
		var currentPage = 1;
		var sideDCode = '${nutritionist.sideDCode}';
		var foodMCode = 0;
		
		$(".materialResult").remove();
		$.getJSON("nutriAjax/sideMaterial/"+sideDCode,function(data){
			var str = "";
			$(data).each(function(){
				foodMCode = this.foodMCode;	
				str += "<tr class = 'materialResult'><td>"+"<input type = 'hidden' name = 'foodMCode' value = '"+foodMCode+"'>"+"</td><td class = 'foodMName' data-code = '"+foodMCode+"'>"+this.foodMName+"</td><td>"+"<input type = 'text' name = 'foodMAmount' class = 'foodMAmount' value = '"+this.foodMAmount+"'>"+"</td></tr>"
			});
			$(".material").append(str);
			v = $('.materialResult').length;    	         
			console.log("길이:"+v);
			cntChange(v);
		});
		
		$(document.body).on("click",".nameClick",function(){
			var foodMName = $(this).attr('data-src');
			foodMCode = $(this).attr('data-code');
			$(".material").append("<tr class = 'materialResult'><td>"+"<input type = 'hidden' name = 'foodMCode' value = '"+foodMCode+"'>"+"</td><td class = 'foodMName' data-code = '"+foodMCode+"'>"+foodMName+"</td><td>"+"<input type = 'text' name = 'foodMAmount' class = 'foodMAmount'>"+"</td></tr>");
			v = $('.materialResult').length; 
			cntChange(v);
		});
		$(document.body).on("click",'.foodMName',function(){   
			$(this).parent().remove();   
			v = $('.materialResult').length;     
			cntChange(v);
		});
		
		$("#listAll").on("click",function(){
			materialAll(1);
		});
		$(".pagination").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			
			materialAll(replyPage);
		});
		
		
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
		
		$(".cancle").on("click",function(){
			if(window.confirm("작업을 끝내고 취소하시겠습니까?")){
				window.location.href = "side";	
			}
		});		
		$(".modify").on("click",function(){
		
			if(window.confirm("정말로 수정하시겠습니까?")){
				$("form").attr("action","sideModify");
				$("form").attr("method","post");
				$("form").submit();
			}
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
		function cntChange(v){
			$.getJSON("nutriAjax/"+v,function(data){
				$("#cnt").val(data);
				
			});
		}      
		$('<input type = "hidden" id = "cnt" name = "cnt" value = "'+v+'">').appendTo("form");
	});
</script>
</head>
<body style = "overflow:scroll;">
	
	<div class = "container">
		<h2>반찬 수정 페이지</h2>
		
		<div class = "div1">
			<input type = "text" name = "search" placeholder = "식재료 검색어 입력란" id = "keyword">
			<button id = "search" class = "btn btn-warning">검색</button>
			<input type = "button" value = "전체목록" id = "listAll" class = "btn btn-warning">
			<h4>추가하려면 클릭하세요 </h4>			
		</div>
		
		<table class = "searchTable table table-hover" style = "height : 380px;">
					<tr>
						<th>코드번호&nbsp;&nbsp;</th>   
						<th>식재료명&nbsp;&nbsp;</th>
					</tr>
					
					<tr class = "searchResult">
							
					</tr>
					
		</table>
		<ul class = "pagination">
		</ul>
		<form enctype = "multipart/form-data">
			<input type = "hidden" name = "sideDCode" id = "sideDCode" value = "${nutritionist.sideDCode }">
			<div>
				<h3>지우시려면 클릭하세요</h3>    
				<table class = "material table table-hover">
					<tr>
						<th></th>
						<th>식재료명&nbsp;&nbsp;</th>
						<th>재료량&nbsp;&nbsp;</th>
					</tr>
					<tr class = "materialResult">
					</tr>
				</table>
			</div>
			<div class = "form-group">
				<label for = "sideDName">식단의 이름:</label>
				<input type = "text" name = "sideDName" value = "${nutritionist.sideDName }" class = "form-control">
			</div>
			<div class = "form-group">
				<label for = "recipe">식단의 레시피:</label>
				<textarea class = "form-control" name = "recipe" style = "width : 500px; height : 100px;">${nutritionist.recipe }</textarea>
			</div>
			<div>
				<h2>반찬 사진</h2>
					<div id = "View_area">
						<img id = "prev_View_area" src="displayFile?fileName=${nutritionist.sideDImg }" style = "width:100px; height : 100px;">
					</div>
					
					<input type = "file" class = "filestyle" data-input = "false" name = "file" placeholder = "식단이미지 올리기" id = "profile_pt" onchange = "previewImage(this,'View_area')">
			</div>
			<div class = "form-group">
				<label for = "foodGCode">식품군 선택</label>
				<select name = "foodGCode" class = "form-control"> 
					<option value = "${nutritionist.foodGCode }" selected>${nutritionist.foodGName }</option>
					<option>식품군</option>
					<option value = "01">밥</option>
					<option value = "02">국</option>
					<option value = "03">메인메뉴1</option>
					<option value = "04">메인메뉴2</option>
					<option value = "05">메인메뉴3</option>
					<option value = "06">메인메뉴4</option>
				</select>
			</div>
			<div class = "form-group">
				<label for = "cookMCode">조리법 선택</label>
				<select name = "cookMCode" class = "form-control">
					<option value = "${nutritionist.cookMCode }" selected>${nutritionist.cookMName }</option>
					<option>조리방법</option>
					<option value = "01">튀김</option>
					<option value = "02">구이</option>
					<option value = "03">조림</option>
					<option value = "04">찜</option>
					<option value = "05">초벌</option>
					<option value = "06">무침</option>
					<option value = "07">탕</option>		
				</select>
			</div>
		</form>
		<div>
			<button class = "modify btn btn-warning">수정</button>
			<button class = "cancle btn btn-default">취소</button>
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