<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../../dacham/resources/bootstrap-filestyle.min.js"> </script>
<script>
	$(document).ready(function(){
		var v = 0;
		var currentPage = 1;
		$("#listAll").on("click",function(){
			materialAll(1);
		});
		$(".pagination").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			
			materialAll(replyPage);
		});
		
		
		$("#search").on("click",function(){
			$(".searchResult").remove();
			var search = $("#keyword").val();
			/* alert("검색값:"+search); */
			$.getJSON("nutriAjax/searching/"+search,function(data){
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'searchResult'><td>"+this.foodMCode+"</td>"+"<td>"+"<a class = 'nameClick' data-src = '"+this.foodMName+"' data-code = '"+this.foodMCode+"'>"+this.foodMName+"</a></td></tr>";
				});
				$(".searchTable").append(str);
				/* alert(str); */
			});
		});
		
		
		
		function materialAll(page){
			currentPage = page;
			$(".searchResult").remove();
			$.getJSON("nutriAjax/materialAll/"+page,function(data){
				var str = "";
				$(data.list).each(function(){
					str += "<tr class = 'searchResult'><td>"+this.foodMCode+"</td>"+"<td>"+"<a class = 'nameClick' data-src = '"+this.foodMName+"' data-code = '"+this.foodMCode+"'>"+this.foodMName+"</a></td></tr>";
				});
				$(".searchTable").append(str);
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
</head>
<body>
	<div class = "container">
		<input type = "hidden" name = "sideDCode" id = "sideDCode" value = "">
		<div class = "div1">
			<input type = "text" name = "search" placeholder = "식재료 검색어 입력란" id = "keyword">
			<button id = "search" class = "btn btn-warning">검색</button>
			<input type = "button" value = "전체목록" id = "listAll" class = "btn btn-warning">			
		</div>
		
		<table class = "searchTable table table-hover">
					<tr>
						<th>코드번호&nbsp;&nbsp;</th>   
						<th>식재료명&nbsp;&nbsp;</th>
					</tr>
					
					<tr class = "searchResult">
							
					</tr>
					
		</table>
		<ul class = "pagination">
		</ul>
		
		<div>
			<table class = "material table table-hover">
				<tr>
					<th>식재료명&nbsp;&nbsp;</th>
					<th>재료량&nbsp;&nbsp;</th>
				</tr>
				<tr class = "materialResult">
				</tr>
			</table>
		</div>
	</div>
</body>
</html>