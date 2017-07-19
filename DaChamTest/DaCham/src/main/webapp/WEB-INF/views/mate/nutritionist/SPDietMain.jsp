<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://www.w3schools.com/lib/w3.js"></script>
<script>
	$(document).ready(function(){
		$("#special").addClass("w3-light-gray");
		
		
		$(".glyphicon-chevron-down").on("click",function(){
			var customer = $(this).attr("data-id");
			console.log("고객아이디:"+customer);
			
			$.getJSON("nutriAjax/specialToggle/"+customer,function(data){
				$(data).each(function(){
					$(".optionSpecial").after("<tr class = 'detailOrder'><td>"+this.dietName + "</td><td>"+this.price+"</td></tr>");      
				});     
			});
			$(".detailOrder").toggle();      
			if($(this).hasClass('glyphicon-chevron-down')){
				$(this).removeClass('glyphicon-chevron-down');
				$(this).addClass('glyphicon-chevron-up');
			}else{
				$(this).removeClass('glyphicon-chevron-up');
				$(this).addClass('glyphicon-chevron-down');			
			}
			
		});
		$(".glyphicon-chevron-up").on("click",function(){
			$(".detailOrder").remove();    
		});
	});
</script>
<style>
	.buttonBox{
		float:right;
	}
</style>
<title>특별식단 관리 페이지</title>
</head>
<body>
<%@include file="nutritionistNavi.jsp" %>
	<div class = "container">    
		
		<div>
				<table class = "table table-hover">
					<tr>
						<th>*</th>
						<th>번호</th>
						<th>고객id</th>
						<th>상담명</th>
						<th>상담일</th>
						
					</tr>
					<c:forEach items = "${list }" var = "v">
						<tr class = "detail">
							<td><input type = "radio" name = "counselCode" value = "${v.counselCode }"></td>
							   
							<td>${v.counselCode}</td>   
							<td>${v.customer }</td>
							<td><a href = "SPRegist?counselCode=${v.counselCode }">${v.counselTitle }</a></td>   
							<td>${v.counselDate }</td>						
							
						</tr>
					</c:forEach>
					                  
				</table>
		</div>
	</div>
</body>
</html>