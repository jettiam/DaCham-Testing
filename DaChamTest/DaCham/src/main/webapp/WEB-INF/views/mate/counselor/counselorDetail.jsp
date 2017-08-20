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
  display:inline-block;  margin-left:50px;}  
</style>
<script>
$(document).ready(function(){
   
   $("#detail").addClass("w3-light-gray");
   
   linkAll();
   
   var id = "";
   var couselCode = ${counselCode};
   
   selectCounsel(couselCode);
   orderList(1,couselCode);
   selectMember(couselCode);
   
   var answer = "";
   var currentPage = 0;
   
   
   $(document.body).on("click",".counselCode",function(){
      couselCode = $(this).attr('data-code');
      var status = $(this).attr('data-status');
      if(status == '응답완료'){
    	  $(".dropOut").hide();
      }
      else if(status == '미응답'){
    	  $(".dropOut").show();	
      }
      $.getJSON("counselAjax/selectCounsel/"+couselCode,function(data){
         $("#counselItemCode2").text(data.counselItemName);
         $("#counselTitle2").text(data.counselTitle);
         $("#counselContent").text(data.counselContent);
         $("#thisAnswer").text(data.answer);
         $("#counselDate").text(data.counselDate);
         $(".answer2").val(data.answer);
      });
   });
   $(".pagination").on("click","li a",function(){
      event.preventDefault();
      var replyPage = $(this).attr("href");
      
      orderList(replyPage, couselCode);                  
   });
   
   function selectMember(couselCode){
      $.getJSON("counselAjax/selectMember/"+couselCode,function(data){
         $(".id").text(data.id);
         id = data.id;
         $(".name").text(data.name);
         $(".birthday").text(data.birthday);
         $(".joinDate").text(data.joinDate);
         $(".tel").text(data.tel);
         $(".email").text(data.email);
         $(".address").text(data.address);
         $(".diseaseName").text(data.diseaseName);
         $(".judgement").text(data.judgement);
         
      });
   }
   
   $(document.body).on("click",".dietName",function(){
      var orderCode = $(this).attr('data-src');
      $(".modalResult").remove();
      $.getJSON("counselAjax/optionTuning/"+orderCode,function(data){
         var str = "";
         $(data).each(function(){
            str += "<tr class = 'modalResult'><td>"+this.sideDName+"</td></tr>";
         });
         $(".modalTable").append(str);
      });
   });
   
   function orderList(page,couselCode){
      currentPage = page;
      $.getJSON("counselAjax/orderList/"+page+"/"+couselCode,function(data){
         $(".orderResult").remove();
         var str = "";
         $(data.list).each(function(){
            str += "<tr class = 'orderResult'><td>"+this.orderCode+"</td><td>"+this.id+"</td><td><a data-src = '"+this.orderCode+"' class = 'dietName' data-toggle = 'modal' href = '#myModal'>"+this.dietName+"</a></td><td>"+this.orderDate+"</td><td>"+this.paymentItemName+"</td><td>"+this.orderItemName+"</td></tr>";
         });
         
         $(".order").append(str);
         printPaging(data.criteria);
      });
   }
   function selectCounsel(couselCode){
      $.getJSON("counselAjax/selectCounsel/"+couselCode,function(data){
         $(".counselCode").val(data.counselCode);
         $(".counselItemName").val(data.counselItemName);
         $(".counselTitle").val(data.counselTitle);
         $(".counselContent").val(data.counselContent);   
         $(".answer2").val(data.answer);
         answer = data.answer;
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
               alert("답변이등록되었습니다.");
               $(".answers").val('');
               linkAll();
               selectCounsel(couselCode);
               orderList(1,couselCode);
               selectMember(couselCode);
            }
         }
      });
   });
   $("#search").on("click",function(){
      var keyword = $(".keyword").val();
      orderListSearch(couselCode,keyword);
   });
   $("#listAll").on("click",function(){
      $(".pagination").show();
      orderList(1,couselCode);
   });
   function orderListSearch(couselCode,keyword){
      
      
      $.getJSON("counselAjax/orderListSearch/"+couselCode+"/"+keyword,function(data){
         $(".orderResult").remove();
         $(".pagination").hide();
         var str = "";
         $(data).each(function(){
            str += "<tr class = 'orderResult'><td>"+this.orderCode+"</td><td>"+this.id+"</td><td class = 'dietName' data-code = '"+this.orderCode+"'><a href = '#'>"+this.dietName+"</a></td><td>"+this.orderDate+"</td><td>"+this.paymentItemName+"</td><td>"+this.orderItemName+"</td></tr>";
         });
         $(".order").append(str);
      });
   }
   
   function linkAll(){
      var customer = '${customer}';
      $(".answerResult").remove();
      $.getJSON("counselAjax/linkCounsel/"+customer,function(data){
         var str = "";
         $(data).each(function(){
            if(this.adviser == null){
               str += "<tr class = 'answerResult'><td>"+this.counselCode+"</td><td>"+this.counselItemName+"</td><td><a class = 'counselCode' data-code = '"+this.counselCode+"' data-id = '"+this.customer+"' data-toggle = 'modal' href = '#yourModal' data-status = '미응답'>"+this.counselTitle+"</a></td><td>"+this.counselDate+"</td><td>미응답</td></tr>";
            }
            else{
               str += "<tr class = 'answerResult'><td>"+this.counselCode+"</td><td>"+this.counselItemName+"</td><td><a class = 'counselCode' data-code = '"+this.counselCode+"' data-id = '"+this.customer+"' data-toggle = 'modal' href = '#yourModal' data-status = '응답완료'>"+this.counselTitle+"</a></td><td>"+this.counselDate+"</td><td>응답완료</td></tr>";
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
         <div class = "form-group" style = "border:1px solid gold;">     
            <label for = "comment">답변내용</label>       
            <textarea class = "answer2 form-control" readonly = 'readonly' rows = "10">
               
            </textarea>     
         </div>   
         <div class = "dropOut" style = "border:1px solid gold;">
            <textarea placeholder = "답변내용 입력" class = "answers"></textarea>
            <button id = "answer" class = "btn btn-success">답변</button>
         </div>
         <br><br>
         <div style = "border:1px solid gold;">   
            <h4>${name }님의 상담내역 </h4><br>                
               
            <table class = "link table table-hover">
               <tr>   
                  <th>번호</th>
                  <th>상담분류</th>
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
               <th>생일</th>
               <td class ="birthday">생일</td>
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
            <tr>
               <th>질병이름</th>
               <td class = "diseaseName">질병이름</td>
            </tr>
            <tr>
               <th>위험군</th>
               <td class = "judgement">위험군</td>
            </tr> 
         </table>
         <div style = "border:1px solid gold;">
               <h4>식단 주문목록</h4><br>   
            <input type = "text" name = "keyword" class = "keyword" placeholder = "식단명을 찾으려면 검색">   
            <button id = "search" class = "btn btn-default">검색</button>
            <button id = "listAll" class = "btn btn-default">전체식단</button>
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
      <div class = "modal fade" id = "myModal" role = "dialog">
            <div class = "modal-dialog">
               <div class = "modal-content">
                  <div class = "modal-header">
                     <button type = "button" class = "close" data-dismiss = "modal">X</button>
                     <h4 class = "modal-title">상세 내역</h4>
                  </div>
                  <div class = "modal-body">
                     <table class = "modalTable table table-borded">
                        <tr>
                           <th>반찬이름</th>
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
      <div class = "modal fade" id = "yourModal" role = "dialog">
         <div class = "modal-dialog">
            <div class = "modal-content">
               <div class = "modal-header">
                  <button type = "button" class = "close" data-dismiss = "modal">X</button>
                  <h4 class = "modal-title">상세 내역</h4>
               </div>
               <div class = "modal-body">
                  <table class = "modalTable2 table table-borded">
                     <tr>
                        <th>분류</th>
                        <td id = "counselItemCode2"></td>
                     </tr>
                     <tr>
                        <th>제목</th>
                        <td id = "counselTitle2"></td>
                     </tr>
                     <tr>
                        <th>상담일자</th>
                        <td id = "counselDate"></td>
                     </tr>
                     <tr>
                        <th>내용</th>
                        <td id = "counselContent"></td>
                     </tr>
                     <tr>
                        <th>답변</th>
                        <td id = "thisAnswer"></td>
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