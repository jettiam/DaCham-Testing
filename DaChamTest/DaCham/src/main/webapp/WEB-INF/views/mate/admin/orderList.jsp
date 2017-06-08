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
	var object = new Object();
	var data = new Array();
	var count = 0;
	
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
		var checkArr = [];
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
			 object.value = data;
			 var values = JSON.stringify(object);
			     $('input[name=orderCode]').val(values);
			     $("#formid").submit();
		}); 
		
		/* $("#foodOrder").click(function() {
			var dataAll; 
			data.forEach(function(item, index) {
				var allData = {
					"orderCode" : item
				};
				alert(item);

				$.ajax({
					url : 'adminSub/orderList3',
					data : JSON.stringify(allData),
					dataType : 'text',
					type : 'POST',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					}, 
					success : function(data) {
							alert("성공");
							dataAll = data;
					
  						
					},error : function(){
						alert("실패")
					}

				});
				
			});
			window.location.href="foodStock"
		}); */
		
		
		
		$("#close").click(function() {
			$("#read").css("display", "none");
		});

		$('.tables*').on("click", "input:checkbox", function() {
			if ($(this).prop("checked")) {
				data[count] = $(this).val();
				count++;
			}

		});
		$('#refund').click(function() {
			data.forEach(function(item, index) {
				var allData = {
					"orderCode" : item
				};

				$.ajax({
					url : 'orderList1',
					data : JSON.stringify(allData),
					dataType : 'json',
					type : 'POST',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					success : function(data) {
						alert("성공")
					}, error : function(){   
						alert("실패");
					}

				});
			})

			location.reload();
		});

		$('#work').click(function() {
			data.forEach(function(item, index) {
				var allData = {
					"orderCode" : item
				};
				$.ajax({
					url : 'orderList2',
					data : JSON.stringify(allData),
					dataType : 'json',
					type : 'POST',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					success : function(data) {

					}

				});
			})

			location.reload();
		});

		//$("#checkBoxId").is(":checked"))
		if ($(this).attr("checked")) {
			// checked
			return;
		}

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
	<form id='formid' method='post' action='foodStock'>
		<input type="hidden" name="orderCode">
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

	<form role="form" method="post">
		<div class="divs" id="a1">
			<table width="600" border="1" class="tables">
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
						<th><input type="checkBox" id="${board.orderCode}"
							class="checkOrder" value="${board.orderCode}" name="che"></th>
						<td>${board.orderCode }&nbsp;&nbsp;&nbsp;</td>
						<td>${board.id }</td>
						<%-- <td>${board.dietName}&nbsp;&nbsp;</td> --%>
						<td><a onclick="showmap()">${board.dietName}&nbsp;&nbsp;</td>
						<td>${board.orderDate }&nbsp;&nbsp;</td>
						<td>${board.price}</td>
						<td>${board.orderItemName}</td>
						<td>${board.transportNum}</td>
					</tr>

				</c:forEach>
			</table>
		</div>
	</form>
	<div>
		<button id="foodOrder">식재료 주문</button>
		<button id="work">작업 요청</button>
		<button id="refund">환불</button>
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