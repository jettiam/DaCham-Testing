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
<title>다참 식재료 도매</title>
<script>
	$(document).ready(function(){
		foodOrderList(); 
		function foodOrderList(){
			$.getJSON("wholesale/foodMOrderList",function(data){
				var length=data.list.length;							
				for(var i=0;i<length;i++){
					console.log(i+":"+data.list[i].orderDate);
					$("#foodMList").append("<tr><td><a href='foodMOrderListDetail?orderDate="+data.list[i].orderDate+"'>"+data.list[i].orderDate+" 주문목록</a></td></tr>");				
				} 
			});

		}
	});
</script>
</head>
<body>
<div class="container">
<h3 class="text-center">식재료 주문 목록</h3>
<table class="table" id="foodMList">

</table>

</div>
</body>
</html>