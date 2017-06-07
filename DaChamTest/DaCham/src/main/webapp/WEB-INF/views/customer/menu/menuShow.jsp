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
</style>

<script>
$(document).ready(function(){
	$("#disease01").click(function(){
		$("#menuShowTableWrap").html();
	});
});
</script>
<%@include file="../../clientNavi.jsp" %>

<div id = "menuShowWrap">
<h1>이달의 메뉴</h1><br>
<input type="button" id="disease01" value="당뇨">
<input type="button" id="disease02" value="신부전증">
<input type="button" id="disease03" value="심부전증">
<input type="button" id="disease04" value="고지혈">
<br><br>
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