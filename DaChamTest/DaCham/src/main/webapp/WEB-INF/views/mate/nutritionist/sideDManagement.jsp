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
		$("#side").addClass("w3-light-gray");
		$('.category').hide();
		$('.category2').hide();
		$("#regist").click(function(){
			window.location.href = "sideDRegist";
		});
		var foodGName = "";
		var cookMName = "";
		$(".category li a").on("click",function(){
			event.preventDefault();
			foodGName = $(this).attr("data-name");
			if(foodGName == "밥"){
				$(".searchResult").remove();
				$.getJSON("nutriAjax/categorySearch/"+foodGName+"/"+"찜",function(data){
					console.log(data);
					var str = "";
					$(data).each(function(){
						str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'radio' value = '"+this.sideDCode+"'>"+"</td>"+"<td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width: 75px; height: 25px;'></td>"+"<td>"+this.sideDName+"</td>"+"</tr>"
					});
					$(".searchTable").append(str);
				});
				$('.category').hide();
				$('#categoryStart').show();
			}
			else if(foodGName == "국"){
				$(".searchResult").remove();
				$.getJSON("nutriAjax/categorySearch/"+foodGName+"/"+"탕",function(data){
					console.log(data);
					var str = "";
					$(data).each(function(){
						str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'radio' value = '"+this.sideDCode+"'>"+"</td>"+"<td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width: 75px; height: 25px;'></td>"+"<td>"+this.sideDName+"</td>"+"</tr>"
					});
					$(".searchTable").append(str);
				});
				$('.category').hide();
				$('#categoryStart').show();
			}
			else{
				$('.category').hide();
				$('.category2').show();
			}
			
		});
		$(".category2 li a").on("click",function(){
			event.preventDefault();
			cookMName = $(this).attr("data-name");
			$(".searchResult").remove();
			
			$('.category2').hide();
			$('#categoryStart').show();
			
			$.getJSON("nutriAjax/categorySearch/"+foodGName+"/"+cookMName,function(data){
				console.log(data);
				var str = "";
				$(data).each(function(){
					str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'radio' value = '"+this.sideDCode+"'>"+"</td>"+"<td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width: 75px; height: 25px;'></td>"+"<td>"+this.sideDName+"</td>"+"</tr>"
				});
				$(".searchTable").append(str);
			});
		});
		$("#categoryStart").on("click",function(){
			event.preventDefault();
			$('.category').show();
			$("#categoryStart").hide();
		});
		$(".updateSide").on("click",function(){
			var sideDCode = $('input:radio[name="radio"]:checked').val();
			window.location.href = "sideModify?sideDCode="+sideDCode;
		});
		$(".deleteSide").on("click",function(){
			var ans = confirm("삭제하면 되돌릴 수 없습니다. 정말로 반찬을 삭제하시겠습니까?");
			if(ans == false) return;
			var sideDCode = $('input:radio[name="radio"]:checked').val();
			$.ajax({
				type : "DELETE",			
				url : 'nutriAjax/delete/'+sideDCode,
				success : function(data){
					if(data =="SUCCESS"){
						alert("삭제되버렸습니다.");
						$(".searchResult").remove();
						$.getJSON("nutriAjax/categorySearch/"+foodGName+"/"+cookMName,function(data){
							console.log(data);
							var str = "";
							$(data).each(function(){
								str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'radio' value = '"+this.sideDCode+"'>"+"</td>"+"<td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width: 75px; height: 25px;'></td>"+"<td>"+this.sideDName+"</td>"+"</tr>"
							});
							$(".searchTable").append(str);
						});
					}
				}
			});
			
		});
	});
</script>
<title>반찬 관리 페이지</title>
<style>
	.box1 {
  float:left; width: 150px; margin-right : 20px;  }
 .box2 {
  display:inline-block;  margin-left:20px; width:580px;}
  ul{
  	list-style : none;
  }
</style>
</head>
<body>
<%@include file="nutritionistNavi.jsp" %>
   <div class = "container">
    <form>
    </form>
	<div class = "box1">
		<b>반찬 카테고리</b>
		<nav>
			<a href = "#" id = "categoryStart">반찬 찾아보기</a>
			<ul class = "category">
				<li><a data-name = "밥"><img class = "img-responsive dImg center-block" src = "resources/customerImage/dietImg/rice7.JPG" style = "width:50px; height:50px;">밥</a></li>
				<li><a data-name = "국"><img class = "img-responsive dImg center-block" src = "resources/customerImage/dietImg/s08.JPG" style = "width:50px; height:50px;">국</a></li>
				<li><a data-name = "메인 메뉴1"><img class = "img-responsive dImg center-block" src = "resources/customerImage/dietImg/m06.JPG" style = "width:50px; height:50px;">메인 메뉴1</a></li>
				<li><a data-name = "메인 메뉴2"><img class = "img-responsive dImg center-block" src = "resources/customerImage/dietImg/m07.JPG" style = "width:50px; height:50px;">메인 메뉴2</a></li>
				<li><a data-name = "메인 메뉴3"><img class = "img-responsive dImg center-block" src = "resources/customerImage/dietImg/m08.JPG" style = "width:50px; height:50px;">메인 메뉴3</a></li>
				<li><a data-name = "메인 메뉴4"><img class = "img-responsive dImg center-block" src = "resources/customerImage/dietImg/m09.JPG" style = "width:50px; height:50px;">메인 메뉴4</a></li>
			</ul>
		</nav>
		<nav>
			<ul class = "category2">
				<li><a data-name = "튀김"><h3>튀김</h3></a></li>
				<li><a data-name = "구이"><h3>구이</h3></a></li>
				<li><a data-name = "조림"><h3>조림</h3></a></li>
				<li><a data-name = "찜"><h3>찜</h3></a></li>
				<li><a data-name = "초벌"><h3>초벌</h3></a></li>
				<li><a data-name = "무침"><h3>무침</h3></a></li>
				<li><a data-name = "탕"><h3>탕</h3></a></li>
			</ul>
		</nav>
	</div>
	<div class = "box2">
		<div>
			<button id = "regist" class = "btn btn-primary">반찬 등록</button>
			<button class = "updateSide btn btn-primary">반찬 수정</button>
<!-- 			<button class = "deleteSide btn btn-primary">반찬 삭제</button> -->
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