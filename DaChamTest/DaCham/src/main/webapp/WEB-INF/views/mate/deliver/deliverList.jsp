<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<select>
				<option>분류</option>
				<option>코드번호</option>
				<option>분류</option>
				<option>식재료명</option>
			</select>
			<input type = "text" name = "keyword" placeholder = "검색어 입력란">
			<button id = "search">검색</button>
		</div>
		<br><br><br><br>
		<div>
			<table>
				<tr>
					<th><input type = "checkbox" name = "all" onclick="check();"></th>
					<th>주문번호</th>
					<th>고객 아이디</th>
					<th>식단 이미지</th>
					<th>식단명</th>
					<th>주소</th>
				</tr>
				<tr>
					<td><input type = "checkbox" name = "chk" value = "01"></td>
					<td>ABAB11</td>
					<td>성빡</td>
					<td><img src="http://placehold.it/140x100"></td>
					<td>병아리콩샐러드<br>식단</td>
					<td>대구광역시 복현동 A타운 505호</td>
				</tr>
				<tr>
					<td><input type = "checkbox" name = "chk" value = "02"></td>
					<td>ABAB11</td>
					<td>권찡</td>
					<td><img src="http://placehold.it/140x100"></td>
					<td>병아리콩샐러드<br>식단</td>
					<td>대구광역시 복현동 A타운 505호</td>
				</tr>
			</table>
		</div>
		<input type = "submit" value = "배송">
	</form>
</body>
</html>