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
<script type="text/javascript"
	src="resources/bootstrap-filestyle.min.js">
	
</script>
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
<style >
.form-group{
	margin: 0px 0 0 0 ;    
}
</style>
<script>
function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area);

	var files = targetObj.files
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
		img.style.height = '300px';
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
						$("#emp").addClass("w3-light-gray");
						$("#id")
								.blur(
										function() {
											//alert("블러 돌아감")
											var id = $("#id").val();
											if (id == "") {
												$("#idCheck").html(
														"아이디를 입력해주세요.");
											} else {
												$
														.getJSON(
																"idCheck/" + id,
																function(data) {
																	var idCheck = data.idCheck
																	console
																			.log(idCheck);
																	if (idCheck == 1) {
																		$(
																				"#idCheck")
																				.html(
																						"사용 중인 아이디입니다.");
																		$(
																				"#idCheck")
																				.attr(
																						"data-idCheck",
																						"false");
																	} else {
																		$(
																				"#idCheck")
																				.html(
																						"<span id='trueId'>사용할 수 있는 아이디입니다.</span>");
																		$(
																				"#idCheck")
																				.attr(
																						"data-idCheck",
																						"true");
																	}
																});
											}
										});
						$("#password").blur(function() {
							var passwdLength = $("#password").val().length;
							if (passwdLength<6 || passwdLength>18) {
								$("#passwd").css("color", "red");
								$("#passwd").attr("data-passwd", "false");
							} else {
								$("#passwd").css("color", "black");
								$("#passwd").attr("data-passwd", "true");
							}
						});
						$("#rePassword").blur(
								function() {
									var password = $("#password").val();
									var rePassword = $("#rePassword").val();
									if (password == rePassword) {
										$("#passwdCheck").html("");
										$("#passwdCheck").attr(
												"data-passwdCheck", "true");
									} else {
										$("#passwdCheck").html(
												"비밀번호가 일치하지 않습니다.");
										$("#passwdCheck").attr(
												"data-passwdCheck", "false");
									}
								});
						$("#name").blur(
								function() {
									var name = $("#name").val();
									if (name == "") {
										$("#nameCheck").html("이름을 입력하세요.");
										$("#nameCheck").attr("data-nameCheck",
												"false");
									} else {
										$("#nameCheck").html("");
										$("#nameCheck").attr("data-nameCheck",
												"true");
									}
								});
						$("#tel").blur(function() {
							var tel = $("#tel").val();
							if (tel.match(/-/) == "-") {
								$("#telCheck").css("color", "red");
								$("#telCheck").attr("data-telCheck", "false");
							} else {
								$("#telCheck").css("color", "black");
								$("#telCheck").attr("data-telCheck", "true");
							}
						});

						$("#email").blur(
								function() {
									var tel = $("#email").val();
									if (tel.match(/@/) != "@") {
										$("#emailCheck").html(
												"이메일을 정확히 입력해주세요.");
										$("#emailCheck").css("color", "red");
										$("#emailCheck").attr(
												"data-emailCheck", "false");
									} else {
										$("#emailCheck").html("");
										$("#emailCheck").attr(
												"data-emailCheck", "true");
									}
								});

						$("#address").blur(
								function() {
									var name = $("#address").val();
									if (name == "") {
										$("#addressCheck").html("주소를 입력하세요.");
										$("#addressCheck").attr(
												"data-addressCheck", "false");
									} else {
										$("#addressCheck").html("");
										$("#addressCheck").attr(
												"data-addressCheck", "true");
									}
								});
						$("#path_e").blur(
								function() {
									var path_e = $("#address").val();
									if (path_e == "") {
										$("#path_eCheck").html(
												"입사경로(특채, 공채)를 입력하세요.");
										$("#path_eCheck").attr(
												"data-path_eCheck", "false");
									} else {
										$("#path_eCheck").html("");
										$("#path_eCheck").attr(
												"data-path_eCheck", "true");
									}
								});
						$("#education")
								.blur(
										function() {
											var education = $("#education")
													.val();
											if (education == "") {
												$("#educationCheck").html(
														"학력을 입력하세요.");
												$("#educationCheck").attr(
														"data-educationCheck",
														"false");
											} else {
												$("#educationCheck").html("");
												$("#educationCheck").attr(
														"data-educationCheck",
														"true");
											}
										});

						$("#salary").blur(
								function() {
									var salary = $("#salary").val();
									if (salary == "") {
										$("#salaryCheck").html("연봉을 입력하세요.");
										$("#salaryCheck").attr(
												"data-salaryCheck", "false");
									} else {
										$("#salaryCheck").html("");
										$("#salaryCheck").attr(
												"data-salaryCheck", "true");
									}
								});

						$("#bank_name")
								.blur(
										function() {
											var bank_name = $("#bank_name")
													.val();
											if (bank_name == "") {
												$("#bank_nameCheck").html(
														"입금 은행을 입력하세요.");
												$("#bank_nameCheck").attr(
														"data-bank_nameCheck",
														"false");
											} else {
												$("#bank_nameCheck").html("");
												$("#bank_nameCheck").attr(
														"data-bank_nameCheck",
														"true");
											}
										});

						$("#bank_user")
								.blur(
										function() {
											var bank_user = $("#bank_user")
													.val();
											if (bank_user == "") {
												$("#bank_userCheck").html(
														"예금주를 입력하세요.");
												$("#bank_userCheck").attr(
														"data-bank_userCheck",
														"false");
											} else {
												$("#bank_userCheck").html("");
												$("#bank_userCheck").attr(
														"data-bank_userCheck",
														"true");
											}
										});

						$("#Account_Number").blur(
								function() {
									var Account_Number = $("#Account_Number")
											.val();
									if (Account_Number == "") {
										$("#Account_NumberCheck").html(
												"계좌번호를 입력하세요.");
										$("#Account_NumberCheck").attr(
												"data-Account_NumberCheck",
												"false");
									} else {
										$("#Account_NumberCheck").html("");
										$("#Account_NumberCheck").attr(
												"data-Account_NumberCheck",
												"true");
									}
								});

						$("#deptCode").blur(
								function() {
									var deptCode = $("#deptCode").val();
									if (deptCode == "") {
										$("#deptCodeCheck").html("부서를 입력하세요");
										$("#deptCodeCheck").attr(
												"data-deptCodeCheck", "false");
									} else {
										$("#deptCodeCheck").html("");
										$("#deptCodeCheck").attr(
												"data-deptCodeCheck", "true");
									}
								});

						$("#gradeCode")
								.blur(
										function() {
											var gradeCode = $("#gradeCode")
													.val();
											if (gradeCode == "") {
												$("#gradeCodeCheck").html(
														"직급을 입력하세요");
												$("#gradeCodeCheck").attr(
														"data-gradeCodeCheck",
														"false");
											} else {
												$("#gradeCodeCheck").html("");
												$("#gradeCodeCheck").attr(
														"data-gradeCodeCheck",
														"true");
											}
										});

						$("#join")
								.click(
										function() {
											if ($("#idCheck").attr(
													"data-idCheck") == "false") {
												alert("아이디를 확인해주세요.");
												return;
											} else if ($("#passwd").attr(
													"data-passwd") == "false"
													|| $("#passwdCheck").attr(
															"data-passwdCheck") == "false") {
												alert("비밀번호를 확인해주세요.");
												return;
											} else if ($("#nameCheck").attr(
													"data-nameCheck") == "false") {
												alert("이름을 확인해주세요.");
												return;
											} else if ($("#telCheck").attr(
													"data-telCheck") == "false") {
												alert("전화번호를 확인해주세요.");
												return;
											} else if ($("#emailCheck").attr(
													"data-emailCheck") == "false") {
												alert("이메일을 확인해주세요.");
												return;
											} else if ($("#addressCheck").attr(
													"data-addressCheck") == "false") {
												alert("주소를 확인해주세요.");
												return;
											} else if ($("#deptCodeCheck")
													.attr("data-deptCodeCheck") == "false") {
												alert("부서 명을 입력하세요");
												return;
											} else if ($("#gradeCodeCheck")
													.attr("data-gradeCodeCheck") == "false") {
												alert("직급을 입력하세요");
												return;
											} else if ($("#path_eCheck").attr(
													"data-path_eCheck") == "false") {
												alert("입사경로를 입력해주세요(특채, 공채)");
												return;
											} else if ($("#educationCheck")
													.attr("data-educationCheck") == "false") {
												alert("최종 학력을 입력하세요");
												return;
											} else if ($("#salaryCheck").attr(
													"data-salaryCheck") == "false") {
												alert("연봉을 입력하세요.");
												return;
											} else if ($("#bank_nameCheck")
													.attr("data-bank_nameCheck") == "false") {
												alert("입금 은행명을 입력하세요");
												return;
											} else if ($("#bank_userCheck")
													.attr("data-bank_userCheck") == "false") {
												alert("예금주 명을 입력하세요");
												return;
											} else if ($("#Account_NumberCheck")
													.attr(
															"data-Account_NumberCheck") == "false") {
												alert("계좌번호를 입력하세요");
												return;
											} else {
												$("#joinForm").submit();
											}
										})
						$("#cancle").click(function() {
							window.location.href = "adminMain";
						});
					});
</script>
</head>
<style>
.topMar{
	margin-top: 4cm;  
}
#password,#rePassword{
font-family:sans-serif !important;
}
</style>
<body>
	<%@include file="../admin/upmenu.jsp"%>
	<div id=".container-fluid">
		<div class="topMar">
		<div class="col-sm-1">
		</div>
		<form action="empjoin" method="post" class="form-horizontal" 
			id="joinForm" enctype="multipart/form-data">
			<div class="col-sm-2">
			<label>증명 사진</label>
			<div id="dietImg">
						<div id="View_area">
							<img id="prev_View_area" src="http://placehold.it/250x300">
						</div>
						<input type="file" class="filestyle" data-input="false"
							name="file" placeholder="식단이미지 올리기" id="profile_pt"
							onchange="previewImage(this,'View_area')">      
					</div>
		</div>    
			<div class="col-sm-4">
			<div class="form-group">
				<label for="id" class="control-label col-sm-2 col-sm-offset-1">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id" class="form-control ">
				</div>
				<div class="col-sm-4" id="idCheck" data-idCheck="false"></div>
			</div>
			<div class="form-group">
				<label for="password" class="control-label col-sm-2 col-sm-offset-1">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="password" name="passwd"
						class="form-control ">
				</div>
				<div class="col-sm-4" id="passwd" data-passwd="false">비밀번호 길이
					6~18자</div>
			</div>
			<div class="form-group">
				<label for="RePassword"
					class="control-label col-sm-2 col-sm-offset-1">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" id="rePassword" name="rePasswd"
						class="form-control ">
				</div>
				<div class="col-sm-4" id="passwdCheck" data-passwdCheck="false"></div>
			</div>
			<div class="form-group"> 
				<label for="name" class="control-label col-sm-2 col-sm-offset-1">이름</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control ">
				</div>
				<div class="col-sm-4" id="nameCheck" data-nameCheck="false"></div>
			</div>
			<div class="form-group">
				<label for="tel" class="control-label col-sm-2 col-sm-offset-1">휴대폰번호</label>
				<div class="col-sm-3">
					<input type="tel" id="tel" name="tel" class="form-control ">
				</div>
				<div class="col-sm-4" id="telCheck" data-telCheck="false">"-"
					입력하지 마세요.</div>
			</div>
			<div class="form-group">
				<label for="email" class="control-label col-sm-2 col-sm-offset-1">이메일</label>
				<div class="col-sm-3">
					<input type="email" id="email" name="email" class="form-control ">
				</div>
				<div class="col-sm-4" id="emailCheck"></div>
			</div>
			<div class="form-group">
				<label for="address" class="control-label col-sm-2 col-sm-offset-1">주소</label>
				<div class="col-sm-3">
					<input type="text" id="address" name="address"
						class="form-control ">
				</div>
				<div class="col-sm-4" id="addressCheck" data-addressCheck="false"></div>
			</div>
			</div>
				<div class="col-sm-5">
				<div class="form-group">
					<label for="deptCode"
						class="control-label col-sm-2 col-sm-offset-1">부서</label>
					<div class="col-sm-3">
						<input type="text" id="deptCode" name="deptCode"
							class="form-control ">
					</div>
					<div class="col-sm-4" id="deptCodeCheck" data-deptCodeCheck="false"></div>
				</div>

				<div class="form-group">
					<label for="gradeCode"
						class="control-label col-sm-2 col-sm-offset-1">직급</label>
					<div class="col-sm-3">
						<input type="text" id="gradeCode" name="gradeCode"
							class="form-control ">
					</div>
					<div class="col-sm-4" id="gradeCodeCheck"
						data-gradeCodeCheck="false"></div>
				</div>



				<div class="form-group">
					<label for="path_e" class="control-label col-sm-2 col-sm-offset-1">입사
						경로</label>
					<div class="col-sm-3">
						<input type="text" id="path_e" name="path_e" class="form-control ">
					</div>
					<div class="col-sm-4" id="path_eCheck" data-path_eCheck="false"></div>
				</div>

				<div class="form-group">
					<label for="education"
						class="control-label col-sm-2 col-sm-offset-1">학력</label>
					<div class="col-sm-3">
						<input type="text" id="education" name="education"
							class="form-control ">
					</div>
					<div class="col-sm-4" id="educationCheck"
						data-educationCheck="false"></div>
				</div>

				<div class="form-group">
					<label for="salary" class="control-label col-sm-2 col-sm-offset-1">연봉</label>
					<div class="col-sm-3">
						<input type="text" id="salary" name="salary" class="form-control ">
					</div>
					<div class="col-sm-4" id="salaryCheck" data-salaryCheck="false"></div>
				</div>

				<div class="form-group">
					<label for="bank_name"
						class="control-label col-sm-2 col-sm-offset-1">급여지급은행</label>
					<div class="col-sm-3">
						<input type="text" id="bank_name" name="bank_name"
							class="form-control ">
					</div>
					<div class="col-sm-4" id="bank_nameCheck"
						data-bank_nameCheck="false"></div>
				</div>

				<div class="form-group">
					<label for="bank_user"
						class="control-label col-sm-2 col-sm-offset-1">예금주</label>
					<div class="col-sm-3">
						<input type="text" id="bank_user" name="bank_user"
							class="form-control ">
					</div>
					<div class="col-sm-4" id="bank_userCheck"
						data-bank_userCheck="false"></div>
				</div>

				<div class="form-group">
					<label for="Account_Number"
						class="control-label col-sm-2 col-sm-offset-1">계좌번호</label>
					<div class="col-sm-3">
						<input type="text" id="Account_Number" name="Account_Number"
							class="form-control ">
					</div>
					<div class="col-sm-4" id="Account_NumberCheck"
						data-Account_NumberCheck="false"></div>
				</div>
				
		</form>
  		</div>
		</div>
		<div class="col-sm-offset-10">      
			<button id="join" class="btn btn-default">회원가입</button> 
			<button id="cancle" class="btn btn-default">취소</button>
		</div>
		
	

</body>
</html>