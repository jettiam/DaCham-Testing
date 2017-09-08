<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.wdb3a.dacham.bean.OrderList"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Bootstrap core CSS     -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />

<!--  Material Dashboard CSS    -->
<link href="resources/assets/css/material-dashboard.css"
	rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="resources/assets/css/demo.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Jeju Gothic',"Nanum Gothic", sans-serif !important;
}
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
					
					$(".dualAmount").eq(i).attr("style","background-color:#CC0066; color : #EEEEEE;");  
				}
			}
		}
		$("#search").on("click",function(){
			var keyword = $("#keyword").val();
			//alert("검색"+keyword);
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
<%@include file = "cookerNavi.jsp" %>>
			<div class = container>
	 		<div class ="row">
			<div class="col-lg-12 col-md-12">
			<div class="card">
			<div class="card-header" data-background-color="skyblue">
			<h2 class="title text-center">식재료재고</h2>
			
				<input type = "text" id = "keyword" name = "keyword" placeholder = "검색어 입력란">
				<button id = "search" class = "btn btn-warning">검색</button>
				<button id = "all" class = "btn btn-success">전체목록</button>
	
		</div>
		
		
		<br><br>
		<div>
		    <div class="card-content table-responsive">
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
	</div>
	</div>
	</div>
	</div>
</body>
</html>
