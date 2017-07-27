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

<title>Insert title here</title>
<script>
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
						$(document.body).on("click", ".ids", function() {
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

												var str = "";
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
												console.log(data.length);
												var strSub = "";
												if (data.deptCode == "회원") {
													strSub += "<tr class='MemberUserInfoSub' style='display:none'><th>부서</th><td id='"+data.deptCode+"'>"
															+ "<input type='text' id = 'deptCode' value='"+data.deptCode+"'>"
															+ "</td></tr>"
															+ "<tr style='display:none'><th>직급</th><td>"
															+ "<input type='text' id=''gradeCode' value='"+data.gradeCode+"'>"
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
												} else {
													strSub += "<tr class='MemberUserInfoSub'><th>부서</th><td id='"+data.deptCode+"'>"
															+ "<input type='text' id = 'deptCode' value='"+data.deptCode+"'>"
															+ "</td></tr>"
															+ "<tr><th>직급</th><td>"
															+ "<input type='text' id=''gradeCode' value='"+data.gradeCode+"'>"
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
												}
												$(".memberUserTableSub")
														.append(strSub);
												$(".memberUserTable").append(
														str);

											});
						}
						$("#empUpdateBtn")
								.click(
										function() {
											var id = ($("#id").attr('data-src') + "");
											var tel = ($("#tel").val() + "");
											var email = ($("#email").val() + "");
											var address = ($("#address").val() + "");
											var deptCode = ($("#deptCode")
													.val() + "");
											var gradeCode = ($("#gradeCode")
													.val() + "");
											var education = ($("#education")
													.val() + "");
											var salary = ($("#salary").val() + "");
											var bank_name = ($("#bank_name")
													.val() + "");
											var bank_user = ($("#bank_user")
													.val() + "");
											var account_Number = ($(
													"#account_Number").val() + "");

											console.log(id + tel + email
													+ address + deptCode
													+ gradeCode + education
													+ salary + bank_name
													+ bank_user
													+ account_Number);

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
															alert("실패");
														}

													});
										});

						$("#empOut").click(function() {
							var id = ($("#id").attr('data-src'));
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
									alert("실패");
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
										});
						$("#searchAll").on("click", function(){
							all();  
						});  

					});
</script>
</head>
<body>
	<%@include file="../admin/upmenu.jsp"%>
	<div class="container">
		<div class="col-sm-4">
			<h2>회원검색</h2>
			<div class="form-group row">
				<div class="col-sm-3">     
					<select name="searchType" class="searchType form-control">
						<option value="t">
							<c:out value="${member.searchType eq 't'?'selected':'' }"/>
							ID</option>           
						<option value="c">
							<c:out value="${member.searchType eq 'c'?'selected':'' }"/>
							이름</option>
						<option value="a">
							<c:out value="${member.searchType eq 'c'?'selected':'' }"/>
							직책</option>  
					</select>  
				</div>
				<div class="col-sm-4">
					<input type="text" name="keyword" id="keyword" class="form-control">
				</div>
				<div class="col-sm-5">
					<button id="search" class="btn btn-default">검색</button>
					<button id="searchAll" class="btn btn-default">전체</button>
				</div>
			</div>
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
		<div class="col-sm-4">
			<table class="memberUserTable table table-condensed">

			</table>
		</div>
		<div class="col-sm-4">
			<table class="memberUserTableSub table table-condensed">

			</table>

		</div>
		<div class="col-sm-2 col-sm-offset-10">
			<button id="empUpdateBtn" class="btn btn-primary">회원수정</button>
			<button id="empOut" class="btn btn-primary">탈퇴</button>
		</div>
	</div>

</body>
</html>