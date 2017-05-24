<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<%@include file="../admin/upmenu.jsp"%>
<title>Insert title here</title>
<script>
	jQuery.fn.center = function() {
		this.css("position", "absolute");
		this.css("top", Math.max(0, (($(window).height() - $(this)
				.outerHeight()) / 2)
				+ $(window).scrollTop())
				+ "px");
		this.css("left", Math.max(0,
				(($(window).width() - $(this).outerWidth()) / 2)
						+ $(window).scrollLeft())
				+ "px");
		this.css("background-color", "#dddddd");
		return this;
	}
	function showmap() {
		$("#read").show();
		$("#read").center();

	}
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		$("#allCheck").click(function() {
			if ($("#allCheck").prop("checked")) {
				//input태그의 name이 che인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=che]").prop('checked', true);
				//클릭이 안되있으면 
			} else {
				$("input[name=che]").prop('checked', false);
			}
		});
		$("#foodOrder").click(function() {
			window.location.href = "foodOrder"
		});
		$("#close").click(function(){
			$("#read").css("display", "none");
		});
	});
</script>
<style>
#read {
	display: none;
}
.font {
	text-align: center;
	font-size: 15pt;
	color: #93DAFF;
}
</style>






</head>
<body>
	<form role="form" method="post">
		<input type="hidden" name="orderCode" value="${orderCode}">
	</form>
	<div>
		<a class="font">전체주문|&nbsp;&nbsp;</a> <a class="font">|결제
			대기주문|&nbsp;&nbsp;</a> <a class="font">|결제 완료 주문|&nbsp;&nbsp;</a> <a
			class="font">|배송중 주문|&nbsp;&nbsp;</a> <a class="font">|완료된주문|&nbsp;&nbsp;</a>
		<a class="font">|취소된 주문|&nbsp;&nbsp;</a>
	</div>

	<div>
		<form method="get" action="">
			<select>
				<option>고객id</option>
				<option>식단명</option>
				<option>진행상태</option>
				<option>배송상태</option>
			</select> <input type="text"> <input type="submit" value="검색">
		</form>
	</div>


	<div class="divs" id="a1">
		<table width="600" border="1">
			<tr>
				<th><input type="checkBox" id="allCheck">전체</th>
				<th>주문번호</th>
				<th>고객id</th>
				<th>식단명</th>
				<th>주문 접수일</th>
				<th>금액</th>
				<th>진행상태</th>
				<th>배송</th>
			</tr>
			<c:forEach items="${list}" var="board">
				<tr>
					<th><input type="checkBox" id="${board.orderCode}" name="che"></th>
					<td>${board.orderCode }&nbsp;&nbsp;&nbsp;</td>
					<td>${board.id }</td>
					<%-- <td>${board.dietName}&nbsp;&nbsp;</td> --%>
					<td><a onclick="showmap()">${board.dietName}${board.dietName}&nbsp;&nbsp;</td>
					<td>${board.orderDate }&nbsp;&nbsp;</td>
					<td>${board.price}</td>
					<td>${board.orderItem}</td>
					<td>${board.transportNum}</td>
				</tr>

			</c:forEach>
		</table>
	</div>
	<div>
		<button id="foodOrder">식재료 주문</button>
		<button>작업 요청</button>
		<button>환불</button>
	</div>

	<div name="read" id="read" class="read">
		<table width="600" border="1">
			<tr>
				<th>고객이름</th>
				<td>${order.name}</td>
				<th>배달주소</th>
				<td>${order.address}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${order.price}</td>
				<th>식단명</th>
				<td>${order.dietName}</td>
			</tr>
			<tr>
				<th>주문일</th>
				<td>${order.orderDate}</td>
				<th>질환명</th>
				<td></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${order.tel}</td>
				<th>질환명</th>
				<td></td>
			</tr>
		</table>
		<button id="close">닫기</button>
	</div>

</body>
</html>