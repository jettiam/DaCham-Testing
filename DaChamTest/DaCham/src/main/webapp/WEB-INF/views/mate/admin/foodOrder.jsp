<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../admin/upmenu.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	<div>
		<form>
			<select>
				<option>전체</option>
				<option>코드번호</option>
				<option>식재료명</option>
			</select> <input type="text">
			<button tpye="submit">검색</button>
		</form>
	</div>
	<div>
		<table id="foodMTable" width="600">
			<tr>
				<th>코드번호</th>
				<th>식재료명</th>
				<th>단가</th>
				<th>단위</th>
				<th>주문량</th>
			</tr>
			<c:forEach items="${invenlist}" var="board" varStatus="status">
				<td>${board.foodMICode}&nbsp;&nbsp;&nbsp;</td>
				<td>${board.foodMName}</td>
				<%-- <td>${board.dietName}&nbsp;&nbsp;</td> --%>
				<td>${board.price}&nbsp;&nbsp;</a></td>
				<td>${board.uint }&nbsp;&nbsp;</td>
				<td><input type="text">&nbsp;&nbsp;</td>

				<%-- <td>${board.outAmount}</td> 
						<td>${board.stock}</td> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<table id="foodMTable" width="600">
			<tr>
				<th>식재료코드</th>
				<th>식재료명</th>
				<th>단가</th>
				<th>주문량</th>
				<th>단위</th>
			</tr>
			<c:forEach items="${list}" var="board" varStatus="status">
				<tr id="foodMOrder${status.index}">
					<td class="foodMCode" data-foodMCode="${board.foodMCode}">${board.foodMCode}</td>
					<td class="foodMName" data-foodMName="${board.foodMName}">${board.foodMName}&nbsp;&nbsp;&nbsp;</td>
					<td class="price" data-price="${board.price}"">${board.price}</td>
					<%-- <td>${board.dietName}&nbsp;&nbsp;</td> --%>
					<td class="foodMAmount" data-foodMAmount="${board.foodMAmount}">${board.foodMAmount}&nbsp;&nbsp;</a></td>
					<td class="unit" data-unit="${board.unit }">${board.unit }&nbsp;&nbsp;</td>

					<%-- <td>${board.outAmount}</td> 
						<td>${board.stock}</td> --%>
				</tr>
			</c:forEach>
		</table>
	</div>
	<button id="foodMOrder">식재료 주문서 보내기</button>

	<script>
		$(document)
				.ready(
						function() {
							$("#foodMOrder")
									.on(
											"click",
											function() {
												var count = $("#foodMTable tr").length;
												//alert(count);
												var foodMArray = new Array();

												var foodMArrayObj = new Object();
												for (var i = 0; i < 3; i++) {
													var foodMObj = new Object();
													foodMObj.foodMCode = $(
															"#foodMOrder"
																	+ i
																	+ ">.foodMCode")
															.attr(
																	"data-foodMCode");
													foodMObj.foodMName = $(
															"#foodMOrder"
																	+ i
																	+ ">.foodMName")
															.attr(
																	"data-foodMName");
													foodMObj.price = $(
															"#foodMOrder" + i
																	+ ">.price")
															.attr("data-price");
													foodMObj.foodMAmount = $(
															"#foodMOrder"
																	+ i
																	+ ">.foodMAmount")
															.attr(
																	"data-foodMAmount");
													foodMObj.unit = $(
															"#foodMOrder" + i
																	+ ">.unit")
															.attr("data-unit");
													foodMArray.push(foodMObj);
												}
												foodMArrayObj.foodMInfo = foodMArray;

												$
														.ajax({
															url : 'adminSub/foodOrder',
															data : JSON
																	.stringify(foodMArrayObj),
															dataType : 'text',
															type : 'POST',
															headers : {
																"Content-Type" : "application/json",
																"X-HTTP-Method-Override" : "POST"
															},
															success : function(
																	data) {
																if (data == "SUCCESS")
																	alert("주문완료");

															},
															error : function() {
																alert("메세지가 전송되었습니다") 
															}

														});
												console.log(foodMArray);
											});
						});
	</script>
</body>
</html>