<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<script>
$(document).ready(function(){
	var id="";
	$("#customer").addClass("w3-light-gray");
	 	function all(){ 
		$.getJSON("adminSub/memberAll",function(data){
			console.log(data); 
			//$(".orderListTable").remove();
			var str = "";  
			for(var i =0; i<data.length; i++){
				str += "<tr><td class='ids' data-code = '"+data[i].id+"'>"+data[i].id+"</td>"+"<td>"+data[i].name+"</tr>"   
			} 
			console.log(str);
			$(".memberTable").append(str);  
		});    
	}
	all();
	$(document.body).on("click",".ids",function(){
		var id = $(this).attr('data-code');
		alert(id);  
		userMemberInfo(id);   
	});
	 function userMemberInfo(id){ 
		$.getJSON("adminSub/memberUserInfo/"+id,function(data){
			console.log(data); 
			console.log("id:"+id);
			$(".MemberUserInfo").remove();
			var str = "";  
			for(var i =0; i<data.length; i++){
				str += "<tr class='MemberUserInfo'><th>ID</th><td id='"+data[i].id+"'>"+data[i].id+"</td>"+"<th>이름</th><td>"+data[i].name+"</td><th>휴대폰번호</th>"+"<td>"+data[i].tel+"<td><th>이메일</th>"+"<td>"+data[i].email+"</td><th>주소<th>"+"<td>"+data[i].address+"</td>"   
			} 
			console.log(str);
			$(".memberUserTable").append(str);  
		});    
	} 
	 userMemberInfo();  
});
</script>
</head>
<body>
<%@include file="../admin/upmenu.jsp" %>
<div class="container">
<div class="col-sm-4">
<h2>회원검색</h2>
<pre class="member pre-scrollable" width="30">
			<table class="memberTable table table-condensed">    
				<tr>
					<th>ID</th>
					<th>이름</th>
				</tr>
			</table>
</pre>
<table class="memberUserTable table table-condensed">    
				
			</table>
</div>    
</div>
</body>
</html>