<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>DaCham 영양정보</title>
<style>
#nutriInfoDetailWrap {
	width: 1080px;
	margin: 0 auto;
	text-align: center;
}

#nutriInfoDetailImg {
	width: 930px;
	margin: 0 auto;
}

#nutriInfoDetailTitleImg {
	width: 100%;
	height: 300px;
}

#nutritionInfoTitleBox {
	
}

#nutritionInfoTextBox {
	width: 680px;
	text-align: center;
	margin: 0 auto;
	position: relative;
}
</style>
</head>
<body>
	<%@include file="../../clientNavi.jsp"%>

	<div id="">
		<img src="../../../dacham/resources/customerImage/Broccolit.jpg"
			id="nutriInfoDetailTitleImg">

	</div>
	<div id="nutriInfoDetailWrap">

		<div id="nutritionInfoTitleBox">
			<h3>미세먼지 기승, 녹차・브로콜리로 예방하세요!</h3>
		</div>
		<div id="nutritionInfoTextBox">
			<h4>미세먼지가 기승이다. 미세먼지는 두 가지 측면에서 문제가 있다. 첫째 직경 10 마이크론 미만의 작은
				입자이므로 폐포까지 전달된다. 우리가 눈으로 보는 먼지는 보기와 달리 크게 해롭지 않다. 대부분 콧털이나 비점막,
				기도점막, 기관지점막 등에서 걸러지고 섬모운동을 통해 가래로 배출되기 때문이다. 그러나 미세먼지는 산소호흡의 최종단계인
				폐포까지 도착한다. 폐포가 망가지면 외부 공기에 섞인 유해물질들이 바로 혈액과 섞여 우리 몸으로 들어온다. 둘째 미세먼지는
				아황산가스나 산화질소, 중금속 등 각종 대기오염물질을 다량으로 농축시켜 전달하는 캐리어 역할을 한다. 같은 농도의
				대기오염물질이라도 미세먼지가 많으면 수십 배 농축된 나쁜 공기를 마시는 셈이다. 미세먼지가 가장 강력한 건강위해요인으로
				주목받는 이유다. 미세먼지 피해를 극복하기 위해선 대기중 농도가 높을 때 외출을 삼가고 꼭 나가야한다면 마스크를 착용하며
				돌아와선 생리식염수 코세척을 하는 게 좋다. 실내에선 가습기를 가동해 실내습도를 높여주고 공기청정기를 가동하는 게 좋다.

				그렇다면 음식으로 미세먼지 피해를 줄이는 방법은 없을까? 일단 돼지고기는 정답이 아니다. 삼겹살 등 돼지고기의 기름이
				어쩐지 먼지를 흡수하는 듯해 알려진 상식이나 의학적 근거가 없다. 오히려 동물성 포화지방은 몸 안의 염증을 악화시켜
				미세먼지로 인한 호흡기 손상을 악화시킬 우려가 있다. 조금이라도 과학적으로 근거를 갖춘 두 가지 식품을 소개한다.</h4>
		</div>
		<div id="nutriInfoDetailImg">
			<img src="../../../dacham/resources/customerImage/greentea.png"
				id="nutriInfoDetailImg">
			<div id="nutritionInfoTitleBox">
				<h3>녹차</h3>
			</div>
			<div id="nutritionInfoTextBox">
				<h4>첫째 녹차다. 녹차는 지금까지 알려진 모든 식품 가운데 가장 강력하게 폐암 등 호흡기 질환을 예방하는데
					도움을 주는 식품이다. 2003년 Journal of Nutrition은 133명의 흡연자를 대상으로 무작위 임상연구를
					진행한 결과 하루 4컵씩 4개월 녹차를 마신 그룹에선 물만 마신 그룹보다 소변에서 8-OHdG라는 물질이 31% 감소한
					것으로 나타났다. 이 물질은 유해산소의 공격으로 DNA가 망가질 때 만들어지며 폐암 등 각종 암의 간접적인 바이오 마커로
					알려져 있다. 이 물질이 적게 나올수록 DNA 손상이 적고 이것은 암 발생 확률을 줄이는데 도움을 줄 수 있다는
					설명이다. 2010년 미국 암학회에선 타이완 연구진의 역학연구결과가 발표됐다. 500여명을 대상으로 조사한 결과 녹차를
					하루 한잔 이상 마신 경우 마시지 않는 사람보다 폐암 발생률이 5배 낮았다는 것이다. 특히 흡연자끼리만 조사한 결과
					13배나 차이가 났다. 이러한 경향은 몸에 IGF1 등 특정 유전자를 갖고 있을수록 강하게 나타났다. 이러한 유전자
					그룹을 갖고 있는 사람은 녹차를 마실 경우 폐암을 66% 가량 낮추는 효과가 있었다는 것이다. 2011년 미국 메릴랜드대
					연구진은 녹차 속 폴리페놀의 일종인 EGCG란 성분이 mi-R210이란 항암물질을 다량 만들어내고 이것이 폐암의
					증식속도를 늦추는 효과가 있다고 발표하기도 했다. 녹차를 마시면 폐암에 안 걸린다는 의미가 아니다. 주로 단순 역학연구나
					시험관 연구결과에서 긍정적 효과가 관찰됐을 뿐 인과관계를 강력하게 입증하는 무작위 임상연구 결과는 거의 없다. 그러나
					지금까지 발표된 이런저런 효능들을 감안할 때 흡연자라면 녹차를 마시지 않을 이유가 없다. 간접적이지만 도움될 여지가
					충분하기 때문이다.</h4>
			</div>

		</div>
		<div id="nutriInfoDetailImg">
			<img src="../../../dacham/resources/customerImage/brocoli2.png"
				id="nutriInfoDetailImg">
			<div id="nutritionInfoTitleBox">
				<h3>브로콜리</h3>
			</div>
			<div id="nutritionInfoTextBox">
				<h4>둘째 브로콜리다. 미국 UCLA대와 존스홉킨스대에 이어 호주 멜버른대에서도 브로콜리의 효능에 대한
					연구결과를 잇따라 내놓고 있다. 2014년 호주 멜버른대 연구진은 매일 1-2컵의 삶은 브로콜리를 먹은 결과 천식에
					도움을 줄 수 있다고 밝혔다. 브로콜리에 다량 함유된 L-sulforaphan 성분이 기관지 점막세포에서 염증을 억제하고
					유해산소의 작용을 차단하는 유전자의 발현을 증가시킨다는 연구결과를 내놓은 것이다. 천식엔 기관지 점막세포의 염증이 중요한
					기전으로 관여하므로 브로콜리 섭취가 간접적으로 도움이 된다는 설명이다. 브로콜리의 L-sulforaphana은 열에 강해
					삶아도 파괴되지 않으며 다 자란 것보다 새싹 성분의 줄기에서 더 많은 양을 함유하고 있다. 폐암과 천식은 미세먼지가
					직접적인 피해를 줄 수 있는 가장 대표적인 호흡기 질환이다. 요즘처럼 미세먼지가 기승을 부릴 때 기왕이면 녹차와
					브로콜리를 즐겨 먹는 게 조금이라도 나의 기관지와 폐를 배려하는 좋은 방법이 아닌가 싶다.</h4>
			</div>

		
				<a href="nutritionInfo"><h3>영양소개 TOP</h3></a>
			</div>
</body>
</html>