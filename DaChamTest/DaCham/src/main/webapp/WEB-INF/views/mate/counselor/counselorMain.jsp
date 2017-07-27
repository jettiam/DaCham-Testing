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
</style>
<script>
   $(document).ready(function(){
      $(".searchResult2").remove();
      $.getJSON("counselAjax/counselorseList2All",function(data){
         var str = "";
         $(data).each(function(){
            str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
         });
         $(".search2").append(str);
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
               str += "<tr class = 'searchResult2'><td>"+this.counselCode+"</td><td class = 'counselTitle'><a data-code = '"+this.counselCode+"' data-name = '"+this.name+"' data-id = '"+this.id+"'>"+this.counselTitle+"</a></td><td>"+this.name+"</td><td>"+this.id+"</td><td>"+this.counselDate+"</td></tr>";
            });
            $(".search2").append(str);
         });
      });
   });
</script>
</head>
<body>
<%@include file = "counselorNavi.jsp" %>
   <div class = "container">
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
          <div>
          <select>
                  <option>등록자</option>
                  <option>제목</option>
                  <option>내용</option>
            </select>
               <input type = "text" name = "keyword">
               <button id = "search"> 검색 </button>
         </div>
         <div>
           
            <table border = "1">
               <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>등록자</th>
                  <th>등록일</th>
                  <th>조회수</th>
               </tr>
               <tr>
                  <td>1</td>
                  <td>영양관리주간목록</td>
                  <td>배송팀장</td>
                  <td>2017.05.05</td>
                  <td>0</td>
               </tr>
            </table>
         </div>
      </div>
      <div class = "box2">
         
         
      </div>
      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <br><br><br><br><br><br>
     </div>
</body>
</html>