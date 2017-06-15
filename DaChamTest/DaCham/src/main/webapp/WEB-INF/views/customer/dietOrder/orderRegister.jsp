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
.orderRegistWrap {
	width: 70%;
	margin: 0 auto;
}
</style>
<script>
	$(document).ready(function() {
		$("#payment").on("click", function() {
			/* $("#setPaymentItem").val($("#paymentItem").val());
			$("#paymentForm").attr("action", "payment");
			$("#paymentForm").submit(); */
			if(confirm("결제 하겠습니까?")){
				var data = new Array();
				var dataObj = new Object();
				var length = $(".dietAmount").length;
				//for() 17-06-14 내일여기 작업!!
					
				/* $.ajax({
					url:"customerAjax/payment",
					data:,
					type:"post",
					data-type:"json",
					success:function(data){
						
					}
				}); */
			}
		});
	});
</script>
</head>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<div class="orderRegistWrap">
		<div class="row">
			<div class="block-center text-center">주문결제</div>
			<div class="row col-sm-6">
				<!--좌측 이 안에 배송지, 결제정보 저장 -->
				<div>배송지 입력</div>
				<div>결제수단 선택</div>
				<select id="paymentItem">
							<option value="2">신용카드</option>
							<option value="3">계좌이체</option>
							<option value="4">휴대폰결제</option>
						</select> 
			</div>
			
			
				<div class="row col-sm-6"><!--우측 주문내역, 결제정보 출력및결제 -->
				<c:if test="${order.detailOrder == true}">
				<!-- detaileOrder에서 넘어온 경우 사용 -->
				<div class="row"> <!-- 주문내역 row -->
					<div class="col-sm-3 text-center">
						<img class="block-center img-responsive" width="120" height="90"
							src="displayFile?fileName=${order.dietImg}">
					</div>
					<div class="col-sm-3 text-center">
						<div class="block-center" data-dietCode0="${order.dietCode}">식단명</div>
						<div >${order.dietName}</div>
					</div>
					<div class="col-sm-3 text-center">
						<div>주문수량</div>
						<div class="dietAmount">${order.dietAmount }개</div>
					</div>
					<div class="col-sm-3 text-center">
						<div>가격</div>
						<div class="dietPrice">${order.price}원</div>
					</div>
					</div>
					</c:if>
					<div>최종결제 정보</div>
					<div class="row"><!-- 최종 결제정보 row -->						
						<div class="col-sm-5">상품가격</div><div class="col-sm-7"><c:if test="${order.detailOrder == true}">${order.price}</c:if>원</div>
						<div class="col-sm-5">할인가격</div><div class="col-sm-7">0원</div>
						<div class="col-sm-5">배송비</div><div class="col-sm-7">0원</div>
						<div class="col-sm-5">최종 결제가격</div><div class="col-sm-7"><c:if test="${order.detailOrder == true}">${order.price}</c:if>원</div>
						<button id="payment">결제</button>
					</div>	
				</div>
			
			
		</div>
	</div>
	<form id="paymentForm" method="post">
		<input id="setDietCode" type="hidden" name="dietCode"> <input
			id="setPrice" type="hidden" name="price"> <input
			id="setDietAmount" type="hidden" name="dietAmount"> <input
			id="setPaymentItem" type="hidden" name="paymentItemCode"> <input
			id="customerId" type="hidden" name="id" value="${order.id }">
	</form>
</body>
</html>