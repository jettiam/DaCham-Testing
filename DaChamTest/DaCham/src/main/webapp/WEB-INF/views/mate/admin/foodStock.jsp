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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS     -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />

<!--  Material Dashboard CSS    -->
<link href="resources/assets/css/material-dashboard.css"
	rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="resources/assets/css/demo.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>
<title>Insert title here</title>
<style>
.all, .paginationSub{
	margin-bottom: 0px;
}
#foodOrder{
float:right;
margin-right: 1cm;         
}
</style>
<script>
	$(document)
			.ready(
					function() {
						function all(page) {
							$
									.getJSON(
											"adminSub/foodStockAll/" + page,
											function(data) {
												console.log(data);
												$(".foodStock").remove();
												var str = "";
												for (var i = 0; i < data.list.length; i++) {
													str += "<tr class='foodStock'>"
															+ "<td>"
															+ data.list[i].foodMName
															+ "</td>"
															+ "<td>"
															+ data.list[i].inAmount
															+ "</td>"
															+ "<td>"
															+ data.list[i].outAmount
															+ "</td>"
															+ "<td>"
															+ data.list[i].stock
															+ "</td>"
															+ "<td>"
															+ data.list[i].unit
															+ "</td></tr>"    
												}
												console.log(str);
												$(".tables").append(str);
												printPaging(data.criteria);
											});
						}
						$("#foodStock").addClass("w3-light-gray");
						all(1);
						$("#foodOrder").on("click", function() {
							window.location.href = "foodOrder"
						});
						$("#search")
								.on(
										"click",
										function() {

											$(".foodStock").remove();

											var str = "";
											var searchType = $(".searchType")
													.val();
											var keyword = $("#keyword").val();
											if (keyword != "") {
												$
														.getJSON(
																"adminSub/foodOrder/"
																		+ searchType
																		+ "/"
																		+ keyword,
																function(data) {
																	for (var i = 0; i < data.length; i++) {

																		str += "<tr class='foodStock'>"
																				+ "<td>"
																				+ data[i].foodMName
																				+ "</td>"
																				+ "<td>"
																				+ data[i].inAmount
																				+ "</td>"
																				+ "<td>"
																				+ data[i].outAmount
																				+ "</td>"
																				+ "<td>"
																				+ data[i].stock
																				+ "</td>"
																				+ "<td>"
																				+ data[i].unit
																				+ "</td></tr>" 
																	}
																	$(".tables")
																			.append(
																					str);
																	$(
																			".pagination")
																			.empty();
																});
											} else {
												alert("검색어를 입력하세요");
												all(1);
											}
										});
						$("#searchAll").on("click", function() {
							all(1);
						});

						function allSub(page) {
							$
									.getJSON(
											"adminSub/foodStockStopAll/" + page,
											function(data) {
												console.log(data);
												$(".foodStockStop").remove();
												var str = "";
												for (var i = 0; i < data.list.length; i++) {
													str += "<tr class='foodStockStop'>"
															+ "<td>"
															+ data.list[i].foodMName
															+ "</td>"
															+ "<td>"
															+ data.list[i].inAmount
															+ "</td>"
															+ "<td>"
															+ data.list[i].unit
															+ "</td><td>"
															+ data.list[i].price
															+ "원</td></tr>" 
												}
												console.log(str);
												$(".tablesStop").append(str);
												printPagingSub(data.criteria);
											});
						}
						allSub(1);

						function printPaging(criteria) {
							var str = "";

							if (criteria.prev) {
								str += "<li><a href='"
										+ (criteria.startPage - 1) + "'>"
										+ "<<" + "</a></li>";
							}
							for (var i = criteria.startPage; i <= criteria.endPage; i++) {
								var strClass = criteria.page == i ? "class = 'active'"
										: "";
								str += "<li "+strClass+"><a href ='"+i+"'>" + i
										+ "</a></li>";
							}
							if (criteria.next) {
								str += "<li><a href='" + (criteria.endPage + 1)
										+ "'>" + ">>" + "</a></li>";
							}
							$(".all").html(str);
						}

						//var currentPage = 1;
						$(".all").on("click", "li a", function() {
							event.preventDefault();
							var replyPage = $(this).attr("href");
							all(replyPage);
						});

						function printPagingSub(criteria) {
							var str = "";

							if (criteria.prev) {
								str += "<li><a href='"
										+ (criteria.startPage - 1) + "'>"
										+ "<<" + "</a></li>";
							}
							for (var i = criteria.startPage; i <= criteria.endPage; i++) {
								var strClass = criteria.page == i ? "class = 'active'"
										: "";
								str += "<li "+strClass+"><a href ='"+i+"'>" + i
										+ "</a></li>";
							}
							if (criteria.next) {
								str += "<li><a href='" + (criteria.endPage + 1)
										+ "'>" + ">>" + "</a></li>";
							}
							$(".paginationSub").html(str);
						}

						//var currentPageSub = 1;  
						$(".paginationSub").on("click", "li a", function() {
							event.preventDefault();
							var replyPage = $(this).attr("href");
							allSub(replyPage);
						});

					});
</script>
</head>
<body>
	<%@include file="../admin/upmenu.jsp"%>
	<div class="wrapper">

		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header" data-background-color="#3A546D">
								<h4 class="title" style="text-align: center">식재료 현황</h4>
							</div>
							<div class="form-group row">
								<div class="col-xs-2">
									<select name="searchType" class="searchType form-control">

										<option value="t"
											<c:out value="${foodMInven.searchType eq 't'?'selected':'' }"/>>
											식재료명</option>
									</select>
								</div>
								<div class="col-xs-3">
									<input type="text" name="keyword" id="keyword"
										class="form-control">
								</div>
								<button id="search" class="btn btn-default">검색</button>
								<button id="searchAll" class="btn btn-default">전체</button>
							</div>
							<div class="card-content table-responsive">
								<table class="tables table">
									<thead class="text-primary">
										<th>식재료명</th>
										<th>입고량</th>
										<th>출고량</th>
										<th>재고량</th>
										<th>단위</th>
									</thead>
								</table>
								<ul class="all pagination">
								</ul>
							</div>
							<button id="foodOrder" class="btn btn-default">추가 식재료 주문</button>
						</div>
					</div>
				</div>
		    
		</div>
	</div>

	
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header" data-background-color="#3A546D">     
								<h4 class="title" style="text-align: center">식재료 입고 대기 현황</h4>
							</div>
							<div class="card-content table-responsive">
								<table class="tablesStop table">
									<thead class="text-primary">
										<th>식재료명</th>
										<th>주문량</th>
										<th>단위</th>
										<th>총가격</th>
									</thead>
								</table>
								<ul class="paginationSub pagination">
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	
</body>
</html>