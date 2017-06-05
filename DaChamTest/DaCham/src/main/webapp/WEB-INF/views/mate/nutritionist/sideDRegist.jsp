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
	<form id = "materialSearch" >
		<%
			long time = System.currentTimeMillis(); 
	
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
			String str = dayTime.format(new Date(time));
	
			System.out.println(str);
		%>	
		<input type = "hidden" name = "sideDCode" value = <%=str %>>
		<input type = "hidden" name = "foodMCode" value = "${nutritionist.foodMName }">
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
							<td><a class = "nameClick" data-src = "${b.foodMName }">${b.foodMName }</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</form>
	<form id = "registForm" enctype = "multipart/form-data">
			<input type = "hidden" name = "sideDCode" value = <%=str %>>	
			<br><br>
			<div class = "box1">
				<table class = "material">
					<tr>
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
								<option value = "03">포유류</option>
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
							</select>
						</td>
					</tr>
				</table>
				<button id = "regist">등록</button>
				<button id = "cancle">취소</button>
			</div>
		</div>
	</form>
	<script>
		$(document).ready(function(){
			
			$("#regist").on("click",function(){
				$("#registForm").attr("method","post");
				$("#registForm").attr("action","side");
				$("#registForm").submit();
			});
			Refresh();
			
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
				
				var foodMName = $(this).attr('data-src');
				
				var cnt = parseInt(localStorage['cnt']);
				localStorage[cnt + '_name'] = foodMName;
				
				localStorage['cnt'] = cnt + 1;
				
				Refresh();
				
			
			});
			$(document.body).on('click','.foodMName',function(){
				var cnt = parseInt(localStorage['cnt']);
				var id = $(this).parent().attr('data-id');
				
				$(this).parent().remove();
				localStorage.removeItem(id+'_name');
				localStorage['cnt'] = cnt - 1;
			});
			
			function Refresh(){
				$('.item').empty();	
				var cnt = parseInt(localStorage['cnt']);
				for(var i = 0; i<cnt; i++){
					var foodMName = localStorage[i + "_name"];
					var item = $('<tr></tr>').addClass('item').attr('data-id',i);
					$('<td>'+foodMName+'</td>').addClass("foodMName").attr('name','foodMName').appendTo(item);
					$('<td></td>').html('<input type ="text" name = "foodMAmount" maxlength="4" size="1" >').appendTo(item);
					item.appendTo(".material");
					
				}
				
			}
		});
	</script>
</body>
</html>