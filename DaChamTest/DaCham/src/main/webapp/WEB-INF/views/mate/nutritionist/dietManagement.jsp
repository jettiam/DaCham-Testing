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
<script>
	$(document).ready(function(){
		$("#diet").addClass("w3-light-gray");
		var currentPage = 1;
		var diseaseName = "";
		$("#regist").click(function(){
			window.location.href = "dietRegist";
		});
		
		$(".pagination").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			
			all(replyPage, diseaseName);
		});
		
		$(".diseaseNation li a").on("click",function(){
			event.preventDefault();
			
			
			var subDiseaseName = $(this).attr("data-name");
			diseaseName = subDiseaseName;
			all(1, diseaseName);
			
		});
		
		$(".modifyDiet").on("click",function(){
			var dietCode = 0;
			dietCode = $('input:radio[name="radio"]:checked').val();
			if(dietCode == undefined){
				alert("라디오로 식단을 선택한 후 진행해 주세요");
			}
			else{
				window.location.href =  "dietModify?dietCode="+dietCode;	
			}
				
		});
		
		$(".deleteDiet").on("click",function(){
			var ans = confirm("삭제하면 되돌릴 수 없습니다. 정말로 식단을 삭제하시겠습니까?");
			if(ans == false) return;
			
			var dietCode = $('input:radio[name="radio"]:checked').val();
			$.ajax({
				type : "DELETE",
				url : 'nutriAjax/remove/'+dietCode,
				success : function(data){
					if(data == "SUCCESS"){
						alert("삭제되어버렸습니다.");
						
						all(currentPage,diseaseName);
					}
				}
			});
		});
		function all(page, diseaseName){
			currentPage = page;
			console.log(diseaseName);
			$(".searchResult").remove();
			$.getJSON("nutriAjax/diseaseDietOverview/"+page+"/"+diseaseName,function(data){
				console.log(data);
				console.log(page);
				var str = "";
				$(data.list).each(function(){
					str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'radio' value = '"+this.dietCode+"'>"+"</td>"+"<td><img src = 'displayFile?fileName="+this.dietImg+"' style = 'width: 75px; height: 25px;'></td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.diseaseName+"</td>"+"</tr>";
				});
				$(".dietDiseaseOverview").append(str); 
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
			$(".pagination").html(str);
		}
	});
</script>
<title>식단 관리 페이지</title>
<style>
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:10px;}  
  ul{
  	list-style : none;
  }
</style>
</head>
<body>
<%@include file="nutritionistNavi.jsp" %>
	<div class = "container">
   <div class = "box1">
      <table>
         <tr>
            <th>질환</th>      
          
         </tr>
         <tr>
          
         </tr>
      </table>
      <nav>
         <ul class = "diseaseNation">
            <li><a data-name = "당뇨">당뇨</a></li>
            <li><a data-name = "고지혈증">고지혈증</a></li>
            <li><a data-name = "심부전증">심부전증</a></li>
            <li><a data-name = "신부전증">신부전증</a></li>
         </ul>
      </nav>
   </div>
   <div class = "box2">
      <div>
         <button id = "regist" class = "btn btn-default">식단 등록</button>
         <button class = "modifyDiet btn btn-default">식단 수정</button>
<!--          <button class = "deleteDiet btn btn-default">식단 삭제</button>    -->
      </div>
      <div>
         <table class = "dietDiseaseOverview table table-hover">
            <tr>
               <th></th>
               <th>식단 이미지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
               <th>식단명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
               <th>질환&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            </tr>
            <tr class = "searchResult">
               
            </tr>
         </table>
         <ul class = "pagination">
         </ul>
      </div>
   </div>
   </div>
</body>
</html>