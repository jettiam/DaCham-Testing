<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
.orderRegistWrap{
	width:80%;
	margin:0 auto;
}
</style>
<script>
$(document).ready(function () {
	$("#payment").on("click",function(){
		$("#setPaymentItem").val($("#paymentItem").val());		
		$("#paymentForm").attr("action","payment");
		$("#paymentForm").submit();
	});
});
</script>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<div class="orderRegistWrap">
주문정보 입력하는 곳(값 확인용)<br>
식단코드 ${order.dietCode}<br>
식단명 ${order.dietName}<br>
식단양 ${order.dietAmount }<br>
가격 ${order.price }<br>
아이디${order.id }<br>
결제수단<select id="paymentItem">
<option value="2">신용카드</option>
<option value="3">계좌이체</option>
<option value="4">휴대폰결제</option>
</select>
<button id="payment">결제하기</button>

<form id="paymentForm" method="post">
		<input id="setDietCode" type="hidden" name="dietCode" value="${order.dietCode }">
		<input id="setPrice" type="hidden" name="price" value="${order.price }">		
		<input id="setDietAmount" type="hidden" name="dietAmount" value="${order.dietAmount }">
		<input id="setPaymentItem" type="hidden" name="paymentItemCode">
		<input id="customerId" type="hidden" name="id" value="${order.id}">
	</form>
</div>
</body>
</html>