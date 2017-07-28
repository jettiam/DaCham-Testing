<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page import="com.wdb3a.dacham.bean.OrderList"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../admin/upmenu.jsp"%>
	<div class="container">
	<div class="col-sm-6">  
		<h2>공지사항</h2>
		<div class="form-group row">
		<div class="col-sm-3">   
			<select class= "form-control">
				<option>등록자</option>
				<option>제목</option>
			</select>
		</div>
		<div class="col-sm-5">
			<input type="text" class="form-control"> 
		</div>
			<input type="submit" value="검색" class = "btn btn-default">
		
			<div style="margin-top:13px">
			<table class="table table-bordered">    
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록자</th>
					<th>등록 일자</th>
					<th>조회수</th>
				</tr>
			</table>
			<input type="button" value="목록" id="notice" class = "btn btn-default">
			</div>
		</div>
	</div>
<!--차트  -->
	<div id ="chart" class="col-sm-6">
		<h2>일자별 통계</h2>
		<div class="form-group row">
			<div class="col-sm-4 text-right">   
		<input type="date" id="startdate" class="form-control">      
		</div>
		<div class="col-sm-1 text-center" style="font-size:23px" > 
		~
		</div>    
		<div class="col-sm-4 text-right">             
		<input type="date" id="enddate" class="form-control">
			</div>
			<div class="col-sm-2 text-right">
		   <input type="button" value="검색" id="chartsearch" class = "btn btn-default">
		   </div>  
		   <div class="col-sm-11 text-right" style="margin-top:13px">   
		   <input type="button" value="오늘" id="today" class = "btn btn-default">
		   <input type="button" value="일주일" id="week" class = "btn btn-default"> 
		   <input type="button" value="지난 한달" id="month" class = "btn btn-default">
		   <br>
		   </div>
		   </div>   
		   	<div> 
		   		<input type = "hidden" id = "dietName" name = "dietName" >
				<input type = "hidden" id =  "sellAmount" name = "sellAmount">
				<input type = "hidden" id = "totalprice" name = "totalprice">
			</div>
		<div id="chart_div" style="width: 500px; height: 300px;"></div>  
		<div id="piechart" style="width: 500px; height: 300px;"></div>
	</div>
	
	
	
	
	
	<div>
		<h2>모든 주문내역</h2>
			<div class="form-group row">      
			<div class="col-xs-2"> 
			<select name="searchType" class= "searchType form-control">
				<option value="t"
					<c:out value="${orderList.searchType eq 't'?'selected':'' }"/>>
					고객 아이디</option>
				<option value="c"
					<c:out value="${orderList.searchType eq 'c'?'selected':'' }"/>>
					식단명</option>
			</select>
			</div>
			<div class="col-xs-3">
			<input type="text" name="keyword" id = "keyword" class="form-control">
			</div>
			<button id="search" class = "btn btn-default">검색</button>
			<button id="searchAll" class = "btn btn-default">전체</button>
			</div>
		<div>
			<table class="tables table table-condensed" width="600">  
				<tr>
					<th>주문번호</th>
					<th>고객id</th>
					<th>식단명</th>
					<th>주문 접수일</th>
					<th>금액</th>
					<th>진행상태</th>
					<th>운송장 번호</th>
				</tr>
			</table>
			<ul class="pagination" position="center">  
			</ul>
		</div>
	</div>
	<!-- <div id="read" class="read" >  
		<table  border="1" class="table table-bordered">
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
		</div> -->
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">상세보기</h4>
        </div>
        <div class="modal-body">   
		<table  border="1" class="table table-bordered">
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
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
<script>
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(drawVisualization);
	/*combo 그래프  */
	function drawVisualization() {
		$.ajax({
            url:"adminMain2",
            success:function(data){ 
               
             var data1 = new google.visualization.DataTable();
             data1.addColumn('string', '날짜'); 
             data1.addColumn('number', '판매량');
             data1.addColumn({type: 'number', role: 'tooltip'}); 
             data1.addColumn('number', '매출액');
             data1.addRows(data.length);
                 
             for(i=0; i<data.length; i++){ 
             data1.setCell(i, 0, data[i].orderdate);    
             data1.setCell(i, 1, data[i].dietAmount*10000);  
             data1.setCell(i, 2, data[i].dietAmount);   
             data1.setCell(i, 3, data[i].totalprice);
            }   
             var options = {
            		tooltip: {isHtml: true},    
            		seriesType : 'bars',
         			series : { 1 : {type : 'line'}
         			}
         		};
       			
             var chart = new google.visualization.ComboChart(document
     				.getElementById('chart_div'));
     		chart.draw(data1, options);
       	      }
  
	 });
	}
	
	 function drawChart() {
		 $.ajax({
	            url:"adminMain1",
	            success:function(data){ 
	              
	             var data1 = new google.visualization.DataTable();
	             data1.addColumn('string', '식단명');
	             data1.addColumn('number', '판매량');
	             data1.addRows(data.length);
	             
	             for(i=0; i<data.length; i++){
	             data1.setCell(i, 0, data[i].dietName);    
	             data1.setCell(i, 1, data[i].sellAmount); 
	            }  
	             var options = {
	       	          title: '전체 식단 판매율'   
	       	        };
	       			
	       	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

	       	        chart.draw(data1, options); 
	       	      }
		 });   
	      }
	function getDefaultDate() {// 해당 일 계산

		var now = new Date();
		var day = ("0" + now.getDate()).slice(-2);
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		return today;
	}

	function getWeek() {// 일주일 전 첫 날짜 계산

		var now = new Date();
		var day = ("0" + (now.getDate() - 6)).slice(-2);
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		return today;
	}

	function getStartDate() {// 한달 버튼 클릭시 그 해당 날짜의 첫번쨰 일 계산
		var now = new Date();
		var Startdate = new Date(now.getYear(), now.getMonth(), 1);
		var day = ("0" + Startdate.getDate()).slice(-2);
		var month = ("0" + (Startdate.getMonth())).slice(-2);
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		return today;
	}

	function getEndDate() {//한달 버튼 클릭시 그 해당 날짜의 마찌맊 일 계산
		var now = new Date();
		var enddate = new Date(now.getYear(), now.getMonth(), 0);
		var day = ("0" + enddate.getDate()).slice(-2);
		var month = ("0" + (enddate.getMonth()+1)).slice(-2);
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		return today;
	}

	function getWeekStartDate() {
		var now = new Date();

	}
	function todayChart(){
		
		var startdate = ($("#startdate").val());
		var enddate = ($("#enddate").val())
		console.log(startdate);
		console.log(enddate); 
		 $.ajax({ 
			url : "adminMain3",
			data: JSON.stringify({
				"startdate" : startdate, 
				"enddate" : enddate 
		    }),
		    headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
			},
			type : "post",
			dataType:"json", 
			success:function(data){
				var data1 = new google.visualization.DataTable();
	             data1.addColumn('string', '날짜'); 
	             data1.addColumn('number', '판매량');
	             data1.addColumn({type: 'number', role: 'tooltip'}); 
	             data1.addColumn('number', '매출액');
	             data1.addRows(data.length);
	                 
	             for(i=0; i<data.length; i++){ 
	             data1.setCell(i, 0, data[i].orderdate);    
	             data1.setCell(i, 1, data[i].dietAmount*10000);  
	             data1.setCell(i, 2, data[i].dietAmount);  
	             data1.setCell(i, 3, data[i].totalprice);
	            }   
	             var options = {
	            		tooltip: {isHtml: true},    
	            		seriesType : 'bars',
	         			series : { 1 : {type : 'line'}
	         			}
	         		};
	       			
	             var chart = new google.visualization.ComboChart(document
	     				.getElementById('chart_div'));
	     		chart.draw(data1, options);
			}
		 });
	}
	$(document).ready(function() {
		$("#today").click(function() {
			$("#startdate").val(getDefaultDate());
			$("#enddate").val(getDefaultDate());
			todayChart();
		});
		$("#week").click(function() {
			$("#startdate").val(getWeek());
			$("#enddate").val(getDefaultDate());
			todayChart();
		});
		$("#month").click(function() {
			$("#startdate").val(getStartDate());
			$("#enddate").val(getEndDate());
			todayChart();
		});
		$("#chartsearch").click(function(){
			$("#startdate").val();
			$("#enddate").val();
			todayChart();  
		})
		$("#notice").click(function() {
			window.location.href = "notice";
		});
		all(1);
		
		$(document).on("click", ".orderCode" , function() {  
			 var orderCode = $(this).attr("data-src"); 
			 $("#orderName").empty();
				$("#orderAddRess").empty();
				$("#orderPrice").empty();
				$("#orderDietName").empty();
				$("#orderOrderDate").empty();
				$("#orderTel").empty();   
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
					//$("#read").center(); 
				},
				error : function() {
					alert("실패");
				}
			});
		});
	$("#search").on("click",function(){
		$(".orderListTable").remove();
		
		var str=""; 
		var searchType = $(".searchType").val();
		var keyword = $("#keyword").val();
		$.getJSON("adminSub/"+searchType+"/"+keyword,function(data){
		for(var i=0; i<data.length; i++){
			str += "<tr class='orderListTable'>"+"<td>"+data[i].orderCode+"</td>"+"<td>"+data[i].id+"</td>"+"<td>"+"<a data-src='"+data[i].orderCode+"' class='orderCode'>"+data[i].dietName+"</a> </td>"+"<td>"+data[i].orderDate+"</td>"+"<td>"+data[i].price+"</td>"+"<td>"+data[i].orderItemName+"</td>"+"<td>"+data[i].transportNum+"</td> </tr>"
			}
		$(".tables").append(str); 
		});
	});
	$("#searchAll").on("click", function(){
		all(1); 
	});
      
	var currentPage = 1;
	$(".pagination").on("click","li a",function(){
		event.preventDefault();
		var replyPage = $(this).attr("href");
		all(replyPage);
	});

	function all(page){
		$.getJSON("adminSub/all/"+page,function(data){
			console.log(data); 
			$(".orderListTable").remove(); 
			var str = "";
			for(var i =0; i<data.list.length; i++){    
				if(data.list[i].transportNum == null){
					data.list[i].transportNum = ""; 
				}
				str += "<tr class='orderListTable'>"+"<td>"+data.list[i].orderCode+"</td>"+"<td>"+data.list[i].id+"</td>"+"<td>"+"<a data-src='"+data.list[i].orderCode+"' class='orderCode' data-toggle='modal' href='#myModal'>"+data.list[i].dietName+"</a> </td>"+"<td>"+data.list[i].orderDate+"</td>"+"<td>"+data.list[i].price+"</td>"+"<td>"+data.list[i].orderItemName+"</td>"+"<td>"+data.list[i].transportNum+"</td> </tr>"		 
			}
			console.log(str);
			$(".tables").append(str);
			printPaging(data.criteria);  
		});  
	}
	
	function printPaging(criteria){  
		var str = "";
				
		if(criteria.prev){
			str += "<li><a href=''"+(criteria.startPage-1)+"'>'" + "<<"+"</a></li>";
		}
		for(var i = criteria.startPage; i<=criteria.endPage; i++){
			var strClass = criteria.page == i?"class = 'active'":"";
			str += "<li "+strClass+"><a href ='"+i+"'>"+i + "</a></li>";
		}
		if(criteria.next){
			str += "<li><a href=''"+(criteria.endPage+1)+"'>'" + ">>"+"</a></li>";
		}
		$(".pagination").html(str);
	}
	});
	
		
	
</script>
</html>