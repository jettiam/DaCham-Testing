<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
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

#myInfoTable {
	position: relative;
	margin: 0 auto;
	width: 450px;
}

#myHealthTableWrap {
	display: none;
}

#myHealthTable {
	margin: 0 auto;
}

#myChart {
	width: 300px;
	height: 300px;
	font-size: 10px;
	position: realative;
}

#myCartTableWrap {
	display: none;
}

#myCartTable {
	width: 800px;
	margin: 0 auto;
	text-align: center;
}

#myOrderList {
	display: none;
}
.myPageImg{
	width: 160px;
	height: 120px;
}
</style>
<script>
$(document).ready(function(){
	//�� ���¿� ���� ��� 0:������,1:���ǰ�����,2:��ٱ���,3:�ֹ�����
	var status=${status};	
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
				for(var i = 0; i<data.list.length; i++){ //��ٱ����� ������ ���̺�� ���
					$('#myCartTable').append("<tr class='addTr'><td>"+"<input type='checkbox' name='cartCheck' value='"+data.list[i].dietCode+"' data-orderCode='"+data.list[i].orderCode+"'>"+"</td><td><img class='myPageImg' data-img="+data.list[i].dietImg+" src='displayFile?fileName="+data.list[i].dietImg+"' alt='�̹���'></td><td class='dietName'>"+data.list[i].dietName+"</td><td class='dietAmount'>"+data.list[i].dietAmount+"</td><td class='price'><span>"+data.list[i].price+"</span>��"+"</td></tr>");
			}
			}
		});
    	$('#myInfoTableWrap').hide();;
    	$('#myHealthTableWrap').hide();
    	$('#myCartTableWrap').show();    	
    	$('#myOrderListTableWrap').hide();
        break;
    case 3:
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
	
	$(".myPageBtn").on("click",function(){
		status = $(this).attr("data-status");		
		switch(status) {
	    case "0":
	    	$('#myInfoTableWrap').show();
	    	$('#myHealthTableWrap').hide();
	    	$('#myCartTableWrap').hide();    	
	    	$('#myOrderListTableWrap').hide();
	        break;
	    case "1":
	    	$('#myInfoTableWrap').hide();
	    	$('#myHealthTableWrap').show();
	    	$('#myCartTableWrap').hide();    	
	    	$('#myOrderListTableWrap').hide();
	        break;
	    case "2":
			var id = $("#customerId").val();
			$(".addTr").remove();
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
					for(var i = 0; i<data.list.length; i++){ //��ٱ����� ������ ���̺�� ���
					$('#myCartTable').append("<tr class='addTr'><td>"+"<input type='checkbox' name='cartCheck' value='"+data.list[i].dietCode+"' data-orderCode='"+data.list[i].orderCode+"'>"+"</td><td><img class='myPageImg' data-img="+data.list[i].dietImg+" src='displayFile?fileName="+data.list[i].dietImg+"' alt='�̹���'></td><td class='dietName'>"+data.list[i].dietName+"</td><td class='dietAmount'>"+data.list[i].dietAmount+"</td><td class='price'><span>"+data.list[i].price+"</span>��"+"</td></tr>");
				}
				}
			});
	    	$('#myInfoTableWrap').hide();;
	    	$('#myHealthTableWrap').hide();
	    	$('#myCartTableWrap').show();    	
	    	$('#myOrderListTableWrap').hide();
	        break;
	    case "3":
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
	});	

	//checkbox ����. �ֻ����� üũ�ڽ� üũ �� ���� üũ�ڽ� ���� ���� Ȥ�� ������Ű��
	$('#checkAllCart').change(function(){
		var checkAll = $('#checkAllCart').prop('checked'); //��ü üũ�ڽ��� üũ����
		if(checkAll){ //üũ�ڽ��� ���� üũ�Ǿ� ������ true,�ƴϸ� false
			$('input[name="cartCheck"]').prop('checked',true);
		}else{
			$('input[name="cartCheck"]').prop('checked',false);
		}
			});
	$('input[name="cartCheck"]').change(function(){ //����Ʈ ���� üũ�ڽ��� ���°� ���� ��
		var cartCheck = true;
		$('input[name="cartCheck"]').each(function(){
			if(cartCheck){ //�� �� üũ�ڽ��� üũ�Ǿ� ���� ��
				cartCheck = $(this).prop('checked');
			if(!cartCheck){ //üũ�Ǿ����� ���� ��
				$('#checkAllCart').prop('checked',false);
			}	
			}
		});	
		if(cartCheck) { //����Ʈ�� üũ�ڽ��� ��� üũ�Ǿ� ���� �� checkAllCart üũ 
			$('#checkAllCart').prop('checked',true);
		}
	});
	
	//��ٱ��� �ֹ��ϱ�
	$("#cartOrder").on("click",function(){		
		var orderCode = $('.addTr:eq(0) input').attr("data-orderCode");
		var dietCode = $('.addTr:eq(0) input').val();
		var dietAmount = $('.addTr:eq(0) .dietAmount').text();
		var price = $('.addTr:eq(0) .price>span').text();
		console.log("�ֹ���ȣ:"+orderCode+" �Ĵ��ڵ�:"+dietCode+" ��:"+dietAmount+" ����:"+price);
		
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
});



</script>
</head>
<body>
	<%@include file="../clientNavi.jsp"%>

	<!-- ��ư�� Ŭ���ϸ� �������� ��ȯ�� -->
	<div id="myPageWrap">
		<h1>����������</h1>
		<br>
		<button id="myInfo" class="btn btn-warning myPageBtn" data-status="0">�� ����</button>
		<button id="myHealth" class="btn btn-warning  myPageBtn" data-status="1">�� �ǰ�����</button>
		<button id="myCart" class="btn btn-warning  myPageBtn" data-status="2">��ٱ���</button>
		<button id="myOrderlist" class="btn btn-warning  myPageBtn" data-status="3">�ֹ�����</button>
		<button id="outMember" class="btn btn-warning">ȸ��Ż��</button>
		<br>
		<br>

		<!-- ���������� -->
		<div id="myInfoTableWrap">
			<table id="myInfoTable" class="table table-bordered">
				<tr>
					<td>����</td>
					<td><input type="text" name="name" value="${memberName}"
						readonly></td>
				</tr>
				<tr>
					<td>���̵�</td>
					<td><input type="text" id="customerId" name="id"
						value="${sessionScope.customerId}" readonly></td>
				</tr>
				<tr>
					<td>��й�ȣ ����</td>
					<td><input type="password" name="passwd" value=""></td>
				</tr>

				<tr>
					<td>��й�ȣ Ȯ��</td>
					<td><input type="password" name="passwd" value=""></td>
				</tr>
				<tr>
					<td>�ּ�</td>
					<td><input type="text" name="address"
						value="${sessionScope.address}"></td>
				</tr>
				<tr>
					<td>����ó</td>
					<td><input type="text" name="tel" value="${sessionScope.tel}"></td>
				</tr>
				<tr>
					<td>e-mail</td>
					<td><input type="text" name="email"
						value="${sessionScope.email}"></td>
				</tr>
				<tr>
					<td>ȸ�����</td>
					<td><input type="text" name="gradeCode"
						value="${sessionScope.gradeCode}" readonly></td>
				</tr>
				<tr>
					<td>������</td>
					<td><input type="text" name="joinDate"
						value="${sessionScope.joinDate}" readonly></td>
				</tr>
			</table>

			<br>
			<button>����</button>
		</div>

		<!-- �� �ǰ����� -->
		<div id="myHealthTableWrap">
			<table id="myHealthTable">
				<tr>
					<td><canvas id="myChart"></canvas></td>
					<td><h2>${memberName}���ǿ�������</h2> ���� ����� �����Ͱ� �������� �ʽ��ϴ�. <br>
						�ֹ��� �ϸ� �� �� �־��:)<br></td>
				</tr>
			</table>
		</div>

		<!-- ��ٱ��� -->
		<div id="myCartTableWrap">
			<!-- <table id="myCartTable" border=2> -->

			<table id="myCartTable" border=1>
				<tr>
					<td><input type="checkbox" id="checkAllCart"></td>
					<td>��ǰ����</td>
					<td>��ǰ��</td>
					<td>����</td>
					<td>��ǰ�ݾ�</td>
				</tr>
			</table>
			<!-- </table> -->
			<button id="cartOrder">�ֹ��ϱ�</button>
		</div>
		<!-- �ֹ����� -->
		<div id="myOrderListTableWrap">�ֹ�����</div>
		<!-- ȸ��Ż�� -->
		
	</div>


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


<form id="cartForm" action="cartOrderRegister" method="post">
<input type="hidden" name="cartInfo" id="cartInfo">
</form>
</body>
</html>