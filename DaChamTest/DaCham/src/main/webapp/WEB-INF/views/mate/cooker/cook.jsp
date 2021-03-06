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
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Jeju Gothic',"Nanum Gothic", sans-serif !important;
}
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
     
      cookAll1();
      
     $("#finishBtn").on("click",function(){
        window.location.href = "cookList";    
     });
      function cookAll1(){
         $.getJSON("cookAjax/readyScreen",function(data){
            $(".cookResult1").remove();
            var str = "";
         
            $(data).each(function(index){
               str += "<tr id = 'cookResult1' data-code = '"+this.orderCode+"'>"+"<td>"+"<h2>"+this.dietName+"</h2>"+"</td>"+"<td><h2>"+this.dietAmount+"인분</h2></td>"+"</tr>"
            });  
            $(".cook1").append(str);           
            
         });
      }
      cookAll2();
      function cookAll2(){
          $.getJSON("cookAjax/cookScreen",function(data){
             $(".cookResult2").remove();
             var str = "";
          
             $(data).each(function(index){
                str += "<tr id = 'cookResult2' data-code = '"+this.orderCode+"'>"+"<td>"+"<h2>"+this.dietName+"</h2>"+"</td>"+"<td><h2>"+this.dietAmount+"인분</h2></td>"+"</tr>"
             });  
             $(".cook2").append(str);           
             
          });
       }
      cookAll3();
      function cookAll3(){
          $.getJSON("cookAjax/endScreen",function(data){
             $(".cookResult3").remove();
             var str = "";
          
             $(data).each(function(index){
                str += "<tr id = 'cookResult3' data-code = '"+this.orderCode+"'>"+"<td>"+"<h2>"+this.dietName+"</h2>"+"</td>"+"<td><h2>"+this.dietAmount+"인분</h2></td>"+"</tr>"
             });  
             $(".cook3").append(str);              
             
          });
       }
   });
</script>
</head>
<%@include file = "cookerNavi.jsp" %>
<body>
   <div style = "float:right; margin-right: 150px;">                        
         <button id = "finishBtn" class = "btn btn-primary">목록보기</button>
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