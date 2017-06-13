<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src ="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>

<!DOCTYPE html>
<html>
<head>
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
</style>
</head>
<body>
<%@include file="../clientNavi.jsp" %>

<!-- 버튼을 클릭하면 페이지가 전환됨 -->
<div id="myPageWrap">
<h1>마이페이지</h1><br>
<button id="myInfo">내 정보</button>
<button id="myHealth">내 건강정보</button>
<button id="myCart">장바구니</button>
<button id="myOrderlist">주문내역</button>
<button id="outMember">회원탈퇴</button><br><br>

<!-- 마이페이지 -->
<div id="myInfoTableWrap">
<table id="myInfoTable">
<tr>
<td>고객명</td>
<td><input type="text" name="name" value="${memberName}" readonly></td>
</tr>
<tr><td>아이디</td>
<td><input type="text" name="id" value="${sessionScope.customerId}" readonly></td>
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
<table id="myCartTable">

</table>

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