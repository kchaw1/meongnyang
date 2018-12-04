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
      
     <!-- ä�ù� css -->
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
                  <p class="name">Giowee Argao</p>
                </div>
              </div>
            </div>
            <div class="list-head">
              <p>���� �ο�</p>
            </div>
            <div class="list">
              <div class="list-item">
                <img class="pull-left img-responsive" src="https://lh4.googleusercontent.com/--W7e24o4cgE/AAAAAAAAAAI/AAAAAAAAG6s/IKny9ARll6s/s32-c-k-no/photo.jpg" alt="" />
                <p class="pull-left">Madayag</p>
              </div>
              <div class="list-item">
                <img class="pull-left img-responsive" src="https://lh3.googleusercontent.com/-clvlFfHcYUE/AAAAAAAAAAI/AAAAAAAAAR0/Ba6VYUO6gME/s90-c-k-no/photo.jpg" alt="" />
                <p class="pull-left">Judith Dela Cruz</p>
              </div>
              <div class="list-item">
                <img class="pull-left img-responsive" src="https://lh3.googleusercontent.com/-1DcoJxJGFEo/AAAAAAAAAAI/AAAAAAAAAAs/joIWEP4Cc14/s32-c-k-no/photo.jpg" alt="" />
                <p class="pull-left">Jordan Quiambao</p>
              </div>
              <div class="list-item">
                <img class="pull-left img-responsive" src="https://lh3.googleusercontent.com/-2MAQZzjRHT8/AAAAAAAAAAI/AAAAAAAAAAs/4vIuT3giyBU/s32-c-k-no/photo.jpg" alt="" />
                <p class="pull-left">Ryan Nacpil</p>
              </div>
              <div class="list-item">
                <img class="pull-left img-responsive" src="https://lh5.googleusercontent.com/-UkvkdLXLgsk/AAAAAAAAAAI/AAAAAAAAAjM/opa3LnfENDc/s32-c-k-no/photo.jpg" alt="" />
                <p class="pull-left">Marco Manalo</p>
              </div>
              <div class="list-item">
                <img class="pull-left img-responsive" src="https://lh4.googleusercontent.com/-1Ydq4Gs3stY/AAAAAAAAAAI/AAAAAAAAAT4/RqkS4pKwDpU/s24-c-k-no/photo.jpg" alt="" />
                <p class="pull-left">Kevin Agatep</p>
              </div>
            </div>
          </div>
        </div>
       
        <div class="col-xs-7">
          <div class="chat-wrapper">
          <div class="chat-list">
          </div>
            <div class="chat-content">
            
                        
            </div>  
          </div>
              <span class="chat-input"><input class="form-control pull-right" type="text" id="message" name="message" /></span><button id="sendBtn">����</button>
        </div>
      </div>
    </div>
    <script>

var ws = null;
var loginId = null;

$(function () {
	
    ws = new WebSocket('ws://localhost:8000/nmcat/chat.mn');  /*
    url /info�� �ڵ� �ٴ°��� �ذ��ؾ� �Ѵ�. 
		    - ����� �������� *.do�� �����Ǿ� �־� 404�� �ȴ�.
		      /*�� �������� ��θ� �����ϰ� �Ǹ� ������ �������� ����� �ؽ�Ʈ�� ���δ�.
		      jsp ��� �䰡 �Ⱥ��δ�.
		      
		      �Ʒ��� SockJS�� ����ϱ� ���ؼ��� spring-websocket.xml���Ͽ� ���κ��� �ּ��� �����ؾ� �Ѵ�.
		  */
		
		ws.onopen = function() {
			    console.log('������ ���� ���� ����');
		};
		// �޼��� �ޱ�
		ws.onmessage = function(evt) {
		  $(".chat-list").prepend(evt.data);
		};
		ws.onerror = function(evt) {
			    $("div").prepend('������ ���� �߻� : ' + evt.data)
		};
		ws.onclose = function() {
			    $("div").prepend("������ ������ �����.");
		};
	});

	$('#sendBtn').click(function() { 
		var $msg = $("#message");
		// ���� �� �ִ� �����ʹ� String, Blob, ArrayBuffer �Դϴ�. 
		// ������ ������ ������ �����ϱ�
		
		ws.send("<div class='chat-bubble pull-right right'><p class='m-b-0'>"+$msg.val()+"</p></div><br>");
		$msg.val(""); 
	});

</script>
</body>
</html>