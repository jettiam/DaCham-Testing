<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.bg {
	background-color: lightgray;
	margin-top: 20px;
}

.box {
	display: inline-block;
	height: 50px;
	padding: 0 20px;
	font-size: 25px;
}
</style>
</head>
<body>
<div id="headerBox">
		<!-- �ΰ� -->
		<div id="logo">
			<!-- �ΰ�ڽ� -->
			<a href="counselorMain" id="counselorMain">     
		    <img src="http://placehold.it/100x100"></a>

			<div id="infoBox">
				<!-- �̸� ���. �α׾ƿ� -->
				<h4>
					${EmpName }
				</h4>
				��ü�� �α׾ƿ�
			</div>
		</div>
	</div>
	<!-- ��� �޴��� -->
	<div class="naviBox">
	<!-- �� ���� -->
	<!-- ��� �޴��� -->
	<div class="bg">
		<ul type="none" class="">
			<!-- �޴� ����Ʈ -->
			<li class="box"><a href="counselorList" id="counselorList">�����</a></li>
			<li class="box"><a href="detail" id="counselorDetail">��㳻��</a></li>
			
		</ul>

	</div>
</body>
</html>

