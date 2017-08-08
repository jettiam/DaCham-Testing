<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>Insert title here</title>
<script>
function disease1(){
	$
	.getJSON(
			"adminSub/disease1",
			function(data) {
				console.log(data);
				$(".dietAll").remove();
				var str = "";
				for (var i = 0; i < data.length; i++) {
					if (data[i].spDietItem == 0) {
						data[i].spDietItem = "특별식단"
					} else if (data[i].spDietItem == 1) {
						data[i].spDietItem = "판매중"
					} else {
						data[i].spDietItem = "판매중지"
					}
					str += "<tr class='dietAll'>"
							+ "<td><input type='checkBox' name='dietCode' value='"+data[i].dietCode+"'></td>"
							+ "<td>"
							+ data[i].dietName
							+ "</td>"
							+ "<td><input type='text' value='" + data[i].price + "'>"
							+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data[i].dietCode+"'>가격수정</button>"
							+ "</td>"
							+ "<td>"
							+ data[i].diseaseName
							+ "</td><td>"
							+ data[i].spDietItem
							+ "</tr>"
				}
				console.log(str);
				$(".tables").append(str);
				$(".pagination").empty();
			});
}
function disease2(){
	$
	.getJSON(
			"adminSub/disease2",
			function(data) {
				console.log(data);
				$(".dietAll").remove();
				var str = "";
				for (var i = 0; i < data.length; i++) {
					if (data[i].spDietItem == 0) {
						data[i].spDietItem = "특별식단"
					} else if (data[i].spDietItem == 1) {
						data[i].spDietItem = "판매중"
					} else {
						data[i].spDietItem = "판매중지"
					}
					str += "<tr class='dietAll'>"
							+ "<td><input type='checkBox' name='dietCode' value='"+data[i].dietCode+"'></td>"
							+ "<td>"
							+ data[i].dietName
							+ "</td>"
							+ "<td><input type='text' value='" + data[i].price + "'>"
							+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data[i].dietCode+"'>가격수정</button>"
							+ "</td>"
							+ "<td>"
							+ data[i].diseaseName
							+ "</td><td>"
							+ data[i].spDietItem
							+ "</tr>"
				}
				console.log(str);
				$(".tables").append(str);
				$(".pagination").empty();
			});
}  
function disease3(){
	$
	.getJSON(
			"adminSub/disease3",
			function(data) {
				console.log(data);
				$(".dietAll").remove();
				var str = "";
				for (var i = 0; i < data.length; i++) {
					if (data[i].spDietItem == 0) {
						data[i].spDietItem = "특별식단"
					} else if (data[i].spDietItem == 1) {
						data[i].spDietItem = "판매중"
					} else {
						data[i].spDietItem = "판매중지"
					}
					str += "<tr class='dietAll'>"
							+ "<td><input type='checkBox' name='dietCode' value='"+data[i].dietCode+"'></td>"
							+ "<td>"
							+ data[i].dietName
							+ "</td>"
							+ "<td><input type='text' value='" + data[i].price + "'>"
							+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data[i].dietCode+"'>가격수정</button>"
							+ "</td>"
							+ "<td>"
							+ data[i].diseaseName
							+ "</td><td>"
							+ data[i].spDietItem
							+ "</tr>"
				}
				console.log(str);
				$(".tables").append(str);
				$(".pagination").empty();
			});
}
function disease4(){
	$
	.getJSON(
			"adminSub/disease4",
			function(data) {
				console.log(data);
				$(".dietAll").remove();
				var str = "";
				for (var i = 0; i < data.length; i++) {
					if (data[i].spDietItem == 0) {
						data[i].spDietItem = "특별식단"
					} else if (data[i].spDietItem == 1) {
						data[i].spDietItem = "판매중"
					} else {
						data[i].spDietItem = "판매중지"
					}
					str += "<tr class='dietAll'>"
							+ "<td><input type='checkBox' name='dietCode' value='"+data[i].dietCode+"'></td>"
							+ "<td>"
							+ data[i].dietName
							+ "</td>"
							+ "<td><input type='text' value='" + data[i].price + "'>"
							+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data[i].dietCode+"'>가격수정</button>"
							+ "</td>"
							+ "<td>"
							+ data[i].diseaseName
							+ "</td><td>"
							+ data[i].spDietItem
							+ "</tr>"
				}
				console.log(str);
				$(".tables").append(str);
				$(".pagination").empty();
			});
}

	$(document)
			.ready(
					function() {
						$("#dietManagement").addClass("w3-light-gray");
						function all(page) {
							$
									.getJSON(
											"adminSub/dietAll/"+page,
											function(data) {
												console.log(data);
												$(".dietAll").remove();
												var str = "";
												for (var i = 0; i < data.list.length; i++) {
													if (data.list[i].spDietItem == 0) {
														data.list[i].spDietItem = "특별식단"
													} else if (data.list[i].spDietItem == 1) {
														data.list[i].spDietItem = "판매중"
													} else {
														data.list[i].spDietItem = "판매중지"
													}
													str += "<tr class='dietAll'>"
															+ "<td><input type='checkBox' name='dietCode' value='"+data.list[i].dietCode+"'></td>"
															+ "<td>"
															+ data.list[i].dietName
															+ "</td>"
															+ "<td><input type='text' value='" + data.list[i].price + "'>"
															+ "&nbsp&nbsp<button class='priceUpdate btn btn-default' data-price='"+data.list[i].dietCode+"'>가격수정</button>"
															+ "</td>"
															+ "<td>"
															+ data.list[i].diseaseName
															+ "</td><td>"
															+ data.list[i].spDietItem
															+ "</tr>"
												}
												console.log(str);
												$(".tables").append(str);
												printPaging(data.criteria);    
											});
						}
						all(1)
						$(".tables").on('click', '.priceUpdate', function() {
							//alert($(this).prev().val());
							var price = $(this).prev().val();
							var dietCode = ($(this).attr('data-price'));
							$.ajax({
								url : 'adminSub/priceUp',
								data : JSON.stringify({
									'price' : price,
									'dietCode' : dietCode
								}),
								dataType : 'text',
								type : 'put',
								headers : {
									"Content-Type" : "application/json",
									"X-HTTP-Method-Override" : "PUT"
								},
								success : function(data) {
									alert("가격수정되었습니다");
									all();
								},
								error : function() {
									alert("실패");
								}

							});
						});
						$("#dietSell")
								.on(
										'click',
										function() {
											var dietCode = "";
											for (var i = 0; i < $('.dietAll').length; i++) {
												if ($(
														'.dietAll:eq(' + i
																+ ') input')
														.prop('checked')) {
													dietCode = $(
															'.dietAll:eq(' + i
																	+ ') input')
															.val();
													alert(dietCode);
													$("#dietSellForm")
															.append(
																	'<input type="hidden" value= "'+dietCode+'" name="dietCode">');
												}
											}
											//alert(JSON.stringify(dietinfo));   
											$("#dietSellForm").submit();
										});

						$("#dietSellStop")
								.on(
										'click',
										function() {
											var dietCode = "";
											for (var i = 0; i < $('.dietAll').length; i++) {
												if ($(
														'.dietAll:eq(' + i
																+ ') input')
														.prop('checked')) {
													dietCode = $(
															'.dietAll:eq(' + i
																	+ ') input')
															.val();
													alert(dietCode);
													$("#dietSellStopForm")
															.append(
																	'<input type="hidden" value= "'+dietCode+'" name="dietCode">');
												}
											}
											//alert(JSON.stringify(dietinfo));   
											$("#dietSellStopForm").submit();
										});
						
						
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
							$(".pagination").html(str);
						}  

						var currentPage = 1;
						$(".pagination").on("click", "li a", function() {
							event.preventDefault();
							var replyPage = $(this).attr("href");
							all(replyPage);
						});   

				
						
						

					});
</script>
</head>
<style>
.topMar{
	margin-top: 0.1cm;
}
</style>
<body>
	<%@include file="../admin/upmenu.jsp"%>
	<div class="container"> 
	
		<div  class="col-sm-offset-8">  
		<ul class="nav nav-pills">    
			<li role="presentation" class="active"><a href="#" onclick="disease1();">당뇨</a></li>
			<li role="presentation" class="active"><a href="#" onclick="disease2();">고지혈증</a></li>
			<li role="presentation" class="active"><a href="#" onclick="disease3();">심부전증</a></li>
			<li role="presentation" class="active"><a href="#" onclick="disease4();">신부전증</a></li> 
		</ul>
		</div>
		<div class="topMar">
			<table class="tables table table-condensed" width="600">
				<tr>
					<th>선택</th>
					<th>식단명</th>
					<th>금액</th>
					<th>질환명</th>
					<th>상태</th>
				</tr>
			</table>
			<ul class="pagination" position="center">
					</ul>
		</div>
		<div class="col-sm-offset-10">
			<button id="dietSell" class="btn btn-default">판매</button>
			<button id="dietSellStop" class="btn btn-default">판매중지</button>
		</div>
	</div>
	<div>
		<form id='dietSellForm' method='GET' action='dietSell'></form>
		<form id='dietSellStopForm' method='GET' action='dietSellStop'>
		</form>
	</div>
</body>
</html>