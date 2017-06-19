<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="resources/favicon/N.ico">
<%@include file="nutritionistNavi.jsp" %>

<title>영양사</title>
<style>
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:10px;}  
</style>
</head>
<body>
   <div class = "box1">
      <div>
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
               <td>영양사장</td>
               <td>2017.05.05</td>
               <td>0</td>
            </tr>
         </table>
         <button id = "noticeList">목록</button>
      </div>
   </div>
   <div class = "box2">
      <table>
         <tr>
            <th>번호</th>
            <th>고객id</th>
            <th>식단명</th>
            <th>주문접수일</th>
            <th>금액</th>
         </tr>
         <tr>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
         </tr>
      </table>
   </div>
   <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
   <br><br><br><br><br><br>
   <div>
      <h1> 월의 판매 식단</h1>
      <hr align = "left" width = "20%">
      <li>탕평채</li>
      <li>낙지연포탕</li>
      <li>닭가슴살두부파치</li>
   </div>
</body>
</html>