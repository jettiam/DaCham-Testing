<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
  .nameClick { color: blue; text-decoration: underline;}
</style>
<script>
   $(document).ready(function(){
      $(".searchResult2").remove();
      //미상담 목록
      $.getJSON("counselAjax/unfinCounselList",function(data){
         var str = "";
         $(data).each(function(){
            //str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
         	str += "<tr class='searchResult2'><td>"+this.counselCode+"</td><td>"+this.counselItemName+"</td><td class='counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.customer+"'>"+this.counselTitle+"</a></td><td>"+this.customer+"</td><td>"+this.counselDate+"</td></tr>";
         });
         $("#unfinCounselList").append(str);
      });
      //상담 완료 목록
      $.getJSON("counselAjax/finCounselList",function(data){
         var str = "";
         $(data).each(function(){
            //str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
         	str += "<tr class='searchResult2'><td>"+this.counselCode+"</td><td>"+this.counselItemName+"</td><td class='counselTitle'><a class = 'nameClick' data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.customer+"'>"+this.counselTitle+"</a></td><td>"+this.customer+"</td><td>"+this.counselDate+"</td></tr>";
         });
         $("#finCounselList").append(str);
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
   });
</script>
</head>
<body>
<%@include file = "counselorNavi.jsp" %>
  
  <div class="container">   
    <div class="col-sm-6">
    <h3 class="text-center">미상담 목록</h3>
    	<table id="unfinCounselList" class="table">
    		<tr>
               <th>상담번호</th>               
               <th>상담분류</th>
               <th>상담제목</th>               
               <th>고객ID</th> 
               <th>작성일</th>                 
           </tr>
    	</table>
    </div>
    <div class="col-sm-6">
    <h3 class="text-center">상담완료 목록</h3>
    	<table id="finCounselList" class="table">
    		<tr>
               <th>상담번호</th>               
               <th>상담분류</th>
               <th>상담제목</th>               
               <th>고객ID</th> 
               <th>작성일</th>               
           </tr>
    	</table>
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