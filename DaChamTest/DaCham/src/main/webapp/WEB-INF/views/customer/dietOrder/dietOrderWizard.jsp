<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="resources/json2.js"></script>
<script>
	$(document).ready(function(){
		$("#startWizard").click(function(){
			alert("위자드를 시작해요.");
			getWizard(1);
		});
		
		$(".btn").click(function(){
			var link=$(this).attr("data-id");
			getWizard(link);
		});
	});
	function getWizard(no){				
		$.ajax({			
			url : "resources/testJson.txt",
			type: "GET", 
			dataType: "text",
			async:true,
			success : function (data){
				var json = JSON.parse(data);
				
				var q = "json.q"+no+".question";
				q = eval(q);			
				document.getElementById("question").innerText = q;
					
				for(i=1; i<5; i++){
					var id="#"+i;
					$(id).text("");
					$(id).attr("data-id", "");
				}
				
				var n=0;					
				while(eval("json.q"+no+".answerList["+n+"]")){
					answer = eval("json.q"+no+".answerList["+n+"].answer");
					link = eval("json.q"+no+".answerList["+n+"].link");
					
					var k=n+1;
					
					var id="#"+k;
					
					
					$(id).text(answer);
					$(id).attr("data-id", link);
					
					n++;
				}					
			},
			error : function(request, status, error){
				alert("에러: "+request.status+"\n massage"+request.responseText);
			}
		});
	}

	
</script>

<style>
	#ground{
		width: 320px;
		height: 100px;
		background-image: url('https://placeimg.com/320/100/any');
	}
	#startBox{
	}
	
	#startWizard{
		text-align: center;
		margin: 0 auto;
		padding-top : 35px;
		color: #ffffff;
	}
	
	li{
		list-style-type: none;
	}
	
</style>
<title></title>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<h1>DaCham 위자드로 주문하기.</h1>

<div id="ground">
<h2 id="startWizard">위자드 시작하기</h3>
</div>

<ul>
<h3 id="question"></h3>
<li class="btn" id="1" data-id=""></li>
<li class="btn" id="2" data-id=""></li>
<li class="btn" id="3" data-id=""></li>
<li class="btn" id="4" data-id=""></li>
</ul>

</body>
</html>