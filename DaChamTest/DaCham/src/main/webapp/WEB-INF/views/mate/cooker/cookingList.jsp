<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#cookList").addClass("w3-light-gray");
		$("#button").on("click",function(){
			window.location.href = "cookScreen";
		});
		
		$("#startCookBtn").on("click", function(){
			window.open("cookScreen", "", "height=1024, width=1366, fullscreen=yes");
		});
		
		$(".turbo1 li a").on("click",function(){
		      event.preventDefault();
		      
		      var form1 = $("#form1");
		      var targetPage =$(this).attr("href"); //a 태그에 href 값 가져옴
		      form1.find("[name=page]").val(targetPage);
		      form1.attr("action","cookList");
		      form1.attr("method","get");
		      form1.submit();
		   });
		$(".turbo2 li a").on("click",function(){
		      event.preventDefault();
		      
		      var form2 = $("#form2");
		      var targetPage =$(this).attr("href"); //a 태그에 href 값 가져옴
		      form2.find("[name=page]").val(targetPage);
		      form2.attr("action","cookList");
		      form2.attr("method","get");
		      form2.submit();
		   });
	});
</script>
</head>
<body>
	<%@include file = "cookerNavi.jsp" %>
	<div class = container>
	<h1>조리 대기</h1>
		<button id = "startCookBtn" class = "btn btn-primary btn-lg">조리시작</button>
		<form id = "form1">
		<input type = "hidden" name = "page" value = "${criteria.page }">
   		<input type = "hidden" name = "recordsPerPage" value = "${criteria.recordsPerPage }">
		<table class ="table table-hover">
			<tr>
				<th>주문번호</th>
				<th>반찬번호</th>
				<th>반찬이미지</th>
				<th>반찬이름</th>
				
				<th>주문안의 반찬진행상태</th>
				<th>조리량</th>
			</tr>
			<c:forEach items = "${list }" var = "b">
				<tr>
					<td>${b.orderCode}</td>
				<td>${b.sideDCode}</td>
				<td><img src = "displayFile?fileName=${b.sideDImg}" style = "width:50px; height : 50px;"></td>
				<td>${b.sideDName}</td>
				
				<td>${b.orderItemName}</td>
				<td>${b.cookingAmount}</td>
				</tr>
			</c:forEach>			
		</table>
		</form>
		<div class="container">
         <ul class="turbo1 pagination">
            <c:if test="${criteria.prev}">
               <li><a href="${criteria.startPage-1 }">&laquo;</a></li>
            </c:if>
            <c:forEach begin="${criteria.startPage}" end="${criteria.endPage}"
               var="idx">
               
               <li <c:out value="${idx==criteria.page?'class=active':''}"/>> <!-- <li class="active"> -->
                  <a href="${idx}">${idx}</a>
               </li>
            </c:forEach>
            <c:if test="${criteria.next}">
               <li><a href="${criteria.endPage+1}">&raquo;</a></li>
            </c:if>
         </ul>
      </div>
	<h1>조리 완료</h1>
		<form id = "form2">
		<input type = "hidden" name = "page" value = "${criteria2.page }">
   		<input type = "hidden" name = "recordsPerPage" value = "${criteria2.recordsPerPage }">
		<table class = "table table-hover">
			<tr>
				<th>주문번호</th>
				<th>반찬번호</th>
				<th>반찬이미지</th>
				<th>반찬이름</th>
				
				<th>주문안의 반찬진행상태</th>
				<th>조리량</th>
			</tr>
			<c:forEach items = "${list2 }" var ="y">
			<tr>
				<td>${y.orderCode}</td>
				<td>${y.sideDCode}</td>
				<td><img src = "displayFile?fileName=${y.sideDImg}" style = "width:50px; height : 50px;"></td>
				<td>${y.sideDName}</td>
				               
				<td>${y.orderItemName}</td>   
				<td>${y.cookingAmount}</td>   
			</tr>
			</c:forEach>
		</table>
		</form>
		<div class="container">
         <ul class="turbo2 pagination">
            <c:if test="${criteria2.prev}">
               <li><a href="${criteria2.startPage-1 }">&laquo;</a></li>
            </c:if>
            <c:forEach begin="${criteria2.startPage}" end="${criteria2.endPage}"
               var="idx">
               
               <li <c:out value="${idx==criteria2.page?'class=active':''}"/>> <!-- <li class="active"> -->
                  <a href="${idx}">${idx}</a>
               </li>
            </c:forEach>
            <c:if test="${criteria2.next}">
               <li><a href="${criteria2.endPage+1}">&raquo;</a></li>
            </c:if>
         </ul>
      </div>	
	</div>
</body>
</html>
