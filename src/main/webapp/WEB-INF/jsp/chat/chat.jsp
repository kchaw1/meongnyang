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
    url /info�� �ڵ� �ٴ°��� �ذ��ؾ� �Ѵ�. 
		    - ����� �������� *.do�� �����Ǿ� �־� 404�� �ȴ�.
		      /*�� �������� ��θ� �����ϰ� �Ǹ� ������ �������� ����� �ؽ�Ʈ�� ���δ�.
		      jsp ��� �䰡 �Ⱥ��δ�.
		      
		      �Ʒ��� SockJS�� ����ϱ� ���ؼ��� spring-websocket.xml���Ͽ� ���κ��� �ּ��� �����ؾ� �Ѵ�.
		  */
		
	   chat.onopen = function() {
			console.log("${chNo}");
			let userId = "${user.id}";
			let userImagePath = "${user.imagePath}";
			let userImageName = "${user.imageName}";
			let image = "sysName=${user.imageName}&path=${user.imagePath}";
			console.log('������ ���� ���� ����');
			$(".chat-list").append("<p style='text-align:center;'>ä���� ���۵Ǿ����ϴ�</p>")
			/*chat.send("roomaccess:" + roomNo + ":" + userId);*/
			chat.send("roomaccess:" + roomNo + ":" + userId +","+image);
			console.log("���� ���̵� : "+userId);
		};
		// �޼��� �ޱ�
		chat.onmessage = function(evt) {		
			console.log("������"+evt.data);
			let arr = evt.data.split(":");
			
			console.log("1"+arr[0]); //roomlist   // roomlist
			console.log("2"+arr[1]); //���̵�  			// ���̵�-�̹���
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
				console.log("4"+attr[0]); // ���̵�-������ ����1
				console.log("5"+attr[1]); // ���̵�-������ ����2
				for(var j=0; j<attr.length; j++){					
					let userList = attr[j].split("-");
					console.log("�迭���� ���̵�:"+userList[0]);
					console.log("�̹���" +userList[1]);
			    	
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
			    $("div").append('������ ���� �߻� : ' + evt.data)
		};
		chat.onclose = function() {
			$(".chat-list").append("<p>ä�� ������ �����ʾ� �����.</p>");
			    

		}
		
		});

		$('#send').click(function() { 
			var $msg = $("#message");
    		loginId = "${user.id}";
    		let image = "sysName=${user.imageName}&path=${user.imagePath}";

    		// ���� �� �ִ� �����ʹ� String, Blob, ArrayBuffer �Դϴ�. 
    		// ������ ������ ������ �����ϱ�
    		console.log($msg.val());
    			
    		chat.send("chat:"+roomNo+":"+loginId +","+ $msg.val()+"-"+image);
    		$msg.val(""); 
	});
	
	
	function enterkey() {
        if (window.event.keyCode == 13) {
        		var $msg = $("#message");
        		loginId = "${user.id}";
        		let image = "sysName=${user.imageName}&path=${user.imagePath}";

        		// ���� �� �ִ� �����ʹ� String, Blob, ArrayBuffer �Դϴ�. 
        		// ������ ������ ������ �����ϱ�
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