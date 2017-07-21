<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			formObj.attr("action","/counselUpdate");
			formObj.attr("method","get");
			formObj.submit();
		});
	});
		
	});
	

</script>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
	<div>
		<form  id="counselRead" method ="post">
		<input type="hidden" name="counselCode" value="${read.counselCode}">
			제목 : <input type = "text" name = "counselTitle" value = "${read.counselTitle }" readonly><br>
			작성자 : <input type = "text" name = "${read.customer}" value = "${read.customer}" readonly>
			작성일 : <input type = "text" name = "regdate" value = "${read.counselDate}"readonly><br><br>
			내용 : <textarea name = "content" >${read.counselContent}</textarea>
		
		</form>
		<button id = "counselUpdate" class="btn btn-warning myPageBtn">수정</button>
		<button id = "counselDelete" class="btn btn-warning myPageBtn">삭제</button>
		
	</div>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<hr><hr><br>
	<div>
		작성자 : <input type = "text" name = "admin" value = "관리자">
		작성일 : <input type = "text" name = "regdate"><br>
		내용 : ${read.answer}
	</div>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<div align = "right">
		<button id = "list" class="btn btn-warning myPageBtn">목록</button>
		<button id = "modify" class="btn btn-warning myPageBtn">수정</button>
		<button id = "remove" class="btn btn-warning myPageBtn">삭제</button>
	</div>
</body>
</html>