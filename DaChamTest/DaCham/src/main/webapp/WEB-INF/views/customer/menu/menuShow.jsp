<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<style> 
#menuShowWrap{
	max-width: 1080px;
	height: 100%;
	margin: 0 auto;
	text-align: center;
}
#menuShowTableWrap{
position: relative;
	
	float: left;
	margin-left: 70px;
	margin-right: 70px;
	
}
#menuShowTextWrap {
position: relative;
	
	float: left;
	width:400px;
	height:100px;
	text-align: center;
	margin-left: 70px;
	margin-right: 70px;
	margin-bottom:10px;
}

#menuShowNutriTable{
position: relative;
	
	float: left;
	width:400px;
	height:100px;
	text-align: center;
	margin-left: 70px;
	margin-right: 70px;
	border : solid 1px black;
}
.NutriTable 
{
border : solid 1px black;
width:100px;
}
#menuShowList1{display:none;}
#menuShowList2{display:none;}
#menuShowList3{display:none;}
#menuShowList4{display:none;}
#menuShowImg
{width:200px;
 height:150px;
}
</style>


<%@include file="../../clientNavi.jsp" %>

<div id = "menuShowWrap">
<h1>이달의 메뉴</h1>
<input type="button" id="disease00" class="btn btn-warning" value="다참 베이직">
<input type="button" id="disease01" class="btn btn-warning" value="당뇨">
<input type="button" id="disease02" class="btn btn-warning" value="신부전증">
<input type="button" id="disease03" class="btn btn-warning" value="심부전증">
<input type="button" id="disease04" class="btn btn-warning" value="고지혈">
<br><br>

<!-- 이달의 메뉴 기본 -->
<div id="menuShowList">
<table id="menuShowTableWrap">
<tr>
<td><img src="../../../dacham/resources/customerImage/dietImg/rice.JPG" id="menuShowImg"></td>
<td><img src="../../../dacham/resources/customerImage/dietImg/d00.JPG" id="menuShowImg"></td>
</tr>

<tr>
<td><img src="../../../dacham/resources/customerImage/dietImg/d01.JPG" id="menuShowImg"></td>
<td><img src="../../../dacham/resources/customerImage/dietImg/d02.JPG" id="menuShowImg"></td>
</tr>

<tr>
<td><img src="../../../dacham/resources/customerImage/dietImg/d04.JPG" id="menuShowImg"></td>
<td><img src="../../../dacham/resources/customerImage/dietImg/d05.JPG" id="menuShowImg"></td>
</tr>
</table>


<table id = "menuShowTableWrap">
<tr>
<td><img src="../../../dacham/resources/customerImage/dietImg/rice2.JPG" id="menuShowImg"></td>
<td><img src="../../../dacham/resources/customerImage/dietImg/d10.JPG" id="menuShowImg"></td>
</tr>

<tr>
<td><img src="../../../dacham/resources/customerImage/dietImg/d11.JPG" id="menuShowImg"></td>
<td><img src="../../../dacham/resources/customerImage/dietImg/d07.JPG" id="menuShowImg"></td>
</tr>

<tr>
<td><img src="../../../dacham/resources/customerImage/dietImg/d08.JPG" id="menuShowImg"></td>
<td><img src="../../../dacham/resources/customerImage/dietImg/d09.JPG" id="menuShowImg"></td>
</tr>
</table>



<table id = "menuShowTextWrap">
<tr>
<td>
<a href=#><h3>저염 베이직 세트</h3></a>
</td>
</tr>
<tr>
<td>
당뇨식의 기본 중의 기본만을 모아둔 식단.<br>
처음 식단을 이용하시는 분들께 추천합니다.
</td>
</tr>
</table>

<table id = "menuShowTextWrap">
<tr>
<td>
<a href=#><h3>다참 베스트</h3></a>
</td>
</tr>
<tr>
<td>
다참의 베스트셀러. <br>모든 종류의 질환식에 대응 가능!
</td>
</tr>
</table>


<table id = "menuShowNutriTable">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">당류</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">0.5g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>

<table id = "menuShowNutriTable">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">당류</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">0.5g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>
</div>



<!-- 당뇨 이달의 메뉴 -->

<div id="menuShowList1">
<table id="menuShowTableWrap">
<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>
</table>


<table id = "menuShowTableWrap" class="menuShowList2">
<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>
</table>



<table id = "menuShowTextWrap">
<tr>
<td>
<a href=#><h3>당뇨메뉴1</h3></a>
</td>
</tr>
<tr>
<td>
당뇨식의 기본 중의 기본만을 모아둔 식단.<br>
처음 식단을 이용하시는 분들께 추천합니다.
</td>
</tr>
</table>

<table id = "menuShowTextWrap">
<tr>
<td>
<a href=#><h3>당뇨메뉴2</h3></a>
</td>
</tr>
<tr>
<td>
다참의 베스트셀러. <br>모든 종류의 질환식에 대응 가능!
</td>
</tr>
</table>


<table id = "menuShowNutriTable">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">당류</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">0.5g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>

<table id = "menuShowNutriTable">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">당류</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">0.5g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>
</div>

<!-- 신부전증 이달의 메뉴 -->

<div id="menuShowList2">
<table id="menuShowTableWrap">
<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>
</table>


<table id = "menuShowTableWrap">
<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>
</table>



<table id = "menuShowTextWrap">
<tr>
<td>
<a href=#><h3>신부전</h3></a>
</td>
</tr>
<tr>
<td>
당뇨식의 기본 중의 기본만을 모아둔 식단.<br>
처음 식단을 이용하시는 분들께 추천합니다.
</td>
</tr>
</table>

<table id = "menuShowTextWrap">
<tr>
<td>
<a href=#><h3>당뇨메뉴2</h3></a>
</td>
</tr>
<tr>
<td>
다참의 베스트셀러. <br>모든 종류의 질환식에 대응 가능!
</td>
</tr>
</table>


<table id = "menuShowNutriTable">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">당류</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">0.5g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>

<table id = "menuShowNutriTable">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">당류</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">0.5g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>
</div>

<!-- 심부전증 이달의 메뉴 -->

<div id="menuShowList3">
<table id="menuShowTableWrap">
<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>
</table>


<table id = "menuShowTableWrap">
<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>
</table>



<table id = "menuShowTextWrap">
<tr>
<td>
<a href=#><h3>심부전</h3></a>
</td>
</tr>
<tr>
<td>
당뇨식의 기본 중의 기본만을 모아둔 식단.<br>
처음 식단을 이용하시는 분들께 추천합니다.
</td>
</tr>
</table>

<table id = "menuShowTextWrap">
<tr>
<td>
<a href=#><h3>심</h3></a>
</td>
</tr>
<tr>
<td>
다참의 베스트셀러. <br>모든 종류의 질환식에 대응 가능!
</td>
</tr>
</table>


<table id = "menuShowNutriTable">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">당류</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">0.5g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>

<table id = "menuShowNutriTable">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">당류</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">0.5g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>
</div>

<!-- 고지혈증 이달의 메뉴 -->

<div id="menuShowList4">
<table id="menuShowTableWrap">
<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>
</table>


<table id = "menuShowTableWrap">
<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>

<tr>
<td><img src="http://placehold.it/200x150"/></td>
<td><img src="http://placehold.it/200x150"/></td>
</tr>
</table>



<table id = "menuShowTextWrap">
<tr>
<td>
<a href=#><h3>고지혈</h3></a>
</td>
</tr>
<tr>
<td>
당뇨식의 기본 중의 기본만을 모아둔 식단.<br>
처음 식단을 이용하시는 분들께 추천합니다.
</td>
</tr>
</table>

<table id = "menuShowTextWrap">
<tr>
<td>
<a href=#><h3>당뇨메뉴2</h3></a>
</td>
</tr>
<tr>
<td>
다참의 베스트셀러. <br>모든 종류의 질환식에 대응 가능!
</td>
</tr>
</table>


<table id = "menuShowNutriTable">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">당류</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">0.5g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>

<table id = "menuShowNutriTable">
<tr class="NutriTable">
<td class="NutriTable">칼로리</td>
<td class="NutriTable">나트륨</td>
<td class="NutriTable">탄수화물</td>
<td class="NutriTable">당류</td>
<td class="NutriTable">지방</td>
</tr>

<tr class="NutriTable">
<td class="NutriTable">614.5kcal</td>
<td class="NutriTable">80.4mg</td>
<td class="NutriTable">14.3g</td>
<td class="NutriTable">0.5g</td>
<td class="NutriTable">48.5g</td>
</tr>
</table>
</div>

</div>

<script>
$('#disease00').click(function(){
	$('#menuShowList3').hide();
	$('#menuShowList4').hide();
	$('#menuShowList5').hide();
	$('#menuShowList1').hide();
	$('#menuShowList').show();
});
$('#disease01').click(function(){
	$('#menuShowList').hide();
	$('#menuShowList3').hide();
	$('#menuShowList4').hide();
	$('#menuShowList5').hide();
	$('#menuShowList1').show();
});
$('#disease02').click(function(){
	$('#menuShowList').hide();
	$('#menuShowList1').hide();
	$('#menuShowList3').hide();
	$('#menuShowList4').hide();
	$('#menuShowList2').show();
});
$('#disease03').click(function(){
	$('#menuShowList').hide();
	$('#menuShowList1').hide();
	$('#menuShowList2').hide();
	$('#menuShowList4').hide();
	$('#menuShowList3').show();
});
$('#disease04').click(function(){
	$('#menuShowList').hide();
	$('#menuShowList1').hide();
	$('#menuShowList2').hide();
	$('#menuShowList3').hide();
	$('#menuShowList4').show();
});
</script>