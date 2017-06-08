<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#insert").on("click",function(){			
			$("form").submit();
		});
		$("#cancle").on("click",function(){
			window.location.href = "counsel";
		});
	});
</script>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
	<h1>글쓰기 페이지</h1>
	<form method = "post" action="write">
		문의분류:<select name = "counselItemCode">
			<option value="1">식단문의</option>
			<option value="2">특별식단</option>
			<option value="3">배송문의</option>
			<option value="4">기타문의</option>
		</select>
		<br><br>
		아이디: <input type = "text" name = "customer" value = "${sessionScope.customerId}" readonly><br>
		제목 : <input type = "text" name ="counselTitle"><br>
		내용 : <textarea name = "counselContent"></textarea><br>
		
	</form>
	<div>
		<button id = "insert">등록</button>
		<button id = "cancle">취소</button>
	</div>
</body>
</html>