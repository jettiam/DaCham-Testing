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
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	<div class="container">
	<div class="form-group row">
	<div class="col-xs-2"> 
			<select class= "searchType form-control">
				<option>코드번호</option>
				<option>식재료명</option>
			</select> 
			
	</div>
	<div class="col-xs-2"> 
	<input type="text" class="form-control">
	</div>
	<div class="col-xs-2"> 
	<button class = "btn btn-default">검색</button>
	</div>
	</div>
	<div>
		<table id="foodMTable" width="600" class="foodMTable table table-condensed">
			<tr>
				<th>코드번호</th>
				<th>식재료명</th>
				<th>단가</th>
				<th>주문량</th>
				<th>단위</th>
			</tr> 
			<%-- <tr>
				<c:forEach items="${invenlist}" var="board" varStatus="status">
					<td class="foodMCode1" data-foodMCode="${board.foodMCode}">${board.foodMICode}&nbsp;&nbsp;&nbsp;</td>
					<td class="foodMName1" data-foodMCode="${board.foodMName}">${board.foodMName}</td>
					<td>${board.dietName}&nbsp;&nbsp;</td>
					<td>${board.price}&nbsp;&nbsp;</a></td>
					<td>${board.uint }&nbsp;&nbsp;</td>
					<td><input type="text">&nbsp;&nbsp;</td>

					<td>${board.outAmount}</td> 
						<td>${board.stock}</td>

				</c:forEach>   
			</tr> --%>
		</table>
	</div>
	
	<div>
		<table id="foodMTable" class="tables table table-condensed"> 
			<tr>
				<th>식재료코드</th>
				<th>식재료명</th>
				<th>단가</th>
				<th>주문량</th>
				<th>단위</th>
			</tr>
		
			<div class="length">
			<c:forEach var="i" items="${map}">  
				<c:forEach var ="j" items="${i.value}">
				<c:set var="count" value="${count + 1}" /> 
					<div class="length2">
					<input type="hidden" id ="foodMName${count}" name="foodMName" value="${j.foodMName}">
					<input type="hidden" id ="price${count}" name="price" value="${j.price}">
					<input type="hidden" id ="foodMAmount${count}" name="foodMAmount" value="${j.foodMAmount}">
					<input type="hidden" id ="unit${count}" name="unit" value="${j.unit}">
					<input type="hidden" id ="foodMCode${count}" name="foodMCode" value="${j.foodMCode}">
					</div>	  		  
				</c:forEach> 
			</c:forEach> 
		</table>
	</div>
	<button id="foodMOrder" class = "btn btn-default">식재료 주문서 보내기</button>
	</div>

	<script>
	var divlength = $(".length .length2").size();
	function foodStockall(){
		$.getJSON("adminSub/foodStockAll",function(data){
			console.log(data); 
			$(".foodStock").remove(); 
			var str = "";
			for(var i =0; i<data.length; i++){
				str += "<tr class='foodStock'>"+"<td>"+data[i].foodMCode+"</td>"+"<td>"+data[i].foodMName+"</td>"+"<td>"+data[i].price+"</td>"+"<td><input type='text' class='Stock' size='4'></td>"+"<td>"+data[i].uint+"</td>"+"<td><button class='btn btn-primary'>주문</button></td>"+"</tr>"		 
			}
			console.log(str);
			$(".foodMTable").append(str); 
		});  
	} 
	
	
			
		$(document)
				.ready(
						function() {
							/* $("#foodMOrder")
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
											}); */
							$(".foodMName1").on("click", function(){
								var a = $(this).siblings()
								alert(a); 
							});
							all();
							foodStockall();
							function all(){
								
								
									var str = "";
									$(".foodOrder").remove();  
									for(var i =1; i<=divlength; i++){
										str += "<tr class='foodOrder'><td>"
										+$("#foodMCode"+i).val()
										+"</td>"+"<td>"
										+$("#foodMName"+i).val()
										+"</td>"+"<td>"
										+$("#price"+i).val()
										+"</td>"+"<td>"
										+$("#foodMAmount"+i).val()
										+"</td>"+"<td>"
										+$("#unit"+i).val()
										+"</td>" 
									} 
									console.log(str);
									$(".tables").append(str); 
								
							} 
						});
	</script>
</body>
</html>