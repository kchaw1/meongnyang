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
              <p>���� �ο�</p>
            </div>
            <div class="list" data-index="${chNo}">
              <div class="list-item">
                <img class="pull-left img-responsive" src="https://lh4.googleusercontent.com/--W7e24o4cgE/AAAAAAAAAAI/AAAAAAAAG6s/IKny9ARll6s/s32-c-k-no/photo.jpg" alt="" />
                <p class="pull-left">sdadsa</p>
              </div>
            </div>
            <div id="chatout">
            	<button id="logout">ä�ù� ������</button>
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
              <span class="chat-input"><input class="form-control pull-right" type="text" id="message" name="message" onkeyup="enterkey();"/></span><button id="sendBtn">����</button>
        		<input type="hidden" id="id" name="id"/> 
        </div>
      </div>
    </div>
    <script>
var chat = null;
var loginId = null;
var imagePath = "${user.imagePath}"+"/${user.imageName}";
var roomNo = "${chNo}";
var image = "<img src='<c:url value='/common/download.mn?sysName=${user.imageName}&path=${user.imagePath}&oriName=${user.imageOriName}'/>' alt=''>"

$(function () {
	
	chat = new WebSocket('wss://192.168.0.68/nmcat/chat.mn');  /*
    url /info�� �ڵ� �ٴ°��� �ذ��ؾ� �Ѵ�. 
		    - ����� �������� *.do�� �����Ǿ� �־� 404�� �ȴ�.
		      /*�� �������� ��θ� �����ϰ� �Ǹ� ������ �������� ����� �ؽ�Ʈ�� ���δ�.
		      jsp ��� �䰡 �Ⱥ��δ�.
		      
		      �Ʒ��� SockJS�� ����ϱ� ���ؼ��� spring-websocket.xml���Ͽ� ���κ��� �ּ��� �����ؾ� �Ѵ�.
		  */
		
	   chat.onopen = function() {
			console.log(imagePath)
			console.log("${chNo}");
			let userId = "${user.id}"
			console.log('������ ���� ���� ����');
			$(".chat-list").append("<p style='text-align:center;'>ä���� ���۵Ǿ����ϴ�</p>")
			chat.send("roomaccess:" + roomNo + ":" + userId);
			console.log("���� ���̵� : "+userId);
		};
		// �޼��� �ޱ�
		chat.onmessage = function(evt) {		
			console.log(evt.data);
			let arr = evt.data.split(":");
			
			console.log("1"+arr[0]);
			console.log("2"+arr[1]);
			console.log("3"+arr[2]);
			if(arr[0] == 'in') {
				$(".chat-list").append("<br><p style='text-align:center;'>" + arr[2] + "</p><br>");
				$(".list").append('<div data-id="'+arr[1]+'" class="list-item"><img class="pull-left img-responsive" src="https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png" alt="" /><p class="pull-left">'+arr[1]+'</p></div>');		
			}
			else if(arr[0] == 'roomlist') {
				let userList = arr[1].split(",");
			    $(".list").empty();
				for(var i = 0 ; i<userList.length ; i++){
						$(".list").append('<div data-id="'+userList[i]+'" class="list-item"><img class="pull-left img-responsive" src="https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png" alt="" /><p class="pull-left">'+userList[i]+'</p></div>');		
				}
			}
			else if(arr[0] =='chat'){
				var chatInfo = arr[2].split(",");
				if("${user.id}"==chatInfo[0]){		 		
			 		$(".chat-list").append("<br><img class='pull-right img-circle chat-img' src='https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png' alt=''/><div class='chat-bubble pull-right right'><p class='m-b-0'>��:"+chatInfo[1]+"</p></div><br>");
			 	}else{	
					$(".chat-list").append("<br><span>"+chatInfo[0]+"</span><br><img class='pull-left img-responsive img-circle chat-img-left' src='https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png' alt=''/><div class='chat-bubble left'><p class='m-b-0'>"+chatInfo[1]+"</p></div><br>");
			 	}
			}
			else if(arr[0] == 'out'){
				$(".chat-list").append("<br><p style='text-align:center;'>" + arr[2] + "</p><br>");
				$("div[data-id='"+arr[1]+"']").remove();

			}
			
			/*
			
				
				
			}else if(evt.data.endsWith("���� �ϼ̽��ϴ�.")){
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
		 		$(".chat-list").append("<br><img class='pull-right img-circle chat-img' src='https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png' alt=''/><div class='chat-bubble pull-right right'><p class='m-b-0'>��:"+exId[1]+"</p></div><br>");
		 	}else{	
				$(".chat-list").append("<br><span>"+exId[0]+"</span><br><img class='pull-left img-responsive img-circle chat-img-left' src='https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png' alt=''/><div class='chat-bubble left'><p class='m-b-0'>"+exId[1]+"</p></div><br>");
		 	}
		 	
			}
			*/
			
		};
		chat.onerror = function(evt) {
			    $("div").append('������ ���� �߻� : ' + evt.data)
		};
		chat.onclose = function() {
			$(".chat-list").append("<p>ä�� ������ �����ʾ� �����.</p>");
			    

		}
		
		});

		$('#sendBtn').click(function() { 
			var $msg = $("#message");
    		loginId = "${user.id}";
    		// ���� �� �ִ� �����ʹ� String, Blob, ArrayBuffer �Դϴ�. 
    		// ������ ������ ������ �����ϱ�
    		console.log($msg.val());
    			
    		chat.send(chNo + ":" + loginId + ":" + $msg.val());
    		$msg.val("");
    	    $(".chat-list").scrollTop($(".chat-list").clientHeight());
	
	});
	
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        		var $msg = $("#message");
        		loginId = "${user.id}";
        		// ���� �� �ִ� �����ʹ� String, Blob, ArrayBuffer �Դϴ�. 
        		// ������ ������ ������ �����ϱ�
        		console.log($msg.val());
        			
        		chat.send("chat:"+roomNo+":"+loginId +","+ $msg.val());
        		$msg.val("");        		
        }
        
        
}
	$('#logout').click(function() { 

			chat.send("roomout:"+roomNo+":"+"${user.id}");
		
			window.close();
	});

	
	window.setInterval(function() {
        var elem = document.getElementById('chatlist');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
	
	
</script>
</body>
</html>