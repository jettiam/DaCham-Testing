<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.table{
	
}
</style>
</head>
<body>
	<div>
	<form method="post" action="notice">
	<select>
		<option>등록자</option>
		<option>제목</option>
	</select>
	제목<input type="text">
	<input type="submit" value="검색">
	</form>
		<div>
		<table width="600" border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>등록자</th>
				<th>등록 일자</th>
				<th>조회수</th>
			</tr>
			<%-- <c:forEach items="${list}" var="board">
				<tr>
					<td>${board.bno }&nbsp;&nbsp;&nbsp;</td>
					<td><a href="read?bno=${board.bno }">
					${board.title }&nbsp;&nbsp;</a></td>
					<td>${board.writer }&nbsp;&nbsp;</td>
					<td>${board.viewcnt }&nbsp;&nbsp;</td>
				</tr>
			</c:forEach> --%>
		</table>
		<input type="button" value="목록" id="notice">
		</div>
	</div>
	
	<div>
	<h2>일자별 통계</h2>
	일자<input type="date" id = "date" value="">
	<input type="button" value="오늘" id = "today">
	<input type="button" value="일주일" id = "week">
	<input type="button" value="한달" id = "month"><br>
	<select>
		<option>당뇨병</option>
		<option>고지혈증</option>
		<option>심부전증</option>
		<option>신부전증</option>
	</select>
	<input type="button" value ="검색">
		<div>
		그래프 나와야함 ㅜㅜ
		</div>
	</div>
	<div>
	<form method="post" action="notice">
	<select>
		<option>고객id</option>
		<option>식단명</option>
	</select>
	제목<input type="text">
	<input type="submit" value="검색">
	</form>
		<div>
		<table width="600" border="1">
			<tr>
				<th>번호</th>
				<th>고객id</th>
				<th>식단명</th>
				<th>주문 접수일</th>
				<th>금액</th>
				<th>진행상태</th>
				<th>배송</th>
			</tr>
			<%-- <c:forEach items="${list}" var="board">
				<tr>
					<td>${board.bno }&nbsp;&nbsp;&nbsp;</td>
					<td><a href="read?bno=${board.bno }">
					${board.title }&nbsp;&nbsp;</a></td>
					<td>${board.writer }&nbsp;&nbsp;</td>
					<td>${board.viewcnt }&nbsp;&nbsp;</td>
				</tr>
			</c:forEach> --%>
		</table>
		</div>
	</div>

</body>
<script>
		// 시작
        /* $(function() {
            // 달력 붙이기
            $('.datePicker').datepicker();
            $('#notice').click(function(){
            	window.location.href = "notice";
            })
        }); */
		$(document).ready(function(){
			$("#today").click(function(){
				var date = new Date();
				var year = date.getFullYear();
				var month = date.getMonth()+1;
				var day = date.getDate();
				var textid =$('#date');
				$("#date").val(year+"-"+month+"-"+day);
			});
		})
	</script>



</html>