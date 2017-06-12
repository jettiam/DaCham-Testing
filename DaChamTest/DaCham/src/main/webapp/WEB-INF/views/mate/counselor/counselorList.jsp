<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file = "counselorNavi.jsp" %>
<title>Insert title here</title>
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
	</form>
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
      
       <select>
	            <option>등록자</option>
	            <option>제목</option>
	            <option>내용</option>
	      </select>
	         <input type = "text" name = "keyword">
	         <button id = "search"> 검색 </button>
      </div>
      
      <div>
	     
         <table>
            <tr>
               <th>번호</th>
               <th>제목</th>
               <th>등록자</th>
               <th>등록일</th>
               <th>조회수</th>
            </tr>
            <tr>
               <td>1</td>
               <td>영양관리주간목록</td>
               <td>배송팀장</td>
               <td>2017.05.05</td>
               <td>0</td>
            </tr>
         </table>
      </div>
   </div>
   <div class = "box2">
      
   </div>
   <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
   <br><br><br><br><br><br>
  
</body>
</html>