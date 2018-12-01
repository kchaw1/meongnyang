<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
     <h1>멍냥 포인트 지급</h1>
   </div>
   <div class="animate">
       <img src="<c:url value="/resources/img/common/teddy_food_dribbble.gif"/>" />
   </div>
 </header>
    <div class="content">
	 <div>
	 	<input class="pay-input" type="text" placeholder="지급할 급액을 입력하세요" onkeyup="inputNumberFormat(this)" />  
	 	<span class="pay-input">(원)</span>
	 </div> 
	<div class="buttonBox">
	  <button type="button" class="pay">지급하기</button>
	  <button type="button" class="cancel">취소하기</button>
	</div>
	</div>

 <script>
 	
 	// 금액 3자리마다 쉼표
 	  function inputNumberFormat(obj) { 
        obj.value = comma(uncomma(obj.value)); 
      } 

      function comma(str) { 
          str = String(str); 
          return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
      } 

      function uncomma(str) { 
          str = String(str); 
          return str.replace(/[^\d]+/g, ''); 
      }
      
      // 쉼표 제거
      function removeComma(str) {
			n = parseInt(str.replace(/,/g,""));
			return n;
	}
      
 	$("button.pay").click(function() {
 		$inputPoint = $("input.pay-input").val();
 		
 		$.ajax({
 			url: "<c:url value='/admin/general/pay-point.mn' />",
 			data: {
 					"no": '${no}',
 					"point": removeComma($inputPoint)
 				  },
 			type: "POST"
 		}).done(function(result) {
 			swal({
 				 	title: removeComma($inputPoint) + "포인트 지급되었습니다."
 				})
 				.then(() => {
 					window.opener.opener.location.reload();
 					window.opener.location.reload();
 				  	window.close()
 				});
//  			swal(removeComma($inputPoint) + "포인트 지급되었습니다.", "", "success")
 		})
//  		console.log($inputPoint)
//  		console.log()
//  		location.href = "<c:url value='/admin/general/pay-point.mn?no="+ ${no} +"&point=" + removeComma($inputPoint) + "' />"
//  		swal(removeComma($inputPoint) + "포인트 지급되었습니다.", "", "success")
 		
 	})
 
 	$("button.cancel").click(function() {
 		window.close();
 	})
 </script>
</body>
</html>