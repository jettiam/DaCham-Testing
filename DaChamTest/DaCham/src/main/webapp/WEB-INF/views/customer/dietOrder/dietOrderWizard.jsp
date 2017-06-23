<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="resources/json2.js"></script>
<script>
	$(document).ready(function() {
		$("#startWizard").click(function() {
			alert("위자드를 시작해요.");
			$("#wizardResult").hide("slow");
			$(".btn").show("slow");
			getWizard(1);
		});

		$(".btn").click(function() {
			var link = $(this).attr("data-id");
			getWizard(link);
		});

		$("#showResultDiet").click(function(){
			$("#rName").val($("#resultName").text());
			$("#rJudg").val($("#resultJudg").text());
			$("#ResultDiet").attr("action", "recommendDiet");
			$("#ResultDiet").submit();
		});
		
		
		
	});
	function getWizard(no) {
		$
				.ajax({
					url : "wizardTestGetWizard",
					type : "GET",
					dataType : "text",
					async : true,
					success : function(data) {
						var json = JSON.parse(data);
						console.log(json);
						var r = "json.q" + no + ".result";
						r = eval(r);
						if (r == "결과") {
							document.getElementById("question").innerText = r;
							alert(r);
							$(".btn").hide("slow");

							var resultName = eval("json.q" + no
									+ ".resultList.result");
							var resultJudg = eval("json.q" + no
									+ ".resultList.judg");
							$("#resultName").text(resultName);
							$("#resultJudg").text(resultJudg);
							$("#wizardResult").show("slow");
						} else {
							var q = "json.q" + no + ".question";
							q = eval(q);
							document.getElementById("question").innerText = q;

							for (i = 1; i < 5; i++) {
								var id = "#" + i;
								$(id).text("");
								$(id).attr("data-id", "");
							}
							var n = 0;
							while (eval("json.q" + no + ".answerList[" + n
									+ "]")) {
								answer = eval("json.q" + no + ".answerList["
										+ n + "].answer");
								link = eval("json.q" + no + ".answerList[" + n
										+ "].link");

								var k = n + 1;
								var id = "#" + k;
								$(id).text(answer);
								$(id).attr("data-id", link);
								n++;
							}
						}
					},
					error : function(request, status, error) {
						alert("에러: " + request.status + "\n massage"
								+ request.responseText);
					}
				});
	}
</script>

<style>
#ground {
	width: 320px;
	height: 100px;
	background-image: url('https://placeimg.com/320/100/any');
}

#startBox {
	
}

#startWizard {
	text-align: center;
	margin: 0 auto;
	padding-top: 35px;
	color: #ffffff;
}

li {
	list-style-type: none;
}
</style>
<title></title>
</head>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<h1>DaCham 위자드로 주문하기.</h1>

	<div id="ground">
		<h2 id="startWizard">
			위자드 시작하기
			</h3>
	</div>

	<ul>
		<h3 id="question"></h3>
		<li class="btn" id="1" data-id=""></li>
		<li class="btn" id="2" data-id=""></li>
		<li class="btn" id="3" data-id=""></li>
		<li class="btn" id="4" data-id=""></li>
	</ul>
	<div id="wizardResult" style="display: none">
		고객님의 위자드 결과
		<h2 id="resultName"></h2>
		<h2 id="resultJudg"></h2>
		<button id="showResultDiet">추천식단 보기</button>
	</div>
	<!-- 시간이 된다면 추가할 파트
	<div id="resultDiet" class=".col-md-8 col-md-offset-4">
		추천식단 목록
	</div> -->
	
	<form id="ResultDiet" method="GET">
		<input id="rName" type="hidden" name="rName">
		<input id="rJudg" type="hidden" name="rJudg">
	</form>

</body>
</html>