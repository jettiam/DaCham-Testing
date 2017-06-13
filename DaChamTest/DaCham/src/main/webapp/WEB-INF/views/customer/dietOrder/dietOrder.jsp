<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
li{	
	list-style: none;
}
table,tr,td{
	border:1px solid black;
}
td>img{
width:150px;
height:150px;
}
</style>

<script>
	$(document).ready(function(){
		$("#wizardOrder").click(function(){
			window.location.href = "dietOrderWizard";
		});
		
		$("#sugarBlood").on("click",function(){
			var diseaseCode = $(this).attr("data-code");
			$.getJSON("customerAjax/dietList/"+diseaseCode,function(data){
				var a = data.list;
				console.log(a);
				console.log(data.list.length);
				console.log(data.list[0].dietName);
				var dietCode=0;
				var trCount=0;
				var tdCount=0;
				for(var i = 0; i<data.list.length; i++){					
					if(dietCode == 0){
						dietCode = data.list[i].dietCode;
						console.log(dietCode+" 테이블 염");
						$("#dietList").append("<table class='dietTable"+dietCode+"'><tr class='dietTr"+trCount+"'>");
						console.log("tr카운트 염" + trCount);
					}					
					if(dietCode==data.list[i].dietCode){
						if(tdCount<2){
							console.log("티디카운트 " +tdCount);
							$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img src='displayFile?fileName="+data.list[i].sideDImg+"' alt='이미지'></td>");
							console.log("이미지찍음 " +i);	
							tdCount++;
							
						}else{
							console.log("tr카운트 닫음" + trCount);
							trCount++;
							$(".dietTable"+dietCode).append("</tr><tr class='dietTr"+trCount+"'>");
							console.log("tr카운트 염" + trCount);
							$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img src='displayFile?fileName="+data.list[i].sideDImg+"' alt='이미지'></td>");
							console.log("이미지찍음 " +i);							
							tdCount = 1;
						}						
						
					}else{
						$(".dietTable"+dietCode).append("</tr>");
						console.log("tr카운트 닫음" + trCount);
						$("#dietList").append("</table>")						
						console.log(dietCode+"테이블 닫기");
						$("#dietList").append("<a class='dietCode' href=# data-dietcode='"+dietCode+"'>"+data.list[i-1].dietName+"</a><br>");					
						trCount=0;						
						dietCode = data.list[i].dietCode;
						$("#dietList").append("<table class='dietTable"+dietCode+"'><tr class='dietTr"+trCount+"'>");
						console.log(dietCode+"테이블 염");
						console.log("tr카운트 염" + trCount);
						$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img src='displayFile?fileName="+data.list[i].sideDImg+"' alt='이미지'></td>");
						//$(".dietTable"+dietCode+">tbody>.dietTr"+trCount).append("<td><img src='displayFile?fileName="+data.list[i].sideDImg+" alt='이미지'></td>");
						tdCount=1;
						console.log("이미지찍음 " +i);	
					}
					
				}
				$("#dietList").append("<a class='dietCode' href=# data-dietcode='"+dietCode+"'>"+data.list[i-1].dietName+"</a><br>");
				
			});
			
		});		
		$("#dietList").on("click",'.dietCode',function(){
			console.log("클릭됨");
			var dietCode = $(this).attr("data-dietcode");
			console.log(dietCode);
			window.location.href="detailOrder?dietCode="+dietCode;
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<div id="dietOrderNav">
<ul>
	<li><a href=# class="disease" data-code="1" id="sugarBlood">당뇨병</a></li>
	<li><a href=# class="disease" id="renalFailure">신부전증</a></li>
	<li><a href=# class="disease" id="heartFailure">심부전증</a></li>
	<li><a href=# class="disease" id="hyperlipidemia">고지혈증</a></li>
	<li><a href=# class="disease" id="wizardOrder">위자드로 주문하기</a></li>
</ul>
</div>
<div id="dietList">
</div>
</body>
</html>