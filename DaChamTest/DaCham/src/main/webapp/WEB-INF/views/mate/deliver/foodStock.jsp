<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.*" %>
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

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Jeju Gothic',"Nanum Gothic", sans-serif !important;
}
   #submit{
      position : relative;
      align : right;
   }
</style>
<script>
   $(document).ready(function(){
      var currentPage = 1;
      var dualStatus = 0;
      
      $(".action2").hide();
      
      showDeliverAll(1);
      
      
      
      var searchType = $(".searchType").val();
      var keyword = $(".keyword").val();
      
      $("#deliverFood").addClass("w3-light-gray");
      $("#regist").on("click",function(){
         $("#foodStockForm").attr("method","post");
         $("#foodStockForm").attr("action","deliverRegist");
         $("#foodStockForm").submit();
         alert("등록완료");      
      });
      
      
      $("#changer").on("click",function(){
         doing(1);           
      });
      $(document.body).on("click",".statusButton",function(){
    		var orderCode = $(this).attr("data-status");
    	    var foodMName = $(this).attr("data-vcode");
    	    $.ajax({
    	    	             type : "PUT",
    	    	            url : "deliverAjax/changer/"+orderCode + "/" + foodMName,
    	    		            success : function(result){
    	    	                if(result == "SUCCESS"){
    	    	                  console.log("입고처리되었습니다.");
    	    	               }
    	    	               else{
    	    	                   alert("오류 실패");
    	    	                }
    	    	            }
    	    	          });
      });
      $(".statusButton").on("click",function(){
        $("input[name='chk']:checked").each(function(){
        	var orderCode = $(this).val();
        	var foodMName = $(this).attr('data-status');
        	$.ajax({
                type : "PUT",
                url : "deliverAjax/changer/"+orderCode + "/" + foodMName,
                success : function(result){
                   if(result == "SUCCESS"){
                      console.log("입고처리되었습니다.");
                      window.location.reload();     
                   }
                   else{
                      alert("오류 실패");
                   }
                }
             });
        });
         
      });
      
      $("#search").on("click",function(){
         $(".actionResult").remove();
         
         keyword = $(".keyword").val();
         /* alert("검색값:"+search); */
         showDeliver(keyword);
      });
      
      function showDeliverAll(page){
         $(".actionResult").remove();
         $.getJSON("deliverAjax/showDeliverAll/"+page,function(data){
            var str = "";
            
            $(data.list).each(function(){
               
                  str += "<tr class = 'actionResult'><td><input type = 'checkbox' name = 'chk' class = 'orderCode' value = '"+this.orderCode+"' data-status = '"+this.foodMName+"'></td><td>"+"<input type = 'hidden' class = 'foodMICode' name = 'foodMICode' value = '"+this.foodMICode+"'>"+this.foodMICode+"</td><td>"+this.foodMName+"</td><td>"+this.orderDate+"</td><td>"+this.inAmount+"</td><td>"+this.unit+"</td><td>"+"<button class = 'statusButton btn btn-default' data-status = '"+this.orderCode+"' data-vcode = '"+this.foodMName+"'>입고작업</button>"+"</td></tr>";
            });
            $(".action1").append(str);    
            printPaging3(data.criteria);
         });
      }
      
      function showDeliver(keyword){
         
         $(".actionResult").remove();
         
         $.getJSON("deliverAjax/showDeliver/"+keyword,function(data){
            var str = "";
            $(data).each(function(){
            	str += "<tr class = 'actionResult'><td><input type = 'checkbox' name = 'chk' class = 'orderCode' value = '"+this.orderCode+"' data-status = '"+this.foodMName+"'></td><td>"+"<input type = 'hidden' class = 'foodMICode' name = 'foodMICode' value = '"+this.foodMICode+"'>"+this.foodMICode+"</td><td>"+this.foodMName+"</td><td>"+this.orderDate+"</td><td>"+this.inAmount+"</td><td>"+this.unit+"</td><td>"+"<button class = 'statusButton btn btn-default' data-status = '"+this.orderCode+"' data-vcode = '"+this.foodMName+"'>입고작업</button>"+"</td></tr>";
            });
            $(".action1").append(str);
            
         });                                        
         
      }   
      function doing(page){
         $(".doingResult").remove();
         $.getJSON("deliverAjax/doing/"+page,function(data){
            var str = "";
            $(data.list).each(function(){
                str += "<tr class = 'doingResult'><td><input type = 'hidden' class = 'orderCode' name = 'orderCode' value = '"+this.orderCode+"'>"+"<input type = 'hidden' class = 'foodMICode' name = 'foodMICode' value = '"+this.foodMICode+"'>"+this.foodMICode+"</td><td>"+this.foodMName+"</td><td>"+this.orderDate+"</td><td>"+this.inAmount+"</td><td>"+this.unit+"</td><td>"+this.orderCode+"</td></tr>";
            });
            $(".doingTable").append(str);
            printPaging2(data.criteria);
         });
      }
      $(".pagination1").on("click","li a",function(){
            event.preventDefault();
            var replyPage = $(this).attr("href");
            completeAll(replyPage);
         });
      $(".pagination2").on("click","li a",function(){
            event.preventDefault();
            var replyPage = $(this).attr("href");
            doing(replyPage);
         });
      $(".pagination3").on("click","li a",function(){
            event.preventDefault();
            var replyPage = $(this).attr("href");
            showDeliverAll(replyPage);
         });
      
      $("#completeAll").on("click",function(){
         $(".pagination3").hide();
         
         completeAll(1);
      });
      
      $("#allCheck").click(function() {
			if ($("#allCheck").prop("checked")) {
				//input태그의 name이 che인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=chk]").prop('checked', true);
				//클릭이 안되있으면 
			} else {
				$("input[name=chk]").prop('checked', false);
			}
		});
      function completeAll(page){
         $(".action1").hide();
         $(".actionResult2").remove();
         $(".action2").show();
         
         $.getJSON("deliverAjax/completeAll/"+page,function(data){
            var str = "";
            $(data.list).each(function(){
               str += "<tr class = 'actionResult2'><td><input type = 'hidden' class = 'orderCode' name = 'orderCode' value = '"+this.orderCode+"'>"+this.foodMICode+"</td><td>"+this.foodMName+"</td><td>"+this.inDate+"</td><td>"+this.inAmount+"</td><td>"+this.unit+"</td><td>"+this.orderItemName+"</td></tr>";   
            });
            $(".action2").append(str);
            printPaging(data.criteria);
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
         $(".pagination1").html(str);
      }
      function printPaging2(criteria){
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
         $(".pagination2").html(str);
      }
      function printPaging3(criteria){
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
         $(".pagination3").html(str);
      }
   });
</script>
<title>Insert title here</title>
</head>
<body>
   <%
      long time = System.currentTimeMillis(); 
   
      SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
   
      String str = dayTime.format(new Date(time));
   %>
   <%@include file = "deliverNavi.jsp" %>
   <div class = "container">
<!--       <form id = "foodStockForm"> -->
         
<!--          <table class = "table table-hover"> -->
<!--             <tr> -->
<!--                <th>입고날짜</th> -->
<%--                <td> <input type="date" name="inDate" value = "<%=str%>"></td> --%>
<!--                <th>단가(원)</th>      -->
<!--                <td><input type = "text" name = "price"></td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--                <td>입고량</td> -->
<!--                <td><input type = "text" name = "inAmount"></td> -->
<!--                <td>식재료이름</td> -->
<!--                <td> -->
<!--                   <select name = "foodMCode"> -->
<%--                      <c:forEach items = "${list }" var = "v"> --%>
<%--                         <option value = "${v.foodMCode }">${v.foodMName }</option> --%>
<%--                      </c:forEach> --%>
<!--                   </select> -->
<!--                </td> -->
<!--             </tr> -->
<!--             <tr> -->
<!--                <td>단위</td> -->
<!--                <td><input type = "text" name = "uint"></td>     -->
<!--                <td>출고날짜</td> -->
<!--                <td><input type = "date" name = "exDate"></td>           -->
<!--             </tr>                      -->
<!--          </table> -->
<!--          <button id = "regist" class = "btn btn-danger">확인</button> -->
<!--       </form> -->        
      <br><br><br>
   
<!--          <div> -->
<!--             <select name = "searchType" class = "searchType"> -->
<!--                <option value = "n" -->
<%--                   <c:out value="${deliver.searchType==null?'selected':'' }"/>> --%>
<!--                   분류 -->
<!--                   </option> -->
<!--                   <option value = "t" -->
<%--                   <c:out value="${deliver.searchType eq 't'?'selected':'' }"/>> --%>
<!--                   코드번호 -->
<!--                   </option> -->
<!--                   <option value = "c" -->
<%--                   <c:out value="${deliver.searchType eq 'c'?'selected':'' }"/>> --%>
<!--                   식재료명 -->
<!--                   </option> -->
<!--             </select> -->
<!--             <input type = "text" class = "keyword" name = "keyword" placeholder = "검색어 입력란"> -->
<!--             <button id = "search" class = "btn btn-warning">검색</button> -->
<!--          </div> -->
		<div>
			<input type = "text" class = "keyword" name = "keyword" placeholder = "검색어 입력란">
			<button id = "search" class = "btn btn-warning">검색</button>
		</div>
		<br><br><br>
         <div>
            <button  class = "btn btn-success"><a id = "changer" data-toggle = "modal" href = "#myModal">입고중인 목록</a></button>
            <button id = "completeAll" class = "btn btn-warning">입고된 목록</button>  
            <button class = "statusButton">체크항목 입고작업</button>                
         </div>
         <br><br>
            <div>
               <table class = "action1 table table-hover">
                  <tr>
                  	 <th><input type = "checkbox" name = "chk" id = "allCheck"></th>
                     <th>코드번호&nbsp;</th>
                           
                     <th>식재료명&nbsp;</th>
                     <th>주문날짜&nbsp;</th>
                     
                     <th>수량&nbsp;</th>
                     <th>단위&nbsp;</th>
                    
                     <th>입고여부</th>
                    

                  </tr>
                  
                     <tr class = "actionResult">
                     </tr>
                  
               </table>
               <ul class = "pagination3 pagination">
               </ul> 
               <table class = "action2 table table-hover">
                  <tr>
                     <th>코드번호</th>
                     <th>식재료명</th>
                     <th>입고날짜</th>
                     <th>수량</th>
                     <th>단위</th>
                     <th>입고여부</th>
                  </tr>
                  <tr class = "actionResult2">
                  </tr>
               </table>
               <ul class = "pagination1 pagination">
               </ul>       
            </div>
        
         
         <div class = "modal fade" id = "myModal" role = "dialog">
            <div class = "modal-dialog" style = "width:1080px;">
               <div class = "modal-content">
                  <div class = "modal-header">
                     <button type = "button" class = "close" data-dismiss = "modal">X</button>
                        <h4 class = "modal-title">진행중인 식재료</h4>
                  </div>
                  <div class = "modal-body">
                     <table class = "doingTable table table-hover">
                        <tr>
                           <th>코드번호&nbsp;</th>
                                 
                           <th>식재료명&nbsp;</th>
                           <th>주문날짜&nbsp;</th>
                           
                           <th>수량&nbsp;</th>
                           <th>단위&nbsp;</th>
                           <th>주문번호</th>
                           
                        </tr>   
                        <tr class = "doingResult">
                        </tr>
                        
                     </table>
                     <ul class = "pagination2 pagination">
                     </ul>
                  </div>
                  <div class = "modal-footer">
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
</body>
</html>