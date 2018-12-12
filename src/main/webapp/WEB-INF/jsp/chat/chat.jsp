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
var chNo = "${chNo}";
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
			 var In = "${user.id}"
			    console.log('������ ���� ���� ����');
			    $(".chat-list").append("<p style='text-align:center;'>ä���� ���۵Ǿ����ϴ�</p>")
			    chat.send("input : " + In +  ",chNo : "+chNo);
			  	console.log("���� ���̵� : "+In);
			
			  	
		};
		// �޼��� �ޱ�
		chat.onmessage = function(evt) {		
			console.log(evt.data);
			
			if(evt.data.startsWith("input : ")){
				var id = evt.data.split(":");
		 		$(".chat-list").append("<br><p style='text-align:center;'>"+id[1].substring(0,id[1].indexOf(","))+"���� �����ϼ̽��ϴ�.</p><br>");
				console.log("1�� : "+id[1].substring(id[1].indexOf(",")+1)) 
				
				var stringList = id[1].substring(id[1].indexOf(",")+1);
				
				stringList.substring(1,stringList.length);
				console.log("2�� : "+stringList.substring(1,stringList.length-1));
				var number = stringList.substring(1,stringList.length-1);
				
				
 				number = number.replace(/],/gi,"]&");
				/* var numberlist = number.split(","); */
				var numberlist = number.split("&");
				
				console.log("numberlist"+numberlist);
				console.log("1:"+numberlist[0]+"2:"+numberlist[1]+"3:"+numberlist[2]);
					
				for(var j =0; j<numberlist.length; j++){
					var list = numberlist[j].split("=");
 						
					 		console.log("list"+list);
							console.log("��ȣ:"+list[0] +"�����ο� :"+ list[1]);
					 
 					
				}
				
				
				 if("${chNo}" === list[0]){
					 console.log("���ȣ : " + list[0]);
					var listex = list[1].substring(list[1].indexOf("[")+1,list[1].lastIndexOf("]"));
					console.log("listex: "+ listex);
					var listarr = listex.split(", ");
					console.log("listarr:" + listarr);
				   $(".list").empty();
					for(var i = 0 ; i<listarr.length ; i++){
							$(".list").append('<div class="list-item"><img class="pull-left img-responsive" src="https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png" alt="" /><p class="pull-left">'+listarr[i]+'</p></div>');		
					}
				}
				
				
				
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
    			
    		chat.send(chNo+","+loginId + ":" + $msg.val());
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