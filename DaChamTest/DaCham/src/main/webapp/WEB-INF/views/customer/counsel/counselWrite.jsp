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
			$("form").attr("action","write");
			$("form").submit();
		});
		$("#cancle").on("click",function(){
			window.location.href = "counsel";
		});
	});
</script>
</head>
<body>
<%@include file="../../main.jsp" %>
	<h1>글쓰기 페이지</h1>
	<form method = "post">
		문의분류:<select name = "counselCode">
			<option>식단문의</option>
			<option>주문문의</option>
			<option>기타</option>
		</select>
		<br><br>
		아이디: <input type = "text" name = "id" value = "id" readonly><br>
		제목 : <input type = "text" name = "counselTitle"><br>
		내용 : <textarea name = "content"></textarea><br>
		
	</form>
	<div>
		<button type = "submit" id = "insert">등록</button>
		<button id = "cancle">취소</button>
	</div>
</body>
</html>