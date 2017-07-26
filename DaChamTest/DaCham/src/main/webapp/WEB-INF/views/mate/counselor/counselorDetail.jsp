<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:20px;}  
</style>
<script>
$(document).ready(function(){
	$("#detail").addClass("w3-light-gray");
	
	linkAll();
	var id = "";
	var couselCode = 0;
	var answer = "";
	var currentPage = 0;
	$(document.body).on("click",".counselCode",function(){
		couselCode = $(this).attr('data-code');
		$(".answers").val(" ");
		
		$.getJSON("counselAjax/selectCounsel/"+couselCode,function(data){
			$(".counselCode").val(data.counselCode);
			$(".counselItemName").val(data.counselitemName);
			$(".counselTitle").val(data.counselTitle);
			$(".counselContent").val(data.counselContent);	
			$(".answers").val(data.answer);
			answer = data.answer;
		});
		$.getJSON("counselAjax/selectMember/"+couselCode,function(data){
			$(".id").text(data.id);
			id = data.id;
			$(".name").text(data.name);
			$(".joinDate").text(data.joinDate);
			$(".tel").text(data.tel);
			$(".email").text(data.email);
			$(".address").text(data.address);
			
		});
		orderList(1,couselCode);
	});
	$(".pagination").on("click","li a",function(){
		event.preventDefault();
		var replyPage = $(this).attr("href");
		
		orderList(replyPage, couselCode);                  
	});
	function orderList(page,couselCode){
		currentPage = page;
		$.getJSON("counselAjax/orderList/"+page+"/"+couselCode,function(data){
			$(".orderResult").remove();
			var str = "";
			$(data.list).each(function(){
				str += "<tr class = 'orderResult'><td>"+this.orderCode+"</td><td>"+this.id+"</td><td>"+this.dietName+"</td><td>"+this.orderDate+"</td><td>"+this.paymentItemName+"</td><td>"+this.orderItemName+"</td></tr>";
			});
			
			$(".order").append(str);
			printPaging(data.criteria);
		});
	}
	$("#answer").on("click",function(){
		var couselCode = $(".counselCode").val();
		var answer = $(".answers").val();
		
		$.ajax({
			type : "PUT",
			url : "counselAjax/counselUpdate/"+couselCode+"/"+answer,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			success : function(result){
				console.log("result:"+result);
				if(result == "SUCCESS"){
					alert("수정되었습니다.");
					linkAll();
				}
			}
		});
	});
	
	function linkAll(){
		var customer = '${customer}';
		$(".answerResult").remove();
		$.getJSON("counselAjax/linkCounsel/"+customer,function(data){
			var str = "";
			$(data).each(function(){
				if(this.adviser == null){
					str += "<tr class = 'answerResult'><td class = 'counselCode' data-code = '"+this.counselCode+"' data-id = '"+this.customer+"'><a href = '#'>"+this.counselCode+"</a></td><td>"+this.counselitemName+"</td><td>"+this.counselTitle+"</td><td>"+this.counselDate+"</td><td>미응답</td></tr>";
				}
				else{
					str += "<tr class = 'answerResult'><td class = 'counselCode' data-code = '"+this.counselCode+"' data-id = '"+this.customer+"'><a href = '#'>"+this.counselCode+"</a></td><td>"+this.counselitemName+"</td><td>"+this.counselTitle+"</td><td>"+this.counselDate+"</td><td>응답완료</td></tr>";
				}
			});
			$(".link").append(str);
		});
	}
	function printPaging(criteria){
		var str = "";
				
		if(criteria.prev){
			str += "<li><a href='"+(criteria.startPage-1)+"'>" + "<<"+"</a></li>";
		}
		for(var i = criteria.startPage; i<=criteria.endPage; i++){
			var strClass = criteria.page == i?"class = 'active'":"";
			str += "<li "+strClass+"><a href ='"+i+"'>"+i + "</a></li>";
		}
		if(criteria.next){
			str += "<li><a href='"+(criteria.endPage+1)+"'>" + ">>"+"</a></li>";
		}
		$(".pagination").html(str);
	}
});

</script>
</head>
<body>
<%@include file = "counselorNavi.jsp" %>
   <div class = "container">
      <div class = "box1">
         <div style = "border:1px solid gold;">
         	<input type = "hidden" name = "counselCode" class = "counselCode" readonly>
            <input type = "text" class = "counselItemName" name = "category" value = "배송문의" readonly>
            <input type = "text" class = "counselTitle" name = "title" value = "특별식을 주문했는데" readonly><br>
            <textarea class = "counselContent" style = "width:400px;" readonly>  
                               내용
            </textarea>
         </div>
         <br><br>
         <div style = "border:1px solid gold;">
            <textarea placeholder = "답변내용 입력" class = "answers"></textarea>
            <button id = "answer">답변</button>
         </div>
         <br><br>
         <div style = "border:1px solid gold;">   
            <h4>${name }님의 상담내역 </h4><br>                
            <select>
               <option>제목</option>
               <option>내용</option>
            </select>
            <input type = "text" name = "keyword">
            <button id = "search">검색</button>
            <table class = "link table table-hover">
               <tr>   
                  <th>번호</th>
                  <th>분류</th>
                  <th>제목</th>
                  <th>등록일</th>
                  <th>답변여부</th>
               </tr>
               <tr class = "answerResult">
                  
               </tr>
            </table>
         </div>
      </div>
      <div class = "box2">
         <table border ="1" class = "table table-hover">
            <tr>
               <th>아이디</th>
               <td class = "id">고객 ID</td>  
            </tr>
            <tr>
               <th>이름</th>
               <td class = "name">고객 성함</td>  
            </tr>
            <tr>
               <th>가입일</th>
               <td class = "joinDate">가입일</td>  
            </tr>
            <tr>
               <th>핸드폰</th>
               <td class = "tel">핸드폰 번호</td>  
            </tr>
             <tr>
               <th>E-mail</th>
               <td class = "email">Email</td>  
            </tr>
            <tr>
               <th>주소</th>
               <td class = "address">주소</td>  
            </tr>  
         </table>
         <div style = "border:1px solid gold;">
               <h4>식단 주문목록</h4><br>   
            <select>
               <option>제목</option>
               <option>내용</option>
            </select>   
            <input type = "text" name = "keyword">
            <button id = "search">검색</button>
            <table class = "order table table-hover">
               <tr>   
                  <th>번호</th>
                  <th>고객아이디</th>
                  <th>식단명</th>
                  <th>주문일</th>
                  <th>결제현황</th>
                  <th>주문현황</th>
               </tr>
               <tr class = "orderResult">
                  <td>1</td>
                  <td>고객ID</td>
                  <td>주문한식단명</td>
                  <td>식단주문일</td>
                  <td>결제현황</td>
                  <td>주문현황</td>
               </tr>
               
            </table>
            <ul class = "pagination">
       		  </ul>
         </div>
      </div>
      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <br><br><br><br><br><br>
   </div>  
</body>
</html>