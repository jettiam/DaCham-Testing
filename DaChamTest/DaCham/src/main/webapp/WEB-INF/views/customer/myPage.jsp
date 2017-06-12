<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#myPageWrap {
	width: 1080px;
	height: 100%;
	margin: 0 auto;
	text-align: center;

}
#myInfo{
position: relative;
margin: 0 auto;
}
</style>
</head>
<body>
<%@include file="../clientNavi.jsp" %>

<div id="myPageWrap">
<h1>마이페이지</h1><br>
<button>내 정보</button>
<button>내 건강정보</button>
<button>장바구니</button>
<button>주문내역</button>
<button>회원탈퇴</button><br><br>
<table id="myInfo">
<tr>
<td>고객명</td>
<td><input type="text" name="name" value="${memberName}" readonly></td>
</tr>
<tr><td>아이디</td>
<td><input type="text" name="id" value="${sessionScope.customerId}" readonly></td>
</tr>
<tr><td>비밀번호 수정</td>
<td><input type="password" name="passwd" value=""></td></tr>

<tr><td>비밀번호 확인</td><td><input type="password" name="passwd" value=""></td></tr>
<tr><td>주소</td><td><input type="text" name="address" value="${sessionScope.address}"></td></tr>
<tr><td>연락처</td><td><input type="text" name="tel" value="${sessionScope.tel}"></td></tr>
<tr><td>e-mail</td><td><input type="text" name="email" value="${sessionScope.email}"></td></tr>
<tr><td>회원등급</td> <td><input type="text" name="gradeCode" value="${sessionScope.gradeCode}" readonly></td></tr>
<tr><td>가입일</td> <td><input type="text" name="joinDate" value="${sessionScope.joinDate}" readonly></td></tr>
</table>

<br>
<button>수정</button>

</div>

</body>
</html>