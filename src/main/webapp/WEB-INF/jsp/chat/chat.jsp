<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹소켓 연습하기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>


<input type="text" id="message" name="message" />
<button id="sendBtn">메세지 보내기</button>

<div></div>
<script type="text/javascript">

var ws = null;
var loginId = null;

$(function () {
	
    ws = new WebSocket('ws://localhost:8000/nmcat/chat.mn');  /*
    url /info가 자동 붙는것을 해결해야 한다. 
    - 현재는 스프링이 *.do로 설정되어 있어 404가 된다.
      /*로 스프링의 경로를 수정하게 되면 문제는 페이지의 결과가 텍스트로 보인다.
      jsp 결과 뷰가 안보인다.
      
      아래의 SockJS를 사용하기 위해서는 spring-websocket.xml파일에 사용부분의 주석을 해제해야 한다.
  */
//ws = new SockJS("/11_spring2/test02.do");  

ws.onopen = function() {
	    console.log('웹소켓 서버 접속 성공');
};
// 메세지 받기
ws.onmessage = function(evt) {
  $("div").prepend(evt.data + "<br>");
};
ws.onerror = function(evt) {
	    $("div").prepend('웹소켓 에러 발생 : ' + evt.data)
};
ws.onclose = function() {
	    $("div").prepend("웹소켓 연결이 종료됨.");
};
});

$('#sendBtn').click(function() { 
var $msg = $("#message");
// 보낼 수 있는 데이터는 String, Blob, ArrayBuffer 입니다. 
// 웹소켓 서버에 데이터 전송하기
ws.send($msg.val());
$msg.val(""); 
});

</script>

</body>
</html>



