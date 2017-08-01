<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>     
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
<title>도매상 식재료 주문 상세내역</title>
<script>
$(document).ready(function(){
	totalPrice();
	function totalPrice(){
		var totalPrice =0;
		var priceLength = $(".price").length;
		console.log(priceLength);
		for(var i=0;i<priceLength;i++){
			totalPrice += Number($(".price").eq(i).text());
		}
		$("#totalPrice").append(""+totalPrice);
		
	}
	
	$(".wholesaler").on("click",function(){
		
		window.location.href="wholesaler";
	});
});
</script>
<style>
.foodMDetailHeader{
	margin : 20px;
}
.totalPrice{
padding: 20px 0;
}
</style>
</head>
<body>
<div class="container">
<h3 class="text-center foodMDetailHeader">${list[0].orderDate} 주문 상세내역</h3>
<div class="text-right col-sm-3 col-sm-offset-9 totalPrice">총 가격 : <span id="totalPrice"></span>원 <button class="btn btn-primary wholesaler">목록</button></div>
<table class="table">
<tr><th>식재료명</th><th>주문량</th><th>단위</th><th>가격</th><th>납품상태</th></tr>
<c:forEach items="${list}" var="list">
<tr><td>${list.foodMName}</td><td>${list.inAmount}</td><td>${list.unit}</td><td><span class="price">${list.price}</span>원</td><td>${list.foodMCheck}</td></tr>
</c:forEach>
</table>
</div>
</body>
</html>