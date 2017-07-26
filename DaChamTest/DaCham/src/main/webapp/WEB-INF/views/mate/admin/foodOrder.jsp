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
<title>Insert title here</title>

</head>
<body>
<%@include file="../admin/upmenu.jsp"%>
	<div class="container">
	<div class="form-group row">
	<div class="col-xs-2"> 
			<select name="searchType" class= "searchType form-control">
				<option value="t"
					<c:out value="${foodMInven.searchType eq 't'?'selected':'' }"/>>
					식재료명</option>
				<option value="c"
					<c:out value="${foodMInven.searchType eq 'c'?'selected':'' }"/>>
					코드번호</option>    
			</select>
			
			
	</div>
	<div class="col-xs-2"> 
	<input type="text" name="keyword" id = "keyword" class="form-control">
	</div>
	<div class="col-xs-2"> 
	<button id="search" class = "btn btn-default">검색</button>
	<button id="searchAll" class = "btn btn-default">전체</button>
	</div>
	</div>
	<div>
		<table id="foodMTable" class="foodMTable table table-condensed"> 
			<tr>
				<th>코드번호</th>
				<th>식재료명</th>
				<th>단가</th>
				<th>주문량</th>
				<th>단위</th>
				<th>재고량</th>  
			</tr> 
			<%-- <tr>
				<c:forEach items="${invenlist}" var="board" varStatus="status">
					<td class="foodMCode1" data-foodMCode="${board.foodMCode}">${board.foodMICode}&nbsp;&nbsp;&nbsp;</td>
					<td class="foodMName1" data-foodMCode="${board.foodMName}">${board.foodMName}</td>
					<td>${board.dietName}&nbsp;&nbsp;</td>
					<td>${board.price}&nbsp;&nbsp;</a></td>
					<td>${board.unit }&nbsp;&nbsp;</td>
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
					<input type="hidden" id ="totalAmount${count}" name="totalAmount" value="${j.totalAmount}">
					<input type="hidden" id ="unit${count}" name="unit" value="${j.unit}">
					<input type="hidden" id ="foodMCode${count}" name="foodMCode" value="${j.foodMCode}">
					<input type="hidden" id ="orderCode" name="orderCode" value="${j.orderCode}">
					</div>	  		  
				</c:forEach> 
			</c:forEach> 
		</table>
	</div>
	<button id="foodMOrder" class = "btn btn-default">식재료 주문서 보내기</button>
	</div>
	<form id="foodMOrderForm" action="mailSending" method="post">  
		<input type="hidden" name="foodMOrderInfo" id="foodMOrderInfo">
	</form>
	<form id="foodMAppOrderForm" action="AppSending" method="post">  
		<input type="hidden" name="foodMAppOrderInfo" id="foodMAppOrderInfo">
	</form>

	<script>
	var divlength = $(".length .length2").size();
	/* function foodStockall(){
		$.getJSON("adminSub/foodStockAll",function(data){
			console.log(data); 
			$(".foodStock").remove(); 
			var str = "";
			for(var i =0; i<data.length; i++){
				str += "<tr class='foodStock'>"+"<td id='foodMCode' data-code='"+data[i].foodMCode+"'>"+data[i].foodMCode+"</td>"+"<td id='foodMName' data-code='"+data[i].foodMName+"'>"+data[i].foodMName+"</td>"+"<td id='price' data-code='"+data[i].price+"'>"+data[i].price+"</td>"+"<td><input type='text' class='Stock' size='4'></td>"+"<td>"+data[i].unit+"</td>"+"<td><button class='orderBtn btn btn-primary'>주문</button></td>"+"</tr>"		 
			}
			console.log(str);
			$(".foodMTable").append(str); 
		});  
	}  */  
	
	
			
		$(document).ready(function() {
			$("#foodMOrder").on("click", function(){
				
				var foodMOrderInfo = {};
				var y=0;
				for(var i =1; i<=divlength; i++){

					var foodMname = $("#foodMName"+i).val();
					var price = $("#price"+i).val();
					var totalAmount = Number($("#totalAmount"+i).val())*0.001;
					var unit = $("#unit"+i).val();
					 var jsonData ={					
							"foodMname":foodMname,
							"price":price,
							"totalAmount":totalAmount,
							"price":price,
							"unit":unit
					}	
					foodMOrderInfo[y]=jsonData;
					y++; 
					
					//alert(foodMname);
					//alert(price); 
					//alert(foodMAmount);
					//alert(unit);
				}    
				console.log(foodMOrderInfo);   
				$("#foodMOrderInfo").val(JSON.stringify(foodMOrderInfo));
				$("#foodMOrderForm").submit();

			  
				//alert(content.length);		 
				//alert(content)
			});
							/* $(".foodMName1").on("click", function(){
								var a = $(this).siblings()
								alert(a); 
							}); */
							all();
						  
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
										+Number($("#totalAmount"+i).val())*0.001
										+"</td>"+"<td>"
										+$("#unit"+i).val()
										+"</td> </tr>" 
									} 
									console.log(str);
									$(".tables").append(str); 
								
							} 
							
								$("#foodStock").addClass("w3-light-gray");
								
								$("#search").on("click",function(){
									$(".foodStock").remove();
									
									var str=""; 
									var searchType = $(".searchType").val();
									var keyword = $("#keyword").val();
									$.getJSON("adminSub/foodOrder/"+searchType+"/"+keyword,function(data){
									for(var i=0; i<data.length; i++){
										str += "<tr class='foodStock'>"+"<td id='foodMCode' data-code='"+data[i].foodMCode+"'>"+data[i].foodMCode+"</td>"+"<td id='foodMName' data-code='"+data[i].foodMName+"'>"+data[i].foodMName+"</td>"+"<td id='price' data-code='"+data[i].price+"'>"+data[i].price+"</td>"+"<td><input type='text' class='Stock' size='4'></td>"+"<td id='unit' data-code='"+data[i].unit+"'>"+data[i].unit+"</td>"+"<td><button class='orderBtn btn btn-primary'>주문</button></td>"+"</tr>"
										}   
									$(".foodMTable").append(str); 
									});
								});
								
								$(document.body).on("click", ".orderBtn" ,function(){
									var Stock = $(".Stock").val();
									var foodMCode = $("#foodMCode").attr('data-code');
									var foodMName = $("#foodMName").attr('data-code');
									var price = $("#price").attr('data-code');
									var unit = $("#unit").attr('data-code');
									var str="";
										str += "<tr><td>"+foodMCode+"</td>"+"<td>"+foodMName+"</td>"+"<td>"+price+"</td>"+"<td>"+Stock+"</td>"+"<td>"+unit+"</td><tr>";
									$(".tables").append(str);
									alert(foodMName+"가 "+Stock+unit+"만큼 추가 주문되었습니다"); 
									
								})  
							
						});
	</script>
</body>
</html>