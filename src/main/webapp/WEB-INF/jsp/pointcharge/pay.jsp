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
       <td><label for="no1" data-value="1100">1,100 포인트</label></td>
       <td>1,000 원</td>
     </tr>
     <tr>
       <td class="no1">
         <input type="radio" id="no2" name="point" value="2000"/>
       </td>
       <td><label for="no2" data-value="2200">2,200 포인트</label></td>
       <td>2,000 원</td>
     </tr>
     <tr>
       <td class="no1">
         <input type="radio" id="no3" name="point" value="3000"/>
       </td>
       <td><label for="no3" data-value="3300">3,300 포인트</label></td>
       <td>3,000 원</td>
     </tr>
     <tr>
       <td class="no1">
         <input type="radio" id="no4" name="point" value="4000"/>
       </td>
       <td><label for="no4" data-value="4400">4,400 포인트</label></td>
       <td>4,000 원</td>
     </tr>
     <tr>
       <td class="no1">
         <input type="radio" id="no5" name="point" value="5000"/>
       </td>
       <td><label for="no5" data-value="5500">5,500 포인트</label></td>
       <td>5,000 원</td>
     </tr>
     <tr class="buttons">
       <td colspan="3">
       	<div class="buttonBox">
         <button type="button" class="cancel">취소하기</button>
         <a href="#1" class="pay"><img class="kakao" src="<c:url value="/resources/img/point/payment_icon_yellow_medium.png"/>"/></a>       	
       	</div>
       </td>
     </tr>
   </table>
 </div>
 <div class="result hidden">
    <div class="resultTitle">
      <span class="name">rsp.buyer_name</span> 님의<br>
      <span>멍냥 포인트 충전이 완료되었습니다.</span>
    </div>
    <table class="impUid result">
      <tr>
        <td class="uid">결제 번호</td>
      </tr>
      <tr>
        <td class="uiddetail">rsp.imp_uid</td>
      </tr>
    </table>
    <table class="detailpay result">
      <tr>
        <td>충전 금액</td>
        <td class="payamount">rsp.paid_amount</td>
      </tr>
    </table>
    <table class="detailpoint result">
      <tr class="first">
        <td>충전된 포인트</td>
        <td ><span class="plusPoint">plusPoint</span> 포인트</td>
      </tr>
      <tr>
        <td>이전 포인트</td>
        <td><span class="prevPoint">prevPoint</span> 포인트</td>
      </tr>
      <tr>
        <td>충전 후 포인트</td>
        <td><span class="nowPoint">nowPoint</span> 포인트</td>
      </tr>
      <tr class="buttons">
          <td colspan="2">
            <img src="<c:url value="/resources/img/common/teddy_food_dribbble.gif"/>" />
            <button type="button" class="cancel">확인</button>
          </td>
        </tr>
    </table>
  </div>
 <script>
 $(function() {
	IMP.init('imp59975900');
 })
 	$("button.cancel").click(function() {
 		window.close();
 	})
 	
 	$("a.pay").click(function() {
 		//console.log(parseInt($("input[type='radio']:checked").val()));
 		//console.log("${user.id}")
 		var checked = $("input[type='radio']:checked");
 		let forValue = checked.attr("id")
 		var plusPoint = $("label[for="+forValue+"]").data("value")
 		//alert(plusPoint);
 		//결제 요청..
 		IMP.request_pay({
 			pg : 'kakao', // 카카오페이
 			pay_method : 'card',
 			merchant_uid : 'merchant_' + new Date().getTime(),
 			name : '멍하고 노냥 포인트 결제',
 			amount : parseInt(checked.val()), // 결제금액
 			buyer_email : '${user.email}',
 			buyer_name : '${user.name}',
 			buyer_tel : '010-8907-9574'
 		}, function(rsp){
 			console.dir(rsp)
 			if ( rsp.success ) {
 		/* //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	jQuery.ajax({
    		url:  "<c:url value='/payments/complete.mn' />",*/ //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
 		    	$.ajax({
 		    		url : "<c:url value='/point/buy.mn' />",	    	
 		    		type: 'POST',
 		    		data: {
 			    		impUid : rsp.imp_uid,
 			    		merchantUid: rsp.merchant_uid,
 			    		id : "${user.id}",
 			    		plusPoint : plusPoint
 		    		}
 		    	}).done(function(prevPoint) {
 		    		$("div.content").addClass("hidden")
 		    		$("header").addClass("hidden")
 		    		$("div.result").removeClass("hidden")
 		    		$("div.result").addClass("show")
 		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
 		    		//if ( everythings_fine ) {
 		    		$("td.uiddetail").html(rsp.imp_uid);
 		    		$("span.name").html(rsp.buyer_name)
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;

	    			console.log
	    			(msg);
 		    		let plus = String(plusPoint).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					console.log(plus)
 		    		$("span.plusPoint").html(plus)

 		    		//3자리 마다 ,찍기..
 		    		 		    		let amount = String(rsp.paid_amount).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 		    		let prev = String(prevPoint).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$("td.payamount").html(amount + " 원");
 		    		$("span.prevPoint").html(prev);
 		    		let total = String(plusPoint + prevPoint).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 		    		$("span.nowPoint").html(total);

 		    		/* } else {
 		    			//[3] 아직 제대로 결제가 되지 않았습니다.
 		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
 		    		} */
 		    	});// ajax done 
 		    	
 		    } else {
 		        var msg = '결제에 실패하였습니다.';
 		        msg += '에러내용 : ' + rsp.error_msg;

 		        alert(msg);
 		    } // response가 실패 떳을때..결제 실패 했을때..
 		}) //callback함수..
 	})
 </script>
</body>
</html>