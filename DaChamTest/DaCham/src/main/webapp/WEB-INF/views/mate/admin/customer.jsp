<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap core CSS     -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />

<!--  Material Dashboard CSS    -->
<link href="resources/assets/css/material-dashboard.css"
	rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="resources/assets/css/demo.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

<title>Insert title here</title>
<style>
.container {
	width: 1700px !important;
	margin-top : 30px !important;
}
#empDiv2 {
    display: none;
}    
</style>
<script>
	function previewImage(targetObj, View_area) {
		var preview = document.getElementById(View_area);

		var files = targetObj.files;
		for (var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/;
			if (!file.type.match(imageType)) {
				continue;
			}
			var prevImg = document.getElementById("prev_" + View_area);
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img");
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '250px';
			img.style.height = '250px';
			preview.appendChild(img);
			if (window.FileReader) {
				var reader = new FileReader();
				reader.onloadend = (function(almg) {
					return function(e) {
						almg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			}
		}
	}
	$(document)
			.ready(
					function() {
						var id = "";
						$("#customer").addClass("w3-light-gray");
						function all() {
							$
									.getJSON(
											"adminSub/memberAll",
											function(data) {
												console.log(data);
												$(".trclass").remove();
												var str = "";
												for (var i = 0; i < data.length; i++) {
													if (data[i].outDate == null) {
														str += "<tr class='trclass'><td class='ids' data-code = '"+data[i].id+"'>"
																+ data[i].id
																+ "</td>"
																+ "<td>"
																+ data[i].name
																+ "<td>"
																+ data[i].gradeCode
																+ "</td>"
																+ "</tr>"
													}
												}
												console.log(str);
												$(".memberTable").append(str);
											});
						}
						all();
						$(".memberTable").on("click", ".ids", function() {
							var id = $(this).attr('data-code');

							userMemberInfo(id);
						});
						function userMemberInfo(id) {
							$(".memberUserTable tr").remove();
							$(".memberUserTableSub tr").remove();
							$
									.getJSON(
											"adminSub/userMemberInfo/" + id,
											function(data) {
												console.log(data);
												console.log("id:" + id);

												$("#id").val(data.id);
												$("#id").attr('data-src', data.deptCode);
												$("#name").val(data.name);
												$("#name").attr('data-src', data.gradeCode);
												
												$(".name").text(data.name);
												$("#email").val(data.email);
												$("#tel").val(data.tel);
												$("#address").val(data.address);
												$(".dpetName")
														.text(
																data.deptCode
																		+ "/"
																		+ data.gradeCode);

												if (data.deptCode == "회원") {
													$("#empDiv2").css(
															'display', 'none');
													$("#empDiv").css('display',
															'none');
													

												} else {
													$("#empDiv").css('display',
													'block');  
													$("#empDiv2").css(
															'display', 'block');
													$("#salary").val(
															data.salary);
													$("#education").val(
															data.education);
													$("#bank_name").val(
															data.bank_name);
													$("#bank_user").val(
															data.bank_user);
													$("#account_Number")
															.val(
																	data.account_Number);
													$("#path_e").val(
															data.path_e);
													console.log(data.photoImg);
													$(".img").attr('src', "resources/upload/"+data.photoImg);  
													
													
												}
												/* var str = "";
												str += "<tr class='MemberUserInfo'><th>ID</th><td id='id' data-src='"+data.id+"'>"
														+ data.id
														+ "</td></tr>"
														+ "<tr><th>이름</th><td>"
														+ data.name
														+ "</td></tr><tr><th>휴대폰번호</th>"
														+ "<td>"
														+ "<input type='text' id='tel' value='"+data.tel+"'>"
														+ "<td></tr><tr><th>이메일</th>"
														+ "<td>"
														+ "<input type='text' id='email' value='"+data.email+"'>"
														+ "</td></tr><tr><th>주소</th>"
														+ "<td>"
														+ "<input type='text' id='address' value='"+data.address+"'>"
														+ "</td></tr>"
														
														$("#prev_View_area").attr("src", "displayFile?fileName="+data.photoImg); */

												/* console.log(data.length);
												var strSub = "";
												if (data.deptCode == "회원") {
													strSub += "<tr class='MemberUserInfoSub' style='display:none'><th>부서</th><td id='"+data.deptCode+"'>"
															+ "<input type='text' id = 'deptCode' value='"+data.deptCode+"'>"
															+ "</td></tr>"
															+ "<tr style='display:none'><th>직급</th><td>"
															+ "<input type='text' id='gradeCode' value='"+data.gradeCode+"'>"
															+ "</td></tr><tr style='display:none'><th>입사 경로</th>"
															+ "<td>"
															+ data.path_e
															+ "<td></tr><tr style='display:none'><th>학력</th>"
															+ "<td>"
															+ "<input type='text' id = 'education' value='"+data.education+"'>"
															+ "</td></tr><tr style='display:none'><th>연봉</th>"
															+ "<td>"
															+ "<input type='text' id= 'salary' value='"+data.salary+"'>"
															+ "</td></tr><tr style='display:none'><th>급여지급은행</th>"
															+ "<td>"
															+ "<input type='text' id='bank_name' value='"+data.bank_name+"'>"
															+ "</td></tr><tr style='display:none'><th>예금주</th>"
															+ "<td>"
															+ "<input type='text' id='bank_user' value='"+data.bank_user+"'>"
															+ "</td></tr><tr style='display:none'><th>계좌번호</th>"
															+ "<td>"
															+ "<input type='text' id ='account_Number' value='"+data.account_Number+"'>"
															+ "</td></tr>"  
															
															$("#prev_View_area").attr("style", "width:250px; height : 250px; display:none;");      
												} else {
													strSub += "<tr class='MemberUserInfoSub'><th>부서</th><td id='"+data.deptCode+"'>"
															+ "<input type='text' id = 'deptCode' value='"+data.deptCode+"'>"
															+ "</td></tr>"
															+ "<tr><th>직급</th><td>"
															+ "<input type='text' id='gradeCode' value='"+data.gradeCode+"'>" 
															+ "</td></tr><tr><th>입사 경로</th>"
															+ "<td>"
															+ data.path_e
															+ "<td></tr><tr><th>학력</th>"
															+ "<td>"
															+ "<input type='text' id = 'education' value='"+data.education+"'>"
															+ "</td></tr><tr><th>연봉</th>"
															+ "<td>"
															+ "<input type='text' id= 'salary' value='"+data.salary+"'>"
															+ "</td></tr><tr><th>급여지급은행</th>"
															+ "<td>"
															+ "<input type='text' id='bank_name' value='"+data.bank_name+"'>"
															+ "</td></tr><tr><th>예금주</th>"
															+ "<td>"
															+ "<input type='text' id='bank_user' value='"+data.bank_user+"'>"
															+ "</td></tr><tr><th>계좌번호</th>"
															+ "<td>"
															+ "<input type='text' id ='account_Number' value='"+data.account_Number+"'>"
															+ "</td></tr>"
															  
															$("#prev_View_area").attr("style", "width:250px; height : 250px; display:block;");       
												}
												$(".memberUserTableSub")
														.append(strSub);
												$(".memberUserTable").append(
														str); */

											});
						}
						$("#empUpdateBtn")
								.click(
										function() {
											var id = ($("#id").val() + "");
											var tel = ($("#tel").val() + "");
											var email = ($("#email").val() + "");
											var address = ($("#address").val() + "");
											var deptCode = ($("#id")
													.attr("data-src")+"");
											            
											var gradeCode = ($("#name")  
													.attr("data-src")+"");  
											var education = ($("#education")
													.val() + "");
											var salary = ($("#salary").val() + "");
											var bank_name = ($("#bank_name")
													.val() + "");
											var bank_user = ($("#bank_user")
													.val() + "");
											var account_Number = ($(
													"#account_Number").val() + "");  
											
											

											 $
													.ajax({
														url : 'adminSub/empUpdate',
														data : JSON
																.stringify({
																	"id" : id,
																	"tel" : tel,
																	"email" : email,
																	"address" : address,
																	"deptCode" : deptCode,
																	"gradeCode" : gradeCode, 
																	"salary" : salary,
																	"education" : education,
																	"bank_name" : bank_name,
																	"bank_user" : bank_user,
																	"account_Number" : account_Number 
																	
																}),
														dataType : 'text',
														type : 'put',
														headers : {
															"Content-Type" : "application/json",
															"X-HTTP-Method-Override" : "PUT"
														},
														success : function(data) {
      
															userMemberInfo(id);

														},
														error : function() {
														  
															userMemberInfo(id);               
														}

													}); 
										});  

						$("#empOut").click(function() {
							var id = ($("#id").val());
							$.ajax({
								url : 'adminSub/empUpdate/' + id,
								data : JSON.stringify({
									"id" : id
								}),
								dataType : 'text',
								type : 'put',
								headers : {
									"Content-Type" : "application/json",
									"X-HTTP-Method-Override" : "PUT"
								},
								success : function(data) {
									$(".memberUserTable tr").remove();
									$(".memberUserTableSub tr").remove();
									all();
									alert("회원탈퇴 되었습니다");

								},
								error : function() {
									 
								}

							});
						})

						$("#search")
								.on(
										"click",
										function() {
											$(".trclass").remove();

											var str = "";
											var searchType = $(".searchType")
													.val();
											var keyword = $("#keyword").val();
											if (keyword != "") {
												$
														.getJSON(
																"adminSub/customer/"
																		+ searchType
																		+ "/"
																		+ keyword,
																function(data) {
																	for (var i = 0; i < data.length; i++) {
																		if (data[i].outDate == null) {
																			str += "<tr class='trclass'><td class='ids' data-code = '"+data[i].id+"'>"
																					+ data[i].id
																					+ "</td>"
																					+ "<td>"
																					+ data[i].name
																					+ "</td>"
																					+ "<td>"
																					+ data[i].gradeCode
																					+ "</td>"
																					+ "</tr>"
																		}
																		$(
																				".memberTable")
																				.append(
																						str);
																	}
																	;

																});
											} else {
												alert("검색어를 입력하세요");
												all();
											}
										});
						$("#searchAll").on("click", function() {
							all();
						});

						$(".admin").on("click", function() {
							all();
						})

						$("#member")
								.on(
										"click",
										function() {
											$
													.getJSON(
															"adminSub/memberNomal",
															function(data) {
																console
																		.log(data);
																$(".trclass")
																		.remove();
																var str = "";
																for (var i = 0; i < data.length; i++) {
																	if (data[i].outDate == null) {
																		str += "<tr class='trclass'><td class='ids' data-code = '"+data[i].id+"'>"
																				+ data[i].id
																				+ "</td>"
																				+ "<td>"
																				+ data[i].name
																				+ "<td>"
																				+ data[i].gradeCode
																				+ "</td>"
																				+ "</tr>"
																	}
																}
																console
																		.log(str);
																$(
																		".memberTable")
																		.append(
																				str);
															});
										})

					});
</script>
</head>
<body>
	<%@include file="../admin/upmenu.jsp"%>
			
				<div class="container">
					<div class="container">
						<div class="col-sm-3">
							<h2>사원/회원 검색</h2>
							<div class="form-group row">
								<div class="col-sm-4">
									<select name="searchType" class="searchType form-control">
										<option value="t">
											<c:out value="${member.searchType eq 't'?'selected':'' }" />
											ID
										</option>
										<option value="c">
											<c:out value="${member.searchType eq 'c'?'selected':'' }" />
											이름
										</option>
									</select>
								</div>
								<div class="col-sm-5">
									<input type="text" name="keyword" id="keyword"
										class="form-control">
								</div>
								<div class="col-sm-3">
									<button id="search" class="btn btn-default">검색</button>
								</div>
							</div>

							<div class="col-sm-offset-8">
								&nbsp;
								<button class="admin btn btn-default btn-xs">관리자</button>
								<button class="btn btn-default btn-xs" id="member">회원</button>
							</div>
							<div id="margin">
								<pre class="member pre-scrollable" width="30">
				<table class="memberTable table table-condensed">    
					<tr>
						<th>ID</th>
						<th>이름</th>
						<th>직책</th> 
					</tr>
				</table>
			</pre>
							</div>

						</div>
						<div class="col-md-6">
							<div class="card">
								<div class="card-header" data-background-color="purple">
									<h4 class="title" style="text-align: center">프로필</h4>
									
								</div>
								<div class="card-content">
									<form>
										<div class="row">
											<div class="col-md-5">
												<div class="form-group label-floating">
													<label class="control-label">ID</label> <input type="text"
														id="id" class="form-control" disabled>
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group label-floating">
													<label class="control-label">이름</label> <input type="text"
														id="name" class="name form-control" disabled>
												</div>
											</div>
											<div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">이메일</label> <input
														type="email" id="email" class="form-control">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-4">
												<div class="form-group label-floating">
													<label class="control-label">휴대폰 번호</label> <input
														type="text" id="tel" class="form-control">
												</div>
											</div>
											<div class="col-md-8">
												<div class="form-group label-floating">
													<label class="control-label">주소</label> <input type="text"
														id="address" class="form-control">
												</div>
											</div>
										</div>
										<div id="empDiv">
											<div class="row">
												<div class="col-md-4">
													<div class="form-group label-floating">
														<label class="control-label">입사 경로</label> <input
															type="text" class="form-control" id="path_e">
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group label-floating">
														<label class="control-label">학력</label> <input type="text"
															class="form-control" id="education">
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group label-floating">
														<label class="control-label">연봉</label> <input type="text"
															class="form-control" id="salary">
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-4">
													<div class="form-group label-floating">
														<label class="control-label">급여지급은행</label> <input
															type="text" class="form-control" id="bank_name">
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group label-floating">
														<label class="control-label">계좌번호</label> <input
															type="text" class="form-control" id="account_Number">
													</div>
												</div>
												<div class="col-md-4">
													<div class="form-group label-floating">
														<label class="control-label">예금주</label> <input
															type="text" class="form-control" id="bank_user">
													</div>
												</div>
											</div>
										</div>

										<button id="empUpdateBtn" class="btn btn-primary">회원수정</button>
										<button id="empOut" class="btn btn-primary">탈퇴</button>
										<div class="clearfix"></div>
									</form>
								</div>
							</div>
						</div>
						<div id="empDiv2" display:none>
							<div class="col-md-3">
								<div class="card card-profile">
									<div class="card-avatar">
										<a href="#pablo"> <img class="img"/>
										</a>
									</div>

									<div class="content">
										<h6 class="dpetName category text-gray"></h6>
										<h4 class="name card-title"></h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			

		
	

	

</body>
</html>