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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href='https://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
<script src="resources/json2.js"></script>
<script>
	$(document).ready(function() {
		$("#dietOrder").addClass("w3-gray");
		step = 1;
		stepArr = new Array();
		$("#startWizard").click(function() {
			
			$(this).text("다시 시작하기");

			$("#wizardResult").hide("slow");
			$(".btn").show("slow");
			step = 1;
			$("#wizardStepLogo").attr("colspan", "");
			$("#wizardStartButton").attr("colspan", "");
			$("#wizardStepArea").empty();
			getWizard(1);

		});

		$(".btn").click(function() {
			var link = $(this).attr("data-id");
			getWizard(link);
		});

		$("#showResultDiet").click(function() {
			$("#rName").val($("#resultName").text());
			$("#rJudg").val($("#resultJudg").text());
			$("#ResultDiet").attr("action", "recommendDiet");
			$("#ResultDiet").submit();
		});

		$(document).on("click", ".step", function() {
			//alert("클릭되었습니다."+$(this).attr("data-link"));
			$("#wizardStepLogo").attr("colspan", $(this).attr("data-step"));
			$("#wizardStartButton").attr("colspan", $(this).attr("data-step"));
			$(this).nextAll("td").remove();
			step = parseInt($(this).attr("data-step")) + 1;
			alert("step: " + step + ", link: " + $(this).attr("data-link"));
			getStep($(this).attr("data-link"));
			$(this).nextAll("td").remove();

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

						var r = "json.q" + no + ".result";
						r = eval(r);
						if (r == "결과") {
							document.getElementById("question").innerText = "";
							/* alert(r); */
							$(".btn").hide("slow");
							var resultName = eval("json.q" + no
							+ ".resultList.result");
							var resultJudg = eval("json.q" + no
									+ ".resultList.judg");
							$("#resultName").text(resultName);							
							switch(resultJudg){
							case "주의" : 
								$("#resultJudg").css("color", "#6B9900");
								break;
							case "위험" :
								$("#resultJudg").css("color", "#993800");
								break;
							case "고위험" :
								$("#resultJudg").css("color", "#980000");
								break;
							default : 
								break;
							}
							$("#resultJudg").text(resultJudg);		
							
							
							$("#wizardAnswerArea").hide("fast");
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
								$(id).text(k+". "+answer);
								$(id).attr("data-id", link);
								n++;
							}
						}
						stepArr[step] = no;

						var a = "<td class='step' data-step='"+step+"' data-link='"+no+"'>"
								+ step + "단계</td>";
						$("#wizardStepLogo").attr('colspan', step);
						$("#wizardStartButton").attr("colspan", step);
						$("#wizardStepArea").append(a);
						step++;
					},
					error : function(request, status, error) {
						alert("에러: " + request.status + "\n massage"
								+ request.responseText);
					}
				});
	}
	function getStep(no) {
		$.ajax({
			url : "wizardTestGetWizard",
			type : "GET",
			dataType : "text",
			async : true,
			success : function(data) {
				var json = JSON.parse(data);

				var r = "json.q" + no + ".result";
				r = eval(r);
				if (r == "결과") {
					document.getElementById("question").innerText = r;
					/* alert(r); */
					$(".btn").hide("slow");
					var resultName = eval("json.q" + no

					+ ".resultList.result");
					var resultJudg = eval("json.q" + no + ".resultList.judg");
					$("#resultName").text(resultName);
					$("#resultJudg").text(resultJudg);
					
					$("#wizardResult").show("slow");
					$("#wizardAnswerArea").hide("slow");
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
					while (eval("json.q" + no + ".answerList[" + n + "]")) {
						answer = eval("json.q" + no + ".answerList[" + n
								+ "].answer");
						link = eval("json.q" + no + ".answerList[" + n
								+ "].link");
						var k = n + 1;
						var id = "#" + k;
						$(id).text(answer);
						$(id).attr("data-id", link);
						n++;
					}
				}
				stepArr[step] = no;
				/* var a = "<td class='step' data-step='"+step+"' data-link='"+no+"'>"+step+"단계</td>"; */

				$("#wizardStepLogo").attr('colspan', step);
				$("#wizardStartButton").attr("colspan", step);
				//$("#wizardStepArea").append(a);											

			},
			error : function(request, status, error) {
				alert("에러: " + request.status + "\n massage"
						+ request.responseText);
			}
		});

	}
</script>

<style>
.ground {
	width: 320px;
	height: 100px;
}

button#startWizard {
  background:#819b3a;
  color:#fff;
  border:none;
  width: 100%;
  position:relative;
  height:60px;
 font-size : 1.45em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}


button#startWizard:hover{
  background:#fff;
  color:#819b3a;
}

button#startWizard:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #819b3a;
  transition:400ms ease all;
}
button#startWizard:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button#startWizard:hover:before,button#startWizard:hover:after{
  width:100%;
  transition:800ms ease all;
}



#startWizardArea {
	margin: 0 auto;
	border-radius : 12px;
	
	
	hegith: 160px;
	cursor: pointer;
	font-size: 23px;
}

.startWizardBefore {
	background-color: #FFFFFF;
	
}

.startWizardAfter {
	background-color: #819b3a;
}

h2#question {
	display: block;
}

#startBox {
	
}

#startWizard {
	text-align: center;
	margin: 0 auto;
}

.testing {
	border-radius: 5px;
	
	padding: 5px;
}

li {
	list-style-type: none;
}

#resultName {
	color: #6F6F6F;
	font-size: 4em;
}
#resultJudg {	
	font-size: 8em;
}

.result{
	display: inline-block;
}
#wizardResult{
	margin-top: -25px;
}

 #showResultDiet:hover { color: #212121;}

.action-button
{
	position: relative;
	padding: 10px 40px;
  	margin: 0px 10px 10px 0px;
	border-radius: 10px;	
	font-size: 25px;
	color: #fff;
	text-decoration: none !important;	
}

.green
{
	background-color: #82BF56;
	border-bottom: 5px solid #669644;
	text-shadow: 0px -2px #669644;
}

.yellow
{
	background-color: #F2CF66;
	border-bottom: 5px solid #D1B358;
	border-right : 3px solid #D1B358;
	text-shadow: 0px -2px #D1B358;
}

</style>
<link rel="stylesheet" href="resources/style.css">
<title></title>
</head>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<!-- 위자드 실행 영역 -->
	<section class="purpose section">
		<div class="container">
			<h2 class="title">Dacham Wizard</h2>
			<div class="row">
				<div id="ground" class="container col-sm-4 testing">
					<table id="wizardStep" class="table table-bordered">
						<tr>
							<td id="wizardStartButton">							
									<button id="startWizard">위자드 시작하기</button>								
							</td>
						</tr>
						<tr>
							<td id="wizardStepLogo">
							<img src="resources/salad.png"
							style="width:100px; height:100px; margin-bottom: 10px; "/></td>
						</tr>
						<tr id="wizardStepArea">
						</tr>
					</table>
				</div>

				<div  class="col-sm-8 testing">
						
											
							<b><h2 style="margin-top: 15px;" id="question"></h2></b>
						<table style="text-align: center; align:center;" id="wizardAnswerArea" class="table" >
							<tr>
								<td style="border:0px;">
									<li class="btn" id="1" data-id=""></li>
								</td>
							</tr>
							<tr>
								<td style="border:0px;">
									<li class="btn" id="2" data-id=""></li>
								</td>
							</tr>
							<tr>
								<td style="border:0px;">
									<li class="btn" id="3" data-id=""></li>
								</td>
							</tr>
							<tr>
								<td style="border:0px;">
									<li class="btn" id="4" data-id=""></li>
								</td>
							</tr>
						</table>		
				
					
					<div id="wizardResult"	style="display: none">
						<div style="font-size: 2em;">
							<c:if test="${not empty sessionScope.memberName}">
								${memberName} 님의 위자드 결과
							</c:if>
							<c:if test="${empty sessionScope.memberName}">
								방문자 님의 위자드 결과
							</c:if>
						</div>
						<div class="result" id="resultName">병명</div>
						<div class="result" id="resultJudg">위험도</div>
						
						<div>
							<button class="action-button yellow" id="showResultDiet">추천식단 보기</button>					
						</div>
					</div>
					<!-- 시간이 된다면 추가할 파트
	<div id="resultDiet" class=".col-md-8 col-md-offset-4">
		추천식단 목록
	</div> -->
				</div>
			</div>


			<form id="ResultDiet" method="GET">
				<input id="rName" type="hidden" name="rName"> <input
					id="rJudg" type="hidden" name="rJudg">
			</form>

		</div>
	</section>


	<section class="purpose section">
		<div class="container">
			<h2 class="title">About Wizard</h2>
			<div class="row">
				<div class="col-sm-4">
					<div class="vira-card">
						<div class="vira-card-header">
							<div class="card-icon">
								<span class="fa fa-one" aria-hidden="true"> <img
									src="resources/number-1.png" style="width: 50px; hegit: 50px;" />
								</span>
							</div>
						</div>
						<div class="vira-card-content">
							<h3>간편한 실행</h3>
							<p>다참 위자드를 실행 하세요.</p>
							<p>다참 위자드가 당신에게 맞는 식단을 추천해줄꺼에요.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="vira-card">
						<div class="vira-card-header">
							<div class="card-icon">
								<span class="fa fa-two" aria-hidden="true"> <img
									src="resources/number-2.png" style="width: 50px; hegit: 50px;" />
								</span>
							</div>
						</div>
						<div class="vira-card-content">
							<h3>맞춤화된 단계</h3>
							<p>질환, 건강측정 정보 등을 선택하세요.</p>
							<p>개인에 따라 질문지의 단계에 차이가 있을 수 있어요.</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="vira-card">
						<div class="vira-card-header">
							<div class="card-icon">
								<span class="fa fa-three" aria-hidden="true"> <img
									src="resources/number-3.png" style="width: 50px; hegit: 50px;" />
								</span>
							</div>
						</div>
						<div class="vira-card-content">
							<h3>알맞은 식단 추천</h3>
							<p>응답을 통해 사용자에게 최적화된 식단을 추천합니다.</p>
							<p>반찬이 마음에 안들까봐 걱정하지 마세요.</P>
							<p>식단 구매 메뉴에서 우리는 많은 선택지를 제공합니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>

	</section>
	
	


	<footer>
		<%@include file="../../footer.jsp"%>
	</footer>

</body>
</html>