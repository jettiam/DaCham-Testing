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
	
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>DaCham 주문하기</title>
<style>
.buyInfo {
	width:90px; 
	
	
}
.row{
	margin-bottom:30px;
}
</style>
<script>
	$(document).ready(function() {
		$("#dietOrder").addClass("w3-gray");
		if("${cartOrder[0].dietCode}">0){
			var totalPrice = 0;
			for(var i=0; i<$(".dietAmount").length;i++){
				totalPrice += Number($(".dietPrice:eq("+i+")>span").text());
			}
			$(".totalPrice").text(totalPrice);
		}
		$("#payment").on("click", function() {
			var recentlyAddress = $("#textArea").val();			
			var id = "${customerId}"			
			$("#paymentForm").append("<input type='hidden' name='recentlyAddress' value='"+recentlyAddress+"'>")
			if($(".orderInfo").attr("data-detailOrder")=="true"){
				if(confirm("결제 하겠습니까?")){
					$("#setPaymentItem").val($("#paymentItem").val());
					$("#paymentForm").attr("action", "payment");
					$("#paymentForm").submit();	
				}
			}else{			
			if(confirm("결제 하겠습니까?")){
				var data = new Array();
				var dataObj = new Object();
				var length = $(".dietAmount").length;
				console.log($(".dietAmount:eq(0)").text());
				console.log($(".orderCode:eq(0)").attr("data-orderCode"));
				console.log($(".dietPrice:eq(0)>span").text());
				var orderInfo = new Array();				
				for(var i=0; i<length;i++){					
					var jsonVal ={
							'orderCode':$(".orderCode:eq("+i+")").attr("data-orderCode"),
							'paymentItemCode':$("#paymentItem").val(),
							'recentlyAddress':recentlyAddress,
							'id':id
					}
					orderInfo[i]=jsonVal;
				}
				console.log(orderInfo);
				
				$.ajax({
					url:"customerAjax/payment",					
					headers : {
			               "Content-Type" : "application/json",
			               "X-HTTP-Method-Override" : "POST"
			            },
			        dataType : "text",
					data:JSON.stringify(orderInfo),
					type:"POST",
					success:function(data){							
						if(data=="SUCCESS"){
							window.location.href="cartPayment";	
						}							
					}
				});
			}
			}
		});
		
		/* 배송지 입력 */
		$("#address").on("click",function(){
			$("#textArea").text("${address}");
			$("#textArea").attr("readonly","readonly");
		});
		$("#recentlyAddress").on("click",function(){
			$("#textArea").text("${recentlyAddress}");
			$("#textArea").attr("readonly","readonly");
		});
		$("#inputAddress").on("click",function(){
			$("#textArea").text("");
			$("#textArea").removeAttr("readonly");
		});
	});
</script>
</head>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<div class="container">
		
			<div class="block-center" style="margin-bottom:30px; border-bottom:2px solid black;"><h2>주문결제</h2></div>
			<div class="row">
				<div class="col-sm-12 form-group"><span class=" h3">구매자 정보</span></div>
				<div class="col-sm-12">
				<table class="table table-striped"> 
				<tr><td class="buyInfo">이름</td><td>${memberName}</td></tr>
				<tr><td class="buyInfo">이메일</td><td>${email}</td></tr>
				<tr><td class="buyInfo">전화번호</td><td>${tel}</td></tr>
				</table>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-12"><span class="h3">배송지</span>&nbsp;&nbsp;
				<input type="radio" id="address" name="address" checked><label for="address">기본 주소</label>&nbsp;
				<input type="radio" id="recentlyAddress" name="address"><label for="recentlyAddress">최근 배송지</label>&nbsp;
				<input type="radio" id="inputAddress" name="address"><label for="inputAddress">배송지 입력</label>
				</div>
				<div class="col-sm-12">
				<table class="table table-striped"> 
				<tr><td class="buyInfo">배송주소</td><td><textarea rows="2" class="form-control" readonly="readonly" id="textArea">${address}</textarea></td></tr>
				<tr><td class="buyInfo">연락처</td><td>${tel}</td></tr>
				</table>				
				</div>
			</div>
		
			<div class="row">
			<div class="col-sm-12 form-group"><span class="h3">주문 식단</span></div>
			<div class="col-sm-12"><!--우측 주문내역, 결제정보 출력및결제 -->
			<table class="table table-striped"> 
			<tr><td style="width:170px;">식단명</td><td style="width:170px;">수량</td><td>가격</td></tr>
				<c:if test="${order.detailOrder == true}">								
				<!-- detaileOrder에서 넘어온 경우 사용 -->
				<tr class="orderInfo" data-detailOrder="${order.detailOrder}">
					<td class="dietCode" data-dietCode="${order.dietCode}">${order.dietName}</td>
					<td class="dietAmount"><span>${order.dietAmount}</span>개</td>
					<td class="dietPrice"><span>${order.price}</span>원</td>
				</tr>			
					</c:if>
					<!-- 장바구니에서 넘어온 경우 사용 -->
				<c:forEach items="${cartOrder}" var="cart">
					<tr class="orderCode" data-orderCode="${cart.orderCode}">
					<td class="dietCode" data-dietCode="${cart.dietCode}">${cart.dietName}</td>
					<td class="dietAmount"><span>${cart.dietAmount}</span>개</td>
					<td class="dietPrice"><span>${cart.price}</span>원</td>
				</tr>				
				</c:forEach>
				</table>
				</div>
				</div>
				<div class="row">
					<div class="col-sm-12 form-group"><span class="h3">최종결제 정보</span></div>	
					<div class="col-sm-12">			
					<table class="table table-striped">
					<tr><td class="buyInfo">상품가격</td><td><c:if test="${order.detailOrder == true}">${order.price}</c:if><span class="totalPrice"></span>원</td></tr>
					<tr><td class="buyInfo">할인</td><td>0원</td></tr>
					<tr><td class="buyInfo">배송비</td><td>0원</td></tr>
					<tr><td class="buyInfo">최종가격</td><td><c:if test="${order.detailOrder == true}">${order.price}</c:if><span class="totalPrice"></span>원</td></tr>
					</table>
					</div>					
				</div>						
					
				<div class="row">			
				<div class="col-sm-12 form-group"><span class="h3">결제수단</span></div>
				<div class="form-group col-sm-12">
				<select id="paymentItem">
							<option value="2">신용카드</option>
							<option value="3">계좌이체</option>
							<option value="4">휴대폰결제</option>
						</select> 
				</div>		
				</div>
			<div class="row text-center">
			<button id="payment" class="btn btn-danger btn-lg">결제하기</button>		
			</div>
	</div>
	
	<form id="paymentForm" method="POST">
		<input id="setDietCode" type="hidden" name="dietCode" value="${order.dietCode}">
		<input id="setPrice" type="hidden" name="price" value="${order.price }">
		<input id="setDietAmount" type="hidden" name="dietAmount" value="${order.dietAmount}">
		<input id="setPaymentItem" type="hidden" name="paymentItemCode"> 
		<input id="customerId" type="hidden" name="id" value="${order.id }">
		<c:if test="${order.detailOrder == true}">
		<c:forEach items="${sideDCode }" var="side">	
		<input id="sideDCode" type="hidden" name="sideDCode" value="${side}">
		</c:forEach>	
		</c:if>
	</form>
	<footer>
	<%@include file="../../footer.jsp" %>
</footer>
</body>
</html>