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
				for(var i = 0; i<data.list.length; i++){					
					if(dietCode == 0){
						dietCode = data.list[i].dietCode;
					}					
					if(dietCode==data.list[i].dietCode){
						$("#dietList").append(data.list[i].sideDImg+"<br>");
					}else{
						$("#dietList").append(data.list[i-1].dietName+"<br>");
						$("#dietList").append(data.list[i].sideDImg+"<br>");
						dietCode = data.list[i].dietCode;
					}					
				}
				$("#dietList").append(data.list[data.list.length-1].dietName+"<br>");
				
			});
			
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<ul>
	<li><a href=# class="disease" data-code="1" id="sugarBlood">당뇨병</a></li>
	<li><a href=# class="disease" id="renalFailure">신부전증</a></li>
	<li><a href=# class="disease" id="heartFailure">심부전증</a></li>
	<li><a href=# class="disease" id="hyperlipidemia">고지혈증</a></li>
	<li><a href=# class="disease" id="wizardOrder">위자드로 주문하기</a></li>
</ul>
<div id="dietList">

</div>
</body>
</html>