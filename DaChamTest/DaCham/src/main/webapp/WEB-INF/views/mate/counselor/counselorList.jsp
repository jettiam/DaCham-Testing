<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file = "counselorNavi.jsp" %>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$(".counselTitle a").on("click",function(){
			var counselCode = $(this).attr('data-code');
			$.getJSON("counselAjax/views/"+counselCode,function(data){           
				$(".box2").html("<table border = '1'><tr><td>제목</td><td><b>"+data.counselTitle+"</b></td></tr><tr><td>내용</td><td>"+data.counselContent+"</td></tr></table>")
			});
		});
	});
</script>
<style>
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:20px;}  
</style>
</head>
<body>
   <div class = "box1">
   	<form>
      <div>
			<select name = "searchType">
				<option value = "n"
	   			<c:out value="${Counselor.searchType==null?'selected':'' }"/>>
	   			----------
	   			</option>
	   			<option value = "t"
	   			<c:out value="${Counselor.searchType eq 't'?'selected':'' }"/>>
	   			고객id
	   			</option>
	   			<option value = "c"
	   			<c:out value="${Counselor.searchType eq 'c'?'selected':'' }"/>>
	   			고객이름
	   			</option>
			</select>
			<input type = "text" name = "keyword" placeholder = "검색어 입력란">
			<button id = "search">검색</button>
		</div>
	
      <div>
      <table border ="1">
         <tr>
         			<th>고객id</th>
					<th>고객이름</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>Email</th>
					<th>부서</th>
					<th>직급</th>
					<th>가입일</th>
					<th>상담사</th>
					<th>상담일시</th>
					<th>상담내용</th>
					
         </tr>
         <c:forEach items = "${list }" var = "c">
					<tr>
						<td>${c.id }</td>
						<td>${c.name }</td>
						<td>${c.address } </td>
						<td>${c.tel }</td>
						<td>${c.email }</td>
						<td>${c.deptCode }</td>
						<td>${c.gradeCode }</td>
						<td>${c.joinDate }</td>
						<td>${c.counselTitle }</td>
						<td>${c.counselDate }</td>
						<td>${c.counselContent }</td>
					</tr>
		</c:forEach>
      </table>
      </form>
      <form>
       <div>
			<select name = "SearchType">
				<option value = "n"
	   			<c:out value="${Counselor.searchType2==null?'selected':'' }"/>>
	   			----------
	   			</option>
	   			<option value = "y"
	   			<c:out value="${Counselor.searchType2 eq 't'?'selected':'' }"/>>
	   			작성자이름
	   			</option>
	   			<option value = "u"
	   			<c:out value="${Counselor.searchType2 eq 'c'?'selected':'' }"/>>
	   			작성자ID
	   			</option>
			</select>
			<input type = "text" name = "keyword2" placeholder = "검색어 입력란">
			<button id = "Search">검색</button>
	 </div>
  
      
      <div>
	     <table border ="1">
            <tr>
               <th>번호</th>
               <th>글제목</th>
               <th>작성자이름</th>
               <th>작성자ID</th>
               <th>작성일</th>
             
            </tr>
            <c:forEach items = "${list2 }" var = "n">
					<tr>
						<td>${n.counselCode }</td>
						<td class = "counselTitle"><a data-code = "${n.counselCode }">${n.counselTitle }</a></td>
						<td>${n.name }</td>
						<td>${n.id } </td>
						<td>${n.counselDate }</td>
						
					</tr>
		</c:forEach>
         </table>
      </div>
   	</form>
   </div>
   <div class = "box2">
      
   </div>
   <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
   <br><br><br><br><br><br>
  
</body>
</html>