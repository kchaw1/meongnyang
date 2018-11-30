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
 <script>
 $(function() {
 })
	IMP.init('imp59975900');
 	$("button.cancel").click(function() {
 		window.close();
 	})
 	
 	$("button.pay").click(function() {
 		console.log(parseInt($("input[type='radio']:checked").val()));
 		console.log("${user.id}")
 		
 		IMP.request_pay({
 			pg : 'kakao',
 			pay_method : 'card',
 			merchant_uid : 'merchant_' + new Date().getTime(),
 			name : '멍하고 노냥 포인트 결제',
 			amount : parseInt($("input[type='radio']:checked").val()),
 			buyer_email : '${user.email}',
 			buyer_name : '${user.name}',
 			buyer_tel : '010-8907-9574'
 		}, function(rsp){
 			if ( rsp.success ) {
 		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
 		    	jQuery.ajax({
 		    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
 		    		type: 'POST',
 		    		dataType: 'json',
 		    		data: {
 			    		imp_uid : rsp.imp_uid,
 			    		merchant_uid: rsp.merchant_uid
 			    		//기타 필요한 데이터가 있으면 추가 전달
 		    		}
 		    	}).done(function(data) {
 		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
 		    		if ( everythings_fine ) {
 		    			var msg = '결제가 완료되었습니다.';
 		    			msg += '\n고유ID : ' + rsp.imp_uid;
 		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
 		    			msg += '\결제 금액 : ' + rsp.paid_amount;
 		    			msg += '카드 승인번호 : ' + rsp.apply_num;

 		    			console.log
 		    			(msg);
 		    		} else {
 		    			//[3] 아직 제대로 결제가 되지 않았습니다.
 		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
 		    		}
 		    	});
 		    } else {
 		        var msg = '결제에 실패하였습니다.';
 		        msg += '에러내용 : ' + rsp.error_msg;

 		        alert(msg);
 		    }
 		})
 	})
 </script>
</body>
</html>