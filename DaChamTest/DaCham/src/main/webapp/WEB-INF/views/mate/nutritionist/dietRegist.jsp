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
		$("#cancle").click(function(){
			if(window.confirm("정말로 취소하시겠습니까?")){
				window.location.href = "diet";	
			}
		});
		
		
		if(!localStorage['clear'] || localStorage['count'] == 'NaN'){
			localStorage['clear'] = "true";
			localStorage['count'] = 0;   
		}
		
		$(".nameClick").on("click",function(){
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
		
		function Refresh(){
			var count = parseInt(localStorage['count']);
			$('.item').empty();	
		
		
			for(var i = 0; i<count; i++){
				var sideDImg = localStorage[i + "_img"];
				var sideDCode = localStorage[i + "_codes"];
				var item = $('<div></div>').addClass('item').attr('data-id',i);
				$('<input type = "hidden" name = "sideDCode" value = '+sideDCode + '>').appendTo(item);    
				$('<img src = "displayFile?fileName='+sideDImg+'" style= "width: 75px; height: 50px;">').addClass("sideDImg").appendTo(item);
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
		  overflow: hidden;
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
	<form name = "input_form" id = "searchForm">
		<div class = "div1">
			<h2>위자드 선택</h2>
			<hr align = "left" width = "40%">
			<div class = "box1">
				<input type = "radio" name = "wizardCode" value = "1"> 고위험군 당뇨병<br>
				<input type = "radio" name = "wizardCode" value = "2"> 저위험 고지혈증<br>
				<input type = "radio" name = "wizardCode" value = "3"> 주의 신부전증
			</div>
			<div class = "box2">
				<table>
					<tr>
						<th></th>
						<th>반찬명</th>
						<th>영양정보</th>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
			<br><br><br><br><br><br>
			<div>
				<input type = "text" name = "search">
				<button id = "search">검색</button><br>
				<table border = "1">
					<tr>
						<th>반찬명</th>
						<th>식품군</th>
						<th>조리방법</th>
					</tr>
					
					<c:forEach items = "${list }" var = "b">
						
						<tr>
							<td><a class = "nameClick" data-img = "${b.sideDImg }" data-code = "${b.sideDCode }">${b.sideDName }</a></td>
							<td>${b.foodGName }</td>
							<td>${b.cookMName }</td>
						</tr>
						
					</c:forEach>
				</table>
			</div>
		</div>
		</form>
		<form id = "registForm">
			<div>
				<h3>선택한 반찬</h3>
				<div class = "material">
				</div>
				<hr align = "left" width = "80%">
			</div>
		
			<div class = "div2" style = "border-left:1px solid #000">
				<div>
					질환별 식단 목록<br>
					- <a>당뇨병</a><br>
					- <a>고지혈증</a>
				</div>
				<br><br><br>
				<div id = "test">
					<input type = "text" name = "diseaseCode" placeholder = "질환코드(test용)">
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
					<input type = "file" name = "dietImg" placeholder = "식단이미지 올리기">
				</div>
				<div id = "body">
					<div id = "chart"></div>
					<div>
					<!-- 총 칼로리 양 표시 -->
					</div>
				</div>
			</div>
		</form>
	<button id = "regist" type = "submit">등록</button>
	<button id = "cancle">취소</button>
	
</body>
</html>