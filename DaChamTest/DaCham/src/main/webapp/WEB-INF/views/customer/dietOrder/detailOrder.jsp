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
<title>DaCham 식단상세보기</title>
</head>
<style>

.dashboard-nav-card {
  background: #1779ba;
  border-radius: 0;
  color: #fefefe;
  display: block;
  min-height: 100px;
  padding: 2rem;
  position: relative;
  width: 100%;
}

.dashboard-nav-card:hover .dashboard-nav-card-title,
.dashboard-nav-card:hover .dashboard-nav-card-icon {
  color: #fefefe;
}

.dashboard-nav-card:hover .dashboard-nav-card-icon {
  opacity: 1;
  transition: all 0.2s ease;
}

.dashboard-nav-card-icon {
  font-size: 1.25rem;
  left: 1rem;
  opacity: 0.5;
  position: absolute;
  top: 1rem;
  transition: all 0.2s ease;
  width: auto;
}

.dashboard-nav-card-title {
  bottom: 0;
  position: absolute;
  right: 1rem;
  text-align: right;
}









.detailOrderWrap {
	width: 80%;
	margin: 0 auto;
}

.sideDImg {
	width: 150px;
	height: 150px;
}

#dietImg {
	width: 240px;
	height: 180px;
}

table, tr, td {
	border: solid 1px black;
}

table {
	display: inline-table;
}
</style>
<script>
	$(document)
			.ready(
					function() {
						$(".sideDList")
								.on(
										"click",
										function() {
											$(".foodGSideD").remove();
											var foodGCode = $(this).attr(
													"data-foodGCode");
											$
													.getJSON(
															"customerAjax/getfoodG/"
																	+ foodGCode,
															function(data) {
																var a = data.list;
																console.log(a);
																for (var i = 0; i < data.list.length; i++) {
																	$(
																			"#foodGList")
																			.append(
																					"<div class='col-sm-8 foodGSideD' data-sideDCode='"+data.list[i].sideDCode+"'><img class='sideDImg' src='displayFile?fileName="
																							+ data.list[i].sideDImg
																							+ "'>"
																							+ data.list[i].sideDName
																							+ "<table><tr><td>칼로리</td><td>탄수화물</td><td>단백질</td><td>지방</td><td>나트륨</td></tr><tr><td>"
																							+ data.list[i].kcal
																									.toFixed(0)
																							+ "kcal</td><td>"
																							+ data.list[i].carbohydrate
																									.toFixed(0)
																							+ "g</td><td>"
																							+ data.list[i].protein
																									.toFixed(0)
																							+ "g</td><td>"
																							+ data.list[i].fat
																									.toFixed(0)
																							+ "g</td><td>"
																							+ data.list[i].na
																									.toFixed(0)
																							+ "mg</td></tr></table>"
																							+ "</div>");
																}

															});
										});

						$("#dietAmount").keyup(
								function() {
									var a = $("#dietAmount").val();
									var price = $("#dietPrice").attr(
											"data-basicPrice");
									console.log("수량" + a);
									console.log("가격" + price);
									console.log(a * price);
									$("#dietPrice").text(a * price);
								});
						$("#dietAmount").mouseup(
								function() {
									var a = $("#dietAmount").val();
									var price = $("#dietPrice").attr(
											"data-basicPrice");
									console.log("수량" + a);
									console.log("가격" + price);
									console.log(a * price);
									$("#dietPrice").text(a * price);
								});

						$("#doOrder")
								.on(
										"click",
										function() {
											$("#setDietCode").val();
											$("#setDietName").val(
													$("#dietName").text());
											$("#setPrice").val(
													$("#dietPrice").text());
											$("#setDietAmount").val(
													$("#dietAmount").val());
											$("#setDietImg").val(
													$("#dietImg").attr(
															"data-dietImg"));
											$("#orderForm").attr("action",
													"doOrder");
											$("#orderForm").submit();
										});

						$("#goMyCart").on("click", function() {
							$("#setDietCode").val();
							$("#setDietName").val($("#dietName").text());
							$("#setPrice").val($("#dietPrice").text());
							$("#setDietAmount").val($("#dietAmount").val());
							$("#orderForm").attr("action", "goMyCart");
							$("#orderForm").submit();
						});
					});
</script>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<div class="detailOrderWrap">
		<div class="row">
			<div class="col-sm-7">

				<img id="dietImg" data-dietImg="${list[0].dietImg}"
					src='displayFile?fileName=${list[0].dietImg}' />

			</div>

			<div class="col-sm-5">
				<div id="dietName">
					<h2>${list[0].dietName}</h2>
				</div>
				<div>
					가격 <span id="dietPrice" data-basicPrice="${list[0].price}">${list[0].price}</span>원
				</div>
				<div>
					<label name="dietAmount">수량</label><input id="dietAmount"
						type="number" name="dietAmount" value="1">
				</div>
				<div>
					<button id="goMyCart">장바구니</button>
					<button id="doOrder">주문하기</button>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${list}" var="list">
				<div class="col-sm-2  sideDList" data-foodGCode='${list.foodGCode}'>
					<div>
						<img class="sideDImg" src='displayFile?fileName=${list.sideDImg}'>
					</div>
					<div>${list.sideDName}</div>
				</div>
			</c:forEach>
		</div>
		<div class="row" id="foodGList"></div>
	</div>

	<!-- 가은 편집 반찬 선택창 입니다 :) -->
	<div>
		<section>
			<nav>
				<ul>
				</ul>
			</nav>
		</section>
	</div>

	<a class="dashboard-nav-card" href="#"> <i
		class="dashboard-nav-card-icon fa fa-users" aria-hidden="true"></i>
		<h3 class="dashboard-nav-card-title">Visitors</h3>
	</a>
	<div>
		<img src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150">
	</div>


	<form id="orderForm" method="get">
		<input id="setDietCode" type="hidden" name="dietCode"
			value="${list[0].dietCode }"> <input id="setPrice"
			type="hidden" name="price"> <input id="setDietImg"
			type="hidden" name="dietImg"> <input id="setDietAmount"
			type="hidden" name="dietAmount"> <input id="setDietName"
			type="hidden" name="dietName"> <input id="customerId"
			type="hidden" name="id" value="${customerId}"> <input
			type="hidden" name="detailOrder" value="true">
		<!-- 디테일오더에서 넘어갔는지 유무 -->
	</form>
</body>
</html>