<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file = "deliverNavi.jsp" %>
<title>Insert title here</title>
<script>
	function check(){
		cbox = input_form.chk;
		if(cbox.length){
			for(var i = 0; i < cbox.length; i++){
				cbox[i].checked = input_form.all.checked;
			}
		}
		else{
			cbox.checked = input_form.all.checked;
		}
	}
</script>
</head>
<body>
	<form name = "input_form">
		<div>
			<select name = "searchType">
				<option value = "n"
	   			<c:out value="${orderList.searchType==null?'selected':'' }"/>>
	   			분류
	   			</option>
	   			<option value = "t"
	   			<c:out value="${orderList.searchType eq 't'?'selected':'' }"/>>
	   			주문번호
	   			</option>
	   			<option value = "c"
	   			<c:out value="${orderList.searchType eq 'c'?'selected':'' }"/>>
	   			고객id
	   			</option>
			</select>
			<input type = "text" name = "keyword" placeholder = "검색어 입력란">
			<button id = "search">검색</button>
		</div>
		<br><br><br><br>
	
		<div>
			<table border = "1">
				<tr>
					<th><input type = "checkbox" name = "all" onclick="check();"></th>
					<th>주문번호</th>
					<th>고객 아이디</th>
					<th>식단 이미지</th>
					<th>식단명</th>
					<th>주소</th>
				</tr>
				<%int i = 1; %>
				<c:forEach items = "${list }" var = "b">
					<tr>
						<td><input type = "checkbox" name = "chk" value = "<%=i %>"></td>
						<td>${b.orderCode }</td>
						<td>${b.id }</td>
						<td><img src = "deliverDisplayFile?fileName=${b.dietImg }" style= "width: 175px; height: 50px;"></td>
						<td>${b.dietName }</td>
						<td>${b.address }</td>
						<%i = i + 1;  %>
					</tr>
				</c:forEach>
			</table>
			
		</div>
	</form>
		<input type = "submit" value = "배송">
	
</body>
</html>