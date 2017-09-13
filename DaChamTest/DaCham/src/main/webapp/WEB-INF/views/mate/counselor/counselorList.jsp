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
            str += "<tr class = 'searchResult1'><td>"+this.id+"</td><td><a class = 'nameClick' data-code = '"+this.couselCode+"' data-name = '"+this.id+"' data-toggle = 'modal' href = '#myModal'>"+this.name+"</a></td><td>"+this.birthday+"</td><td>"+this.address+"</td><td>"+this.tel+"</td><td>"+this.email+"</td><td>"+this.joinDate+"</td><td>"+this.diseaseName+"</td><td>"+this.judgement+"</td></tr>";
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
         var counselTitle = $(".quickTitle").val();
         
         $.ajax({
            type : "POST",
            url : 'counselAjax/counselInsert/'+customer+"/"+answer + "/" + counselTitle,
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
        
         var searchType = $(".searchType").val();
         var keyword = $("#keyword").val();
         if(keyword == ""){
        	 alert("검색어를 입력하세요");
         }
         else{
        	 $(".searchResult1").remove();
             
             var str = "";
        	 $.getJSON("counselAjax/listAll/"+searchType+"/"+keyword,function(data){
                 $(data).each(function(){
                 	str += "<tr class = 'searchResult1'><td>"+this.id+"</td><td><a class = 'nameClick' data-code = '"+this.couselCode+"' data-name = '"+this.id+"' data-toggle = 'modal' href = '#myModal'>"+this.name+"</a></td><td>"+this.birthday+"</td><td>"+this.address+"</td><td>"+this.tel+"</td><td>"+this.email+"</td><td>"+this.joinDate+"</td><td>"+this.diseaseName+"</td><td>"+this.judgement+"</td></tr>";
                 });
                 $(".search1").append(str);
              });	 
         }
         
      });
      
      $(document.body).on("click",".answerClick",function(){
    	 
    	 $('.overAnswer').empty();
         var counselCode = $(this).attr('data-code');
         var answer = $(this).attr('data-answer');
         var customer = $(this).attr('data-customer');
         $('.overAnswer').append("<div class = 'form-group'><label>기존답변:</label>");
         $('.overAnswer').append("<textarea readonly class = 'answerDual form-control'>"+answer+"</textarea></div>");
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
                         $(".answerDual").val(answer);
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
      $("#listAll").on("click",function(){
    	  $(".searchResult1").remove();
          $(".answerReturn").hide();
          $.getJSON("counselAjax/counselorListAll",function(data){
             var str = "";
             $(data).each(function(){
                str += "<tr class = 'searchResult1'><td>"+this.id+"</td><td><a class = 'nameClick' data-code = '"+this.couselCode+"' data-name = '"+this.id+"' data-toggle = 'modal' href = '#myModal'>"+this.name+"</a></td><td>"+this.birthday+"</td><td>"+this.address+"</td><td>"+this.tel+"</td><td>"+this.email+"</td><td>"+this.deptCode+"</td><td>"+this.gradeCode+"</td><td>"+this.joinDate+"</td><td>"+this.diseaseName+"</td><td>"+this.judgement+"</td></tr>";
             });
             $(".search1").append(str);
          });
      });
      $(document.body).on("click",".dualLink",function(){
    	  var counselCode = $(this).attr('data-code');
    	  console.log(counselCode);
    	  $.getJSON("counselAjax/views/"+counselCode,function(data){
    		  $("#dualContent").text(data.counselContent);
    		  $("#dualAnswer").text(data.answer);
    		  console.log(data.counselContent);
    		  console.log(data.answer);
    	  });
      });
      function linkAll(customer){
         $(".answerResult").remove();
        $(".super div").remove();	
         $.getJSON("counselAjax/linkCounsel2/"+customer,function(data){
            var str = "";
            $(data).each(function(){
               if(this.counselCode != null){
                  str += "<tr class = 'answerResult'><td>"+this.counselDate+"</td><td>"+this.counselItemName+"</td><td><a class = 'dualLink' href = '#ourModal' data-toggle = 'modal' data-code = '"+this.counselCode+"'>"+this.counselTitle+"</a></td></tr>";
               }
              
            });
            $(".link").append(str);
            $(".super").append("<div class = 'form-group'><label>글제목:</label><textarea class = 'quickTitle form-control'></textarea><label>신규등록</label><textarea class = 'quickAnswer form-control'></textarea><button id = 'newAnswer' class = 'btn btn-success' data-code = '"+customer+"'>등록</button></div>");
         });
      }
   });
 
</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

* {
	font-family: 'Jeju Gothic',"Nanum Gothic", sans-serif !important;
}
 .nameClick { color: blue; text-decoration: underline;}
 .link {
 	table-layout:fixed;
		work-break:break-all;
 }    
 .pushTable{    
 	table-layout:fixed;
		work-break:break-all;   
 }  
</style>
</head>
<body>           
<%@include file = "counselorNavi.jsp" %>
    
    <div class = "container-fluid"  >    
    <!--   <div class = "box1"> --> 
      
   
             <div class ="row">
				<div class="col-lg-12 col-md-12">
				<div class="card">
				<div class="card-header" data-background-color="#3A546D">
				<h4 class="title">고객정보</h4>
				<div class="form-group row">
				<div class="col-xs-2">
            <select name = "searchType" class= "searchType form-control">
                  <option value = "t"
                  <c:out value="${Counselor.searchType eq 't'?'selected':'' }"/>>
                  고객id
                  </option>
                  <option value = "c"
                  <c:out value="${Counselor.searchType eq 'c'?'selected':'' }"/>>
                  고객이름
                  </option>
            </select>
            </div>
          
            <div class="col-xs-3" >
            <input type = "text" name = "keyword" id = "keyword" class="form-control"  placeholder  = "검색어 입력란">
            </div>
            <button id = "search" class = "btn btn-success">검색</button>
            <button id = "listAll" class = "btn btn-warning">전체고객목록</button>
         </div>
        </div>
        
         
        <div>
			<div class="card-content table-responsive">
	        <table class = "search1 table table-borded" >                   
            <tr>
                  <th>고객id</th>
                  <th>고객이름</th>
                  <th>생일</th>
                  <th>주소</th>
                  <th>전화번호</th>
                  <th>Email</th>
                  <th>가입일</th>
                  <th>질병이름</th>
                  <th>위험군</th>
                  
            </tr>
              <tr class = "searchResult1">
              </tr>
         </table>
         </div>
         </div>
         </div>
         </div>
         </div>
         <form>
            <div class = "answer">
            </div>
         </form>     
      
      <div class = "modal fade" id = "myModal" role = "dialog" style = "width:100%; overflow-x:auto; word-wrap : break-word;">
      		<div class = "modal-dialog">
      			<div class = "modal-content">
      				<div class = "modal-header">
      					<button type = "button" class = "close" data-dismiss = "modal">X</button>
      					<h4 class = "modal-title">상담 내역</h4>
      				</div>
      				<div class = "super modal-body">
      					<table class = "link table table-borded">
      						<tr>
      							<th>날짜</th>
      							<th>상담목록</th>
      							<th>제목</th>
      							
      							
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
      <div class = "modal fade" id = "ourModal" role = "dialog" style= "word-wrap : break-word">
      	<div class = "modal-dialog">
      		<div class = "modal-content">
      			<div class = "modal-header">
      				<button type = "button" class = "close" data-dismiss = "modal">X</button>
      				<h4 class = "modal-title">상담상세 내역</h4>
      			</div>
      			<div class = "modal-body" style="word-wrap : break-word">
      				<table class = "pushTable table table-hover">
      					<tr>
      						<th>내용</th>
      						<td id = "dualContent"></td>
      					</tr>
      					<tr>
      						<th>답변</th>
      						<td id = "dualAnswer"></td>
      					</tr>
      				</table>
      			</div>
      			<div class = "modal-footer">
      			</div>
      		</div>
      		</div>
      		</div>
      	</div>
      
      <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
      <br><br><br><br><br><br>
    
  
</body>
</html>