<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/favicon/N.ico">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		orderList(1);
		var currentPage = 1;
		var doubleCurrentPage = 1;
		$(".pagination1").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			orderList(replyPage);
		});
		$(".pagination2").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			thisMonth(replyPage);
		});
		
		
		$(document.body).on("click",".dualOver",function(){
			var dietCode = $(this).attr('data-code');
			
			$.getJSON("nutriAjax/popup/"+dietCode,function(data){
				$(".modalResult").remove();
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'modalResult'><td>"+"<img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width: 75px; height: 25px;'>"+"</td><td>"+this.sideDName+"</td></tr>";
				});
				$(".modalTable").append(str);  
			});   
		});
		
		$(document.body).on("click",".clicker",function(){
			var dietCode = $(this).attr('data-code');
			
			$.getJSON("nutriAjax/popup/"+dietCode,function(data){
				$(".modalResult").remove();
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'modalResult'><td>"+"<img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width: 75px; height: 25px;'>"+"</td><td>"+this.sideDName+"</td></tr>";
				});
				$(".modalTable").append(str);  
			});   
		});
		
		thisMonth(1);
		function orderList(page){
			currentPage = page;
			$(".orderResult").remove();
			$.getJSON("nutriAjax/orderList/"+page,function(data){
				var str = "";
				$(data.list).each(function(){
					str += "<tr class = 'orderResult'><td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td><a class = 'dualOver' data-code = '"+this.dietCode+"' data-toggle = 'modal' href = '#myModal'>"+this.dietName+"</a></td>"+"<td>"+this.orderDate+"</td>"+"<td>"+this.price+"</td>"+"</tr>"
				});
				$(".orderTable").append(str);
				printPaging(data.criteria);
			});             
		}
		function thisMonth(page){
			$(".thisResult").remove();
			$.getJSON("nutriAjax/thisMonth/"+page,function(data){
				doubleCurrentPage = page;
				var str = "";
				$(data.list).each(function(){
					str += "<tr class = 'thisResult'><td>"+"<img src = 'displayFile?fileName="+this.dietImg+"' style = 'width: 75px; height: 25px;'>"+"</td><td><a class = 'clicker' data-code = '"+this.dietCode+"' data-toggle = 'modal' href = '#myModal'>"+this.dietName+"</a></td></tr>";
				});
				$(".thisTable").append(str);
				printPaging2(data.criteria);
			});
		}
		function printPaging(criteria){
			var str = "";
					
			if(criteria.prev){
				str += "<li><a href=''"+(criteria.startPage-1)+"'>'" + "<<"+"</a></li>";
			}
			for(var i = criteria.startPage; i<=criteria.endPage; i++){
				var strClass = criteria.page == i?"class = 'active'":"";
				str += "<li "+strClass+"><a href ='"+i+"'>"+i + "</a></li>";
			}
			if(criteria.next){
				str += "<li><a href=''"+(criteria.endPage+1)+"'>'" + ">>"+"</a></li>";
			}
			$(".pagination1").html(str);
		}
		function printPaging2(criteria){
			var str = "";
					
			if(criteria.prev){
				str += "<li><a href=''"+(criteria.startPage-1)+"'>'" + "<<"+"</a></li>";
			}
			for(var i = criteria.startPage; i<=criteria.endPage; i++){
				var strClass = criteria.page == i?"class = 'active'":"";
				str += "<li "+strClass+"><a href ='"+i+"'>"+i + "</a></li>";
			}
			if(criteria.next){
				str += "<li><a href=''"+(criteria.endPage+1)+"'>'" + ">>"+"</a></li>";
			}
			$(".pagination2").html(str);
		}
	});
</script>

<title>영양사</title>
<style>
 .box1 {
    }
 .box2 {
 	float:left;
  }  
  .thisMonth{
  		display:inline-block;  margin-left:100px;
  }
  ul{
  	list-style : none;
  }
</style>
</head>
<body>
<%@include file="nutritionistNavi.jsp" %>
  <div class = "container">
<!--    <div class = "box1"> -->
<!--    	  <h3>공지사항</h3> -->
<!--       <div> -->
<!--          <select> -->
<!--             <option>등록자</option> -->
<!--             <option>제목</option> -->
<!--             <option>내용</option> -->
<!--          </select> -->
<!--          <input type = "text" name = "keyword"> -->
<!--          <button id = "search" class = "btn btn-warning"> 검색 </button> -->
<!--       </div> -->
<!--       <div> -->
<!--          <table class = "table table-hover"> -->
<!--             <tr> -->
<!--                <th>번호</th> -->
<!--                <th>제목</th> -->
<!--                <th>등록자</th> -->
<!--                <th>등록일</th> -->
<!--                <th>조회수</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--                <td>1</td> -->
<!--                <td>영양관리주간목록</td> -->
<!--                <td>영양사장</td> -->
<!--                <td>2017.05.05</td> -->
<!--                <td>0</td> -->
<!--             </tr> -->
<!--          </table> -->
<!--          <button id = "noticeList" class = "btn btn-warning">목록</button> -->
<!--       </div> -->
<!--    </div> -->
   <div class = "box2">
   	  <h2>특별 식단 요청 리스트</h2>  
      <table class = "orderTable table table-hover">      
         <tr>
            <th>번호&nbsp;&nbsp;&nbsp;</th>
            <th>고객id&nbsp;&nbsp;&nbsp;</th>
            <th>식단명&nbsp;&nbsp;&nbsp;</th>
            <th>주문접수일&nbsp;&nbsp;&nbsp;</th>
            <th>금액&nbsp;&nbsp;&nbsp;</th>
         </tr>
         <tr class = "orderResult">
            
         </tr>
      </table>
      <ul class = "pagination1 pagination">
      </ul>
   </div>
   <div class = "thisMonth">
      <h1> 이번 달의 판매 식단</h1>
      <hr align = "left" width = "20%">
     	<table class = "thisTable table table-hover">
     		<tr>
     			<th>이미지</th>
     			<th>식단명</th>
     		</tr>
     		<tr class = "thisResult">
     		</tr>
     	</table>
     <ul class = "pagination2 pagination">
     </ul>
   </div>
   <div class = "modal fade" id = "myModal">
   		<div class = "modal-dialog">
   			<div class = "modal-content">
   				<div class = "modal-header">
   					<button type = "button" class = "close" data-dismiss = "modal">X</button>
      				<h4 class = "modal-title">식단 내용</h4>
   				</div>
   				<div class = "modal-body">
   					<table class = "modalTable table table-hover">
   						<tr>
   							<th>이미지</th>
   							<th>반찬명</th>
   						</tr>
   						<tr class = "modalResult">
   						</tr>
   					</table>
   				</div>
   				<div class = "modal-footer">
   					<button type = "button" class = "btn btn-default" data-dismiss = "modal">Close</button>
   				</div>
   			</div>
   		</div>
   </div>
  </div> 
</body>
</html>