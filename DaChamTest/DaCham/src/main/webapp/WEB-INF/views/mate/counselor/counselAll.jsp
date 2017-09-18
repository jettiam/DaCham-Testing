<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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


<!-- Bootstrap core CSS     -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />

<!--  Material Dashboard CSS    -->
<link href="resources/assets/css/material-dashboard.css"
	rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="resources/assets/css/demo.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Jeju Gothic',"Nanum Gothic", sans-serif !important;
}
	.counselTitle { color: blue; text-decoration: underline;}   
	
	.counsel{
		table-layout:fixed;
		work-break:break-all;
	}
</style>
<script>
	$(document).ready(function(){
		$("#detail").addClass("w3-light-gray");
		
		listAll(1);
		
		$("#listAll1").on("click",function(){
			listAll(1);
		});
		
		$("#listAll2").on("click",function(){
			listAll(2);
		});
		$("#listAll3").on("click",function(){
			listAll(3);
		});
		$("#listAll4").on("click",function(){
			listAll(4);
		});
		$("#listAll5").on("click",function(){
			listAll(5);
		});
		
		function listAll(counselItemCode){
			$.getJSON("counselAjax/listAll/"+counselItemCode,function(data){
				$(".counselResult").remove();
				var str = "";
				$(data).each(function(){
					if(this.adviser == null){
			               str += "<tr class = 'counselResult'><td>"+this.counselCode+"</td><td>"+this.counselItemName+"</td><td class = 'counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.customer+"'>"+this.counselTitle+"</a></td><td>"+this.id+"</td><td>"+this.counselDate+"</td><td>미응답</td></tr>";
			            }
			            else{
			               str += "<tr class = 'counselResult'><td>"+this.counselCode+"</td><td>"+this.counselItemName+"</td><td class = 'counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.customer+"'>"+this.counselTitle+"</a></td><td>"+this.id+"</td><td>"+this.counselDate+"</td><td>응답완료</td></tr>";
			            }
				});
				$(".counsel").append(str);
			});
		}          
		$(document.body).on("click",".counselTitle a",function(){
	         var counselCode = $(this).attr('data-code');
	         var customer = $(this).attr('data-id');   
	         var name = '';
	         name = $(this).attr('data-name');
	         window.location.href = "detail?customer="+customer+"&name="+name+"&counselCode="+counselCode;           
	      });
	});
</script>
</head>
<body>
	<%@include file = "counselorNavi.jsp" %>
	<div class = "container">
	<div class ="row">
	<div class="col-lg-12 col-md-12">
	<div class="card">
	<div class="card-header" data-background-color="#3A546D">
		<div style = "margin-left:200px;">
			<button id = "listAll1" data-item = "1" class = "btn btn-success">식단문의</button>
			<button id = "listAll2" data-item = "2" class = "btn btn-success">특별식단</button>
			<button id = "listAll3" data-item = "3" class = "btn btn-success">배송문의</button>
			<button id = "listAll4" data-item = "4" class = "btn btn-success">기타문의</button>
			<button id = "listAll5" data-item = "5" class = "btn btn-success">특별식단작성완료</button>
		</div>
	</div>
		<div class="card-content table-responsive">
		<table class = "counsel table table-hover">
			<tr>
				<th>상담번호</th>
				<th>상담목록</th>
				<th>상담제목</th>
				<th>고객ID</th>
				<th>작성일</th>
				<th>상담여부</th>
			</tr>		
			<tr class = "counselResult">
				
			</tr>
		</table>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>
