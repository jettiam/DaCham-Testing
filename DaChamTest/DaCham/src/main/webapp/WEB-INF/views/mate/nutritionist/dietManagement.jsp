<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
 .box1 {
  float:left;  }
 .box2 {
  display:inline-block;  margin-left:10px;}  
</style>
</head>
<body>
   <div class = "box1">
      <table>
         <tr>
            <th>질환</th>
            <th>식단 수량(개)</th>
         </tr>
         <tr>
            <td>당뇨병</td>
            <td>5</td>
         </tr>
      </table>
      <nav>
         <ul>
            <li><a>당뇨병</a></li>
            <li><a>고지혈증</a></li>
            <li><a>심부전증</a></li>
            <li><a>신부전증</a></li>
         </ul>
      </nav>
   </div>
   <div class = "box2">
      <div>
         <button>식단 등록</button>
         <button>식단 수정</button>
         <button>식단 삭제</button>
      </div>
      <div>
         <table>
            <tr>
               <th></th>
               <th>식단 이미지&nbsp;&nbsp;</th>
               <th>식단명&nbsp;&nbsp;</th>
               <th>질환&nbsp;&nbsp;</th>
            </tr>
            <tr>
               <td><input type = "checkbox"></td>
               <td></td>
               <td></td>
               <td></td>
            </tr>
         </table>
      </div>
   </div>
</body>
</html>