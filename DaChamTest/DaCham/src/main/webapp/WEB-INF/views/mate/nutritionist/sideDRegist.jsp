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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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
	<form id = "materialSearch"  class = "materialSearch">
		<div class = "div1">
			<div>
				<input type = "text" name = "search" placeholder = "식재료 검색어 입력란">
				<button id = "search"> 검색 </button>
				<table>
					<tr>
						<th>코드번호</th>
						<th>이미지</th>
						<th>식재료명</th>
					</tr>
					<c:forEach items = "${list }" var = "b">
						<tr>
							<td>${b.foodMCode }</td>
							<td><img src = "displayFile?fileName=${b.foodMImg }" style= "width: 175px; height: 50px;"></td>
							<td><a class = "nameClick" data-src = "${b.foodMName }" data-code = "${b.foodMCode }">${b.foodMName }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</form>
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
				<h2>반찬 사진</h2>
				<input type = "file" name = "file">
				
				<div>
				</div>
		</div>
			
	
		<div class = "div2">
			<div>
				그래프가 들어갈
				open API영역
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
			var v = 0;
			$("#regist").on("click",function(){
				$("#registForm").attr("method","post");
				$("#registForm").attr("action","side");
				$("#registForm").submit();
			});
			
			
			if(!localStorage['init']){
				localStorage['init'] = "true";
				localStorage['cnt'] = 0;
			}
			
			
			$("#cancle").click(function(){
				if(confirm("정말로 취소하시겠습니까?")){
					window.location.href = "side";	
				}
			});
			$(".nameClick").on("click",function(){
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
			
			function Refresh(){
				var cnt = parseInt(localStorage['cnt']);
				$('.item').empty();	
				
				
				
			
				for(var i = 0; i<cnt; i++){
					var foodMName = localStorage[i + "_name"];
					var foodMCode = localStorage[i + "_code"];
					var item = $('<tr></tr>').addClass('item').attr('data-id',i);
					$('<td></td>').html('<input type = "hidden" name = "foodMCode" value = '+foodMCode + '>').appendTo(item);    
					$('<td>'+foodMName+'</td>').addClass("foodMName").attr('name','foodMName').appendTo(item);
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
		});
	</script>
</body>
</html>