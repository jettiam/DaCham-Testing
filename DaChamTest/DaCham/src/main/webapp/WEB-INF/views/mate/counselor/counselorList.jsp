<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#counselorList").addClass("w3-light-gray");
		$(".searchResult1").remove();
		$.getJSON("counselAjax/counselorListAll",function(data){
			var str = "";
			$(data).each(function(){
				str += "<tr class = 'searchResult1'><td>"+this.id+"</td><td><a class = 'nameClick' data-name = '"+this.id+"'>"+this.name+"</a></td><td>"+this.address+"</td><td>"+this.tel+"</td><td>"+this.email+"</td><td>"+this.deptCode+"</td><td>"+this.gradeCode+"</td><td>"+this.joinDate+"</td></tr>";
			});
			$(".search1").append(str);
		});
		
		
		$(".searchResult2").remove();
		$.getJSON("counselAjax/counselorseList2All",function(data){
			var str = "";
			$(data).each(function(){
				str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
			});
			$(".search2").append(str);
		});
		
		
		$(document.body).on("click",".nameClick",function(){
			var name = $(this).attr('data-name');
			$(".answer").empty();
			$(".answer").append("<textarea id = 'answers' name = 'answer'></textarea>");
			$(".answer").append("<input type = 'hidden' class = 'id'  name = 'id' value = '"+name+"'>");
			$(".answer").append("<button id = 'button'>답변등록</button>");
			linkAll(name);
		});
		
		$(document.body).on("click","#button",function(){
			var customer = $('.id').val();
			var answer = $('#answers').val();
			
			$.ajax({
				type : "POST",
				url : 'counselAjax/counselInsert/'+customer+"/"+answer,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST",
				},
				success : function(result){
					if(result == "SUCCESS"){
						alert("등록되었습니다.");
					}
				}
			});
		});
		
		$("#search").on("click",function(){
			$(".searchResult1").remove();
			
			var str = "";
			var searchType = $(".searchType").val();
			var keyword = $("#keyword").val();
			$.getJSON("counselAjax/listAll/"+searchType+"/"+keyword,function(data){
				$(data).each(function(){
					str += "<tr class = 'searchResult1'><td>"+this.id+"</td><td>"+this.name+"</td><td>"+this.address+"</td><td>"+this.tel+"</td><td>"+this.email+"</td><td>"+this.deptCode+"</td><td>"+this.gradeCode+"</td><td>"+this.joinDate+"</td></tr>";
				});
				$(".search1").append(str);
			});
		});
		$("#Search").on("click",function(){
			$(".searchResult2").remove();
			
			var str = "";
			var searchType = $(".searchType2").val();
			var keyword = $("#keyword2").val();
			$.getJSON("counselAjax/counselorseList2/"+searchType+"/"+keyword,function(data){
				$(data).each(function(){
					str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
				});
				$(".search2").append(str);
			});
		});
		
		function linkAll(customer){
			$(".answerResult").remove();
			$.getJSON("counselAjax/linkCounsel/"+customer,function(data){
				var str = "";
				$(data).each(function(){
					
						str += "<tr class = 'answerResult'><td class = 'counselCode' data-code = '"+this.counselCode+"' data-id = '"+this.customer+"'><a href = '#'>"+this.counselCode+"</a></td><td>"+this.customer+"</td><td>"+this.answer+"</td></tr>";
				
				});
				$(".link").append(str);
			});
		}
	});
</script>
<style>
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:20px;}  
</style>
</head>
<body>
<%@include file = "counselorNavi.jsp" %>
	<div class = "container">   
	   <div class = "box1">
	   
	   		 <h3>고객의 정보</h3>
	      <div>
				<select name = "searchType" class= "searchType">
					<option value = "n"
		   			<c:out value="${Counselor.searchType==null?'selected':'' }"/>>
		   			----------
		   			</option>
		   			<option value = "t"
		   			<c:out value="${Counselor.searchType eq 't'?'selected':'' }"/>>
		   			고객id
		   			</option>
		   			<option value = "c"
		   			<c:out value="${Counselor.searchType eq 'c'?'selected':'' }"/>>
		   			고객이름
		   			</option>
				</select>
				<input type = "text" name = "keyword" id = "keyword" placeholder = "검색어 입력란">
				<button id = "search">검색</button>
			</div>
		
	      
	     <div style = "border:1px solid gold;">
	      <table border ="1" class = "search1 table table-hover">
	         <tr>
	         			<th>고객id</th>
						<th>고객이름</th>
						<th>주소</th>
						<th>전화번호</th>
						<th>Email</th>
						<th>부서</th>
						<th>직급</th>
						<th>가입일</th>
						
						
	         </tr>
	       	 <tr class = "searchResult1">
	       	 </tr>
	      </table>
	      </div>
	      <div>
	      		<table class = "link table table-hover">
               <tr>   
                  <th>번호</th>
                  <th>고객아이디</th>
                  <th>답변</th>
               </tr>
               <tr class = "answerResult">
                  
               </tr>
            </table>
	      </div>
	      <form>
		      <div class = "answer">
		      </div>
	      </form>	  
	   </div>
	   <div class = "box2">
	      
	   </div>
	   <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	   <br><br><br><br><br><br>
	  </div>
</body>
</html>