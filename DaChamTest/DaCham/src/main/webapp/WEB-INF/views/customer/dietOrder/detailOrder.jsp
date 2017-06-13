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
<title>주문 상세 보기</title>
</head>
<style>
.detailOrderWrap {
	width: 1080px;
	margin: 0 auto;
}
</style>
<script>
	$(document).ready(function(){
		$(".sideDList").on("click",function(){
			var foodGCode = $(this).attr("data-foodGCode");
			$.getJSON("customerAjax/getfoodG/"+foodGCode,function(data){
				alert("성공");
			});
		});
	});
</script>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<div class="detailOrderWrap">
		<div class="row">
			<div class="col-sm-7">
				<img src='displayFile?fileName=' +${list[0].dietImg} />
			</div>
			<div class="col-sm-5">
				<div>${list[0].dietName}</div>
				<div>
					가격 <span id="dietPrice">${list[0].price}</span>원
				</div>
				<div>
					<label name="dietAmount">수량</label><input type="number"
						name="dietAmount" value="1">
				</div>
				<div>
					<button>장바구니</button>
					<button>주문하기</button>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${list}" var="list">
				<div class="col-sm-2  sideDList" data-foodGCode='${list.foodGCode }'>
					<div>
						<img src='displayFile?fileName=' +${list.sideDImg }>
					</div>					
					<div>${list.sideDName}</div>										
				</div>
			</c:forEach>
		</div>
		<div class="row foodGList">
			
		</div>
	</div>
</body>
</html>