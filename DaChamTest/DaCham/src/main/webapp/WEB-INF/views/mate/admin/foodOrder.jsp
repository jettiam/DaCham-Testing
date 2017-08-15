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
	<h2>식재료 추가 주문</h2>
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
	<div class="col-xs-4">   
	<button id="search" class = "btn btn-default">검색</button>
	<button id="searchAll" class = "btn btn-default" data-toggle='modal' href='#myModal'>주문내역서 보기</button>
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
		<h2>식단에 포함된 식재료</h2>
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
					<input type="hidden" id ="orderCode${count}" name="orderCode" value="${j.orderCode}">
					</div>	  		  
				</c:forEach> 
			</c:forEach>
			
		</table>
	</div>
	<button id="foodMOrder" class = "btn btn-default">식재료 주문서 보내기</button>
	</div>
	<form class="foodMOrderForm" action="mailSending" method="post">  
		<input type="hidden" name="foodMOrderInfo" id="foodMOrderInfo">
		<input type="hidden" name="foodMCnt" id="foodMCnt">
	</form>
	<form class="foodMOrderSubForm" action="mailSendingSub" method="post">  
		<input type="hidden" name="cnt" id="cnt">
	</form>
	
	<form id="foodMAppOrderForm" action="AppSending" method="post">  
		<input type="hidden" name="foodMAppOrderInfo" id="foodMAppOrderInfo">
	</form>
	
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">상세보기</h4>
        </div>
        <div class="modal-body">   
		<table class="modalTable table table-condensed">
			<tr>
				<th>식재료코드</th>
				<th>식재료명</th>
				<th>단가</th>
				<th>주문량</th>
				<th>단위</th>
			</tr> 
		</table>
        </div>
        <div class="modal-footer">
        <button id="foodMOrderSub" class = "btn btn-default">추가 식재료 주문서 보내기</button>    
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

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
			$("#foodMOrderSub").on("click", function(){
				 
				if(cnt!=0){
				$(".foodMOrderSubForm").submit();
				}else{
					alert("식재료를 검색하여 주문하여 주세요");
				}
			})
			$("#foodMOrder").on("click", function(){
				
				var foodMOrderInfo = {};
				var y=0;
				if(divlength!=0){
				for(var i =1; i<=divlength; i++){

					var foodMname = $("#foodMName"+i).val();
					var price = $("#price"+i).val();
					var totalAmount = Number($("#totalAmount"+i).val())*0.001;
					var unit = $("#unit"+i).val();
					var orderCode = $("#orderCode"+i).val();
					var foodMCode = $("#foodMCode"+i).val(); 
					 var jsonData ={					
							"foodMName":foodMname,
							"price":price,
							"totalAmount":totalAmount,
							"price":price,
							"unit":unit,
							"orderCode":orderCode,
							"foodMCode":foodMCode
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
				$(".foodMOrderForm").submit();
				}else{
					alert("식단에 따른 식재료 주문입니다. 주문내역에서 식단을 선택하세요");
				}
				

			  
				//alert(content.length);		 
				//alert(content)
			});
							
							all();
						  
							function all(){
								
								
									 var str = "";
									
									$(".foodOrder").remove();
									
									 /* for(var i =1; i<=divlength; i++){
										str += "<tr class='foodOrder'><td>"
										+$("#foodMCode"+i).val()
										+"</td>"+"<td>"
										+$("#foodMName"+i).val()
										+"</td>"+"<td>"
										+$("#price"+i).val()
										+"</td>"+"<td>"
										+(Number($("#totalAmount"+i).val())*0.001).toFixed(3) 
										+"</td>"+"<td>"
										+$("#unit"+i).val()
										+"</td> </tr>" 
									}  */
								 	 var length = ($("input[name='foodMName']").length);
								 	var one = new Array();
								 	var check = 1;
										for(var i=0; i<length; i++){
											var y=0;
											if(i==0){
											one[i] = $("input[name='foodMName']").eq(i).val();
											}else{
												for(var z=0; z<one.length; z++){
													if(one[z]==$("input[name='foodMName']").eq(i).val()){
														y++;
													}
													
												}
												if(y==0){
													one[check] = $("input[name='foodMName']").eq(i).val();
													check++;
												}
													
											}
											
				  
											
										} console.log(one);
										var totalAmountSum = new Array();
										var unit = new Array();
										var price = new Array();
										var foodOrder = new Array();
										var foodMName = new Array();
										var foodMCnt = 0;
								
										for(var i=0; i<one.length; i++){
											console.log($("input[value='"+one[i]+"']"));
											var length = $("input[value='"+one[i]+"']").length
											for(var z=0; z<length; z++){
												console.log($("input[value='"+one[i]+"']").eq(z).next().next().val());
												if(z==0){
												foodMName[i] = $("input[value='"+one[i]+"']").eq(z).val(); 
												totalAmountSum[i] = Number($("input[value='"+one[i]+"']").eq(z).next().next().val())*0.001;   
												unit[i] = $("input[value='"+one[i]+"']").eq(z).next().next().next().val();
												price[i] = $("input[value='"+one[i]+"']").eq(z).next().val(); 
												foodOrder[i] = $("input[value='"+one[i]+"']").eq(z).next().next().next().next().val();
												}else  
												totalAmountSum[i] = Number($("input[value='"+one[i]+"']").eq(z).next().next().val())*0.001+totalAmountSum[i];
				
											}
										}   
										 for(var i =0; i<one.length; i++){
												str += "<tr class='foodOrder'><td data-code='"+foodOrder[i]+"'>"
												+foodOrder[i]
												+"</td>"+"<td data-code='"+one[i]+"'>"
												+one[i]
												+"</td>"+"<td data-code='"+price[i]+"'>"
												+price[i]
												+"</td>"+"<td data-code='"+totalAmountSum[i].toFixed(3)+"'>"
												+totalAmountSum[i].toFixed(3)    
												+"</td>"+"<td data-code='"+unit[i] +"'>"
												+unit[i]   
												+"</td> </tr>"
												
												$(".foodMOrderForm").append("<input type='hidden' value='"+foodOrder[i]+"'"+"name='foodMOrder'>");
												$(".foodMOrderForm").append("<input type='hidden' value='"+one[i]+"'"+"name='foodMName'>");
												$(".foodMOrderForm").append("<input type='hidden' value='"+price[i]+"'"+"name='foodPrice'>");
												$(".foodMOrderForm").append("<input type='hidden' value='"+totalAmountSum[i].toFixed(3)+"'"+"name='totalAmount'>");
												$(".foodMOrderForm").append("<input type='hidden' value='"+unit[i]+"'"+"name='unit'>");
												foodMCnt++;
											}
										 $("#foodMCnt").val(foodMCnt);
										 
										
										
									
									 console.log(totalAmountSum);
									 console.log(unit);
									 console.log(price);
									 console.log(foodOrder);
									console.log(str);
									$(".tables").append(str); 
								
							} 
							
								$("#foodStock").addClass("w3-light-gray");
								
								$("#search").on("click",function(){
									$(".foodStock").remove();
									
									var str=""; 
									var searchType = $(".searchType").val();
									var keyword = $("#keyword").val();
									if(keyword != ""){
									$.getJSON("adminSub/foodMaterial/"+searchType+"/"+keyword,function(data){
									for(var i=0; i<data.length; i++){
										str += "<tr class='foodStock'>"+"<td id='foodMCode' data-code='"+data[i].foodMCode+"'>"+data[i].foodMCode+"</td>"+"<td id='foodMName' data-code='"+data[i].foodMName+"'>"+data[i].foodMName+"</td>"+"<td id='price' data-code='"+data[i].price+"'>"+data[i].price+"</td>"+"<td><input type='text' class='Stock' size='4'></td>"+"<td id='unit' data-code='"+data[i].unit+"'>"+data[i].unit+"</td>"+"<td><button class='orderBtn btn btn-primary'>주문</button></td>"+"</tr>"
										}    
									$(".foodMTable").append(str); 
									});
									}else{
										alert("검색어를 입력하세요");
										
									}
								});
								var cnt=0; 
							 
								$(document.body).on("click", ".orderBtn" ,function(){
									var Stock = $(this).parent().prev().prev().children().val();
									//empty($(this).parent().prev().prev().children());  
									var foodMCode = $(this).parent().prev().prev().prev().prev().prev().attr('data-code');
									var foodMName = $(this).parent().prev().prev().prev().prev().attr('data-code');
									var price = $(this).parent().prev().prev().prev().attr('data-code');
									var unit = $(this).parent().prev().attr('data-code');
				   				    cnt++;  
				   					//alert(cnt);    
									var str="";
										str += "<tr><td>"+foodMCode+"</td>"+"<td>"+foodMName+"</td>"+"<td>"+price+"</td>"+"<td>"+Stock+"</td>"+"<td>"+unit+"</td><tr>";
									$(".modalTable").append(str);
									alert(foodMName+"가 "+Stock+unit+"만큼 추가 주문되었습니다");
									$(".foodMOrderSubForm").append("<input type='hidden' value='"+Stock+"'"+"name='StockAdd'>");
									$(".foodMOrderSubForm").append("<input type='hidden' value='"+foodMCode+"'"+"name='foodMCodeAdd'>");
									$(".foodMOrderSubForm").append("<input type='hidden' value='"+foodMName+"'"+"name='foodMNameAdd'>");
									$(".foodMOrderSubForm").append("<input type='hidden' value='"+price+"'"+"name='priceAdd'>");
									$(".foodMOrderSubForm").append("<input type='hidden' value='"+unit+"'"+"name='unitAdd'>");
									$("#cnt").val(cnt);
									$(this).parent().prev().prev().children().val(""); 
									
								})
								
								
							
						});
	</script>
</body>
</html>