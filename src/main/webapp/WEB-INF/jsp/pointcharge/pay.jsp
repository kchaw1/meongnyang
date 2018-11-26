<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="payCSSJS.jsp"/>
</head>
<body>
<header>
   <div class="title">
     <h1>멍냥 포인트 충전</h1>
   </div>
   <div class="animate">
       <img src="<c:url value="/resources/img/common/teddy_food_dribbble.gif"/>" />
   </div>
 </header>
 <div class="content">
   <table class="payment">
     <tr class="title">
       <th class="no1">선택</th>
       <th>충전포인트</th>
       <th>결제 금액</th>
     </tr>
     <tr>
       <td class="no1">
         <input type="radio" id="no1" name="point" value="1000"/>
       </td>
       <td><label for="no1">1,100 포인트</label></td>
       <td>1,000 원</td>
     </tr>
     <tr>
       <td class="no1">
         <input type="radio" id="no2" name="point" value="2000"/>
       </td>
       <td><label for="no2">2,200 포인트</label></td>
       <td>2,000 원</td>
     </tr>
     <tr>
       <td class="no1">
         <input type="radio" id="no3" name="point" value="3000"/>
       </td>
       <td><label for="no3">3,300 포인트</label></td>
       <td>3,000 원</td>
     </tr>
     <tr>
       <td class="no1">
         <input type="radio" id="no4" name="point" value="4000"/>
       </td>
       <td><label for="no4">4,400 포인트</label></td>
       <td>4,000 원</td>
     </tr>
     <tr>
       <td class="no1">
         <input type="radio" id="no5" name="point" value="5000"/>
       </td>
       <td><label for="no5">5,500 포인트</label></td>
       <td>5,000 원</td>
     </tr>
     <tr class="buttons">
       <td colspan="3">
         <button type="button" class="cancel">취소하기</button>
         <button type="button" class="pay">결제하기</button>
       </td>
     </tr>
   </table>
 </div>

</body>
</html>