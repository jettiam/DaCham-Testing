<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script>
	$(document).ready(function(){
		$("#write").on("click",function(){
			window.location.href = "write";
		});
		$(".counselRead").on("click",function(){
			if("${customerId}"!=$(this).attr("data-id")){
				event.preventDefault();
				alert("비밀글입니다.");
			}else{
				
			}
		});
		$("#counsel").addClass("w3-gray");
		
		var page = ${criteria.page};
		if(page==1){
			var prev = ${criteria.prev};
			var next = ${criteria.next};
			var strPaginations ="";
			var startPage=${criteria.startPage};
			var length = ${criteria.endPage}
			if(prev){
				strPaginations = "<li><a href='"+(page-1)+"'><<</a></li>"
			}
			for(var i=startPage;i<=length;i++){
				var strClass = page == i?"class = 'active'":"";
				strPaginations += "<li "+strClass+"><a href ='"+i+"'>"+i + "</a></li>";
			}
			if(next){
				strPaginations += "<li><a href='"+(page+1)+"'>>></a></li>"
			}
			$(".pagination").html(strPaginations);
		}
		
		$(".pagination").on("click","li a",function(){
			var page = $(this).attr("href");
			event.preventDefault();
			$(".pagination li").removeClass("active");
			$(this).parent().addClass("active"); 
			
			counselPage(page);
		});
		function counselPage(page){
			$.getJSON("customerAjax/counsel/"+page,function(data){
				console.log(data.list);
				$(".counselList").remove();
				for(var i=0; i<data.list.length;i++){
					var str = "<tr class='counselList'><td>"+data.list[i].counselItemName+"</td><td>"+data.list[i].counselCode+"</td><td><a data-id='"+data.list[i].customer+"' href='read?counselCode="+data.list[i].counselCode+"'>"+data.list[i].counselTitle+"</a></td><td>"+data.list[i].customer+"</td><td>"+data.list[i].counselDate+"</td>";
					var checkCounsel = data.list[i].adviser;
					if(checkCounsel==null){
						checkCounsel="미응답";
					}else{
						checkCounsel="답변완료";
					}
					str += "<td>"+checkCounsel+"</td></tr>"
					$("#counselTable").append(str);
					
				}
			});
		} 
	});
</script>
<style>

</style>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
<!-- 	<form action = "write" method = "get"> -->
<%-- 		<input type = "hidden" name = "id" value = "${a. }"> --%>
<!-- 	</form> -->
		<div class="container">
		<table id="counselTable" class="table table-hover">
			<tr>
				<th width="10%">문의분류</th>
				<th width="8%">글번호</th>
				<th>글제목</th>
				<th width="10%">작성자</th>
				<th width="9%">작성일</th>
				<th width="7%">답변</th>
				
			</tr>
			<c:forEach items="${list}" var="counsel">
			<tr class="counselList">
				<td>${counsel.counselItemName}</td>			
				<td>${counsel.counselCode }</td>
				<td><a href = "read?counselCode=${counsel.counselCode}" data-id="${counsel.customer}" class="counselRead">${counsel.counselTitle }</a></td>
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
		<div class="text-center">
			<ul class = "pagination">			
			</ul>
		</div>	
		<div>
		<c:if test="${empty sessionScope.memberName}">
			로그인 후 이용해주세요.
		</c:if>
		<c:if test="${not empty sessionScope.memberName}">
			<button id = "write" class="btn btn-warning">글쓰기</button>
		</c:if>
		</div>
			</div>
<footer>
	<%@include file="../../footer.jsp" %>
</footer>	
</body>
</html>
<!-- localhost:8080/dacham/counsel -->