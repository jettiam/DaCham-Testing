<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src ="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#myPageWrap {
	width: 1080px;
	height: 100%;
	margin: 0 auto;
	text-align: center;

}
#myInfoTable{
position: relative;
margin: 0 auto;
width:450px;
}

#myHealthTableWrap{
display:none;

}
#myHealthTable{margin: 0 auto;}
#myChart{

	width: 300px;
	height: 300px;
	font-size:10px;
	position:realative;

}
#myCartTableWrap{
display:none;

}
#myCartTable{
width:800px;
margin: 0 auto;
text-align: center;
}
</style>
<script>
$(document).ready(function(){
	$("#myCart").on("click",function(){ //장바구니 버튼 클릭 시 데이터 받아오기
		var id = $("#customerId").val();
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
				console.log(data);				
				
				//$('#myCartTableWrap').append(data.list[i].dietName+"<br>"+ data.list[i].dietImg+"<br>"+ data.list[i].orderDate+"<br>"+ data.list[i].price+"<br>"+ data.list[i].dietAmount);
// 					var div=document.querySelector('#cartTable');
// 					html = '<table>';
// 					html += '<tr><th><input type="checkbox"></th><th>상품정보</th><th>상품명</th><th>수량</th><th>상품금액</th></tr>';
// 					for(var i=0; data.list.length>i; i++){
// 						 html += '<tr><td>' + '<input type="checkbox">' + '</td><td>' + data.list[i].dietImg
// 		                    + '</td><td> ' + data.list[i].dietName+ '</td><td> ' + data.list[i].dietAmount+ '</td><td> ' + data.list[i].price+ + '</td></tr>';
						
// 					}
// 					 html += '</table>';
				for(var i = 0; i<data.list.length; i++){ //장바구니의 데이터 테이블로 출력
				$('#myCartTable').append("<tr><td>"+"<input type='checkbox' name='cartCheck' value='data.list[i].dietCode'>"+"</td><td><img src='displayFile?fileName="+data.list[i].dietImg+"' alt='이미지'></td><td>"+data.list[i].dietName+"</td><td>"+data.list[i].dietAmount+"</td><td>"+data.list[i].price+"원"+"</td></tr>");


					
			}
			}
		});
	});
});

//checkbox 설정. 최상위의 체크박스 체크 시 하위 체크박스 전부 선택 혹은 해제시키기
$(function(){
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
});
</script>
</head>
<body>
<%@include file="../clientNavi.jsp" %>

<!-- 버튼을 클릭하면 페이지가 전환됨 -->
<div id="myPageWrap">
<h1>마이페이지</h1><br>
<button id="myInfo" class="btn btn-warning">내 정보</button>
<button id="myHealth" class="btn btn-warning" >내 건강정보</button>
<button id="myCart" class="btn btn-warning">장바구니</button>
<button id="myOrderlist" class="btn btn-warning">주문내역</button>
<button id="outMember" class="btn btn-warning">회원탈퇴</button><br><br>

<!-- 마이페이지 -->
<div id="myInfoTableWrap">
<table id="myInfoTable" class="table table-bordered">
<tr>
<td>고객명</td>
<td><input type="text" name="name" value="${memberName}" readonly></td>
</tr>
<tr><td>아이디</td>
<td><input type="text" id="customerId" name="id" value="${sessionScope.customerId}" readonly></td>
</tr>
<tr><td>비밀번호 수정</td>
<td><input type="password" name="passwd" value=""></td></tr>

<tr><td>비밀번호 확인</td><td><input type="password" name="passwd" value=""></td></tr>
<tr><td>주소</td><td><input type="text" name="address" value="${sessionScope.address}"></td></tr>
<tr><td>연락처</td><td><input type="text" name="tel" value="${sessionScope.tel}"></td></tr>
<tr><td>e-mail</td><td><input type="text" name="email" value="${sessionScope.email}"></td></tr>
<tr><td>회원등급</td> <td><input type="text" name="gradeCode" value="${sessionScope.gradeCode}" readonly></td></tr>
<tr><td>가입일</td> <td><input type="text" name="joinDate" value="${sessionScope.joinDate}" readonly></td></tr>
</table>

<br>
<button>수정</button>
</div>

<!-- 내 건강정보 -->
<div id="myHealthTableWrap">
<table id="myHealthTable">
<tr>
<td><canvas id="myChart"></canvas></td>
<td><h2>${memberName}님의 영양정보</h2>
	아직 충분한 데이터가 존재하지 않습니다. <br>
	주문을 하면 볼 수 있어요:)<br>
</td>
</tr>
</table>
</div>

<!-- 장바구니 -->
<div id="myCartTableWrap">
<!-- <table id="myCartTable" border=2> -->

<table id="myCartTable" border=1>
<tr> 
	<td><input type="checkbox" id="checkAllCart"></td>
	<td>상품정보</td>
	<td>상품명</td>
	<td>수량</td>
	<td>상품금액</td>
</tr>
</table>



<!-- </table> -->

</div>
<!-- 주문내역 -->
<!-- 회원탈퇴 -->

</div>
<script>
$('#myInfo').click(function(){
	$('#myHealthTableWrap').hide();
	$('#myCartTableWrap').hide();
	$('#myInfoTableWrap').show();
});
$('#myHealth').click(function(){
	$('#myInfoTableWrap').hide();
	$('#myCartTableWrap').hide();
	$('#myHealthTableWrap').show();
});
$('#myCart').click(function(){
	
	$('#myInfoTableWrap').hide();
	$('#myHealthTableWrap').hide();
	$('#myCartTableWrap').show();
});
</script>

<script>
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
</script>



</body>
</html>