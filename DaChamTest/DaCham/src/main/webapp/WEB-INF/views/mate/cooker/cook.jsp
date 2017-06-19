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
		$(document.body).on("click",".cookResult1 td a",function(data){
			event.preventDefault();
			
		});
		cookAll1();
		
		$(document.body).on("click",".cookResult1 td a",function(){
			event.preventDefault();
			
			alert("일단 클릭됨");
			
			$(".cookResult2").remove();
			var i = $(this).attr("href");
			alert(i);
			$(".cook2").append($(".cookResult1").eq(i));        
			
		});    
		function cookAll1(){
			$.getJSON("cookAjax/readycook",function(data){
				$(".cookResult1").remove();
				var str = "";
				$(data).each(function(index){
					str += "<tr class = 'cookResult1'>"+"<td>"+"<a href = '"+index+"' data-name = '"+this.sideDName+"'>"+this.sideDName+"</a>"+"</td>"+"<td>"+this.dietAmount+"</td>"+"</tr>"
				});
				$(".cook1").append(str);
			});
		}
	});
</script>
</head>
<body>
<h1>조리 대기</h1>
<div>
         <table border ="1" class = "cook1">
            <tr>
               <th>음식명</th>
               <th>주문수</th>
            </tr>
            <tr class = "cookResult1">
            </tr>
  		</table>
  		</div>
<div>
<h1>조리중</h1>        
<table border ="1" class = "cook2">
             <tr>
               <th>음식명</th>
               <th>주문수</th>
            </tr>
            <tr class = "cookResult2">
            </tr>
  		</table>
         
  		
</div>
<div>
<h1>조리완료</h1>        
<table border ="1" class = "cook3">
             <tr>
               <th>음식명</th>
               <th>주문수</th>
            </tr>
             <tr class = "cookResult3">
             	
             </tr>
  		
  		</table>
</div>
<button id = "button">마감</button>
</body>
</html>