<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://www.w3schools.com/lib/w3.js"></script>


<title>DaCham 마이페이지</title>
<style>
.myPageImg{
	max-width: 160px;
}
.optionView{
	display:none;
}
@media only screen and (max-width: 736px) {
	.myPageImg{
		max-width: 50px;
	}
}
</style>

</head>
<body>
<!-- Sidebar -->
<div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none;z-index:5" id="mySidebar">
  <button class="w3-bar-item w3-button w3-large" onclick="w3_close()">Close &times;</button>
		<a id="myInfo" class="w3-bar-item w3-button myPageBtn" onclick="w3_close()" data-status="0">내 정보</a>
		<a id="myHealth" class="w3-bar-item w3-button myPageBtn" onclick="w3_close()" data-status="1">내 건강정보</a>
		<a id="myCart" class=" w3-bar-item w3-button myPageBtn" onclick="w3_close()" data-status="2">장바구니</a>
		<a id="myOrderlist" class="w3-bar-item w3-button myPageBtn" onclick="w3_close()" data-status="3">주문내역</a>
		<a id="outMember" class="w3-bar-item w3-button" onclick="w3_close()">회원탈퇴</a>
</div>

	<%@include file="../clientNavi.jsp"%>
	
<!-- Page Content -->
<div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>
<button class="w3-button w3-white visible-xs h2" onclick="w3_open()">&#9776; 마이페이지</button>

	<!-- 버튼을 클릭하면 페이지가 전환됨 -->
	<div id="myPageWrap" class="container">		
		<div class="hidden-xs text-center">
		<button id="myInfo" class="btn btn-warning myPageBtn" data-status="0">내 정보</button>
		<button id="myHealth" class="btn btn-warning  myPageBtn" data-status="1">내 건강정보</button>
		<button id="myCart" class="btn btn-warning  myPageBtn" data-status="2">장바구니</button>
		<button id="myOrderlist" class="btn btn-warning  myPageBtn" data-status="3">주문내역</button>
		<button id="outMember" class="btn btn-warning">회원탈퇴</button>
		</div>
		<!-- 마이페이지 -->
		<div id="myInfoTableWrap">
		<h2 class="text-center">내 정보</h2>
		<div class="col-sm-3"></div><div class="col-sm-6 center-block">
			<table id="myInfoTable" class="table table-bordered">
				<tr>
					<td>고객명</td>
					<td><input type="text" name="name" value="${memberName}"
						readonly></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="customerId" name="id"
						value="${sessionScope.customerId}" readonly></td>
				</tr>
				<tr>
					<td>비밀번호 수정</td>
					<td><input type="password" name="passwd" value=""></td>
				</tr>

				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="passwd" value=""></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address"
						value="${sessionScope.address}"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="tel" value="${sessionScope.tel}"></td>
				</tr>
				<tr>
					<td>e-mail</td>
					<td><input type="text" name="email"
						value="${sessionScope.email}"></td>
				</tr>
				<tr>
					<td>회원등급</td>
					<td><input type="text" name="gradeCode"
						value="${sessionScope.gradeCode}" readonly></td>
				</tr>
				<tr>
					<td>가입일</td>
					<td><input type="text" name="joinDate"
						value="${sessionScope.joinDate}" readonly></td>
				</tr>
			</table>
		</div>
		<div class="col-sm-12 text-center">	
			<button class="btn btn-warning  myPageBtn">수정</button>
			</div>	
		</div>

		<!-- 내 건강정보 -->
		<div id="myHealthTableWrap">
		<h2 class="text-center">내 건강정보</h2>
			<table id="myHealthTable">
				<tr>
					<td><canvas id="myChart"></canvas></td>
					<td><h2>${memberName}님의영양정보</h2> 아직 충분한 데이터가 존재하지 않습니다. <br>
						주문을 하면 볼 수 있어요:)<br></td>
				</tr>
			</table>
		</div>

		<!-- 장바구니 -->
		<div id="myCartTableWrap">
			<h2 class="text-center">장바구니</h2>
			<div class="col-sm-1"></div>
			<div class="col-sm-10" style="padding:0px;">
			<table id="myCartTable" class="table text-center">
				<thead>
				<tr>
					<td><input type="checkbox" class="w3-check" id="checkAllCart"></td>
					<td>상품정보</td>
					<td>상품명</td>					
					<td>수량</td>
					<td>상품금액</td>
				</tr>
				</thead>
				<tbody>
				</tbody>
				
			</table>
			</div>
			<div class="col-sm-12 text-center">			
			<button id="cartOrder" class="btn btn-warning">주문하기</button>
			</div>
		</div>
		
		
		
		
		<!-- 주문내역 -->
		<div id="myOrderListTableWrap">
		<h2 class="text-center">주문내역</h2>
		<div class="col-sm-1"></div>
			<div class="col-sm-10" style="padding:0px;">
		<table id="myOrderListTable" class="table table-striped table-bordered text-center">
				<tr>
					<td class="hidden-xs" onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(1)')" style="cursor:pointer">주문번호</td>
					<td onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(2)')" style="cursor:pointer">주문일자</td>
					<td class="hidden-xs" onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(3)')" style="cursor:pointer">상품정보</td>
					<td onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(4)')" style="cursor:pointer">상품명</td>
					<td onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(5)')" style="cursor:pointer">수량</td>
					<td onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(6)')" style="cursor:pointer">상품금액</td>
					<td onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(7)')" style="cursor:pointer">주문현황</td>
				</tr>
			</table>
		</div>
		<!-- 회원탈퇴 -->
		
	</div>




<form id="cartForm" action="cartOrderRegister" method="post">
<input type="hidden" name="cartInfo" id="cartInfo">
</form>
<script>
$(document).ready(function(){
	//각 상태에 따른 출력 0:내정보,1:내건강정보,2:장바구니,3:주문내역	
	var status=${status};
	myPage(status);
	
	function myPage(status){
		status = Number(status);
		switch(status) {
	    case 0:
	    	$('#myInfoTableWrap').show();
	    	$('#myHealthTableWrap').hide();
	    	$('#myCartTableWrap').hide();    	
	    	$('#myOrderListTableWrap').hide();
	        break;
	    case 1:
	    	$('#myInfoTableWrap').hide();
	    	$('#myHealthTableWrap').show();
	    	$('#myCartTableWrap').hide();    	
	    	$('#myOrderListTableWrap').hide();
	        break;
	    case 2:
	    	var id = $("#customerId").val();
	    	  $(".addTr").remove();
			$(".optionAddTr").remove();
			$(".optionView").css("display","");
			$.ajax({
				url:"customerAjax/myCart",
				headers : {
		               "Content-Type" : "application/json",
		               "X-HTTP-Method-Override" : "POST"
		            },
		            dataType : "json",
				data:JSON.stringify({id:id}),
				type:"POST",			
				success:function(data){				
					for(var i = 0; i<data.list.length; i++){ //장바구니의 데이터 테이블로 출력					
						var orderCode = data.list[i].orderCode;				
						$('#myCartTable').append("<tr class='addTr' data-orderCode='"+data.list[i].orderCode+"'><td>"
								+"<input type='checkbox' class='w3-check' name='cartCheck' value='"+data.list[i].dietCode+"' data-orderCode='"+data.list[i].orderCode+"'>"
								+"</td><td><img class='myPageImg img-responsive pull-left' data-img="+data.list[i].dietImg+" src='displayFile?fileName="+data.list[i].dietImg
										+"' alt='이미지'>"
										+"<span data-orderCode='"+data.list[i].orderCode+"' class='optiondown glyphicon glyphicon-chevron-down'>"						
										+"주문상세</span></td><td class='dietName'>"+data.list[i].dietName
										+"</td><td class='dietAmount'>"+data.list[i].dietAmount+"</td><td class='price'><span>"+data.list[i].price+"</span>원"+"</td></tr>");
						var sideDName = "sideDName";
						$.each(data, function(key, value){
							if(key==orderCode){	
								var length = value.length
								$(".addTr[data-orderCode="+orderCode+"]").after(
										"<tr class='optionAddTr'><td class='"+orderCode+"_optionArea optionView' colspan='5'>"
										//새로 열리는 반찬 옵션 창 안의 내용
										+"<h4>"+orderCode+"번 주문 반찬</h4>"
										+"<div class='"+orderCode+"_options' ></div>"
										+"</td></tr>");
								 for(var i=0; i<length; i++){
									$("."+orderCode+"_options").html($("."+orderCode+"_options").html()+"<img src='"+value[i].sideDImg+"'/>"+value[i].sideDName);																		
								}	 						
							}
						})
				}
				}
			});					
			
			
			
	    	$('#myInfoTableWrap').hide();;
	    	$('#myHealthTableWrap').hide();
	    	$('#myCartTableWrap').show();    	
	    	$('#myOrderListTableWrap').hide();
	        break;
	    case 3:
	    	var id = $("#customerId").val();
	    	
			$(".orderTr").remove();
			$.ajax({
				url:"customerAjax/myOrderlist",
				headers : {
		               "Content-Type" : "application/json",
		               "X-HTTP-Method-Override" : "POST"
		            },
		            dataType : "json",
				data:JSON.stringify({id:id}),
				type:"POST",
				
				success:function(data){
					console.log(data);
					var orderStatus="";
					for(var i = 0; i<data.list.length; i++){ //주문내역의 데이터 테이블로 출력
					/* if(data.list[i].orderItemCode==0){
						orderStatus="미결제";				
					}else if(data.list[i].orderItemCode==6){
						orderStatus="주문취소";
					}else if(data.list[i].orderItemCode==7){
						orderStatus="배송중";
					}else if(data.list[i].orderItemCode==8){
						orderStatus="배송완료";
					}else{
						orderStatus="결제완료";
					} */
						$('#myOrderListTable').append("<tr class='orderTr'><td class='orderCode hidden-xs'>"+data.list[i].orderCode+"</td><td class='orderDate'>"+data.list[i].orderDate+"</td><td class='hidden-xs'><img class='img-responsive myPageImg' data-img="+data.list[i].dietImg+" src='displayFile?fileName="+data.list[i].dietImg+"' alt='이미지'></td><td class='dietName'>"+data.list[i].dietName+"</td><td class='dietAmount'>"+data.list[i].dietAmount+"</td><td class='price'><span>"+data.list[i].price+"</span>원"+"</td><td class='oItemCode' data-oItemCode='"+data.list[i].orderItemCode+"'>"+data.list[i].orderListStatus+"</td></tr>");
				}
				}
			});
	    	$('#myInfoTableWrap').hide();
	    	$('#myHealthTableWrap').hide();
	    	$('#myCartTableWrap').hide();    	
	    	$('#myOrderListTableWrap').show();
	        break;   
	    default:
	    	$('#myInfoTableWrap').show();
			$('#myHealthTableWrap').hide();
			$('#myCartTableWrap').hide();    	
			$('#myOrderListTableWrap').hide();
		}
	}
	
	$(".myPageBtn").on("click",function(){
		status = Number($(this).attr("data-status"));
		myPage(status);
		
	});
	//checkbox 설정. 최상위의 체크박스 체크 시 하위 체크박스 전부 선택 혹은 해제시키기
	$('#checkAllCart').change(function(){
		var checkAll = $('#checkAllCart').prop('checked'); //전체 체크박스의 체크여부
		if(checkAll){ //체크박스가 전부 체크되어 있으면 true,아니면 false
			$('input[name="cartCheck"]').prop('checked',true);
		}else{
			$('input[name="cartCheck"]').prop('checked',false);
		}
			});
	$('input[name="cartCheck"]').change(function(){ //리스트 안의 체크박스의 상태가 변할 때
		var cartCheck = true;
		$('input[name="cartCheck"]').each(function(){
			if(cartCheck){ //그 전 체크박스가 체크되어 있을 때
				cartCheck = $(this).prop('checked');
			if(!cartCheck){ //체크되어있지 않을 때
				$('#checkAllCart').prop('checked',false);
			}	
			}
		});	
		if(cartCheck) { //리스트의 체크박스가 모두 체크되어 있을 때 checkAllCart 체크 
			$('#checkAllCart').prop('checked',true);
		}
	});
	
	//장바구니 주문하기
	$("#cartOrder").on("click",function(){		
		var orderCode = $('.addTr:eq(0) input').attr("data-orderCode");
		var dietCode = $('.addTr:eq(0) input').val();
		var dietAmount = $('.addTr:eq(0) .dietAmount').text();
		var price = $('.addTr:eq(0) .price>span').text();
		console.log("주문번호:"+orderCode+" 식단코드:"+dietCode+" 양:"+dietAmount+" 가격:"+price);
		
		var cartOrderInfo = {};
		var y=0;
		for(var i=0; i<$(".addTr").length;i++){
			if($('.addTr:eq('+i+') input').prop('checked')){
				var orderCode = $('.addTr:eq('+i+') input').attr("data-orderCode");
				var dietCode = $('.addTr:eq('+i+') input').val();
				var dietAmount = $('.addTr:eq('+i+') .dietAmount').text();
				var price = $('.addTr:eq('+i+') .price>span').text();
				var dietImg=$('.addTr:eq('+i+') .myPageImg').attr("data-img");
				var dietName=$('.addTr:eq('+i+') .dietName').text();
				var jsonData ={					
						"orderCode":orderCode,
						"dietCode":dietCode,
						"dietAmount":dietAmount,
						"price":price,
						"dietImg":dietImg,
						"dietName":dietName
				}				
				cartOrderInfo[y]=jsonData;
				y++;
			}
		}
		
/* 		var josnText = JSON.stringify(cartOrderInfo);
		var jsonData ={
				"orderInfo":josnText
		}
		console.log(JSON.stringify(jsonData));
		*/
		alert(JSON.stringify(cartOrderInfo));
		$("#cartInfo").val(JSON.stringify(cartOrderInfo));
		$("#cartForm").submit();
	});
	
	$("#myCartTable").on("click", ".optiondown", function(){				
		var orderCode = $(this).attr("data-orderCode");
		$("."+orderCode+"_optionArea").toggle("fast");	
		if($(this).hasClass('glyphicon-chevron-down')){
			$(this).removeClass('glyphicon-chevron-down');
			$(this).addClass('glyphicon-chevron-up');
		}else{
			$(this).removeClass('glyphicon-chevron-up');
			$(this).addClass('glyphicon-chevron-down');			
		}			
				
	});
	
	var ctx = document.getElementById("myChart");
	var myChart = new Chart(ctx, {
	    type: 'pie',
	    data: {
	        labels: [ "탄수화물",
	                  "단백질",
	                  "지방",
	                  "나트륨",
	                  "칼륨",
	                  "칼슘"],
	        datasets: [{
	            label: '# of Votes',
	            data: [400, 90, 55, 10, 15, 20],
	            backgroundColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	        }]
	    },
	    options: {
	/*         scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero:true
	                }
	            }]
	        } */
	           responsive: false,
	           maintainAspectRatio: false
	    }
	});	
});
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}


</script>
</body>
</html>