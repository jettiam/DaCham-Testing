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
	
<link rel="shortcut icon" href="resources/favicon/N.ico">

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
<script>
	$(document).ready(function(){
		$("#side").addClass("w3-light-gray");
		
		var currentPage = 1;
		$('.category').hide();
		$('.category2').hide();
		$("#regist").click(function(){
			window.location.href = "sideDRegist";
		});
		var foodGName = "밥";
		var cookMName = "";
		categorySearch(1,"밥","찜");
		
		$(".pagination").on("click","li a",function(){
			event.preventDefault();
			var replyPage = $(this).attr("href");
			if(foodGName == '밥'){
				cookMName = "찜";
			}
			else if(foodGName == '국'){
				cookMName = "탕";
			}
			categorySearch(replyPage,foodGName, cookMName);
		});
		$(".category li a").on("click",function(){
			event.preventDefault();
			foodGName = $(this).attr("data-name");
			
			if(foodGName == "밥"){
				categorySearch(1,"밥","찜");
			}
			else if(foodGName == "국"){
				categorySearch(1,"국","탕");
			}
			else{
				$('.category').hide();
				$('.category2').show();
			}
			
		});
		
		
		function categorySearch(page,foodGName, cookMName){
			$(".searchResult").remove();
			$.getJSON("nutriAjax/categorySearch/"+page+"/"+foodGName+"/"+cookMName,function(data){
				console.log(data);
				var str = "";
				$(data.list).each(function(){
					str += "<tr class = 'searchResult'>"+"<td>"+"<input type = 'radio' name = 'radio' value = '"+this.sideDCode+"'>"+"</td>"+"<td><img src = 'displayFile?fileName="+this.sideDImg+"' style = 'width: 75px; height: 25px;'></td>"+"<td>"+this.sideDName+"</td>"+"</tr>"
					    
				});
				$(".searchTable").append(str);
				printPaging(data.criteria);
			});    
			$('.category').hide();
			$('#categoryStart').show();
		}
		
		
		$(".category2 li a").on("click",function(){
			event.preventDefault();
			cookMName = $(this).attr("data-name");
			$(".searchResult").remove();
			
			$('.category2').hide();
			$('#categoryStart').show();
			
			$.getJSON("nutriAjax/categorySearch/"+1+"/"+foodGName+"/"+cookMName,function(data){
				console.log(data);
				var str = "";
				$(data.list).each(function(){
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
			if(sideDCode == undefined){
				alert("라디오로 반찬을 선택 후 진행해 주세요");
			}
			else{
				window.location.href = "sideModify?sideDCode="+sideDCode;
			}
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
<title>반찬 관리 페이지</title>
<style>
	.box1 {
  float:left; width: 150px; margin-right : 20px;  }
 .box2 {
  display:inline-block;  margin-left:20px; width:800px;}
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
		<div class = "row">
			<div class = "col-lg-12 col-md-12">
				<div class = "card">
					<div class = "card-header" data-background-color = "#3A546D">
						<h4 class = "title">반찬 목록</h4>
						<div>
							<button id = "regist" class = "btn btn-primary">반찬 등록</button>
							<button class = "updateSide btn btn-primary">반찬 수정</button>
			<!-- 			<button class = "deleteSide btn btn-primary">반찬 삭제</button> -->
						</div>
					</div>
					<div class = "card-content table-responsive">
						<table class = "searchTable table table-hover">
							<tr>
								<th>&nbsp;&nbsp;</th>
								<th>이미지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
								<th>반찬명</th>
							</tr>
							<tr class = "searchResult">
								
							</tr>
						</table>
						<ul class = "pagination">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
   </div>
</body>
</html>