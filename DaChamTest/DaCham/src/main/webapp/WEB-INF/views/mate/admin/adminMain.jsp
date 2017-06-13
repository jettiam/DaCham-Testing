<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.wdb3a.dacham.bean.OrderList"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../admin/upmenu.jsp"%>
<title>Insert title here</title>
<style>
#read {
	display: none; 
	width:300px;
	background-color:gray;
	position:absolute;
	top:50%;
	left:50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index:1000;
}
#close{
	float : right;
}
</style>
</head>
<body>
	<div>
		<form method="post" action="notice">
			<select>
				<option>등록자</option>
				<option>제목</option>
			</select> 제목<input type="text"> <input type="submit" value="검색">
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
		일자<input type="date" id="startdate"> ~ <input type="date"
			id="enddate"> <input type="button" value="오늘" id="today">
		<input type="button" value="일주일" id="week"> <input
			type="button" value="한달" id="month"><br> <select>
			<option>전체</option>
			<option>당뇨병</option>
			<option>고지혈증</option>
			<option>심부전증</option>
			<option>신부전증</option>
		</select> <input type="button" value="검색">
		<div>그래프 나와야함 ㅜㅜ</div>
	</div>
	<div>
		<form method="post" action="notice">
			<select>
				<option>고객id</option>
				<option>식단명</option>
			</select> 제목<input type="text"> <input type="submit" value="검색">
		</form>
		<div>
			<table width="600" border="1">
				<tr>
					<th>주문번호</th>
					<th>고객id</th>
					<th>식단명</th>
					<th>주문 접수일</th>
					<th>금액</th>
					<th>진행상태</th>
					<th>배송</th>
				</tr>
				<c:forEach items="${list}" var="board">
					<tr>
						<td>${board.orderCode}&nbsp;&nbsp;&nbsp;</td>
						<td>${board.id }</td>
						<%-- <td>${board.dietName}&nbsp;&nbsp;</td> --%>
						<td><a data-src="${board.orderCode}"  class="orderCode">${board.dietName}&nbsp;&nbsp;</a></td>
						<td>${board.orderDate }&nbsp;&nbsp;</td>
						<td>${board.price}</td>
						<td>${board.orderItemName}</td> 
						<td>${board.transportNum}</td>

					</tr>

				</c:forEach>
			</table>
		</div>
	</div>
	<div id="detailView">
	</div>
	 <div name="read" id="read" class="read">
		<table width="600" border="1">
			<tr>
				<th>고객이름</th>
				<td id="orderName"></td> 
				<th>배달주소</th> 
				<td id="orderAddRess"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td id ="orderPrice"></td>
				<th>식단명</th>
				<td id ="orderDietName"></td>
			</tr>
			<tr>
				<th>주문일</th>
				<td id="orderOrderDate"></td>
				<th>전화번호</th>
				<td id="orderTel"></td>
			</tr>
		</table>
		<button id="close">닫기</button>
	</div>
 

</body>
<script>

	/* jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
    this.css("background-color", "#dddddd"); 
    return this;
	} */
	
	$(".orderCode").on("click", function(){
		event.preventDefault();
		var orderCode = $(this).attr("data-src");		
		alert("이건됨");		
		$.ajax({
	         type: "post",
	         url: "adminSub/detailView/"+orderCode,
	         headers: {
	            "Content-Type":"application/json",
	            "X-HTTP-Method-Override":"POST"
	         },	         
	         dataType: "text",
	         success: function(data) {	            
	            	$("#read").show();  
	           		 var str =data.list.name;
	           		 alert(str);	           		
	           
	         },
	         error:function(){
	        	 alert("실패");
	         }
	    });    
    });
	/* function getPageReplyList() {
		var orderCode = $(".orderCode").attr("data-src");
		alert(orderCode); 
	      $.getJSON("adminSub/detailView/"+orderCode, function(data){
	         var str = "";
	         $(data.list).each(function(){
	            alert(this.dietCode);
	        	 /* str += "<li data-rno='"+this.rno+"' class='replyLI'>"+this.rno+":"+this.replyText+
	            "<button>변경</button></li>";     
	         });
	      });
	   } */
	/* function showmap(){ 
		
		/* event.preventDefault();
		var orderCode = $(this).attr("href");
		alert(orderCode); */
		/* $.ajax({
	         type: "get",
	         url: "adminMain",
	        
	         dataType: "text",
	         data: JSON.stringify({
	            "replyText":replyText
	         }),
	         success: function(reslut) {
	            if(reslut=="SUCCESS"){
	               alert("수정되었습니다");
	               $("#modDiv").hide("slow");
	               getAllReplies();
	            }
	         }
	      });
		 */
		//$("#read").show();
		//$("#read").center();
		
	//}    
	
	function getDefaultDate() {// 해당 일 계산

		var now = new Date();
		var day = ("0" + now.getDate()).slice(-2);
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		return today;
	}

	function getWeek() {// 일주일 전 첫 날짜 계산

		var now = new Date();
		var day = ("0" + (now.getDate() - 6)).slice(-2);
		var month = ("0" + (now.getMonth() + 1)).slice(-2);
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		return today;
	}

	function getStartDate() {// 한달 버튼 클릭시 그 해당 날짜의 첫번쨰 일 계산
		var now = new Date();
		var Startdate = new Date(now.getYear(), now.getMonth(), 1);
		var day = ("0" + Startdate.getDate()).slice(-2);
		var month = ("0" + (Startdate.getMonth())).slice(-2);
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		return today;
	}

	function getEndDate() {//한달 버튼 클릭시 그 해당 날짜의 마찌맊 일 계산
		var now = new Date();
		var enddate = new Date(now.getYear(), now.getMonth(), 0);
		var day = ("0" + enddate.getDate()).slice(-2);
		var month = ("0" + (enddate.getMonth() + 1)).slice(-2);
		var today = now.getFullYear() + "-" + (month) + "-" + (day);
		return today;
	}

	function getWeekStartDate() {
		var now = new Date();

	}

	$(document).ready(function() {
		$("#today").click(function() {
			$("#startdate").val(getDefaultDate());
			$("#enddate").val(getDefaultDate());
		});
		$("#week").click(function() {
			$("#startdate").val(getWeek());
			$("#enddate").val(getDefaultDate());
		});
		$("#month").click(function() {
			$("#startdate").val(getStartDate());
			$("#enddate").val(getEndDate());
		});
		$("#notice").click(function() {
			window.location.href = "notice";
		});
		$("#close").click(function(){
			$("#read").css("display", "none");
		});
	});
</script>
</html>