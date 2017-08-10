<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
	$(document).ready(function() {
		$("#list").on("click", function() {
			window.location.href = "counsel";
		});
		$("#counselDelete").on("click", function() {
			if (confirm("삭제하시겠습니까?")) {
				$("#counselRead").attr('action', 'counselDelete');
				$("#counselRead").attr("method", "post");
				$("#counselRead").submit();
			}
		});

		$("#counselUpdate").on("click", function() {
			$("#counselRead").attr("action", "counselUpdate");
			$("#counselRead").attr("method", "get");
			$("#counselRead").submit();
		});
		$("#counsel").addClass("w3-gray");
	});
</script>
<style>
.counselText {
	padding:30px 0;
}

.counselTable {
	width: 100%;
}

.counselTable th {
	height: auto;
	padding: 10px 0;
}

.table80 {
	width: 80%;
}

.table10 {
	width: 10%;
}
</style>
</head>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<div class="container">
		<div class="row">
			<table class="counselTable">
				<tr>
					<th colspan="3" class="h3 text-center">${read.counselTitle }</th>
				</tr>
				<tr>
					<td class="table80 "><strong>분류</strong></td>
					<td class="table10 text-center"><strong>작성자</strong></td>
					<td class="table10 text-center"><strong>작성일</strong></td>
				</tr>
				<tr>
					<td class="table80">${read.counselItemName}</td>
					<td class="table10 text-center">${read.customer}</td>
					<td class="table10 text-center">${read.counselDate}</td>
				</tr>
				<tr>
					<td colspan="3" class="counselText">${read.counselContent}</td>
				</tr>
				<tr>
					<td colspan="3"><hr style="height:1px;border-width:0;color:#aaa;background-color:#aaa" noshade="noshade"></td>
				</tr>
				<c:if test="${not empty read.adviser}">
				<tr>
					<td></td>
					<td></td>
					<td class="text-center"><strong>상담자</strong></td>
				</tr>
				
				<tr>
					<td></td>
					<td></td>
					<td class="text-center">${read.adviser}</td>
				</tr>
				<tr>
					<td colspan="3"  class="counselText">${read.answer}</td>
				</tr>
				</c:if>
				<c:if test="${empty read.adviser}">				
				<tr>	<td colspan="3"  class="counselText">아직 답변 내용이 없습니다.</td>
				</tr>
				</c:if>
			</table>

		</div>
		<div align="right">
			<button id="list" class="btn btn-warning myPageBtn">목록</button>
			<button id="counselUpdate" class="btn btn-warning myPageBtn">수정</button>
			<button id="counselDelete" class="btn btn-warning myPageBtn">삭제</button>
		</div>

	</div>
	<form id="counselRead">
		<input type="hidden" name="counselCode" value="${read.counselCode}">
	</form>
	<footer>
		<%@include file="../../footer.jsp"%>
	</footer>
</body>
</html>