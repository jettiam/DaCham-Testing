
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
         $("#deliverList").addClass("w3-light-gray");
         var currentPage = 1;
         var currentItemCode = "";
         all(1,5);
      
      $("#button").on("click",function(){
         var status = true;
         $("input[name='chk']:checked").each(function(){
            var orderCode = $(this).val();     
            var data = $(".transportNum"+orderCode).val();
            if(data == "" || orderCode == null){
                alert("운송장번호입력하세요");
                status = false;
            }
            else{
                 
               $.ajax({
                    type : "put",   
                    url : "deliverAjax/"+ orderCode,
                    headers : {
                       "Content-Type" : "application/json",
                       "X-HTTP-Method-Override" : "PUT"
                    },
                    dataType : 'text',
                    data : JSON.stringify({
                       "transportNum" : data
                    }),
                    success : function(result){
                       if(result == "SUCCESS"){
                          all(currentPage,5);
                          status = true;
                       }
                    }
                    
                 });
                 
            }
             
            
            
         });
         if(status == true && $("input[name='chk']").is(":checked")){   
            alert("배송이 완료되었습니다.");
         }
         
      });
      $("#search").on("click",function(){
         $(".searchResult").remove();
         var searchType = $('.searchType').val();
         var keyword = $("#keyword").val();
         if(keyword == ""){
            alert("검색어를 입력하세요");
         }
         
         $.getJSON("deliverAjax/"+searchType+"/"+keyword,function(data){
            var str = "";
            $(data).each(function(){
               str += "<tr class = 'searchResult'><td><input type = 'checkbox' name = 'chk' value = '"+this.orderCode+"' class = 'check'>"+"</td>"+"<td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.address+"</td>"+"<td>"+"<input type = 'text' class = 'transportNum"+this.orderCode+"' name = 'transportNum'>"+"</td>"+"<td>"+"배송대기"+"</td>"+"</tr>";
            });
            $(".searchTable").append(str);
         });
      });
      $("#all").on("click",function(){
         all(1,5);
      });
      $("#button1").on("click",function(){
         all(1,5);
      });
      $("#button2").on("click",function(){
         all(1,7);
      });
      $(".pagination").on("click","li a",function(){
         event.preventDefault();
         var replyPage = $(this).attr("href");
         all(replyPage,currentItemCode);
      });
      
      function all(page,orderItemCode){
         $.getJSON("deliverAjax/all/"+page+"/"+orderItemCode,function(data){
            currentPage = page;
            currentItemCode = orderItemCode;
            $(".searchResult").remove();
            var str = "";
            $(data.list).each(function(){
               if(orderItemCode == 5){
                  str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'checkBox' name = 'chk' value = '"+this.orderCode+"' class = 'check'>"+"</td>"+"<td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td class = 'orderItemName' style = 'color:red;'>"+this.dietName+"</td>"+"<td>"+this.address+"</td>"+"<td>"+"<input type = 'text' class = 'transportNum"+this.orderCode+"' name = 'transportNum'>"+"</td>"+"<td style ='color:red;'>"+"배송대기"+"</td>"+"</tr>";
               }
               else{
                  str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'checkBox' name = 'chk' value = '"+this.orderCode+"' class = 'check'>"+"</td>"+"<td>"+this.orderCode+"</td>"+"<td>"+this.id+"</td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.address+"</td>"+"<td>"+"<input type = 'text' class = 'transportNum"+this.orderCode+"' name = 'transportNum' value = '"+this.transportNum+"' readonly>"+"</td>"+"<td>"+this.orderItemName+"</td>"+"</tr>";
               }
            });
            $(".searchTable").append(str);
            printPaging(data.criteria);
         });
      }
      function printPaging(criteria){
         var str = "";
               
         if(criteria.prev){
            str += "<li><a href=''"+(criteria.startPage-1)+"'>'" + "<<"+"</a></li>";
         }
         for(var i = criteria.startPage; i<=criteria.endPage; i++){
            var strClass = criteria.page == i?"class = 'active'":"";
            str += "<li "+strClass+"><a href ='"+i+"'>"+i + "</a></li>";
         }
         if(criteria.next){
            str += "<li><a href=''"+(criteria.endPage+1)+"'>'" + ">>"+"</a></li>";
         }
         $(".pagination").html(str);
      }
   
   $("#allCheck").click(function() {
      
      if ($("#allCheck").prop("checked")) {
         //input태그의 name이 che인 태그들을 찾아서 checked옵션을 true로 정의
         $("input[name=chk]").prop('checked', true);
         //클릭이 안되있으면 
      } else {
         $("input[name=chk]").prop('checked', false);
      }
   });
   });
</script>
</head>
<body>
<%@include file = "deliverNavi.jsp" %>
   <div class = "container">
                <div class ="row">
				<div class="col-lg-12 col-md-12">
				<div class="card">
				<div class="card-header" data-background-color="#3A546D">
				<h4 class="title">배송 검색</h4>
				<div class="form-group row">
				<div class="col-xs-2">
         <select name = "searchType" class = "searchType form-control">
            <option value = "n"
               <c:out value="${orderList.searchType==null?'selected':'' }"/>>
               분류
               </option>
               <option value = "t"
               <c:out value="${orderList.searchType eq 't'?'selected':'' }"/>>
               주문번호
               </option>
               <option value = "c"
               <c:out value="${orderList.searchType eq 'c'?'selected':'' }"/>>
               고객id
               </option>
         </select>
         </div>
         <div class="col-xs-3">
         <input type = "text" name = "keyword" class="form-control" placeholder = "검색어 입력란" id = "keyword">
         </div>
         
         <button id = "search" class = "btn btn-success">검색</button>
         <button id = "all" class = "btn btn-success">전체목록</button>
      </div>
      </div>
      
      
      <br>
     
      <div class="card">
      <button id = "button" class = "btn btn-success">배송</button>
      <div style = "float:right;">
         <button id = "button1" class = "btn btn-info">배송목록</button>
         <button id = "button2" class = "btn btn-info">배송확인 목록</button>       
      </div>
     
     
      	<div class="card-content table-responsive">
         <table class = "searchTable table table-hover">   
            <tr>
               <th><input type = "checkbox" name = "chk" id = "allCheck"></th>
               <th>주문번호</th>
               <th>고객 아이디</th>
               <th>식단명</th>
               <th>주소</th>
               <th>운송장번호</th>
               <th>배송상태</th>
            </tr>
               <tr class = "searchResult">
                  
               </tr>
         </table>
        </div>
        </div>
        
        
         <ul class = "pagination">
         </ul>
      
      </div>
    
      </div>
      </div>
</body>
</html>