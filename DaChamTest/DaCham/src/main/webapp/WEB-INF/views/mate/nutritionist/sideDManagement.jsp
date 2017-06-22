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
		$('.category').hide();
		$('.category2').hide();
		$("#regist").click(function(){
			window.location.href = "sideDRegist";
		});
		var foodGName = "";
		$(".category li a").on("click",function(){
			event.preventDefault();
			foodGName = $(this).attr("data-name");
			$('.category').hide();
			$('.category2').show();
		});
		$(".category2 li a").on("click",function(){
			event.preventDefault();
			var cookMName = $(this).attr("data-name");
			$(".searchResult").remove();
			
			$('.category2').hide();
			$('#categoryStart').show();
			
			$.getJSON("nutriAjax/categorySearch/"+foodGName+"/"+cookMName,function(data){
				console.log(data);
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'radio' value = '"+this.sideCode+"'>"+"</td>"+"<td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width: 75px; height: 25px;'></td>"+"<td>"+this.sideDName+"</td>"+"</tr>"
				});
				$(".searchTable").append(str);
			});
		});
		$("#categoryStart").on("click",function(){
			event.preventDefault();
			$('.category').show();
			$("#categoryStart").hide();
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
		<b>반찬 카테고리</b>
		<nav>
			<a href = "#" id = "categoryStart">반찬 찾아보기</a>
			<ul class = "category">
				<li><a data-name = "곡류">곡류</a></li>
				<li><a data-name = "조미류">조미류</a></li>
				<li><a data-name = "채소류">채소류</a></li>
				<li><a data-name = "생선류">생선류</a></li>
				<li><a data-name = "고기류">고기류</a></li>
			</ul>
		</nav>
		<nav>
			<ul class = "category2">
				<li><a data-name = "튀김">튀김</a></li>
				<li><a data-name = "구이">구이</a></li>
				<li><a data-name = "조림">조림</a></li>
				<li><a data-name = "찜">찜</a></li>
				<li><a data-name = "초벌">초벌</a></li>
				<li><a data-name = "무침">무침</a></li>
				<li><a data-name = "탕">탕</a></li>
			</ul>
		</nav>
	</div>
	<div class = "box2">
		<div>
			<button id = "regist" class = "btn btn-primary">반찬 등록</button>
			<button class = "btn btn-primary">반찬 수정</button>
			<button class = "btn btn-primary">반찬 삭제</button>
		</div>
		<div>
			<table class = "searchTable table table-hover">
				<tr>
					<th>&nbsp;&nbsp;</th>
					<th>이미지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th>반찬명</th>
				</tr>
				<tr class = "searchResult">
					
				</tr>
			</table>
		</div>
	</div>
   </div>
</body>
</html>