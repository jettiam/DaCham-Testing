<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
   .floating-box{
      display : inline-block;
         width: 150px;
       height: 75px;
       margin: 10px;   
   }
   .cooking{
      
   }
   #cookResult1 td{
      padding-bottom : 50px;
      padding-top : 50px;     
   }
</style>
<script>
   $(document).ready(function(){
      $("#cook").addClass("w3-light-gray");
      $(document.body).on("click","#finishBtn",function(){
         
         
         
         var length = $(".cook3>tbody>tr").length-1;
         
         
         for(var i=0; i<length; i++){
            var orderCode = $(".cook3 tbody tr:eq("+(i+1)+")").attr('data-code');            
            $.ajax({
               type : "put",   
               url : "cookAjax/"+ orderCode,
               headers : {
                  "Content-Type" : "application/json",
                  "X-HTTP-Method-Override" : "PUT"
               },
               dataType : 'text',
               success : function(result){
         
                  if(result == "SUCCESS"){
                  
                     window.location.href = "cookList";
                  }
               }
            });
         }
      });
      $(document.body).on("click",".cookResult1 td a",function(data){
         event.preventDefault();
         
      });
      cookAll1();
      
      $(document.body).on("click",".cook1 #cookResult1",function(){
         event.preventDefault();
         
   
         $(".cookResult2").remove();
         var i = $(this).attr("href");
         
         $(this).clone().appendTo(".cook2");
         $(this).remove();
         
      });    
      $(document.body).on("click",".cook2 #cookResult1",function(){
         event.preventDefault();
         
         $('.cookResult3').remove();
         
         $(this).clone().appendTo(".cook3");
         $(this).remove();
      });
      function cookAll1(){
         $.getJSON("cookAjax/readycook",function(data){
            $(".cookResult1").remove();
            var str = "";
         
            $(data).each(function(index){
               str += "<tr id = 'cookResult1' data-code = '"+this.orderCode+"'>"+"<td>"+"<a href = '"+index+"' data-name = '"+this.sideDName+"'>"+"<h2>"+this.sideDName+"</h2>"+"</a>"+"</td>"+"<td><h2>"+this.dietAmount+"인분</h2></td>"+"</tr>"
            });  
            $(".cook1").append(str);   
            
         });
      }
   });
</script>
</head>
<%@include file = "cookerNavi.jsp" %>
<body>
   <div style = "float:right; margin-right: 150px;">                        
         <button id = "finishBtn" class = "btn btn-primary">마감</button>
   </div>  
   <br><br><br>  
   <div class="container" style = "height : 600px;">    
      <div class = "row">
      <div style="float: left; width: 33%;"> 
         <h1>조리 대기</h1>     
             <table class = "cook1 table table-hover">
                 <tr>            
                    <th><h3>음식명</h3></th>
                    <th><h3>조리량</h3></th>
                 </tr>
                 <tr class = "cookResult1">
                 </tr>
            </table>
       </div>     
      <div style="float: left; width: 33%;">
         <h1>조리중</h1>        
         <table  class = "cook2 table table-hover">
                      <tr>
                        <th><h3>음식명</h3></th>
                        <th><h3>조리량</h3></th>
                     </tr>
                     <tr class = "cookResult2">
                     </tr>
         </table>       
      </div>  
      <div style="float: left; width: 33%;">
         <h1>조리완료</h1>        
         <table  class = "cook3 table table-hover">
                   <tr>
                     <th><h3>음식명</h3></th>          
                     <th><h3>조리량</h3></th>        
                  </tr>      
                   <tr class = "cookResult3">
                      
                   </tr>   
              
              </table>
      </div>
   </div>
       
   </div>    
   
</body>
</html>