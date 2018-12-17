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
              <span class="chat-input"><input class="form-control pull-right" type="text" id="message" name="message" onkeyup="enterkey();"/></span>&nbsp<img id="send" class="pull-left img-responsive img-circle chat-img-left" src="<c:url value='/common/download.mn?sysName=${user.imageName}&path=${user.imagePath}'/>" alt="" />

        		<input type="hidden" id="id" name="id"/> 
        </div>
      </div>
    </div>
    <script>
var chat = null;
var loginId = null;
var imagePath = "${user.imagePath}";
var imageName = "${user.imageName}";
var roomNo = "${chNo}";

$(function () {
	
	chat = new WebSocket('wss://192.168.0.68/nmcat/chat.mn');  /*
    url /info가 자동 붙는것을 해결해야 한다. 
		    - 현재는 스프링이 *.do로 설정되어 있어 404가 된다.
		      /*로 스프링의 경로를 수정하게 되면 문제는 페이지의 결과가 텍스트로 보인다.
		      jsp 결과 뷰가 안보인다.
		      
		      아래의 SockJS를 사용하기 위해서는 spring-websocket.xml파일에 사용부분의 주석을 해제해야 한다.
		  */
		
	   chat.onopen = function() {
			console.log("${chNo}");
			let userId = "${user.id}";
			let userImagePath = "${user.imagePath}";
			let userImageName = "${user.imageName}";
			let image = "sysName=${user.imageName}&path=${user.imagePath}";
			console.log('웹소켓 서버 접속 성공');
			$(".chat-list").append("<p style='text-align:center;'>채팅이 시작되었습니다</p>")
			/*chat.send("roomaccess:" + roomNo + ":" + userId);*/
			chat.send("roomaccess:" + roomNo + ":" + userId +","+image);
			console.log("입장 아이디 : "+userId);
		};
		// 메세지 받기
		chat.onmessage = function(evt) {		
			console.log("들어오니"+evt.data);
			let arr = evt.data.split(":");
			
			console.log("1"+arr[0]); //roomlist   // roomlist
			console.log("2"+arr[1]); //아이디  			// 아이디-이미지
			console.log("3"+arr[2]); // undefined // undefined
			
		    
			
			
			if(arr[0] == 'in') {
				let inAttr = arr[2].split("-");
				console.log("2-1"+inAttr[0]);
				console.log("2-2"+inAttr[1]);
				$(".chat-list").append("<br><p style='text-align:center;'>" + inAttr[0] + "</p><br>");
				
				$(".list").append('<div data-id="'+arr[1]+'" class="list-item"><img class="pull-left img-responsive" src="<c:url value="/common/download.mn?'+inAttr[1]+'"/>" alt="" /><p class="pull-left">'+arr[1]+'</p></div>');		
			}
			else if(arr[0] == 'roomlist') {
				let attr = arr[1].split(",");
				$(".list").empty();
				console.log("4"+attr[0]); // 아이디-프로필 사진1
				console.log("5"+attr[1]); // 아이디-프로필 사진2
				for(var j=0; j<attr.length; j++){					
					let userList = attr[j].split("-");
					console.log("배열돌린 아이디:"+userList[0]);
					console.log("이미지" +userList[1]);
			    	
					for(var i = 0 ; i<userList.length;){
							$(".list").append('<div data-id="'+userList[i]+'" class="list-item"><img class="pull-left img-responsive" src="<c:url value="/common/download.mn?'+userList[i+1]+'"/>" alt="" /><p class="pull-left">'+userList[i]+'</p></div>');		
							i += 2;
						
				}			    	
			    
			    
				}
			}
			else if(arr[0] =='chat'){
				var chatInfo = arr[2].split(",");
				var chatAttr = chatInfo[1].split("-");
				if("${user.id}"==chatInfo[0]){		 		
			 		$(".chat-list").append('<br><img class="pull-right img-circle chat-img" src="<c:url value="/common/download.mn?'+chatAttr[1]+'"/>" alt=""/><div class="chat-bubble pull-right right"><p class="m-b-0">'+chatAttr[0]+'</p></div><br>');
			 	}else{	
					$(".chat-list").append('<br><span>'+chatInfo[0]+'</span><br><img class="pull-left img-responsive img-circle chat-img-left" src="<c:url value="/common/download.mn?'+chatAttr[1]+'"/>" alt=""/><div class="chat-bubble left"><p class="m-b-0">'+chatAttr[0]+'</p></div><br>');
			 	}
			}
			else if(arr[0] == 'out'){
				let inAttr = arr[2].split("-");
				$(".chat-list").append("<br><p style='text-align:center;'>" + inAttr[0] + "</p><br>");
				$("div[data-id='"+arr[1]+"']").remove();

			}
			
		};
		chat.onerror = function(evt) {
			    $("div").append('웹소켓 에러 발생 : ' + evt.data)
		};
		chat.onclose = function() {
			$(".chat-list").append("<p>채팅 연결이 되지않아 종료됨.</p>");
			    

		}
		
		});

		$('#send').click(function() { 
			var $msg = $("#message");
    		loginId = "${user.id}";
    		let image = "sysName=${user.imageName}&path=${user.imagePath}";

    		// 보낼 수 있는 데이터는 String, Blob, ArrayBuffer 입니다. 
    		// 웹소켓 서버에 데이터 전송하기
    		console.log($msg.val());
    			
    		chat.send("chat:"+roomNo+":"+loginId +","+ $msg.val()+"-"+image);
    		$msg.val(""); 
	});
	
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        		var $msg = $("#message");
        		loginId = "${user.id}";
        		let image = "sysName=${user.imageName}&path=${user.imagePath}";

        		// 보낼 수 있는 데이터는 String, Blob, ArrayBuffer 입니다. 
        		// 웹소켓 서버에 데이터 전송하기
        		console.log($msg.val());
        			
        		chat.send("chat:"+roomNo+":"+loginId +","+ $msg.val()+"-"+image);
        		$msg.val("");        		
        }
        
        
	};
	$('#logout').click(function() { 
		let image = "sysName=${user.imageName}&path=${user.imagePath}";

			chat.send("roomout:"+roomNo+":"+"${user.id}"+","+image);
		
			window.close();
	});

	
	window.setInterval(function() {
        var elem = document.getElementById('chatlist');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
	
	
</script>
</body>
</html>