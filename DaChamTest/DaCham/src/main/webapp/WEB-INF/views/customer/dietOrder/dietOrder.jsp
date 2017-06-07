<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>


<script>
	$(document).ready(function(){
		$("#wizardOrder").click(function(){
			window.location.href = "dietOrderWizard";
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
<%@include file="../../clientNavi.jsp" %>
식단주문
<button id="wizardOrder">위자드로 주문하기</button>
</body>
</html>