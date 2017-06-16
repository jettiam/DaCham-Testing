<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file = "cookerNavi.jsp" %>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#button").on("click",function(){
			window.location.href = "cookMain";
		});
	});
</script>
</head>
<body>
<h1>조리 대기</h1>
<div>
         <table border ="1">
            <tr>
               <th>음식명</th>
               <th>주문수</th>
            </tr>
            <c:forEach items = "${list }" var = "a">
            <tr>
               <td><a href = "#">${a.sideDName }</a></td>
               <td>${a.dietAmount }</td>
            </tr>
            </c:forEach>
  		</table>
  		</div>
<div>
<h1>조리중</h1>        
<table border ="1">
             <tr>
               <th>음식명</th>
               <th>주문수</th>
            </tr>
             <c:forEach items = "${list2 }" var = "b">
            <tr>
               <td><a href = "#">${b.sideDName }</a></td>
               <td>${b.dietAmount }</td>
            </tr>
            </c:forEach>
  		</table>
         
  		
</div>
<div>
<h1>조리완료</h1>        
<table border ="1">
             <tr>
               <th>음식명</th>
               <th>주문수</th>
            </tr>
              <c:forEach items = "${list3 }" var = "c">
            <tr>
               <td><a href = "#">${c.sideDName }</a></td>
               <td>${c.dietAmount }</td>
            </tr>
            </c:forEach>
  		
  		</table>
</div>
<button id = "button">마감</button>
</body>
</html>