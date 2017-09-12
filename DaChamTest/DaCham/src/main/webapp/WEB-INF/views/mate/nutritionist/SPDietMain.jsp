<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
<link rel="shortcut icon" href="resources/favicon/N.ico">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
		
		<div class = "row">
			<div class = "col-lg-12 col-md-12">
				<div class = "card">
					<div class = "card-header" data-background-color = "#3A546D">
						<h4 class = "title">특별식단 요청 리스트</h4>
					</div>
					<div class = "card-content table-responsive">
						<table class = "table table-hover">
					<tr>
						
						<th>번호</th>
						<th>고객id</th>
						<th>상담명</th>
						<th>상담일</th>
						
					</tr>
					<c:forEach items = "${list }" var = "v">
						<tr class = "detail">
				
							<td>${v.counselCode}</td>   
							<td>${v.customer }</td>
							<td><a href = "SPRegist?counselCode=${v.counselCode }">${v.counselTitle }</a></td>   
							<td>${v.counselDate }</td>						
							
						</tr>
					</c:forEach>
					                  
				</table>
					</div>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>