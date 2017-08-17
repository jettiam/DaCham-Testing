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
			alert($(this).attr("data-step") + "단계~");
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
							document.getElementById("question").innerText = r;
							/* alert(r); */
							$(".btn").hide("slow");
							var resultName = eval("json.q" + no

							+ ".resultList.result");
							var resultJudg = eval("json.q" + no
									+ ".resultList.judg");
							$("#resultName").text(resultName);
							$("#resultJudg").text(resultJudg);
							$("#wizardAnswerArea").hide("slow");
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

img#startWizard {
	margin: 0;
	padding: 0;
	position: absolute;
}

#startWizardArea {
	margin: 0 auto;
	border-radius : 12px;
	
	width: 230px;
	hegith: 160px;
	
	font-size: 23px;
}

.startWizardBefore {
	background-color: #FFFFFF;
	border: 3px solid #819b3a;
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
	border: 1px solid #819b3a;
	padding: 5px;
}

li {
	list-style-type: none;
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
								<div id="startWizardArea" class="startWizardBefore">
									<img src="resources/play-button-green.png" style="width: 50px; height:50px;" />
									<span id="startWizard">위자드 시작하기</span>
								</div>
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
						
							<hr style="align:center;  border: solid 1px #5D5D5D; width: 50%; ">
							<b><h2 id="question"></h2></b>
							<hr style="align:center;  border: solid 1px #5D5D5D; width: 50%; ">							
							
							
						

						<table style="text-align: center; align:center;" id="wizardAnswerArea" class="table" >
							<tr>
								<td>
									<li class="btn" id="1" data-id=""></li>
								</td>
							</tr>
							<tr>
								<td>
									<li class="btn" id="2" data-id=""></li>
								</td>
							</tr>
							<tr>
								<td>
									<li class="btn" id="3" data-id=""></li>
								</td>
							</tr>
							<tr>
								<td>
									<li class="btn" id="4" data-id=""></li>
								</td>
							</tr>
						</table>		
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
									src="resources/number-1.png" width="60" height="60" />
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
									src="resources/number-2.png" width="60" height="60" />
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
								<span class="fa fa-bicycle" aria-hidden="true"> <img
									src="resources/number-3.png" width="60" height="60" />
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