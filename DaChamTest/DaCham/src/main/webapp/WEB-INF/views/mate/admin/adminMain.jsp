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
<%@include file="../admin/upmenu.jsp"%>
<title>Insert title here</title>
<style>
#read {
	display: none;
	width: 300px;
	/* background-color: gray; */ 
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}

#close {
	float: right;
}
</style>
</head>
<body>
	<div>
		<form method="post" action="notice">
			<select>
				<option>등록자</option>
				<option>제목</option>
			</select> 제목<input type="text"> <input type="submit" value="검색">
		</form>
		<div>
			<table width="600" border="1">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>등록자</th>
					<th>등록 일자</th>
					<th>조회수</th>
				</tr>
				<%-- <c:forEach items="${list}" var="board">
				<tr>
					<td>${board.bno }&nbsp;&nbsp;&nbsp;</td>
					<td><a href="read?bno=${board.bno }">
					${board.title }&nbsp;&nbsp;</a></td>
					<td>${board.writer }&nbsp;&nbsp;</td>
					<td>${board.viewcnt }&nbsp;&nbsp;</td>
				</tr>
			</c:forEach> --%>
			</table>
			<input type="button" value="목록" id="notice">
		</div>
	</div>
<!--차트  -->
	<div>
		<h2>일자별 통계</h2>
		일자<input type="date" id="startdate"> ~ <input type="date" id="enddate"> 
		   <input type="button" value="오늘" id="today">
		   <input type="button" value="일주일" id="week"> 
		   <input type="button" value="지난 한달" id="month"><br>
		   	<div>  
		   		<input type = "hidden" id = "dietName" name = "dietName">
				<input type = "hidden" id =  "sellAmount" name = "sellAmount">
				<input type = "hidden" id = "totalprice" name = "totalprice">
			</div>
		<div id="chart_div" style="width: 900px; height: 500px;"></div>
		<div id="piechart" style="width: 900px; height: 500px;"></div>
	</div>
	
	
	
	
	
	<div>
		<form>
			<select name="searchType">
				<option value="n"
					<c:out value="${orderList.searchType==null?'selected':'' }"/>>
					전체</option>
				<option value="t"
					<c:out value="${orderList.searchType eq 't'?'selected':'' }"/>>
					고객 아이디</option>
				<option value="c"
					<c:out value="${orderList.searchType eq 'c'?'selected':'' }"/>>
					식단명</option>
			</select> 제목<input type="text" name="keyword">
			<button id="search">검색</button>
		</form>
		<div>
			<table width="600" border="1">
				<tr>
					<th>주문번호</th>
					<th>고객id</th>
					<th>식단명</th>
					<th>주문 접수일</th>
					<th>금액</th>
					<th>진행상태</th>
					<th>배송</th>
				</tr>
				<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.orderCode}&nbsp;&nbsp;&nbsp;</td>
						<td>${board.id }</td>
						<td><a data-src="${board.orderCode}" class="orderCode">${board.dietName}&nbsp;&nbsp;</a></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${board.orderDate}" /></td>
						<td>${board.price}</td>
						<td>${board.orderItemName}</td>
						<td>${board.transportNum}</td>

					</tr>

				</c:forEach>
			</table>
		</div>
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
	 

	$(".orderCode").on("click", function() {
		event.preventDefault();
		var orderCode = $(this).attr("data-src");
		alert("이건됨");
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
				
			},
			error : function() {
				alert("실패");
			}
		});
	});
	
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
		$("#notice").click(function() {
			window.location.href = "notice";
		});
		$("#close").click(function() {
			$("#read").css("display", "none");
		});
		
	});
		
	
</script>
</html>