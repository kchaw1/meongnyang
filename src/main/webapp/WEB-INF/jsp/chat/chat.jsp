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
              	<c:choose>
              	<c:when test="${user.id != 'null'}">
                <img class="pull-left" src="<c:url value='/common/download.mn?sysName=${user.imageName}&path=${user.imagePath}'/>" alt="" />
              	</c:when>
              	<c:otherwise>
              	<img class="pull-left" src="https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png" alt="">              	
              	</c:otherwise>
              	</c:choose>
                <div class="pull-left">
                  <p class="name">${user.id}</p>
                  <p class="name">${user.name}</p>
                  
                </div>
              </div>
            </div>
            <div class="list-head">
              <p>참가 인원</p>
            </div>
            <div class="list" data-index="${chNo}">
              <div class="list-item">
                <img class="pull-left img-responsive" src="https://lh4.googleusercontent.com/--W7e24o4cgE/AAAAAAAAAAI/AAAAAAAAG6s/IKny9ARll6s/s32-c-k-no/photo.jpg" alt="" />
                <p class="pull-left">sdadsa</p>
              </div>
            </div>
            <div id="chatout">
            	<button id="logout">채팅방 나가기</button>
            </div>
          </div>
        </div>
       
        <div class="col-xs-7">
          <div class="chat-wrapper">
          <div id="chatlist" class="chat-list" id="out" style="overflow-y:auto;">
          </div>
            <div class="chat-content">
            
                        
            </div>  
          </div>
              <span class="chat-input"><input class="form-control pull-right" type="text" id="message" name="message" onkeyup="enterkey();"/></span><button id="sendBtn">전송</button>
        		<input type="hidden" id="id" name="id"/> 
        </div>
      </div>
    </div>
    <script>
var chat = null;
var loginId = null;
var imagePath = "${user.imagePath}"+"/${user.imageName}";
var chNo = "${chNo}";
var image = "<img src='<c:url value='/common/download.mn?sysName=${user.imageName}&path=${user.imagePath}&oriName=${user.imageOriName}'/>' alt=''>"

$(function () {
	
	chat = new WebSocket('wss://192.168.0.68/nmcat/chat.mn');  /*
    url /info가 자동 붙는것을 해결해야 한다. 
		    - 현재는 스프링이 *.do로 설정되어 있어 404가 된다.
		      /*로 스프링의 경로를 수정하게 되면 문제는 페이지의 결과가 텍스트로 보인다.
		      jsp 결과 뷰가 안보인다.
		      
		      아래의 SockJS를 사용하기 위해서는 spring-websocket.xml파일에 사용부분의 주석을 해제해야 한다.
		  */
		
		  chat.onopen = function() {
			console.log(imagePath)
			console.log("${chNo}");
			 var In = "${user.id}"
			    console.log('웹소켓 서버 접속 성공');
			    $(".chat-list").append("<p style='text-align:center;'>채팅이 시작되었습니다</p>")
			    chat.send("input : " + In +  ",chNo : "+chNo);
			  	console.log("입장 아이디 : "+In);
			
			  	
		};
		// 메세지 받기
		chat.onmessage = function(evt) {		
			console.log(evt.data);
			
			if(evt.data.startsWith("input : ")){
				var id = evt.data.split(":");
		 		$(".chat-list").append("<br><p style='text-align:center;'>"+id[1].substring(0,id[1].indexOf(","))+"님이 입장하셨습니다.</p><br>");
				console.log(id[1].substring(id[1].indexOf(",")+1))
				
				var stringList = id[1].substring(id[1].indexOf(",")+1);
				
				stringList.substring(1,stringList.length);
				console.log(stringList.substring(1,stringList.length-1));
				
				var list = stringList.substring(1,stringList.length-1)
				console.log(list);
				var listarr = list.split(", ");
				console.log(listarr);
				/* for(var key in listarr){
					console.log(listarr[key]);
					console.log(listarr[key].substring(0,listarr[key].indexOf("="))); // 방번호
					console.log(listarr[key].substring(listarr[key].indexOf("[")+1,listarr[key].indexOf("]"))); // 참여자
					 for(var keys in listarr[key] ){
						console.log(listarr[key][keys]);
					} 
				} */
				$(".list").empty();
				for(var i = 0 ; i<listarr.length ; i++){
					$(".list").append('<div class="list-item"><img class="pull-left img-responsive" src="https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png" alt="" /><p class="pull-left">'+listarr[i]+'</p></div>');		
				}
				
				
			}else if(evt.data.endsWith("퇴장 하셨습니다.")){
				console.log(evt.data);
				var stringList = evt.data.substring(1,evt.data.indexOf("]"));
				console.log(stringList);
				var listarr = stringList.split(", ");
				console.log(listarr);
				$(".list").empty();
				for(var i = 0 ; i<listarr.length ; i++){
					$(".list").append('<div class="list-item"><img class="pull-left img-responsive" src="https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png" alt="" /><p class="pull-left">'+listarr[i]+'</p></div>');		
				}
				$(".chat-list").append("<br><p style='text-align:center;'>"+evt.data.substring(evt.data.indexOf(",")+1)+"</p><br>");

			}
			else{
				
		 	var ex = evt.data.split(',');
		 	var exId = ex[1].split(":");
		 	
		 	console.log("1:"+ex);
		 	console.log("2"+exId);
		 	console.log("3"+exId[0]);
		 	console.log("4"+exId[1]);
		 	if("${user.id}"==exId[0]){		 		
		 		$(".chat-list").append("<br><img class='pull-right img-circle chat-img' src='https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png' alt=''/><div class='chat-bubble pull-right right'><p class='m-b-0'>나:"+exId[1]+"</p></div><br>");
		 	}else{	
				$(".chat-list").append("<br><span>"+exId[0]+"</span><br><img class='pull-left img-responsive img-circle chat-img-left' src='https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png' alt=''/><div class='chat-bubble left'><p class='m-b-0'>"+exId[1]+"</p></div><br>");
		 	}
		 	
			}
			
		};
		chat.onerror = function(evt) {
			    $("div").append('웹소켓 에러 발생 : ' + evt.data)
		};
		chat.onclose = function() {
			$(".chat-list").append("<p>채팅 연결이 되지않아 종료됨.</p>");
			    

		}
		
		});

		$('#sendBtn').click(function() { 
			var $msg = $("#message");
    		loginId = "${user.id}";
    		// 보낼 수 있는 데이터는 String, Blob, ArrayBuffer 입니다. 
    		// 웹소켓 서버에 데이터 전송하기
    		console.log($msg.val());
    			
    		chat.send(chNo+","+loginId + ":" + $msg.val());
    		$msg.val("");
    		 $(".chat-list").scrollTop($(".chat-list").clientHeight());
    		
	
	});
	
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        		var $msg = $("#message");
        		loginId = "${user.id}";
        		// 보낼 수 있는 데이터는 String, Blob, ArrayBuffer 입니다. 
        		// 웹소켓 서버에 데이터 전송하기
        		console.log($msg.val());
        			
        		chat.send(chNo+","+loginId + ":" + $msg.val());
        		$msg.val("");        		
        }
        
        
}
	$('#logout').click(function() { 
		$.ajax({
			url: "<c:url value='/chat/chat.mn' />"
		})
		.done(function (result) {
			
			chat.send("output : " + loginId);
						
			loginId = "${user.id}";
			
			$(".chat-list").html("");
		
			window.close();
		});
	});

	
	window.setInterval(function() {
        var elem = document.getElementById('chatlist');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
	
	
</script>
</body>
</html>