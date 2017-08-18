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
<style>
	.changeColor{
		background-color : red;
	}
</style>
<title>Insert title here</title>
<script>  
	$(document).ready(function(){
		$("#cookFood").addClass("w3-light-gray");
		
		foodStockAll(1);
		
		$(".pagination").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			
			foodStockAll(replyPage);
		});
		
		function foodStockAll(page){
			$(".pagination").show();
			$.getJSON("cookAjax/foodStockAll/"+page,function(data){
				$(".overlayResult").remove();
				var str = "";
				$(data.list).each(function(i){
					
					str += "<tr class = 'overlayResult'><td>"+this.foodMName+"</td><td class = 'dualAmount' data-mount = '"+this.foodMAmount+"'>"+this.foodMAmount+"</td><td>"+this.unit+"</td></tr>";

				});
				
				
				$(".overlay").append(str);
				style();      
				
				printPaging(data.criteria);
			});
			
			
		}
		function style(){
			var length = 0;
			length = $(".overlayResult").length;
			for(var i = 0; i< length; i++){
				var font = $(".dualAmount").eq(i).attr('data-mount');
				
				if(font < 0.3){   
					
					$(".dualAmount").eq(i).attr("style","background-color:red;");  
				}
			}
		}
		$("#search").on("click",function(){
			var keyword = $("#keyword").val();
			alert("검색"+keyword);
			if(keyword == ""){
				alert("검색어를 입력하세요");
			}
			else{
				$(".pagination").hide();
				$.getJSON("cookAjax/foodStockSearch/"+keyword,function(data){
					$(".overlayResult").remove();
					var str = "";
					$(data).each(function(){
						str += "<tr class = 'overlayResult'><td>"+this.foodMName+"</td><td class = 'dualMount' data-mount = '"+this.foodMAmount+"'>"+this.foodMAmount+"</td><td>"+this.unit+"</td></tr>";
					});
					$(".overlay").append(str);
				});
			}
		});
		$("#all").on("click",function(){
			
			foodStockAll(1);
		});
		
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
</head>
<body>
<%@include file = "cookerNavi.jsp" %>
	<div class = "container">
		<div>
			
				<input type = "text" id = "keyword" name = "keyword" placeholder = "검색어 입력란">
				<button id = "search" class = "btn btn-warning">검색</button>
				<button id = "all" class = "btn btn-success">전체목록</button>
		</div>
		<br><br>
		<div>
			<table class = "overlay table table-hover">
				<tr>
					<th>식재료명</th>
					<th>재고량</th>					
					<th>단위</th>
				</tr>
				<tr class = "overlayResult">
						
				</tr>
				
			</table>
			<ul class = "pagination">
			</ul>
		</div>
	</div>
</body>
</html>
