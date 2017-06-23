<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.min.css">	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>DaCham 식단상세보기</title>
</head>
<style>
/* .dashboard-nav-card {
	background: #1779ba;
	border-radius: 0;
	color: #fefefe;
	display: block;
	min-height: 100px;
	padding: 2rem;
	position: relative;
	width: 100%;
}

.dashboard-nav-card:hover .dashboard-nav-card-title, .dashboard-nav-card:hover .dashboard-nav-card-icon
	{
	color: #fefefe;
}

.dashboard-nav-card:hover .dashboard-nav-card-icon {
	opacity: 1;
	transition: all 0.2s ease;
}

.dashboard-nav-card-icon {
	font-size: 1.25rem;
	left: 1rem;
	opacity: 0.5;
	position: absolute;
	top: 1rem;
	transition: all 0.2s ease;
	width: auto;
}

.dashboard-nav-card-title {
	bottom: 0;
	position: absolute;
	right: 1rem;
	text-align: right;
}

.detailOrderWrap {
	width: 80%;
	margin: 0 auto;
}

.sideDImg {
	width: 150px;
	height: 150px;
}

#dietImg {
	width: 240px;
	height: 180px;
}

table, tr, td {
	border: solid 1px black;
}

table {
	display: inline-table;
} */
</style>
<script>
	function getDishList(a) {
		a.children().each(
						function() {
							var foodGCode = $(this).attr("data-foodGCode");
							var b = $(this);
							$
									.getJSON(
											"customerAjax/getfoodG/"
													+ foodGCode, //controller를 통해 요청.
											function(data) { //데이터 받아옴 data.list로 사용
												for (var i = 0; i < data.list.length; i++) {
													b
															.append("<label><div class='foodGSideD' data-sideDCode='"+data.list[i].sideDCode+"'>"
																	+ "<input type='radio' name='"+data.list[i].foodGCode+"' value='"+data.list[i].sideDCode+"' />"
																	+ "<img src='http://via.placeholder.com/150x150'>"
																	//<img class='sideDImg' src='displayFile?fileName="	+ data.list[i].sideDImg//+ "'>"
																	+ data.list[i].sideDName
																	+ "  <table><tr><td>칼로리</td><td>탄수화물</td><td>단백질</td><td>지방</td><td>나트륨</td></tr><tr><td>"
																	+ data.list[i].kcal
																			.toFixed(0)
																	+ "kcal</td><td>"
																	+ data.list[i].carbohydrate
																			.toFixed(0)
																	+ "g</td><td>"
																	+ data.list[i].protein
																			.toFixed(0)
																	+ "g</td><td>"
																	+ data.list[i].fat
																			.toFixed(0)
																	+ "g</td><td>"
																	+ data.list[i].na
																			.toFixed(0)
																	+ "mg</td></tr></table>"
																	+ "</div></label>");
												}
											})
						});
	}

	function getCheckedList(a) {		
		var arrInx = 0;
		var sideDish = [];
		a.children().each(function() {
			var name = $(this).attr("data-foodGCode");
			var checkedValue = $('input:radio[name="'+name+'"]:checked').val(); //벨류가 반찬 코드		
			if(checkedValue!=undefined){
			sideDish[arrInx] = checkedValue;
			arrInx++;		
			}
			console.log(sideDish);
		});
		$("#orderForm>#sideDish").remove();
		for(i=0; i<arrInx; i++){
			$("#orderForm").append(					
					"<input id='sideDish' type='hidden' name='sideDish' value='"+sideDish[i]+"'>");
		}		
	}

	$(document).ready(function() {
		getDishList($("#foodGList"));
	 /* $(document).on("click", "input:radio", function() {
			getCheckedList($("#foodGList"));
		});  */
		//console.log("${list}.length");
		/* $(".sideDList").on("click",function() {
							$(".foodGSideD").remove();
							var foodGCode = $(this).attr("data-foodGCode");
							$.getJSON(
											"customerAjax/getfoodG/"
													+ foodGCode,
											function(data) {
										 	var a = data.list;
												console.log(a); 
												for (var i = 0; i < data.list.length; i++) {
													console.log(data.list[i]);
													$(
															"#foodGList")
															.append(
																	"<label><div class='col-sm-8 foodGSideD' data-sideDCode='"+data.list[i].sideDCode+"'>"
																			+ "<input type='radio' name='"+data.list[i].foodGCode+"' value='"+data.list[i].sideDCode+"' />"
																			+ "<img src='http://via.placeholder.com/150x150'>"
																			+ "<b>  "
																			+ data.list[i].sideDCode
																			+ "  </b>"
																			//<img class='sideDImg' src='displayFile?fileName="	+ data.list[i].sideDImg//+ "'>"
																			+ data.list[i].sideDName
																			+ "  <table><tr><td>칼로리</td><td>탄수화물</td><td>단백질</td><td>지방</td><td>나트륨</td></tr><tr><td>"
																			+ data.list[i].kcal
																					.toFixed(0)
																			+ "kcal</td><td>"
																			+ data.list[i].carbohydrate
																					.toFixed(0)
																			+ "g</td><td>"
																			+ data.list[i].protein
																					.toFixed(0)
																			+ "g</td><td>"
																			+ data.list[i].fat
																					.toFixed(0)
																			+ "g</td><td>"
																			+ data.list[i].na
																					.toFixed(0)
																			+ "mg</td></tr></table>"
																			+ "</div></label>");
												}

											});
						}); */

		$("#dietAmount").keyup(function() {
			var a = $("#dietAmount").val();
			var price = $("#dietPrice").attr("data-basicPrice");
			console.log("수량" + a);
			console.log("가격" + price);
			console.log(a * price);
			$("#dietPrice").text(a * price);
		});
		$("#dietAmount").mouseup(function() {
			var a = $("#dietAmount").val();
			var price = $("#dietPrice").attr("data-basicPrice");
			console.log("수량" + a);
			console.log("가격" + price);
			console.log(a * price);
			$("#dietPrice").text(a * price);
		});

		$("#doOrder").on("click", function() {
			//getCheckedList($("#foodGList")
			$("#setDietCode").val();
			$("#setDietName").val($("#dietName").text());
			$("#setPrice").val($("#dietPrice").text());
			$("#setDietAmount").val($("#dietAmount").val());
			$("#setDietImg").val($("#dietImg").attr("data-dietImg"));
			$("#orderForm").attr("action", "doOrder");
			$("#orderForm").submit();
		});

		$("#goMyCart").on("click", function() {
			getCheckedList($("#foodGList"));
			$("#setDietCode").val();
			$("#setDietName").val($("#dietName").text());
			$("#setPrice").val($("#dietPrice").text());
			$("#setDietAmount").val($("#dietAmount").val());
			$("#sideDish").val();
			$("#orderForm").attr("action", "goMyCart");
			$("#orderForm").submit();
		});
	});
</script>
<body>
	<%@include file="../../clientNavi.jsp"%>
	<div class="detailOrderWrap">
		<div class="row">
			<div class="col-sm-7">
				<img src="http://via.placeholder.com/150x150">
				<!--<img id="dietImg" data-dietImg="${list[0].dietImg}"
					src='displayFile?fileName=${list[0].dietImg}' /> -->

			</div>

			<div class="col-sm-5">
				<div id="dietName">
					<h2>${list[0].dietName}</h2>
				</div>
				<div>
					가격 <span id="dietPrice" data-basicPrice="${list[0].price}">${list[0].price}</span>원
				</div>
				<div>
					<label name="dietAmount">수량</label><input id="dietAmount"
						type="number" name="dietAmount" value="1">
				</div>
				<div>
					<button id="goMyCart">장바구니</button>
					<button id="doOrder">주문하기</button>
				</div>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${list}" var="list">
				<div class="col-sm-2  sideDList" data-foodGCode='${list.foodGCode}'>
					<div>
						<img src="http://via.placeholder.com/150x150">
						<!-- img class="sideDImg" src='displayFile?fileName=${list.sideDImg}'> -->
					</div>
					<div>${list.sideDName}반찬군이름나와야됨.</div>
				</div>
			</c:forEach>
		</div>

		<!-- 반찬군별 식단의 반찬 리스트 노출 -->
		<div class="row" id="foodGList">
			<c:forEach items="${list}" var="list">
				<div id="${list.foodGCode}_foodGList"
					data-foodGCode="${list.foodGCode}">
					<h1>${list.foodGCode}</h1>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- 가은 편집 반찬 선택창 입니다 :) -->
	<div>
		<section>
			<nav>
				<ul>
				</ul>
			</nav>
		</section>
	</div>
	<div>
		<img src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150"> <img
			src="http://via.placeholder.com/150x150">
	</div>

	<div>
		<h1>삭제할 공간입니다.</h1>
		<div id="testing"></div>
	</div>



	<form id="orderForm" method="get">
		<input id="setDietCode" type="hidden" name="dietCode"
			value="${list[0].dietCode }"> 
		<input id="setPrice" type="hidden" name="price">
		<input id="setDietImg"type="hidden" name="dietImg">
		<input id="setDietAmount" type="hidden" name="dietAmount">
		<input id="setDietName" type="hidden" name="dietName">
		<input id="customerId" type="hidden" name="id" value="${customerId}">
		<input id="sideDish" type="hidden" name="sideDish">
		<input type="hidden" name="detailOrder" value="true">
		<!-- 디테일오더에서 넘어갔는지 유무 -->
	</form>
	
    <!-- Start Top Bar -->
    <div class="top-bar">
      <div class="row">
        <div class="top-bar-left">
          <ul class="dropdown menu" data-dropdown-menu>
            <li class="menu-text">Yeti Store</li>
            <li class="has-submenu">
              <a href="#">One</a>
              <ul class="submenu menu vertical" data-submenu>
                <li><a href="#">One</a></li>
                <li><a href="#">Two</a></li>
                <li><a href="#">Three</a></li>
              </ul>
            </li>
            <li><a href="#">Two</a></li>
            <li><a href="#">Three</a></li>
          </ul>
        </div>
        <div class="top-bar-right">
          <ul class="menu">
            <li><input type="search" placeholder="Search"></li>
            <li><button type="button" class="button">Search</button></li>
          </ul>
        </div>
      </div>
    </div>
    <!-- End Top Bar -->
    <br>
    <!-- You can now combine a row and column if you just need a 12 column row -->
    <div class="row columns">
      <nav aria-label="You are here:" role="navigation">
        <ul class="breadcrumbs">
          <li><a href="#">Home</a></li>
          <li><a href="#">Features</a></li>
          <li class="disabled">Gene Splicing</li>
          <li>
            <span class="show-for-sr">Current: </span> Cloning
          </li>
        </ul>
      </nav>
    </div>

    <div class="row">
      <div class="medium-6 columns">
        <img class="thumbnail" src="http://placehold.it/650x350">
        <div class="row small-up-4">
          <div class="column">
            <img class="thumbnail" src="http://placehold.it/250x200">
          </div>
          <div class="column">
            <img class="thumbnail" src="http://placehold.it/250x200">
          </div>
          <div class="column">
            <img class="thumbnail" src="http://placehold.it/250x200">
          </div>
          <div class="column">
            <img class="thumbnail" src="http://placehold.it/250x200">
          </div>
        </div>
      </div>
      <div class="medium-6 large-5 columns">
        <h3>My Awesome Product</h3>
        <p>Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in.</p>

        <label>Size
        <select>
          <option value="husker">Small</option>
          <option value="starbuck">Medium</option>
          <option value="hotdog">Large</option>
          <option value="apollo">Yeti</option>
        </select>
        </label>

        <div class="row">
          <div class="small-3 columns">
            <label for="middle-label" class="middle">Quantity</label>
          </div>
          <div class="small-9 columns">
            <input type="text" id="middle-label" placeholder="One fish two fish">
          </div>
        </div>

        <a href="#" class="button large expanded">Buy Now</a>

        <div class="small secondary expanded button-group">
            <a class="button">Facebook</a>
            <a class="button">Twitter</a>
            <a class="button">Yo</a>
          </div>
        </div>
    </div>

    <div class="column row">
      <hr>
      <ul class="tabs" data-tabs id="example-tabs">
        <li class="tabs-title is-active"><a href="#panel1" aria-selected="true">Reviews</a></li>
        <li class="tabs-title"><a href="#panel2">Similar Products</a></li>
      </ul>
      <div class="tabs-content" data-tabs-content="example-tabs">
        <div class="tabs-panel is-active" id="panel1">
          <h4>Reviews</h4>
          <div class="media-object stack-for-small">
            <div class="media-object-section">
              <img class="thumbnail" src="http://placehold.it/200x200">
            </div>
            <div class="media-object-section">
              <h5>Mike Stevenson</h5>
              <p>I'm going to improvise. Listen, there's something you should know about me... about inception. An idea is like a virus, resilient, highly contagious. The smallest seed of an idea can grow. It can grow to define or destroy you.</p>
            </div>
          </div>
          <div class="media-object stack-for-small">
            <div class="media-object-section">
              <img class="thumbnail" src="http://placehold.it/200x200">
            </div>
            <div class="media-object-section">
              <h5>Mike Stevenson</h5>
              <p>I'm going to improvise. Listen, there's something you should know about me... about inception. An idea is like a virus, resilient, highly contagious. The smallest seed of an idea can grow. It can grow to define or destroy you</p>
            </div>
          </div>
          <div class="media-object stack-for-small">
            <div class="media-object-section">
              <img class="thumbnail" src="http://placehold.it/200x200">
            </div>
            <div class="media-object-section">
              <h5>Mike Stevenson</h5>
              <p>I'm going to improvise. Listen, there's something you should know about me... about inception. An idea is like a virus, resilient, highly contagious. The smallest seed of an idea can grow. It can grow to define or destroy you</p>
            </div>
          </div>
          <label>
            My Review
            <textarea placeholder="None"></textarea>
          </label>
          <button class="button">Submit Review</button>
        </div>
        <div class="tabs-panel" id="panel2">
          <div class="row medium-up-3 large-up-5">
            <div class="column">
              <img class="thumbnail" src="http://placehold.it/350x200">
              <h5>Other Product <small>$22</small></h5>
              <p>In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci a
                c euismod semper, magna diam.</p>
              <a href="#" class="button hollow tiny expanded">Buy Now</a>
            </div>
            <div class="column">
              <img class="thumbnail" src="http://placehold.it/350x200">
              <h5>Other Product <small>$22</small></h5>
              <p>In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam.</p>
              <a href="#" class="button hollow tiny expanded">Buy Now</a>
            </div>
            <div class="column">
              <img class="thumbnail" src="http://placehold.it/350x200">
              <h5>Other Product <small>$22</small></h5>
              <p>In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam.</p>
              <a href="#" class="button hollow tiny expanded">Buy Now</a>
            </div>
            <div class="column">
              <img class="thumbnail" src="http://placehold.it/350x200">
              <h5>Other Product <small>$22</small></h5>
              <p>In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam.</p>
              <a href="#" class="button hollow tiny expanded">Buy Now</a>
            </div>
            <div class="column">
              <img class="thumbnail" src="http://placehold.it/350x200">
              <h5>Other Product <small>$22</small></h5>
              <p>In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam.</p>
              <a href="#" class="button hollow tiny expanded">Buy Now</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="row column">
      <hr>
      <ul class="menu">
        <li>Yeti Store</li>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
        <li class="float-right">Copyright 2016</li>
      </ul>
    </div>


    
    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="http://dhbhdrzi4tiry.cloudfront.net/cdn/sites/foundation.js"></script>
    <script>
      $(document).foundation();
    </script>

</body>
</html>