<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<title>Insert title here</title>
<script>
    function divcall(text1){
        var text2 = "#"+text1;
        $('.divs').css('display', 'none');
        $(text2).css('display', 'block');
       
    }
    $(document).ready(function(){
    	var formObj = $("form[role='form']");
    	$("#foodorder").click(function(){
    		window.location.href = "foodOrder";
    	});
    	
    	/* $("#cancle").click(function(){
    		formObj.attr("action", "cancleupdate");
            formObj.submit();
    	});
    	$("#ok").click(function(){
    		formObj.attr("action", "okupdate");
    		formObj.submit();
    	}); */
    });
</script>
<style>
    .divs {display:none;}
    
    a{text-align: center;
    	font-size:15pt;
    	color:#93DAFF;
    }
</style>






</head>
<body>
	<form role="form" method="post">
   <input type="hidden" name="orderCode" value="${orderCode}">
	</form>
	<div>
		<a onclick="divcall('a1');">전체주문|&nbsp&nbsp</a>
		<a onclick="divcall('a2');">|결제 대기 주문|&nbsp&nbsp</a>
		<a onclick="divcall('a3');">|결제 완료 주문|&nbsp&nbsp</a>
		<a onclick="divcall('a4');">|배송중 주문|&nbsp&nbsp</a>
		<a onclick="divcall('a5');">|완료된 주문|&nbsp&nbsp</a>
		<a onclick="divcall('a6');">|취소된 주문|&nbsp&nbsp</a>
	</div>
	<div>
	<form method="get" action="">
	<select>
		<option>고객id</option>
		<option>식단명</option>
		<option>진행상태</option>
		<option>배송상태</option>
	</select>
	<input type="text">
	<input type="submit" value="검색">
	</form>
	</div>	
	<div>
	<div class="divs" id="a1">
		<table width="600" border="1">
			<tr>
				<th>전체 주문</th>
				<th>결제 대기 주문</th>
				<th>결제 완료 주문</th>
				<th>배송 중 주문</th>
				<th>완료 된 주문</th>
				<th>취소 된 주문</th>
			</tr>
			<tr>
				<th><input type="checkbox"></th>
			</tr>
			<%-- <c:forEach items="${list}" var="board">
				<tr>
					<td>${board.bno }&nbsp;&nbsp;&nbsp;</td>
					<td><a href="read?bno=${board.bno}">
					${board.title }&nbsp;&nbsp;</a></td>
					<td>${board.writer }&nbsp;&nbsp;</td>
					<td>${board.viewcnt }&nbsp;&nbsp;</td>
				</tr>
			</c:forEach> --%>
		</table>
	</div>
	<div class="divs" id="a2">
	<table width="700" border="1">
			<tr>
				<th>전체 주문</th>
				<th>결제 대기 주문</th>
				<th>결제 완료 주문</th>
				<th>배송 중 주문</th>
				<th>완료 된 주문</th>
				<th>취소 된 주문</th>
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
	<div class="divs" id="a3">
		<table width="600" border="1">
			<tr>
				<th>전체 주문</th>
				<th>결제 대기 주문</th>
				<th>결제 완료 주문</th>
				<th>배송 중 주문</th>
				<th>완료 된 주문</th>
				<th>취소 된 주문</th>
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
	<div class="divs" id="a4">
		<table width="600" border="1">
			<tr>
				<th>전체 주문</th>
				<th>결제 대기 주문</th>
				<th>결제 완료 주문</th>
				<th>배송 중 주문</th>
				<th>완료 된 주문</th>
				<th>취소 된 주문</th>
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
	<div class="divs" id="a5">
		<table width="600" border="1">
			<tr>
				<th>전체 주문</th>
				<th>결제 대기 주문</th>
				<th>결제 완료 주문</th>
				<th>배송 중 주문</th>
				<th>완료 된 주문</th>
				<th>취소 된 주문</th>
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
	<div class="divs" id="a6">
		<table width="600" border="1">
			<tr>
				<th>전체 주문</th>
				<th>결제 대기 주문</th>
				<th>결제 완료 주문</th>
				<th>배송 중 주문</th>
				<th>완료 된 주문</th>
				<th>취소 된 주문</th>
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
	<div class="divs" id="a7">
		<table width="600" border="1">
			<tr>
				<th>전체 주문</th>
				<th>결제 대기 주문</th>
				<th>결제 완료 주문</th>
				<th>배송 중 주문</th>
				<th>완료 된 주문</th>
				<th>취소 된 주문</th>
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
			<div>
			<button id = "foodorder">식재료 주문</button>
			<button type="submit" id="ok">작업요청</button>
			<button type="submit" id = "cancle">환불</button>
			</div>
	</div>


</body>
</html>