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
            <tr>
               <td><a href ="#">연포탕</a></td>
               <td>16인분</td>
            </tr>
         	 <tr>
               <td><a href ="#">병아리콩 샐러드</a></td>
               <td>18인분</td>
            </tr>
  		</table>
  		</div>
<div>
<h1>조리중</h1>        
<table border ="1">
             <tr>
               <th>음식명</th>
               <th>주문수</th>
            </tr>
            <tr>
               <td><a href ="#">감자조림</a></td>
               <td>16인분</td>
            </tr>
         	 <tr>
               <td><a href ="#">웰빙갈비찜</a></td>
               <td>18인분</td>
            </tr>
  		</table>
         
  		</table>
</div>
<div>
<h1>조리완료</h1>        
<table border ="1">
             <tr>
               <th>음식명</th>
               <th>주문수</th>
            </tr>
            <tr>
               <td><a href ="#">감자밥</a></td>
               <td>16인분</td>
            </tr>
         	 <tr>
               <td><a href ="#">김치</a></td>
               <td>21인분</td>
            </tr>
  		
  		</table>
</div>
<button id = "button">조리완료</button>
</body>
</html>