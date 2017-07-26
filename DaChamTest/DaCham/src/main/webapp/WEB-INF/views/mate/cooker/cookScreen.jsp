<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>

	cookAll1();
	function cookAll1() {
		$
				.getJSON(
						"cookAjax/readyScreen",
						function(data) {
							$(".cookResult1").remove();
							var str = "";

							$(data)
									.each(
											function() {

												str += "<tr id = 'cookResult1' data-code = '"+this.orderCode+"'>"
														+ "<td>"
														+ "<img src = 'displayCookFile?fileName='"
														+ this.dietImg
														+ "'>"
														+ "</td>"
														+ "<td>"
														+ this.dietName
														+ "</td>"
														+ "<td>"
														+ this.orderDate
														+ "</td>" + "</tr>"
											});
							$(".cook1").append(str);

						});
	}
	cookAll2();
	function cookAll2() {
		$
				.getJSON(
						"cookAjax/cookScreen",
						function(data) {
							$(".cookResult2").remove();
							var str = "";

							$(data)
									.each(
											function() {
												str += "<tr id = 'cookResult2' data-code = '"+this.orderCode+"'>"
														+ "<td>"
														+ "<img src = 'displayCookFile?fileName='"
														+ this.dietImg
														+ "'>"
														+ "</td>"
														+ "<td>"
														+ this.dietName
														+ "</td>"
														+ "<td>"
														+ this.orderDate
														+ "</td>" + "</tr>"
											});
							$(".cook2").append(str);
						});
	}
	cookAll3();
	function cookAll3() {
		$
				.getJSON(
						"cookAjax/endScreen",
						function(data) {
							$(".cookResult3").remove();
							var str = "";

							$(data)
									.each(
											function() {
												str += "<tr id = 'cookResult3' data-code = '"+this.orderCode+"'>"
														+ "<td>"
														+ "<img src = 'displayCookFile?fileName='"
														+ this.dietImg
														+ "'>"
														+ "</td>"
														+ "<td>"
														+ this.dietName
														+ "</td>"
														+ "<td>"
														+ this.orderDate
														+ "</td>" + "</tr>"
											});
							$(".cook3").append(str);
						});
	}
	$(document).ready(function() {
		$("#present").on("click", function() {
			window.location.href = "cook";
		});

		$("#list").on("click", function() {
			window.location.href = "cookList";
		});
		
		var date = new Date();
		var todayDate = date.getFullYear() + ". " + parseInt(date.getMonth()+1) + ". " + date.getDate();
		$(".todayDate>h1").text(todayDate);
	});
</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
* {
	font-family: 'Jeju Gothic', sans-serif;
}

  body {
    margin: 40px;
  }
  
  .bodyWrapper{
  	width: 1286px;
  	height: 944px;
  }


  .wrapper_else {
    width: 100%;
    height: 100%;
  }
  .row{
    display: inline-block;
  }

  .box {
  	display: inline-block;
    /*background-color: #444;
    color: #fff; */
    border: 2px solid #333;
    border-radius: 5px;
    padding: 10px;
    font-size: 150%;
    margin: 10px;
  }
  .box>h2{
  	text-align:center;
  }

	.mintColor{
		 background-color: #009688;
		 border: 2px solid #009688;
	}


  .X {
    height: 560px;
    width: 610px;
    float: left;
  }
  
  .C{
  
    height: 140px;
    width: 556px;     
    text-align: center;
  }
 .C>.todayDate>h1{
 	color: #FFF;
 }
 
 
  .Y {
    height: 400px;
    width: 556px;
   
  }

  .Z {
    height: 256px;
    width: 710px;
    float: left;
  }

  .Q {
    height: 256px;
    width: 456px;
    float: right;
  }
</style>
</head>

<body>
	<div class="bodyWrapper">
	<div class="wrapper_else">
		<div class="row">
			<div class="box X">
				<h2>조리중</h2>
				<div class="container">
					내용 들어갈 자리
				</div>
			</div>
			<div class="box C mintColor">
				<h3>다참</h3>
				<span class="todayDate"><h1></h1></span>
			</div>
			<div class="box Y">
				<h2>조리 대기</h2>
				<div class="container">
					내용 들어갈 자리
				</div>
			</div>
		</div>
		<div class="row">
			<div class="box Z">
				<h2>조리 완료</h2>
				<div class="container">
					내용 들어갈 자리
				</div>
			</div>
			<div class="box Q">여기는 버튼 같은거 달기</div>
		</div>
	</div>
	</div>

	<h1>조리 화면 표표표..!</h1>
	<table class="table">
		<tr>
			<td>주문번호</td>
			<td>반찬번호</td>
			<td>반찬이미지</td>
			<td>반찬이름</td>
			<td>주문진행상태</td>
			<td>주문안의 반찬진행상태</td>
			<td>조리량</td>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.orderCode}</td>
				<td>${list.sideDCode}</td>
				<td>${list.sideDImg}</td>
				<td>${list.sideDName}</td>
				<td>${list.orderOrderItemCode}</td>
				<td>${list.optionsOrderItemCode}</td>
				<td>${list.cookingAmount}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="container">
		<div>
			<button id="present">현황</button>
			<button id="list">조리목록</button>
		</div>
		<div>
			<h1>조리대기</h1>
			<table class="cook1">
				<tr>
					<th>음식이미지&nbsp;&nbsp;&nbsp;</th>
					<th>식단이름&nbsp;&nbsp;&nbsp;</th>
					<th>식단주문날짜&nbsp;&nbsp;&nbsp;</th>
				</tr>
				<tr class="cookResult1">
				</tr>
			</table>
		</div>
		<div>
			<h1>조리중</h1>
			<table class="cook2">
				<tr>
					<th>음식이미지&nbsp;&nbsp;&nbsp;</th>
					<th>식단이름&nbsp;&nbsp;&nbsp;</th>
					<th>식단주문날짜&nbsp;&nbsp;&nbsp;</th>
				</tr>
				<tr class="cookResult2">

				</tr>
			</table>
		</div>
		<div>
			<h1>조리완료</h1>
			<table class="cook3">
				<tr>
					<th>음식이미지&nbsp;&nbsp;&nbsp;</th>
					<th>식단이름&nbsp;&nbsp;&nbsp;</th>
					<th>식단주문날짜&nbsp;&nbsp;&nbsp;</th>
				</tr>
				<tr class="cookResult3">

				</tr>
			</table>
		</div>

	</div>
</body>
</html>