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
			<a href="../cooker/main" id="cookerMain">
		    <img src="http://placehold.it/100x100"></a>

			<div id="infoBox">
				<!-- �̸� ���. �α׾ƿ� -->
				<h4>
					��������
				</h4>
				�丮�� �α׾ƿ�
			</div>
		</div>
	</div>
	<!-- �� ���� -->
	<!-- ��� �޴��� -->
	<div class="bg">
		<ul type="none" class="">
			<!-- �޴� ����Ʈ -->
			<li class="box"><a href="../cooker/list" id="cookingList">�������</a></li>
			<li class="box"><a href="../cooker/food" id="foodStock">��������</a></li>
		</ul>

	</div>
</body>
</html>