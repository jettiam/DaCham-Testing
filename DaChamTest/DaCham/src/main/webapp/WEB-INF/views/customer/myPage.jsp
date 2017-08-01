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


<title>DaCham ����������</title>
<style>
.myPageImg{
	max-width: 160px;
}
.optionView{
	display:none;
}
.detailSideDImg{
	max-width:150px;
	max-height:100px;
}
#myHealthTable{
	display:table;
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
		<a id="myInfo" class="w3-bar-item w3-button myPageBtn" onclick="w3_close()" data-status="0">�� ����</a>
		<a id="myHealth" class="w3-bar-item w3-button myPageBtn" onclick="w3_close()" data-status="1">�� �ǰ�����</a>
		<a id="myCart" class=" w3-bar-item w3-button myPageBtn" onclick="w3_close()" data-status="2">��ٱ���</a>
		<a id="myOrderlist" class="w3-bar-item w3-button myPageBtn" onclick="w3_close()" data-status="3">�ֹ�����</a>
		<a id="outMember" class="w3-bar-item w3-button" onclick="w3_close()">ȸ��Ż��</a>
</div>

	<%@include file="../clientNavi.jsp"%>
	
<!-- Page Content -->
<div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>
<button class="w3-button w3-white visible-xs h2" onclick="w3_open()">&#9776; ����������</button>

	<!-- ��ư�� Ŭ���ϸ� �������� ��ȯ�� -->
	<div id="myPageWrap" class="container">		
		<div class="hidden-xs text-center">
		<button id="myInfo" class="btn btn-warning myPageBtn" data-status="0">�� ����</button>
		<button id="myHealth" class="btn btn-warning  myPageBtn" data-status="1">�� �ǰ�����</button>
		<button id="myCart" class="btn btn-warning  myPageBtn" data-status="2">��ٱ���</button>
		<button id="myOrderlist" class="btn btn-warning  myPageBtn" data-status="3">�ֹ�����</button>
		<button id="outMember" class="btn btn-warning">ȸ��Ż��</button>
		</div>
		<!-- ���������� -->
		<div id="myInfoTableWrap">
		<h2 class="text-center">�� ����</h2>
		<div class="col-sm-3"></div><div class="col-sm-6 center-block">
			<table id="myInfoTable" class="table table-bordered table-condensed table-responsive">
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
		</div>
		<div class="col-sm-12 text-center">	
			<button class="btn btn-warning  myPageBtn">����</button>
			</div>	
		</div>

		<!-- �� �ǰ����� -->
		<div id="myHealthTableWrap" class="row">
		<h2 class="text-center">${memberName}���� �ǰ�����</h2><br>
		<div class="col-sm-6">
		<h3 class="text-center">��������</h3>
			<table id="myHealthTable" class="text-center center-block table-condensed table-responsive">
				<tr>
					<td><canvas id="myChart"></canvas></td>
					</tr>
			</table>
		</div>
		<div class="col-sm-6">
			<h3 class="text-center">�������</h3>
			<div>
				<canvas id="measureChart"></canvas>
			</div>
		</div>
		
		<div class="row">
		<div class="col-sm-12">			
			  <div class="form-group col-sm-3 col-sm-offset-3">
			    <label for="LowBooldP">��������(Hg)</label>
			    <input type="number" class="form-control" id="lowBooldP" placeholder="����(Hg)" min="0" value="0">
			  </div>
			  <div class="form-group col-sm-3">
			    <label for="HighBooldP">�ְ�����(Hg)</label>
			    <input type="number" class="form-control" id="highBooldP" placeholder="����(Hg)" min="0" value="0">
			  </div>
		</div>
		<div class="col-sm-12 center-block">
			  <div class="form-group col-sm-3 col-sm-offset-3">
			    <label for="LowBooldS">��������(mg/dL)</label>
			    <input type="number" class="form-control" id="lowBooldS" placeholder="����(mg/dL)" min="0" value="0">
			  </div>
			  <div class="form-group col-sm-3">
			    <label for="highBooldS">��������(mg/dL)</label>
			    <input type="number" class="form-control" id="highBooldS" placeholder="����(mg/dL)" min="0" value="0">
			  </div>			
		</div>
		<div class="col-sm-12 text-center"><button class="btn btn-primary" id="measureRegist">���</button></div>
		</div>	
		</div>

		<!-- ��ٱ��� -->
		<div id="myCartTableWrap">
			<h2 class="text-center">��ٱ���</h2>
			<div class="col-sm-1"></div>
			<div class="col-sm-10" style="padding:0px;">
			<table id="myCartTable" class="table text-center table-condensed table-responsive">
				<thead>
				<tr>
					<td><input type="checkbox" class="w3-check" id="checkAllCart"></td>
					<td>��ǰ����</td>
					<td>��ǰ��</td>					
					<td>����</td>
					<td>��ǰ�ݾ�</td>
				</tr>
				</thead>
				<tbody>
				</tbody>
				
			</table>
			</div>
			<div class="col-sm-12 text-center">			
			<button id="cartOrder" class="btn btn-warning">�ֹ��ϱ�</button>
			</div>
		</div>
		
		
		
		
		<!-- �ֹ����� -->
		<div id="myOrderListTableWrap">
		<h2 class="text-center">�ֹ�����</h2>
		<div class="col-sm-1"></div>
			<div class="col-sm-10" style="padding:0px;">
		<table id="myOrderListTable" class="table table-striped table-bordered text-center table-condensed table-responsive">
				<tr>
					<td class="hidden-xs" onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(1)')" style="cursor:pointer">�ֹ���ȣ</td>
					<td onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(2)')" style="cursor:pointer">�ֹ�����</td>
					<td class="hidden-xs" onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(3)')" style="cursor:pointer">��ǰ����</td>
					<td onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(4)')" style="cursor:pointer">��ǰ��</td>
					<td onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(5)')" style="cursor:pointer">����</td>
					<td onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(6)')" style="cursor:pointer">��ǰ�ݾ�</td>
					<td onclick="w3.sortHTML('#myOrderListTable', '.orderTr', 'td:nth-child(7)')" style="cursor:pointer">�ֹ���Ȳ</td>
				</tr>
			</table>
		</div>
		<!-- ȸ��Ż�� -->
		
	</div>




<form id="cartForm" action="cartOrderRegister" method="post">
<input type="hidden" name="cartInfo" id="cartInfo">
</form>
<script>
$(document).ready(function(){
	//�� ���¿� ���� ��� 0:������,1:���ǰ�����,2:��ٱ���,3:�ֹ�����	
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
			var id = $("#customerId").val();
			//1501022	2151813
			/* alert(id); */
	    	
			$(".orderTr").remove();
			$.ajax({
				url:"customerAjax/myNutri",
				headers : {
		               "Content-Type" : "application/json",
		               "X-HTTP-Method-Override" : "POST"
		            },
		            dataType : "json",
				data:JSON.stringify({"id":id}),
				type:"POST",
				
				success:function(data){
				
					cab=data.list[0].carbohydrate;
					pro=data.list[0].protein;
					fat=data.list[0].fat;
					k=data.list[0].k;
					ca=data.list[0].ca;
					na=data.list[0].na;
					
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
					            data: [cab, pro, fat, na, k, ca],
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
					
// 					$('#myHealthTable').append("<tr><td>�� ���� Į�θ� : "+data.list[0].kcal+"</td></tr>");
				
				}
			});
			readMeasure();
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
					for(var i = 0; i<data.list.length; i++){ //��ٱ����� ������ ���̺�� ���					
						var orderCode = data.list[i].orderCode;				
						$('#myCartTable').append("<tr class='addTr' data-orderCode='"+data.list[i].orderCode+"'><td>"
								+"<input type='checkbox' class='w3-check' name='cartCheck' value='"+data.list[i].dietCode+"' data-orderCode='"+data.list[i].orderCode+"'>"
								+"</td><td><img class='myPageImg img-responsive pull-left' data-img='"+data.list[i].dietImg+"' src='displayFile?fileName="+data.list[i].dietImg
										+"' alt='�̹���'>"
										+"<span data-orderCode='"+data.list[i].orderCode+"' class='optiondown glyphicon glyphicon-chevron-down'>"						
										+"�ֹ���</span></td><td class='dietName'>"+data.list[i].dietName
										+"</td><td class='dietAmount'>"+data.list[i].dietAmount+"</td><td class='price'><span>"+data.list[i].price+"</span>��"+"</td></tr>");
						var sideDName = "sideDName";
						$.each(data, function(key, value){
							if(key==orderCode){	
								var length = value.length
								$(".addTr[data-orderCode="+orderCode+"]").after(
										"<tr class='optionAddTr'><td class='"+orderCode+"_optionArea optionView' colspan='5'>"
										//���� ������ ���� �ɼ� â ���� ����
										+"<h4>"+orderCode+"�� �ֹ� ����</h4>"
										+"<div class='"+orderCode+"_options' ></div>"
										+"</td></tr>");
								 for(var i=0; i<length; i++){
									$("."+orderCode+"_options").html($("."+orderCode+"_options").html()+"<div class='col-sm-2'><img class='detailSideDImg' src='displayFile?fileName="+value[i].sideDImg+"'/>"+value[i].sideDName+"</div>");																		
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
					for(var i = 0; i<data.list.length; i++){ //�ֹ������� ������ ���̺�� ���
					/* if(data.list[i].orderItemCode==0){
						orderStatus="�̰���";				
					}else if(data.list[i].orderItemCode==6){
						orderStatus="�ֹ����";
					}else if(data.list[i].orderItemCode==7){
						orderStatus="�����";
					}else if(data.list[i].orderItemCode==8){
						orderStatus="��ۿϷ�";
					}else{
						orderStatus="�����Ϸ�";
					} */
						$('#myOrderListTable').append("<tr class='orderTr'><td class='orderCode hidden-xs'>"+data.list[i].orderCode+"</td><td class='orderDate'>"+data.list[i].orderDate+"</td><td class='hidden-xs'><img class='img-responsive myPageImg' data-img='"+data.list[i].dietImg+"' src='displayFile?fileName="+data.list[i].dietImg+"' alt='�̹���'></td><td class='dietName'>"+data.list[i].dietName+"</td><td class='dietAmount'>"+data.list[i].dietAmount+"</td><td class='price'><span>"+data.list[i].price+"</span>��"+"</td><td class='oItemCode' data-oItemCode='"+data.list[i].orderItemCode+"'>"+data.list[i].orderListStatus+"</td></tr>");
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
		/* alert(JSON.stringify(cartOrderInfo)); */
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
	$("#lowBooldP").keyup(function(){
		var lowBooldP = $("#lowBooldP").val();
	});
/*�ǰ��������� ���*/
	$("#measureRegist").click(function () {
		var lowBooldP = $("#lowBooldP").val();
		var highBooldP = $("#highBooldP").val();
		var lowBooldS = $("#lowBooldS").val();
		var highBooldS = $("#highBooldS").val();
		var id = $("#customerId").val();
		
		if(lowBooldP=="" || lowBooldP<0){
			lowBooldP=0;
			if(highBooldP==""){
				highBooldP=0;
				if(lowBooldS==""){
					lowBooldS=0;
					if(highBooldS==""){
						highBooldS=0;
					}
				}
			}
		}
		console.log("����"+lowBooldP+"����"+highBooldP+"����"+lowBooldS+"����"+highBooldS);
		$.ajax({
			url:"customerAjax/insertMeasure",
			headers : {
	               "Content-Type" : "application/json; charset=utf-8;", 
	               "X-HTTP-Method-Override" : "POST"
	            },
	            dataType : "text",
			data:JSON.stringify({"id":id, 
				"lowBooldP":lowBooldP,
				"highBooldP":highBooldP,
				"lowBooldS":lowBooldS,
				"highBooldS":highBooldS
			}),
			
			type:"POST",			
			success:function(data){				
					alert("�����̴�! ���� ������ ġŲ�̴�!");					
					console.log(data);
				
			}
		});
	});
	
	//�ǰ����� �ҷ�����
	function readMeasure(){
		var id = $("#customerId").val()
		
		$.ajax({
			url:"customerAjax/measureRead",
			headers : {
	               "Content-Type" : "application/json; charset=utf-8;", 
	               "X-HTTP-Method-Override" : "POST"
	            },
	            dataType : "json",
			data:JSON.stringify({"id":id			
			}),
			
			type:"POST",			
			success:function(data){											
					console.log(data);
					var date = new Array();
					var lowBloodP = new Array();
					var highBloodP = new Array();
					var lowBloodS = new Array();
					var highBloodS = new Array();
					var x = 0;
					console.log(data.list.length);
					console.log(data.list[0].measureDate);
					for(var i=0;i<data.list.length;i++){
						date[x] = data.list[i].measureDate;
						lowBloodP[x]=data.list[i].reading; //��������
						i++;
						highBloodP[x]=data.list[i].reading;
						i++;
						lowBloodS[x]=data.list[i].reading;
						i++;
						highBloodS[x]=data.list[i].reading;
						x++;					
					}
					console.log("��¥"+date);
					console.log("��������"+lowBloodP);
					console.log("�ְ�����"+highBloodP);
					console.log("��������"+lowBloodS);
					console.log("��������"+highBloodS);
					var ctx = $("#measureChart");
					var chart = new Chart(ctx, {
					    // The type of chart we want to create
					    type: 'line',

					    // The data for our dataset
					    data: {
					        labels: date,
					        datasets: [{
					            label: "��������",
					            backgroundColor: 'rgb(255, 99, 132)',
					            borderColor: 'rgb(255, 99, 132)',
					            data: lowBloodP,
					            fill:false,},
					            {
						            label: "�ְ�����",
						            backgroundColor: 'rgb(99, 255, 132)',
						            borderColor: 'rgb(99, 255, 132)',
						            data: highBloodP,
						            fill:false,},
						       {
							     	 label: "��������",
							         backgroundColor: 'rgb(132, 99, 225)',
							         borderColor: 'rgb(132, 99, 225)',
							         data: lowBloodS,
							         fill:false,},
							  {
								   label: "��������",
								   backgroundColor: 'rgb(30, 12, 225)',
								   borderColor: 'rgb(30, 12, 225)',
								   data: highBloodS,
								   fill:false,}
					            
					        ]
					    },

					    // Configuration options go here
					    options: {}
					});
			}
		});
		
	};
	
	
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