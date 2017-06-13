<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
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
<style>
#counselTableWrap{
    width: 1080px;
	height: 100%;
	margin: 0 auto;
	
}
#counselTable{

width:600px;

}

</style>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<!-- 	<form action = "write" method = "get"> -->
<%-- 		<input type = "hidden" name = "id" value = "${a. }"> --%>
<!-- 	</form> -->
		<div id="counselTableWrap">
		<table id="counselTable" class="table table-hover">
			<tr>
				<th>문의분류</th>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>답변</th>
				
			</tr>
			<c:forEach items="${list}" var="counsel">
			<tr>
				<td>${counsel.counselItemName}</td>			
				<td>${counsel.counselCode }</td>
				<td><a href = "read?counselCode=${counsel.counselCode}">${counsel.counselTitle }</a></td>
				<td>${counsel.customer}</td>
				<td>${counsel.counselDate }</td>
				<c:if test="${empty counsel.adviser}">
				<td>미응답</td>
				</c:if>
				<c:if test="${not empty counsel.adviser}">
				<td>답변완료</td>
				</c:if>				
			</tr>
			</c:forEach>
		</table>
	
		
		<div>
		<c:if test="${empty sessionScope.memberName}">
			로그인 후 이용해주세요.
		</c:if>
		<c:if test="${not empty sessionScope.memberName}">
			<button id = "write" class="btn btn-warning">글쓰기</button>
		</c:if>
		</div>
			</div>
	
</body>
</html>
<!-- localhost:8080/dacham/counsel -->