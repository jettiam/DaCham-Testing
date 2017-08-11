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
      $(".answerReturn").hide();
      $.getJSON("counselAjax/counselorListAll",function(data){
         var str = "";
         $(data).each(function(){
            str += "<tr class = 'searchResult1'><td>"+this.id+"</td><td><a class = 'nameClick' data-code = '"+this.couselCode+"' data-name = '"+this.id+"' data-toggle = 'modal' href = '#myModal'>"+this.name+"</a></td><td>"+this.birthday+"</td><td>"+this.address+"</td><td>"+this.tel+"</td><td>"+this.email+"</td><td>"+this.deptCode+"</td><td>"+this.gradeCode+"</td><td>"+this.joinDate+"</td><td>"+this.diseaseName+"</td><td>"+this.judgement+"</td></tr>";
         });
         $(".search1").append(str);
      });
      
      
//       $(".searchResult2").remove();
//       $.getJSON("counselAjax/counselorseList2All",function(data){
//          var str = "";
//          $(data).each(function(){
//             str += "<tr class = 'searchResult2'><td>"+this.id+"</td><td>"+this.name+"</td><td>"+this.address+"</td><td>"+this.tel+"</td><td>"+this.email+"</td><td>"+this.deptCode+"</td><td>"+this.gradeCode+"</td><td>"+this.joinDate+"</td></tr>";
//          });
//          $(".search2").append(str);
//       });
      
      
      $(document.body).on("click",".nameClick",function(){
         var name = $(this).attr('data-name');
         var counselCode = $(this).attr('data-code');
         $(".answer").empty();
         $(".answerReturn").show();
         
         
         linkAll(name);
      });
      
      $(document.body).on("click","#newAnswer",function(){
         var customer = $(this).attr('data-code');
         var answer = $(".quickAnswer").val();
         alert("정답:"+answer);
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
                  linkAll(customer);
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
            	str += "<tr class = 'searchResult1'><td>"+this.id+"</td><td><a class = 'nameClick' data-code = '"+this.couselCode+"' data-name = '"+this.id+"' data-toggle = 'modal' href = '#myModal'>"+this.name+"</a></td><td>"+this.birthday+"</td><td>"+this.address+"</td><td>"+this.tel+"</td><td>"+this.email+"</td><td>"+this.deptCode+"</td><td>"+this.gradeCode+"</td><td>"+this.joinDate+"</td><td>"+this.diseaseName+"</td><td>"+this.judgement+"</td></tr>";
            });
            $(".search1").append(str);
         });
      });
      
      $(document.body).on("click",".answerClick",function(){
    	 
    	 $('.overAnswer').empty();
         var counselCode = $(this).attr('data-code');
         var answer = $(this).attr('data-answer');
         var customer = $(this).attr('data-customer');
         $('.overAnswer').append("<div class = 'form-group'><label>기존답변:</label>");
         $('.overAnswer').append("<textarea readonly class = 'form-control'>"+answer+"</textarea></div>");
         $('.overAnswer').append("<div class = 'form-group'><label>변경할 답변:</label><textarea class = 'answerReturn form-control' placeholder = '변경하려면 적고 아래 버튼 누르십시오'></textarea></div>");
         $('.overAnswer').append("<button id = 'answerReturn' data-customer = '"+customer+"' data-code = '"+counselCode+"' class = 'btn btn-warning'>변경</button>");
         
      });
      $(document.body).on("click","#answerReturn",function(){
         var couselCode = $(this).attr("data-code");
         var customer = $(this).attr('data-customer');
            var answer = $('.answerReturn').val();
           if($('.answerReturn').val() == ""){
              alert("답변을 입력하세요");
           } 
           else{
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
                         alert("수정되었습니다. 이제 팝업을 닫아주십시오");
                         $(".answerReturn").val('');
                         
                        linkAll(customer);
                        
                      }
                   }
                });
           }
           
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
        $(".super div").remove();	
         $.getJSON("counselAjax/linkCounsel2/"+customer,function(data){
            var str = "";
            $(data).each(function(){
               if(this.counselCode != null){
                  str += "<tr class = 'answerResult'><td class = 'counselCode' data-code = '"+this.counselCode+"' data-id = '"+this.customer+"'><a>"+this.counselCode+"</a></td><td>"+this.customer+"</td><td>"+this.counselContent+"</td><td><a  href = '#yourModal' data-toggle = 'modal'  class = 'answerClick' data-code = '"+this.counselCode+"' data-answer = '"+this.answer+"' data-customer = '"+customer+"'>"+this.answer+"</a></td></tr>";
               }
              
            });
            $(".link").append(str);
            $(".super").append("<div class = 'form-group'><label>신규등록</label><textarea class = 'quickAnswer form-control'></textarea><button id = 'newAnswer' class = 'btn btn-success' data-code = '"+customer+"'>등록</button></div>");
         });
      }
   });

</script>
<style>
 .nameClick { color: blue; text-decoration: underline;}
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
                  <th>질병이름</th>
                  <th>위험군</th>
                  <th>판정</th>
                  
            </tr>
              <tr class = "searchResult1">
              </tr>
         </table>
         </div>
         <div>
           
         </div>
         <form>
            <div class = "answer">
            </div>
         </form>     
      </div>
      <div class = "box2">
         
      </div>
      <div class = "modal fade" id = "myModal" role = "dialog">
      		<div class = "modal-dialog" style = "width:1080px;">
      			<div class = "modal-content">
      				<div class = "modal-header">
      					<button type = "button" class = "close" data-dismiss = "modal">X</button>
      					<h4 class = "modal-title">상담 내역</h4>
      				</div>
      				<div class = "super modal-body">
      					<table class = "link table table-borded">
      						<tr>
      							<th>번호</th>
      							<th>고객아이디</th>
      							<th>질문</th>
      							<th>답변</th>
      							
      						</tr>
      						<tr class = "answerResult">
      						</tr>
      					</table>
      					
      				</div>
      				<div class = "modal-footer">
      					<button type = "button" class = "btn btn-default" data-dismiss = "modal">Close</button>
      				</div>
      			</div>
      		</div>
      </div>
      <div class = "modal fade" id = "yourModal" role = "dialog">
      	<div class = "modal-dialog" >
      		<div class = "modal-content">
      			<div class = "modal-header">
      				<button type = "button" class = "close" data-dismiss = "modal">X</button>
      				<h4 class = "modal-title">답변 내역</h4>
      			</div>
      			<div class = "overAnswer modal-body">
      				
      			</div>
      			<div class = "modal-footer">
      			</div>
      		</div>
      	</div>
      </div>
      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <br><br><br><br><br><br>
     </div>
</body>
</html>