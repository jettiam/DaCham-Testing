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
<%@include file="../admin/upmenu.jsp"%>
<title>Insert title here</title>
<script>
	var object = new Object();
	var booler = false; 
	 /*디테일뷰 상세보기 css */
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
		
		/*  $("#foodOrder").click(function() {
			 object.value = data;
			 alert(data);
			 var values = JSON.stringify(object);
			     $('input[name=orderCode]').val(values);
			     $("#formid").submit();
		});  */
		//체크박스 된 값의 orderCode값 출력
	 	var y = 0;
		$("#foodOrder").on('click', function(){
			var orderCode="";
			var foodOrderinfo = {};
			for(var i=0; i<$('.orderListTable').length; i++){
			if($('.orderListTable:eq('+i+') input').prop('checked')){   
			orderCode = $('.orderListTable:eq('+i+') input').val();  
			var json ={
					'orderCode':orderCode
			}
			foodOrderinfo[y] = json;
			y++;  
				}
			}
			//alert(JSON.stringify(foodOrderinfo)); 
			$('input[name=orderCode]').val(JSON.stringify(foodOrderinfo));
			$("#formid").submit();
		}); 
		
		$("#close").click(function() {
			$("#read").css("display", "none");
		});

		//주문 전체 리스트
		all();
		function all(){ 
			$.getJSON("adminSub/orderAll",function(data){
				console.log(data); 
				$(".orderListTable").remove();
				var str = "";
				for(var i =0; i<data.length; i++){
					str += "<tr class='orderListTable'><td>"+"<input type='checkBox' id='"+data[i].orderCode+"' value='"+data[i].orderCode+"' name='che'</td>"+"<td class='orderCode'>"+data[i].orderCode+"</td>"+"<td class='id'>"+data[i].id+"</td>"+"<td>"+"<a data-src='"+data[i].orderCode+"' class='dietName'>"+data[i].dietName+"</a> </td>"+"<td class='orderDate'>"+data[i].orderDate+"</td>"+"<td class='price'>"+data[i].price+"</td>"+"<td class='orderItemName'>"+data[i].orderItemName+"</td></tr>"		 
				} 
				console.log(str);
				$(".tables").append(str); 
			});
		}
		//환불 버튼
		$('#refund').click(function() {
			$("input[name=che]:checked").each(function() {
				var test = $(this).val();
				console.log(test);
				
				$.ajax({
					url : 'adminSub/orderList1',
					data : JSON.stringify({
						"orderCode" : test  
				    }),
					dataType : 'text',
					type : 'put',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					}, 
					success : function(data) {
							alert("환불처리 되었습니다");
						all();
					}, error : function(){   
						alert("실패");
					}
				
				});
			});
		});
		//작업요청
		$('#work').click(function() {
			$("input[name=che]:checked").each(function() {
				var test = $(this).val();
				console.log(test);
				
				$.ajax({
					url : 'adminSub/orderList2',
					data : JSON.stringify({
						"orderCode" : test  
				    }),
					dataType : 'text',
					type : 'put',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					}, 
					success : function(data) {
						 
						all();
						
					}, error : function(){   
						alert("실패");
					}

				});
			});
		});
		//검색
	$("#search").on("click",function(){
		$(".orderListTable").remove();
		
		var str=""; 
		var searchType = $(".searchType").val();
		var keyword = $("#keyword").val(); 
		$.getJSON("adminSub/orderList/"+searchType+"/"+keyword,function(data){
		for(var i=0; i<data.length; i++){
			str += "<tr class='orderListTable'><td>"+"<input type='checkBox' id='"+data[i].orderCode+"' value='"+data[i].orderCode+"' name='che'</td>"+"<td>"+data[i].orderCode+"</td>"+"<td>"+data[i].id+"</td>"+"<td>"+"<a data-src='"+data[i].orderCode+"' class='orderCode'>"+data[i].dietName+"</a> </td>"+"<td>"+data[i].orderDate+"</td>"+"<td>"+data[i].price+"</td>"+"<td>"+data[i].orderItemName+"</td>"+"<td>"+data[i].transportNum+"</td> </tr>"
			}  
		$(".tables").append(str); 
		});
	});
	$("#searchAll").on("click", function(){
		all(); 
	});
	//디테일 뷰
	$(document).on("click", ".dietName" , function() {  
			 var orderCode = $(this).attr("data-src");  
			 $.ajax({
				type : "post",
				url : "adminMain4",
				data: { 
					"orderCode" : orderCode,	
			    },
			    dataType:"json",
				success : function(data) {
					console.log(data);  
					$("#orderName").append(data[0].name);
					$("#orderAddRess").append(data[0].address);
					$("#orderPrice").append(data[0].price);
					$("#orderDietName").append(data[0].dietName);
					$("#orderOrderDate").append(data[0].orderDate);
					$("#orderTel").append(data[0].tel);
					$("#read").show();
					$("#read").center(); 
				},
				error : function() {
					alert("실패");
				}
			});
		});
		/* //$("#checkBoxId").is(":checked"))
		if ($(this).attr("checked")) {
			// checked
			return;
		} */

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
	<div class="container">
	<form id='formid' method='post' action='foodOrder'>
		<input type="hidden" name="orderCode">
	</form>
	<!-- <div>
		<a class="font">전체주문|&nbsp;&nbsp;</a> <a class="font">|결제
			대기주문|&nbsp;&nbsp;</a> <a class="font">|결제 완료 주문|&nbsp;&nbsp;</a> <a
			class="font">|배송중 주문|&nbsp;&nbsp;</a> <a class="font">|완료된주문|&nbsp;&nbsp;</a>
		<a class="font">|취소된 주문|&nbsp;&nbsp;</a>
	</div> -->

	<div>
		<div class="form-group row">
		<div class="col-xs-2"> 
			<select name = "searchType" class="searchType form-control">
	   			</option>
	   			<option value = "t"
	   			<c:out value="${order.searchType eq 't'?'selected':'' }"/>>
	   			고객id
	   			</option>
	   			<option value = "c"
	   			<c:out value="${order.searchType eq 'c'?'selected':'' }"/>>
	   			식단명
	   			</option>
	   			<option value = "a"
	   			<c:out value="${order.searchType eq 'a'?'selected':'' }"/>>
	   			진행상태
	   			</option>
			</select> 
		</div>
		<div class="col-xs-3">       
			<input type="text" name = "keyword" id="keyword" class="form-control"> 
		</div>
			<button id = "search" class="btn btn-default">검색</button>
			<button id = "searchAll" class="btn btn-default">전체 검색</button>
	</div>
	<div class="form-group row">  

	<form role="form" method="post">
		<div class="divs" id="a1">
			<table width="600" class="tables table table-condensed">    
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
	<div>
		<button id="foodOrder" class="btn btn-default">식재료 주문</button>
		<button id="work" class="btn btn-default">작업 요청</button>
		<button id="refund" class="btn btn-default">환불</button>
	</div>

	<div id="read" class="read">
		<table width="600" border="1">
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
		<button id="close">닫기</button>
		</div>
		</div>
</body>
</html>