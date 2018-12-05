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
                  <p class="name">${user.id}</p>
                  <p class="name">${user.name}</p>
                  
                </div>
              </div>
            </div>
            <div class="list-head">
              <p>���� �ο�</p>
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
              <span class="chat-input"><input class="form-control pull-right" type="text" id="message" name="message" /></span><button id="sendBtn">����</button>
        		<input type="hidden" id="id" name="id"/> 
        </div>
      </div>
    </div>
    <script>

var chat = null;
var loginId = null;
$(function () {
	
	chat = new WebSocket('wss://192.168.0.68/nmcat/chat.mn');  /*
    url /info�� �ڵ� �ٴ°��� �ذ��ؾ� �Ѵ�. 
		    - ����� �������� *.do�� �����Ǿ� �־� 404�� �ȴ�.
		      /*�� �������� ��θ� �����ϰ� �Ǹ� ������ �������� ����� �ؽ�Ʈ�� ���δ�.
		      jsp ��� �䰡 �Ⱥ��δ�.
		      
		      �Ʒ��� SockJS�� ����ϱ� ���ؼ��� spring-websocket.xml���Ͽ� ���κ��� �ּ��� �����ؾ� �Ѵ�.
		  */
		
		  chat.onopen = function() {
			    console.log('������ ���� ���� ����');
			    $(".chat-list").append("<p>ä���� ���۵Ǿ����ϴ�</p>")
		};
		// �޼��� �ޱ�
		chat.onmessage = function(evt) {
		  $(".chat-list").append("<div>"+evt.data+"</div>");
			
		};
		chat.onerror = function(evt) {
			    $("div").append('������ ���� �߻� : ' + evt.data)
		};
		chat.onclose = function() {
			    $("div").append("������ ������ �����.");
		};
	});

	$('#sendBtn').click(function() { 
		var $msg = $("#message");
		var $id = $("#id");
		// ���� �� �ִ� �����ʹ� String, Blob, ArrayBuffer �Դϴ�. 
		// ������ ������ ������ �����ϱ�
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