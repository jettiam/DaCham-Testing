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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>



</head>
<style>
.topMar {
	margin-top: 0.1cm;
}
.w3-card-4{
	margin-right: 25px; 
	margin-bottom : 20px;       
}
</style>
<body>
	<%@include file="../admin/upmenu.jsp"%>
	<div class="container">
		<form id='formid' method='post' action='foodOrder'>
			<input type="hidden" name="orderCode">
		</form>
		<div>
			<div class="form-group row">
				<div class="col-xs-2">
					<select name="searchType" class="searchType form-control">
						</option>
						<option value="t"
							<c:out value="${orderList.searchType eq 't'?'selected':'' }"/>>
							고객id</option>
						<option value="c"
							<c:out value="${orderList.searchType eq 'c'?'selected':'' }"/>>
							식단명</option>
						<option value="a"
							<c:out value="${orderList.searchType eq 'a'?'selected':'' }"/>>
							진행상태</option>
					</select>
				</div>
				<div class="col-xs-3">
					<input type="text" name="keyword" id="keyword" class="form-control">
				</div>
				<button id="search" class="btn btn-default">검색</button>
				<button id="searchAll" class="btn btn-default">전체 검색</button>
			</div>

			<div class="w3-container ">    

				<div class="w3-card-4 w3-dark-grey w3-col m2">

					<div class="w3-container w3-center">
						<h4>결제완료</h4>
						<div class="w3-section">
							<p id="str1"></p>
							<button class="active w3-button w3-green w3-center" id="creadt"
								data-code="1">결제완료 정렬</button>
						</div>
					</div>
				</div>
				<div class="w3-card-4 w3-dark-grey w3-col m2">
					<div class="w3-container w3-center">
						<h4>식재료 발주</h4>
						<div class="w3-section">
							<p id="str2"></p>
							<button class="active w3-button w3-green w3-center"
								id="FoodOrder" data-code="2">식재료 발주 정렬</button>
						</div>
					</div>
				</div>
				<div class="w3-card-4 w3-dark-grey w3-col m2">
					<div class="w3-container w3-center">
						<h4>식재료 입고</h4>
						<div class="w3-section">
							<p id="str3">ddd</p>
							<button class="active w3-button w3-green" id="Foodreceiving"
								data-code="3">식재료 입고 정렬</button>
						</div>
					</div>
				</div>
				<div class="w3-card-4 w3-dark-grey w3-col m2">
					<div class="w3-container w3-center">
						<h4>조리대기</h4>
						<div class="w3-section">
							<p id="str4"></p>
							<button class="active w3-button w3-green" id="cook" data-code="4">조리대기
								정렬</button>
						</div>
					</div>
				</div>
				<div class="w3-card-4 w3-dark-grey w3-col m2"> 

					<div class="w3-container w3-center">
						<h4>환불</h4>
						<div class="w3-section">
							<p id="str5"></p>
							<button class="active w3-button w3-green" id="refundSort"
								data-code="5">환불 정렬</button>
						</div>
					</div>

				</div>
			</div>
			<!-- <ul class="nav nav-pills text-right">
					<li role="presentation" class="active"><a class='data'
						data-code='1' href="#" onclick="orderSort1(1);">결제완료 정렬</a></li>
					<li role="presentation" class="active"><a class='data'
						data-code='3' href="#" onclick="orderSort3(1);">식재료 발주 정렬</a></li>
					<li role="presentation" class="active"><a class='data'
						data-code='4' href="#" onclick="orderSort4(1);">식재료 입고 정렬</a></li>
					<li role="presentation" class="active"><a class='data'
						data-code='2' href="#" onclick="orderSort2(1);">조리대기 정렬</a></li>
					<li role="presentation" class="active"><a class='data'
						data-code='5' href="#" onclick="orderSort5(1);">환불 정렬</a></li> -->
			</ul>
		</div>
		<div class="orderItemNameCount"></div>
		<div class="topMar">
			<div class="form-group row">

				<form role="form" method="post">
					<div class="divs" id="a1">
						<table class="tables table table-condensed">
							<tr>
								<th><input type="checkBox" id="allCheck">전체</th>
								<th>주문번호</th>
								<th>고객id</th>
								<th>식단명</th>
								<th>주문 접수일</th>
								<th>금액</th>
								<th>진행상태</th>
							</tr>

						</table>
					</div>
				</form>
				<ul class="pagination1 pagination" position="center">
				</ul>
				
				<ul class="pagination2 pagination" position="center">
				</ul>
				
				<ul class="pagination3 pagination" position="center">
				</ul>
				
				<ul class="pagination4 pagination" position="center">
				</ul>
				
				<ul class="pagination5 pagination" position="center">
				</ul> 
				
				<ul class="pagination6 pagination" position="center">
				</ul>
				<div>
					<button id="foodOrder" class="btn btn-default">식재료 주문</button>
					<button id="work" class="btn btn-default">작업 요청</button>
					<button id="refund" class="btn btn-danger">환불</button>
				</div>


				<div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">×</button>
								<h4 class="modal-title">상세 내역</h4>
							</div>
							<div class="modal-body">
								<table class="table table-bordered">
									<tr>
										<th>고객이름</th>
										<td id="orderName"></td>
										<th>배달주소</th>
										<td id="orderAddRess"></td>
									</tr>
									<tr>
										<th>가격</th>
										<td id="orderPrice"></td>
										<th>식단명</th>
										<td id="orderDietName"></td>
									</tr>
									<tr>
										<th>주문일</th>
										<td id="orderOrderDate"></td>
										<th>전화번호</th>
										<td id="orderTel"></td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>




			</div>
		</div>
</body>
<script>
	

	$(document)
			.ready(
					function() {

						$("#orderList").addClass("w3-light-gray");
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

						//체크박스 된 값의 orderCode값 출력
						var y = 0;
						$("#foodOrder")
								.on(
										'click',
										function() {
											var orderCode = "";
											var foodOrderinfo = {};
											var length = $('.orderListTable input:checked').length;

											var orderCheck = true;
											if (length != 0) {
												for (var i = 0; i < length; i++) {

													var orderItemName = $(
															'.orderListTable input:checked')
															.eq(i).parent()
															.next().next()
															.next().next()
															.next().next()
															.text()
													var orderCodeCheck = $(
															'.orderListTable input:checked')
															.eq(i)

													if (orderItemName == "결제완료") {
														orderCheck = true;

														orderCode = $(
																'.orderListTable:eq('
																		+ i
																		+ ') input')
																.val();
														var json = {
															'orderCode' : orderCode
														}
														foodOrderinfo[y] = json;
														y++;
													} else {
														orderCheck = false;
													}
													if (orderCheck == false) {
														break;
													}

												}
												//alert(JSON.stringify(foodOrderinfo)); 
												if (orderCheck == true) {
													$('input[name=orderCode]')
															.val(
																	JSON
																			.stringify(foodOrderinfo));
													$("#formid").submit();
												} else {
													alert("결제 완료만 식재료 주문이 가능합니다");
												}
											} else {
												alert("식단을 선택하세요");
											}

										});

						$("#close").click(function() {
							$("#read").css("display", "none");
						});

						//주문 전체 리스트

						function fontColor() {
							var length = $('.tables tr').length;
							for (var i = 0; i < length; i++) {
								var font = $(".orderItemName").eq(i).text();
								if (font == "환불") {

									$(".orderItemName").eq(i).css("color",
											"red");
								}
							}
						}

						all(1);
						function all(page) {
							$
									.getJSON(
											"adminSub/orderAll/" + page,
											function(data) {
												console.log(data);
												$(".orderListTable").remove();
												var str = "";
												for (var i = 0; i < data.list.length; i++) {
													str += "<tr class='orderListTable'><td>"
															+ "<input type='checkBox' id='"
															+ data.list[i].orderCode
															+ "' value='"
															+ data.list[i].orderCode
															+ "' name='che'</td>"
															+ "<td class='orderCode'>"
															+ data.list[i].orderCode
															+ "</td>"
															+ "<td class='id'>"
															+ data.list[i].id
															+ "</td>"
															+ "<td>"
															+ "<a data-src='"+data.list[i].orderCode+"' class='dietName' data-toggle='modal' href='#myModal'>"
															+ data.list[i].dietName
															+ "</a> </td>"
															+ "<td class='orderDate'>"
															+ data.list[i].orderDate
															+ "</td>"
															+ "<td class='price'>"
															+ data.list[i].price
															+ "</td>"
															+ "<td class='orderItemName'>"
															+ data.list[i].orderItemName
															+ "</td></tr>"
												}
												console.log(str);
												$(".tables").append(str);
												printPaging(data.criteria);
												fontColor();

											});
						}
						var readyCook = 0; //조리대기
						var ReadyFood = 0; //식재료 발주
						var StartFood = 0; //식재료 입고
						var Creadit = 0; //결제완료
						var refund = 0; //환불
						function orderAllCountTd() {
							$
									.getJSON(
											"adminSub/orderAllCountTd",
											function(data) {

												$("#str1").empty();
												$("#str2").empty();
												$("#str3").empty();
												$("#str4").empty();
												$("#str5").empty();
												for (var i = 0; i < data.length; i++) {
													if (data[i].orderItemName == "조리 대기") {
														readyCook++;
														console.log("조리대기 "+readyCook);
													} else if (data[i].orderItemName == "식재료발주") {
														ReadyFood++;
													} else if (data[i].orderItemName == "식재료 입고") {
														StartFood++;
													} else if (data[i].orderItemName == "결제완료") {
														Creadit++
													} else {
														refund++
													}

												}
												str1 = "<p id='str1'>"
														+ Creadit + "건</p>"
												str2 = "<p id='str2'>"
														+ ReadyFood + "건</p>"
												str3 = "<p id='str3'>"
														+ readyCook + "건</p>"
												str4 = "<p id='str4'>"
														+ StartFood + "건</p>"
												str5 = "<p id='str5'>" + refund
														+ "건</p>"

												$("#str1").append(str1);
												$("#str2").append(str2);
												$("#str4").append(str3);  
												$("#str3").append(str4);
												$("#str5").append(str5);

											});
						}
						orderAllCountTd()

						//환불 버튼  
						$('#refund')
								.click(
										function() {
											var length = $('.orderListTable input:checked').length;

											if (length != 0) {
												$("input[name=che]:checked")
														.each(
																function() {
																	var test = $(
																			this)
																			.val();

																	var orderItemName = $(
																			this)
																			.parent()
																			.next()
																			.next()
																			.next()
																			.next()
																			.next()
																			.next()
																			.text();
																	var length = $('.orderListTable input:checked').length;

																	console
																			.log(test);
																	if (orderItemName == "결제완료") {

																		$
																				.ajax({
																					url : 'adminSub/orderList1',
																					data : JSON
																							.stringify({
																								"orderCode" : test
																							}),
																					dataType : 'text',
																					type : 'put',
																					headers : {
																						"Content-Type" : "application/json",
																						"X-HTTP-Method-Override" : "PUT"
																					},
																					success : function(
																							data) {

																						alert("환불처리 되었습니다");
																						all(1);
																						
																					},
																					error : function() {
																						alert("실패");
																					}

																				});
																	} else {
																		alert("결제완료 상태이여만 환불처리 됩니다.")
																	}

																});
											} else {
												alert("식단을 선택하세요");
											}
											orderAllCountTd()
										});
						//작업요청
						$('#work')
								.click(
										function() {
											var length = $('.orderListTable input:checked').length;
											if (length != 0) {

												$("input[name=che]:checked")
														.each(
																function() {
																	var orderCode = $(
																			this)
																			.val();
																	var orderItemName = $(
																			this)
																			.parent()
																			.next()
																			.next()
																			.next()
																			.next()
																			.next()
																			.next()
																			.text();
																	if (orderItemName == "식재료 입고") {
																		console
																				.log(orderCode);

																		$
																				.ajax({
																					url : 'adminSub/orderList2',
																					data : JSON
																							.stringify({
																								"orderCode" : orderCode
																							}),
																					dataType : 'text',
																					type : 'put',
																					headers : {
																						"Content-Type" : "application/json",
																						"X-HTTP-Method-Override" : "PUT"
																					},
																					success : function(
																							data) {

																						all(1);
																						

																					},
																					error : function() {
																						alert("실패");
																					}

																				});
																	} else {
																		alert("식재료 입고 상태여야만 작업요청을 할 수 있습니다.")
																	}
																});
											} else {
												alert("식단을 선택하세요");
											}
											orderAllCountTd()
										});
						//검색
						$("#search")
								.on(
										"click",
										function() {
											$(".orderListTable").remove();

											var str = "";
											var searchType = $(".searchType")
													.val();
											var keyword = $("#keyword").val();
											if (keyword != "") {
												$
														.getJSON(
																"adminSub/orderList/"
																		+ searchType
																		+ "/"
																		+ keyword,
																function(data) {
																	for (var i = 0; i < data.length; i++) {
																		str += "<tr class='orderListTable'><td>"
																				+ "<input type='checkBox' id='"
																				+ data[i].orderCode
																				+ "' value='"
																				+ data[i].orderCode
																				+ "' name='che'</td>"
																				+ "<td>"
																				+ data[i].orderCode
																				+ "</td>"
																				+ "<td>"
																				+ data[i].id
																				+ "</td>"
																				+ "<td>"
																				+ "<a data-src='"+data[i].orderCode+"' class='orderCode'>"
																				+ data[i].dietName
																				+ "</a> </td>"
																				+ "<td>"
																				+ data[i].orderDate
																				+ "</td>"
																				+ "<td>"
																				+ data[i].price
																				+ "</td>"
																				+ "<td>"
																				+ data[i].orderItemName
																				+ "</td> </tr>"
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
						//디테일 뷰
						$(document).on(
								"click",
								".dietName",
								function() {
									var orderCode = $(this).attr("data-src");
									$("#orderName").empty();
									$("#orderAddRess").empty();
									$("#orderPrice").empty();
									$("#orderDietName").empty();
									$("#orderOrderDate").empty();
									$("#orderTel").empty();
									$.ajax({
										type : "post",
										url : "adminMain4",
										data : {
											"orderCode" : orderCode,
										},
										dataType : "json",
										success : function(data) {
											console.log(data);
											$("#orderName")
													.append(data[0].name);
											$("#orderAddRess").append(
													data[0].address);
											$("#orderPrice").append(
													data[0].price);
											$("#orderDietName").append(
													data[0].dietName);
											$("#orderOrderDate").append(
													data[0].orderDate);
											$("#orderTel").append(data[0].tel);
										},
										error : function() {
											alert("실패");
										}
									});
								});
						//페이지 네이션
						function printPaging(criteria) {
							var str = "";

							if (criteria.prev) {
								str += "<li><a href=''"
										+ (criteria.startPage - 1) + "'>'"
										+ "<<" + "</a></li>";
							}
							for (var i = criteria.startPage; i <= criteria.endPage; i++) {
								var strClass = criteria.page == i ? "class = 'active'"
										: "";
								str += "<li "+strClass+"><a href ='"+i+"'>" + i
										+ "</a></li>";
							}
							if (criteria.next) {
								str += "<li><a href=''"
										+ (criteria.endPage + 1) + "'>'" + ">>"
										+ "</a></li>";
							}
							$(".pagination1").html(str);   
						}

						var currentPage = 1;
						$(".pagination1").on("click", "li a", function() {
							event.preventDefault();
							var replyPage = $(this).attr("href");
							all(replyPage);
						});
						
						
						var object = new Object();
						var booler = false;
						var sortCount;

						function orderSort1(page) {

							$(".pagination1 li").empty();    
							$(".pagination3 li").remove();
							$(".pagination4 li").remove();
							$(".pagination5 li").remove();
							$(".pagination6 li").remove();            
							sortCount = 1
							$
									.getJSON(
											"adminSub/orderSort1/" + page,
											function(data) {

												console.log(data);
												$(".orderListTable").remove();
												var str = "";
												for (var i = 0; i < data.list.length; i++) {
													str += "<tr class='orderListTable'><td>"
															+ "<input type='checkBox' id='"
															+ data.list[i].orderCode
															+ "' value='"
															+ data.list[i].orderCode
															+ "' name='che'</td>"
															+ "<td class='orderCode'>"
															+ data.list[i].orderCode
															+ "</td>"
															+ "<td class='id'>"
															+ data.list[i].id
															+ "</td>"
															+ "<td>"
															+ "<a data-src='"+data.list[i].orderCode+"' class='dietName' data-toggle='modal' href='#myModal'>"
															+ data.list[i].dietName
															+ "</a> </td>"
															+ "<td class='orderDate'>"
															+ data.list[i].orderDate
															+ "</td>"
															+ "<td class='price'>"
															+ data.list[i].price
															+ "</td>"
															+ "<td class='orderItemName'>"
															+ data.list[i].orderItemName
															+ "</td></tr>"
												}
												console.log(str);
												$(".tables").append(str);
												printPaging2(data.criteria);  
												fontColor1()
											});
						}
						function orderSort2(page) {
							$(".pagination1 li").remove();
							$(".pagination2 li").remove();
							$(".pagination4 li").remove();
							$(".pagination5 li").remove();
							$(".pagination6 li").remove();
							
							sortCount = 2;
							$
									.getJSON(
											"adminSub/orderSort2/" + page,
											function(data) {
												console.log(data);
												$(".orderListTable").remove();
												var str = "";
												for (var i = 0; i < data.list.length; i++) {
													str += "<tr class='orderListTable'><td>"
															+ "<input type='checkBox' id='"
															+ data.list[i].orderCode
															+ "' value='"
															+ data.list[i].orderCode
															+ "' name='che'</td>"
															+ "<td class='orderCode'>"
															+ data.list[i].orderCode
															+ "</td>"
															+ "<td class='id'>"
															+ data.list[i].id
															+ "</td>"
															+ "<td>"
															+ "<a data-src='"+data.list[i].orderCode+"' class='dietName' data-toggle='modal' href='#myModal'>"
															+ data.list[i].dietName
															+ "</a> </td>"
															+ "<td class='orderDate'>"
															+ data.list[i].orderDate
															+ "</td>"
															+ "<td class='price'>"
															+ data.list[i].price
															+ "</td>"
															+ "<td class='orderItemName'>"
															+ data.list[i].orderItemName
															+ "</td></tr>"
												}
												console.log(str);
												$(".tables").append(str);
												printPaging3(data.criteria);
												fontColor1()  
											});
						}
						function orderSort3(page) {
							$(".pagination1 li").remove();
							$(".pagination2 li").remove();
							$(".pagination3 li").remove(); 
							$(".pagination5 li").remove();
							$(".pagination6 li").remove();
							sortCount = 3
							$
									.getJSON(
											"adminSub/orderSort3/" + page,
											function(data) {
												console.log(data);
												$(".orderListTable").remove();
												var str = "";
												for (var i = 0; i < data.list.length; i++) {
													str += "<tr class='orderListTable'><td>"
															+ "<input type='checkBox' id='"
															+ data.list[i].orderCode
															+ "' value='"
															+ data.list[i].orderCode
															+ "' name='che'</td>"
															+ "<td class='orderCode'>"
															+ data.list[i].orderCode
															+ "</td>"
															+ "<td class='id'>"
															+ data.list[i].id
															+ "</td>"
															+ "<td>"
															+ "<a data-src='"+data.list[i].orderCode+"' class='dietName' data-toggle='modal' href='#myModal'>"
															+ data.list[i].dietName
															+ "</a> </td>"
															+ "<td class='orderDate'>"
															+ data.list[i].orderDate
															+ "</td>"
															+ "<td class='price'>"
															+ data.list[i].price
															+ "</td>"
															+ "<td class='orderItemName'>"
															+ data.list[i].orderItemName
															+ "</td></tr>"
												}
												console.log(str);
												$(".tables").append(str);
												printPaging4(data.criteria);
												fontColor1()
											});
						}
						function orderSort4(page) {
							$(".pagination1 li").remove();
							$(".pagination2 li").remove();
							$(".pagination3 li").remove(); 
							$(".pagination4 li").remove(); 
							$(".pagination6 li").remove();
							sortCount = 4;
							$
									.getJSON(
											"adminSub/orderSort4/" + page,
											function(data) {
												console.log(data);
												$(".orderListTable").remove();
												var str = "";
												for (var i = 0; i < data.list.length; i++) {
													str += "<tr class='orderListTable'><td>"
															+ "<input type='checkBox' id='"
															+ data.list[i].orderCode
															+ "' value='"
															+ data.list[i].orderCode
															+ "' name='che'</td>"
															+ "<td class='orderCode'>"
															+ data.list[i].orderCode
															+ "</td>"
															+ "<td class='id'>"
															+ data.list[i].id
															+ "</td>"
															+ "<td>"
															+ "<a data-src='"+data.list[i].orderCode+"' class='dietName' data-toggle='modal' href='#myModal'>"
															+ data.list[i].dietName
															+ "</a> </td>"
															+ "<td class='orderDate'>"
															+ data.list[i].orderDate
															+ "</td>"
															+ "<td class='price'>"
															+ data.list[i].price
															+ "</td>"
															+ "<td class='orderItemName'>"
															+ data.list[i].orderItemName
															+ "</td></tr>"
												}
												console.log(str);
												$(".tables").append(str);
												printPaging5(data.criteria);     
												fontColor1()
											});
						}

						function orderSort5(page) {
							$(".pagination1 li").remove();
							$(".pagination2 li").remove();
							$(".pagination3 li").remove(); 
							$(".pagination4 li").remove(); 
							$(".pagination5 li").remove(); 
							sortCount = 5;
							$
									.getJSON(
											"adminSub/orderSort5/" + page,
											function(data) {
												console.log(data);
												$(".orderListTable").remove();
												var str = "";
												for (var i = 0; i < data.list.length; i++) {
													str += "<tr class='orderListTable'><td>"
															+ "<input type='checkBox' id='"
															+ data.list[i].orderCode
															+ "' value='"
															+ data.list[i].orderCode
															+ "' name='che'</td>"
															+ "<td class='orderCode'>"
															+ data.list[i].orderCode
															+ "</td>"
															+ "<td class='id'>"
															+ data.list[i].id
															+ "</td>"
															+ "<td>"
															+ "<a data-src='"+data.list[i].orderCode+"' class='dietName' data-toggle='modal' href='#myModal'>"
															+ data.list[i].dietName
															+ "</a> </td>"
															+ "<td class='orderDate'>"
															+ data.list[i].orderDate
															+ "</td>"
															+ "<td class='price'>"
															+ data.list[i].price
															+ "</td>"
															+ "<td class='orderItemName'>"
															+ data.list[i].orderItemName
															+ "</td></tr>"
												}
												console.log(str);
												$(".tables").append(str);
												printPaging6(data.criteria);   
												fontColor1()   
											});
						}

						function printPaging2(criteria) {
							var str = "";

							if (criteria.prev) {
								str += "<li><a href=''" + (criteria.startPage - 1) + "'>'" + "<<"
										+ "</a></li>";
							}
							for (var i = criteria.startPage; i <= criteria.endPage; i++) {
								var strClass = criteria.page == i ? "class = 'active'" : "";
								str += "<li "+strClass+"><a href ='"+i+"'>" + i + "</a></li>";
							}
							if (criteria.next) {
								str += "<li><a href=''" + (criteria.endPage + 1) + "'>'" + ">>"
										+ "</a></li>";
							}
							$(".pagination2").html(str);   
						}
						function fontColor1() {
							var length = $('.tables tr').length;
							for (var i = 0; i < length; i++) {
								var font = $(".orderItemName").eq(i).text();
								if (font == "환불") {

									$(".orderItemName").eq(i).css("color", "red");
								}
							}
						}

						$(".pagination2").on("click", "li a", function() { 
							event.preventDefault();
							var replyPage = $(this).attr("href");
							orderSort1(replyPage);
							

						});
						
						function printPaging3(criteria) {    
							var str = "";

							if (criteria.prev) {
								str += "<li><a href=''" + (criteria.startPage - 1) + "'>'" + "<<"
										+ "</a></li>";
							}
							for (var i = criteria.startPage; i <= criteria.endPage; i++) {
								var strClass = criteria.page == i ? "class = 'active'" : "";
								str += "<li "+strClass+"><a href ='"+i+"'>" + i + "</a></li>";
							}
							if (criteria.next) {
								str += "<li><a href=''" + (criteria.endPage + 1) + "'>'" + ">>"
										+ "</a></li>";
							}
							$(".pagination3").html(str);   
						}
						
						$(".pagination3").on("click", "li a", function() { 
							event.preventDefault();
							var replyPage = $(this).attr("href");
							orderSort2(replyPage);  
							

						});
						
						function printPaging4(criteria) {    
							var str = "";

							if (criteria.prev) {
								str += "<li><a href=''" + (criteria.startPage - 1) + "'>'" + "<<"
										+ "</a></li>";
							}
							for (var i = criteria.startPage; i <= criteria.endPage; i++) {
								var strClass = criteria.page == i ? "class = 'active'" : "";
								str += "<li "+strClass+"><a href ='"+i+"'>" + i + "</a></li>";
							}
							if (criteria.next) {
								str += "<li><a href=''" + (criteria.endPage + 1) + "'>'" + ">>"
										+ "</a></li>";
							}
							$(".pagination4").html(str);   
						}
						
						$(".pagination4").on("click", "li a", function() { 
							event.preventDefault();
							var replyPage = $(this).attr("href");
							orderSort3(replyPage);  
							

						});
						
						function printPaging5(criteria) {    
							var str = "";

							if (criteria.prev) {
								str += "<li><a href=''" + (criteria.startPage - 1) + "'>'" + "<<"
										+ "</a></li>";
							}
							for (var i = criteria.startPage; i <= criteria.endPage; i++) {
								var strClass = criteria.page == i ? "class = 'active'" : "";
								str += "<li "+strClass+"><a href ='"+i+"'>" + i + "</a></li>";
							}
							if (criteria.next) {
								str += "<li><a href=''" + (criteria.endPage + 1) + "'>'" + ">>"
										+ "</a></li>";
							}
							$(".pagination5").html(str);    
						}
						
						$(".pagination5").on("click", "li a", function() { 
							event.preventDefault();
							var replyPage = $(this).attr("href"); 
							orderSort4(replyPage);  
							

						});
						
						function printPaging6(criteria) {    
							var str = "";

							if (criteria.prev) {
								str += "<li><a href=''" + (criteria.startPage - 1) + "'>'" + "<<"
										+ "</a></li>";
							}
							for (var i = criteria.startPage; i <= criteria.endPage; i++) {
								var strClass = criteria.page == i ? "class = 'active'" : "";
								str += "<li "+strClass+"><a href ='"+i+"'>" + i + "</a></li>";
							}
							if (criteria.next) {
								str += "<li><a href=''" + (criteria.endPage + 1) + "'>'" + ">>"
										+ "</a></li>";
							}
							$(".pagination6").html(str);    
						}
						
						$(".pagination6").on("click", "li a", function() { 
							event.preventDefault(); 
							var replyPage = $(this).attr("href"); 
							orderSort5(replyPage);  
							

						});

						$("#creadt").click(function() {
							orderSort1(1);
						});
						$("#FoodOrder").click(function() {
							orderSort3(1);
						})
						$("#Foodreceiving").click(function() {
							orderSort4(1);
						})
						$("#cook").click(function() {
							orderSort2(1);
						})
						$("#refundSort").click(function() {
							orderSort5(1);
						})  

					});
</script>
</html> 