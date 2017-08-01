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
					var orderDate = data.list[i].orderDate;						
					var foodMList = "<tr><td>"+orderDate+"</td>";
					var foodMList2 =""
					var foodMCheck1 = Number(data.list[i].foodMCheck1);
					var foodMCheck2 = Number(data.list[i].foodMCheck2);
					/*foodMCheck1
					0 추가주문 없음 일반주문만 잇음
					1 이상 추가주문 있음
					foodMCheck2
					0 일반주문 없음
					1 일반주문 있음
					*/					
					if(foodMCheck1>=1 && foodMCheck2>=1){
						//일반주문, 추가주문 있음
						foodMList2="<td><a href='foodMOrderListDetail?orderDate="+orderDate+"'>주문 상세 보기</a></td><td><a href='foodMOrderListDetailAdd?orderDate="+orderDate+"'>추가 주문 상세 보기</a></td></tr>";
												
					}else if(foodMCheck1>=1 && foodMCheck2==0){
						//추가주문 있음
						foodMList2="<td>주문 없음</td><td><a href='foodMOrderListDetailAdd?orderDate="+orderDate+"'>추가 주문 상세 보기</a></td></tr>";
						
					}else if(foodMCheck1==0){ 
						//일반주문만 있음
						foodMList2="<td><a href='foodMOrderListDetail?orderDate="+orderDate+"'>주문 상세 보기</a></td><td>추가 주문 없음</td></tr>";
						
					}else{
						foodMList2="<td>DB 오류</td><td>DB 오류</td></tr>";
						
					}
					
					$("#foodMList").append(foodMList+foodMList2+"");				
				} 
			});
		}
				
		
	});
</script>
<style>
.foodMList{
	margin:20px;
}
</style>
</head>
<body>
<div class="container">

<h3 class="text-center foodMList">식재료 주문 목록</h3>
<table class="table" id="foodMList">
<tr><th>주문일</th><th>주문</th><th>추가 주문</th></tr>
</table>

</div>
</body>
</html>