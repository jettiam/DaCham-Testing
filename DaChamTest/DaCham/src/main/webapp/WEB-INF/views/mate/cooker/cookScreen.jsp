<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" />
<link rel="stylesheet" href="resources/jquery.countup.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="resources/jquery.growl.js" type="text/javascript"></script>
  <link href="resources/jquery.growl.css" rel="stylesheet" type="text/css" />
  
  
<script>


	//조리시작
	function cookStart() {	
		var p = $(this).parent();
		var sideDCode = p.find(".waitSideDCode").text(); 
		var sideDName = p.find(".waitSideDName").text();
		var amount = p.find(".waitAmount").text();
		var sideDImg =p.find(".waitSideDImg").val();
		var newTr =	"<tr class=c"+sideDCode+">" 
						+ "<td><img class='sideDImg' src='displayFile?fileName="+sideDImg+"'/></td>"
						+ "<td><h3><b>"+sideDName+"</b></h3><h4>"+amount+"</h4></td>"
						+ "<td></td>"
						+ "</tr>"
						+ "<tr class=c"+sideDCode+">"
						+ "<td colspan='2'><span class='countup'></span></td>"
						+ "<td><button class='btn end'>완료</button></td>"
						+ "</tr>";
		
		updateOptionsItemCode(4,sideDCode);
		$(this).parent().remove();
		$("#cookContinueTable").append(newTr);
		
		var newCounter = $("#cookContinueTable .countup:last");
		newCounter.countup();
			
		$(".countDays, .countDiv0").attr("style", "display: none");		
	};
	
	// 조리종료
	function cookEnd(){
		var className = $(this).parent().parent().attr('class');
		var code = className.slice(1);
		updateOptionsItemCode(5, code);		
		var element = $("tr."+className);
		var sideDName = element.find("b").text();
		var amount = element.find("h4").text();
			
		var content = "<p><span>"+sideDName+" "+amount+"</span></p>";
		
		$(element).remove();
		$("#cookFinish>.container").append(content);		
	}	

	function updateOptionsItemCode(orderItemCode, sideDCode){
		$.ajax({
			url: "cookAjax/updateOptionsItemCode",
			type : "POST",
			dataType : "text",
			data : {
				orderItemCode : orderItemCode,
				sideDCode : sideDCode
			},
			success : function(data){
				if(data=="SUCCESS"){
					
				}else{
					console.log(data);
				}			
			}
		});
	}

	
	$(document)
			.ready(
					function() {
					/* 	$.growl.warning({ message: "조리 상태를 확인 하세요" }); */
						$("#present").on("click", function() {
							window.location.href = "cook";
						});

						$("#list").on("click", function() {
							window.location.href = "cookList";
						});

						var date = new Date();
						var todayDate = date.getFullYear() + ". "
								+ parseInt(date.getMonth() + 1) + ". "
								+ date.getDate();
						$(".todayDate>h1").text(todayDate);

					});
	$(document).on("click", "#cookWait .container .start", cookStart);
	$(document).on("click", "#cookContinue .container .end", cookEnd);

	$(function(){
		$('.countup').each(function(){			
			$(this).countup();
			$(".countDays, .countDiv0").attr("style", "display: none");
		});
	});
		
	
</script>

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

* {
	font-family: 'Jeju Gothic', sans-serif;
}
.sideDImg{
	width:100px;
	height: 100px;
}
body {
	margin: 40px;
}

.bodyWrapper {
	width: 1286px;
	height: 944px;
}

.wrapper_else {
	width: 100%;
	height: 100%;
}

.row {
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

.box>h2 {
	text-align: center;
}

.mintColor {
	background-color: #009688;
	border: 2px solid #009688;
}

.container {
	overflow-Y: scroll;
}

#cookWait>.container {
	width: 500px;
	height: 260px;
}

.X {
	height: 835px;
	width: 610px;
	float: left;
}

#cookContinue>.container {
	width: 560px;
	height: 790px;
}

.C {
	height: 140px;
	width: 556px;
	text-align: center;
}

.C>.todayDate>h1 {
	color: #FFF;
}

.Y {
	height: 350px;
	width: 556px;
}

.Z {
	height: 306px;
	width: 356px;
	float: left;
}

.Q {
	height: 306px;
	width: 180px;
	float: left;
}
</style>
</head>

<body>
	<div class="bodyWrapper">
		<div class="wrapper_else">
			
				<div id="cookContinue" class="box X">
					<div class="container">			
					<table id="cookContinueTable" class="table table-bordered">
						<tr>
							<td colspan='3'><h2 style="text-align:center;">조리중</h2></td>
						</tr>
						<c:forEach items="${list}" var="list">
							<c:if test="${list.optionsOrderItemCode==4}"  >								
							<%-- 	<p>
									<span style='display:none;'>${list.sideDCode} </span> <span>${list.sideDName}
										${list.cookingAmount}인분</span> <span class="countup"></span>
									<button class='end'>완료</button>
								</p> --%>					
							<tr class="c${list.sideDCode}">
								<td><img class="sideDImg" src= "displayFile?fileName=${list.sideDImg}"/></td>
								<td><span class='continueSideDCode' style='display:none;'>${list.sideDCode}</span>
										<h3><b>${list.sideDName}</b></h3><h4>${list.cookingAmount}인분</h4>
								</td>
								<td></td>												
							</tr>
							<tr class="c${list.sideDCode}">
								<td colspan="2"><span class="countup"></span></td>								
								<td><button class="btn end">완료</button></td>
							</tr>							
							</c:if>							
						</c:forEach>
					</table>	
					</div>
				</div>
				<div class="box C mintColor">
					<h3>다참</h3>
					<span class="todayDate"><h1></h1></span>
				</div>
				<div id="cookWait" class="box Y">
					<h2>조리 대기</h2>
					<div class="container">
						<c:forEach items="${list}" var="list">
							<c:if test="${list.optionsOrderItemCode==3}">
								<p>
									<input class="waitSideDImg" type="hidden" value='${list.sideDImg}'>
									<span class="waitSideDCode">${list.sideDCode} </span> 
									<span class="waitSideDName">${list.sideDName}</span>
									<span class="waitAmount">${list.cookingAmount}인분</span>
									<button class="start">시작</button>
								</p>
							</c:if>
						</c:forEach>
					</div>
			
			</div>
		
				<div id="cookFinish" class="box Z">
					<h2>조리 완료</h2>
					<div class="container"></div>
				</div>
				<div class="box Q">
					<button onclick="window.close();">종료</button>
				</div>
			
		</div>
	</div>
	<script src="resources/jquery.growl.js" type="text/javascript"></script>
  	<link href="resources/jquery.growl.css" rel="stylesheet" type="text/css" />
	<script src="resources/jquery.countup.js"></script>

	<%-- <h1>↓↓↓여기서부터 잘라낼 부분 개발 확인용 ↓↓↓</h1>
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
				
				<td>${list.sideDCode}</td>
				<td>${list.sideDImg}</td>
				<td>${list.sideDName}</td>
				
				<td>${list.optionsOrderItemCode}</td>
				<td>${list.cookingAmount}</td>
			</tr>
		</c:forEach>
	</table> --%>
</body>
</html>