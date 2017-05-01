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
		$("#write").on("click",function(){
			window.location.href = "write";
		});
	});
</script>
</head>
<body>
<!-- 	<form action = "write" method = "get"> -->
<%-- 		<input type = "hidden" name = "id" value = "${a. }"> --%>
<!-- 	</form> -->
		<table border = 3>
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>답변</th>
			</tr>
			<tr>
				<td>1</td>
				<td><a href = "read">질문 있습니다.</a></td>
				<td>김작성</td>
				<td>2017-05-01</td>
				<td>처리완료</td>
			</tr>
		</table>
		<div>
			<button id = "write">글쓰기</button>
		</div>
		<div>
			이메일문의
			doifjewo@dacham.com(그냥 네모 틀)
		</div>
		<div>
			전화문의
			1004-0000(그냥 네모 틀)
		</div>
	
</body>
</html>
<!-- localhost:8080/dacham/counsel -->