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
<h1>����������</h1><br>
<button>�� ����</button>
<button>�� �ǰ�����</button>
<button>��ٱ���</button>
<button>�ֹ�����</button>
<button>ȸ��Ż��</button><br><br>
<table id="myInfo">
<tr>
<td>����</td>
<td><input type="text" name="name" value="${memberName}" readonly></td>
</tr>
<tr><td>���̵�</td>
<td><input type="text" name="id" value="${sessionScope.customerId}" readonly></td>
</tr>
<tr><td>��й�ȣ ����</td>
<td><input type="password" name="passwd" value=""></td></tr>

<tr><td>��й�ȣ Ȯ��</td><td><input type="password" name="passwd" value=""></td></tr>
<tr><td>�ּ�</td><td><input type="text" name="address" value="${sessionScope.address}"></td></tr>
<tr><td>����ó</td><td><input type="text" name="tel" value="${sessionScope.tel}"></td></tr>
<tr><td>e-mail</td><td><input type="text" name="email" value="${sessionScope.email}"></td></tr>
<tr><td>ȸ�����</td> <td><input type="text" name="gradeCode" value="${sessionScope.gradeCode}" readonly></td></tr>
<tr><td>������</td> <td><input type="text" name="joinDate" value="${sessionScope.joinDate}" readonly></td></tr>
</table>

<br>
<button>����</button>

</div>

</body>
</html>