<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
 <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
      
     <!-- 채팅방 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/chat/chat.css"/>">
  
</head>
<body>
  <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

    <div class="row">
      <div class="container-fluid main">
        <div class="col-xs-3 no-pad">
          <div class="people" style="position: fixed;">
            <div class="user">
              <div class="user-item"> 
                <img class="pull-left" src="https://plus.google.com/u/0/_/focus/photos/public/AIbEiAIAAABECND6k6O2gLWavQEiC3ZjYXJkX3Bob3RvKigyMjgzNGM2ZWZkYjJhZDZhZjI1YTI0MzQxYzJkYTRkODEzNDBhY2UyMAHQr8BxOTmI3m0dZJGY3Vj4osnP9g?sz=48" alt="" />
                <div class="pull-left">
                  <p class="name">${user.id}</p>
                  <p class="name">${user.name}</p>
                  
                </div>
              </div>
            </div>
            <div class="list-head">
              <p>참가 인원</p>
            </div>
            <div class="list">
              <div class="list-item">
                <img class="pull-left img-responsive" src="https://lh4.googleusercontent.com/--W7e24o4cgE/AAAAAAAAAAI/AAAAAAAAG6s/IKny9ARll6s/s32-c-k-no/photo.jpg" alt="" />
                <p class="pull-left">sdadsa</p>
              </div>
            </div>
          </div>
        </div>
       
        <div class="col-xs-7">
          <div class="chat-wrapper">
          <div class="chat-list" style="overflow-y:auto;">
          </div>
            <div class="chat-content">
            
                        
            </div>  
          </div>
              <span class="chat-input"><input class="form-control pull-right" type="text" id="message" name="message" /></span><button id="sendBtn">전송</button>
        		<input type="hidden" id="id" name="id"/> 
        </div>
      </div>
    </div>
    <script>

var chat = null;
var loginId = null;
$(function () {
	
	chat = new WebSocket('wss://192.168.0.68/nmcat/chat.mn');  /*
    url /info가 자동 붙는것을 해결해야 한다. 
		    - 현재는 스프링이 *.do로 설정되어 있어 404가 된다.
		      /*로 스프링의 경로를 수정하게 되면 문제는 페이지의 결과가 텍스트로 보인다.
		      jsp 결과 뷰가 안보인다.
		      
		      아래의 SockJS를 사용하기 위해서는 spring-websocket.xml파일에 사용부분의 주석을 해제해야 한다.
		  */
		
		  chat.onopen = function() {
			    console.log('웹소켓 서버 접속 성공');
			    $(".chat-list").append("<p>채팅이 시작되었습니다</p>")
		};
		// 메세지 받기
		chat.onmessage = function(evt) {
		  $(".chat-list").append("<div>"+evt.data+"</div>");
			
		};
		chat.onerror = function(evt) {
			    $("div").append('웹소켓 에러 발생 : ' + evt.data)
		};
		chat.onclose = function() {
			    $("div").append("웹소켓 연결이 종료됨.");
		};
	});

	$('#sendBtn').click(function() { 
		var $msg = $("#message");
		var $id = $("#id");
		// 보낼 수 있는 데이터는 String, Blob, ArrayBuffer 입니다. 
		// 웹소켓 서버에 데이터 전송하기
		console.log($msg.val());
		if("${user.id}"== loginId){
			
		chat.send("<br><div class='chat-bubble pull-right right'><p class='m-b-0'>"+$msg.val()+"</p></div><br>");
		$msg.val(""); 
		}else{
			chat.send("<br><div class='chat-bubble pull-left'><p class='m-b-0'>"+$msg.val()+"</p></div><br>");
			$msg.val(""); 
				
		}
	});
	
	$(".chat-list").scrollTop($(".chat-list").height());
	
</script>
</body>
</html>