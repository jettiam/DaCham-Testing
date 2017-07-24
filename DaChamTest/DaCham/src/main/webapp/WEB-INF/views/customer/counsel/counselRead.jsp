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
	$(document).ready(function(){
		$("#list").on("click",function(){
			window.location.href = "counsel";
		});
		$("#counselDelete").on("click",function(){
			if(confirm("삭제하시겠습니까?")){
				$("#counselRead").attr('action','counselDelete');
				$("#counselRead").submit();
			}
		});
		
		$("#counselUpdate").on("click",function(){
			$("#counselRead").attr("action","counselUpdate");
			$("#counselRead").attr("method","get");
			$("#counselRead").submit();
		});
	});

</script>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<div class="container">
	<div>
		<div class=""><h3>${read.counselTitle }</h3></div>
		<div class="row">
			<div class="col-sm-3">문의분류 ${read.counselItemName}</div>
			<div class="col-sm-1">${read.customer}</div>
			<div class="col-sm-2 col-sm-offset-6">${read.counselDate}</div>		
		</div>
		<div>${read.counselContent}</div> 	
	</div>
	
	<hr><hr>
	<div>
		작성자 : <input type = "text" name = "adviser" value = "${read.adviser}">
		
		내용 : ${read.answer}
	</div>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>

	<div align = "right">
		<button id = "list" class="btn btn-warning myPageBtn">목록</button>
		<button id = "counselUpdate" class="btn btn-warning myPageBtn">수정</button>
		<button id = "counselDelete" class="btn btn-warning myPageBtn">삭제</button>
	</div>
	
</div>
	<form  id="counselRead">
		<input type="hidden" name="counselCode" value="${read.counselCode}">		
	</form>
</body>
</html>