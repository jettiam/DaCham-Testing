<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.wdb3a.dacham.bean.OrderList"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- Bootstrap core CSS     -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />

<!--  Material Dashboard CSS    -->
<link href="resources/assets/css/material-dashboard.css"
	rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="resources/assets/css/demo.css" rel="stylesheet" />

<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons'
	rel='stylesheet' type='text/css'>

<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Jeju Gothic',"Nanum Gothic", sans-serif !important;
}
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:20px;}  
  .nameClick { color: blue; text-decoration: underline;}
</style>
<script>
   $(document).ready(function(){
      $(".searchResult2").remove();
      var currentPage = 0;
      //미상담 목록
      
      function orderList1(page){
    	  $(".searchResult2").remove();
    	  $.getJSON("counselAjax/unfinCounselList/"+page,function(data){
    	         var str = "";
    	         $(data.list).each(function(){
    	            //str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
    	         	str += "<tr class='searchResult2'><td>"+this.counselCode+"</td><td>"+this.counselItemName+"</td><td class='counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.customer+"'>"+this.counselTitle+"</a></td><td>"+this.customer+"</td><td>"+this.counselDate+"</td></tr>";
    	         });
    	         $("#unfinCounselList").append(str);
    	         printPaging(data.criteria);
    	      });
      }
	function orderList2(page){
		 $.getJSON("counselAjax/finCounselList/"+page,function(data){
			 $(".searchResult3").remove();
	         var str = "";
	         $(data.list).each(function(){
	            //str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
	         	str += "<tr class='searchResult3'><td>"+this.counselCode+"</td><td>"+this.counselItemName+"</td><td class='counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.customer+"'>"+this.counselTitle+"</a></td><td>"+this.customer+"</td><td>"+this.counselDate+"</td></tr>";
	         });
	         $("#finCounselList").append(str);
	         printPaging2(data.criteria);
	      });
      }
      $.getJSON("counselAjax/unfinCounselList/1",function(data){
         var str = "";
         $(data.list).each(function(){
            //str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
         	str += "<tr class='searchResult2'><td>"+this.counselCode+"</td><td>"+this.counselItemName+"</td><td class='counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.customer+"'>"+this.counselTitle+"</a></td><td>"+this.customer+"</td><td>"+this.counselDate+"</td></tr>";
         });
         $("#unfinCounselList").append(str);
         printPaging(data.criteria);
      });
      //상담 완료 목록
      $.getJSON("counselAjax/finCounselList/1",function(data){
         var str = "";
         $(data.list).each(function(){
            //str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
         	str += "<tr class='searchResult3'><td>"+this.counselCode+"</td><td>"+this.counselItemName+"</td><td class='counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.customer+"'>"+this.counselTitle+"</a></td><td>"+this.customer+"</td><td>"+this.counselDate+"</td></tr>";
         });
         $("#finCounselList").append(str);
         printPaging2(data.criteria);
      });
      
      $(".overPage1").on("click","li a",function(){
          event.preventDefault();
          var replyPage = $(this).attr("href");
          
          orderList1(replyPage);                  
       });
      $(".overPage2").on("click","li a",function(){
    	      event.preventDefault();
    	      var replyPage = $(this).attr("href");
    	      
    	      orderList2(replyPage);                  
       });
      
      $(document.body).on("click",".counselTitle a",function(){
         var counselCode = $(this).attr('data-code');
         var customer = $(this).attr('data-id');   
         var name = '';
         name = $(this).attr('data-name');
         window.location.href = "detail?customer="+customer+"&name="+name+"&counselCode="+counselCode;           
      });
      
      $("#Search").on("click",function(){
         $(".searchResult2").remove();         
         var str = "";
         var searchType = $(".searchType2").val();
         var keyword = $("#keyword2").val();
         $.getJSON("counselAjax/counselorseList2/"+searchType+"/"+keyword,function(data){
            $(data).each(function(){
               str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
            });
            $(".search2").append(str);
         });
      });
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
          $(".overPage1").html(str);
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
          $(".overPage2").html(str);
       }
   });
</script>
</head>
<body>
<%@include file = "counselorNavi.jsp" %>
  
  <div class="container">   
   		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="card">
			<div class="card-header" data-background-color="#3A546D">
				<h4 class="title text-center" >미상담 목록</h4>
    </div>
   
		<div class="card-content table-responsive">
    	<table id="unfinCounselList" class="table">
    		<tr>
               <th>상담번호</th>               
               <th>상담분류</th>
               <th>상담제목</th>               
               <th>고객ID</th> 
               <th>작성일</th>                 
           </tr>
    	</table>
    	<ul class = "overPage1 pagination">
               </ul>
    </div>
    </div>
    </div>
    </div>
    	<div class="row">
		<div class="col-lg-12 col-md-12">
		<div class="card">
		<div class="card-header" data-background-color="#3A546D">         
    	<h4 class="title text-center" >상담 목록</h4>
    	
   		</div> 	
    	<div class="card-content table-responsive">
    	<table id="finCounselList" class="table">
    		<tr>
               <th>상담번호</th>               
               <th>상담분류</th>
               <th>상담제목</th>               
               <th>고객ID</th> 
               <th>작성일</th>               
           </tr>
    	</table>
    	<ul class = "overPage2 pagination">
               </ul>
    </div>
   </div> 
   </div>
   </div>
     
    
 <%--     <div class = "container">
      <div class = "box1">
         
         <h3>전체 상담 내역</h3>         
          <div>
            <select name = "SearchType" class = "searchType2">
               <option value = "n"
                  <c:out value="${Counselor.searchType2==null?'selected':'' }"/>>
                  ----------
                  </option>
                  <option value = "y"
                  <c:out value="${Counselor.searchType2 eq 'y'?'selected':'' }"/>>
                  작성자이름
                  </option>
                  <option value = "u"
                  <c:out value="${Counselor.searchType2 eq 'u'?'selected':'' }"/>>
                  작성자ID
                  </option>
            </select>
            <input type = "text" name = "keyword2" id = "keyword2" placeholder = "검색어 입력란">
            <button id = "Search">검색</button>
       </div>
       <div>
            
           <table border ="1" class = "search2 table table-hover">            
               <tr>
                  <th>번호</th>
                  <th>글제목</th>
                  <th>작성자이름</th>
                  <th>작성자ID</th>
                  <th>작성일</th>
                
               </tr>
               <tr class = "searchResult2">
               </tr>
            </table>
         </div>   

      </div>
      </div> --%>

 
</body>
</html>