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
	$(document).ready(function() {
		$("#dietManagement").addClass("w3-light-gray");
		function all() {
			$.getJSON("adminSub/dietAll", function(data) {
				console.log(data);
				$(".dietAll").remove();
				var str = "";
				for (var i = 0; i < data.length; i++) {    
					str += "<tr class='dietAll'>" +"<td><input type='checkBox' value='"+data[i].dietCode+"'></td>"+"<td><img src = 'displayFileAdmin?fileName="+data[i].dietImg+"' style = 'width: 75px; height: 25px;'></td>" 
							+ "</td>" + "<td>" + data[i].dietName  + "</td>"  
							+ "<td><input type='text' value='" + data[i].price + "'>"+"<button class='priceUpdate btn-primary' data-price='"+data[i].dietCode+"'>가격수정</button>"+"</td>" + "<td>"
							+ data[i].diseaseName + "</td></tr>"
				}
				console.log(str);  
				$(".tables").append(str);
			}); 
		}
		all()
		$(".tables").on('click', '.priceUpdate', function(){
			//alert($(this).prev().val());
			var price = $(this).prev().val();
			var dietCode = ($(this).attr('data-price'));
			 $.ajax({
				url : 'adminSub/priceUp',
				data : JSON.stringify({
					'price':price,
					'dietCode':dietCode  
			    }),
				dataType : 'text',
				type : 'put',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				}, 
				success : function(data) {
						alert("가격수정되었습니다");
					all();
				}, error : function(){   
					alert("실패");
				}
			
			}); 
			
			
			
			
		});
	});
</script>
</head>
<body>
	<%@include file="../admin/upmenu.jsp"%>
	<div>
		<table class="tables table table-condensed" width="600">
			<tr>
				<th>선택</th>
				<th>식단이미지</th>
				<th>식단명</th>
				<th>금액</th>
				<th>질환명</th>
			</tr>
		</table>
	</div>
	<div>
	<button>판매</button>
	<button>판매중지</button>
	<button>식단삭제</button>
	</div>

</body>
</html>