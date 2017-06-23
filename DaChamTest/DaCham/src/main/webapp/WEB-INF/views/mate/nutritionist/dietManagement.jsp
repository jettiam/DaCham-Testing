<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="nutritionistNavi.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(){
		$("#regist").click(function(){
			window.location.href = "dietRegist";
		});
		
		$(".diseaseNation li a").on("click",function(){
			event.preventDefault();
			$(".searchResult").remove();
			
			var diseaseName = $(this).attr("data-name");
			
			$.getJSON("nutriAjax/diseaseDietOverview/"+diseaseName,function(data){
				console.log(data);
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'radio' value = '"+this.dietCode+"'>"+"</td>"+"<td><img src = 'displayFile?fileName="+this.dietImg+"' style = 'width: 75px; height: 25px;'></td>"+"<td>"+this.dietName+"</td>"+"<td>"+this.diseaseName+"</td>"+"</tr>";
				});
				$(".dietDiseaseOverview").append(str);     
			});
		});
	});
</script>
<title>Insert title here</title>
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
            <li><a data-name = "당뇨병">당뇨병</a></li>
            <li><a data-name = "고지혈증">고지혈증</a></li>
            <li><a data-name = "심부전증">심부전증</a></li>
            <li><a data-name = "신부전증">신부전증</a></li>
         </ul>
      </nav>
   </div>
   <div class = "box2">
      <div>
         <button id = "regist" class = "btn btn-default">식단 등록</button>
         <button class = "btn btn-default">식단 수정</button>
         <button class = "btn btn-default">식단 삭제</button>   
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
      </div>
   </div>
   </div>
</body>
</html>