<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#list").on("click",function(){
			window.location.href = "counsel";
		});
	});
</script>
</head>
<body>
	<div>
		<form method ="post">
			제목 : <input type = "text" name = "title" value = "질문 있습니다."><br>
			작성자 : <input type = "text" name = "writer">
			작성일 : <input type = "text" name = "regdate">
			조회 : <input type = "text" name = "viewcnt"><br>
			내용 : <textarea name = "content"></textarea>
		</form>
	</div>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<hr><hr><br>
	<div>
		작성자 : <input type = "text" name = "admin" value = "관리자">
		작성일 : <input type = "text" name = "regdate"><br>
		내용 : <textarea name = "content">답변입니다.</textarea>
	</div>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	<div align = "right">
		<button id = "list">목록</button>
		<button id = "modify">수정</button>
		<button id = "remove">삭제</button>
	</div>
</body>
</html>