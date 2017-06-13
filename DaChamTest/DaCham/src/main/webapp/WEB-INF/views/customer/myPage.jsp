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

<!-- ��ư�� Ŭ���ϸ� �������� ��ȯ�� -->
<div id="myPageWrap">
<h1>����������</h1><br>
<button id="myInfo">�� ����</button>
<button id="myHealth">�� �ǰ�����</button>
<button id="myCart">��ٱ���</button>
<button id="myOrderlist">�ֹ�����</button>
<button id="outMember">ȸ��Ż��</button><br><br>

<!-- ���������� -->
<div id="myInfoTableWrap">
<table id="myInfoTable">
<tr>
<td>����</td>
<td><input type="text" name="name" value="${memberName}" readonly></td>
</tr>
<tr><td>���̵�</td>
<td><input type="text" name="id" value="${sessionScope.customerId}" readonly></td>
</tr>
<tr><td>��й�ȣ ����</td>
<td><input type="password" name="passwd" value=""></td></tr>

<tr><td>��й�ȣ Ȯ��</td><td><input type="password" name="passwd" value=""></td></tr>
<tr><td>�ּ�</td><td><input type="text" name="address" value="${sessionScope.address}"></td></tr>
<tr><td>����ó</td><td><input type="text" name="tel" value="${sessionScope.tel}"></td></tr>
<tr><td>e-mail</td><td><input type="text" name="email" value="${sessionScope.email}"></td></tr>
<tr><td>ȸ�����</td> <td><input type="text" name="gradeCode" value="${sessionScope.gradeCode}" readonly></td></tr>
<tr><td>������</td> <td><input type="text" name="joinDate" value="${sessionScope.joinDate}" readonly></td></tr>
</table>

<br>
<button>����</button>
</div>

<!-- �� �ǰ����� -->
<div id="myHealthTableWrap">
<table id="myHealthTable">
<tr>
<td><canvas id="myChart"></canvas></td>
<td><h2>${memberName}���� ��������</h2>
	���� ����� �����Ͱ� �������� �ʽ��ϴ�. <br>
	�ֹ��� �ϸ� �� �� �־��:)<br>
</td>
</tr>
</table>
</div>

<!-- ��ٱ��� -->
<div id="myCartTableWrap">
<table id="myCartTable">

</table>

</div>
<!-- �ֹ����� -->
<!-- ȸ��Ż�� -->

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
        labels: [ "ź��ȭ��",
                  "�ܹ���",
                  "����",
                  "��Ʈ��",
                  "Į��",
                  "Į��"],
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