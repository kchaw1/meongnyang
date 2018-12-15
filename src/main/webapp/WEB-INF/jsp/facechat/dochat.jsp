<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="./dochatCSSJS.jsp"/>
</head>

<body>

<div class="content-wrapper">
	<div class="main-doc">
		<div id="videos-container"></div>	
	</div>
</div>
<!-- <div class="loading"></div> -->
<div id="setup-room">
	<!-- <input type="hidden" id="name"/>
	<input type="hidden" id="id"/>
	<input type="hidden" id="no"/> -->
	 <input type="text" id="conference-name">
    <button id="setup-new-room" class="setup">new</button> 
    <!-- list of all available conferencing rooms -->
    <table id="rooms-list"></table>
</div>
<div class="ment hidden" data-anim="la-anim-12">
	<h1 class="la-anim-12" data-content="${param.name} 님의 수락을 기다리고 있습니다..">${param.name} 님의 수락을 기다리고 있습니다...</h1>
</div>
<%-- <c:import url="./video.jsp"/> --%>
<%-- <script src="<c:url value="/resources/js/facechat/video.js"/>"></script> --%>
<script>
var videosContainer = document.getElementById('videos-container') || document.body;
var btnSetupNewRoom = document.getElementById('setup-new-room');
var roomsList = document.getElementById('rooms-list');
var ment = $("div.ment");
var alarmSocket = new WebSocket('wss://localhost:443/nmcat/alarm.mn');
//var alarmSocket = new WebSocket('wss://192.168.0.63:443/nmcat/alarm.mn');

//new 버튼 눌렀을때..이벤트..

	if("${user.id}"!="${param.id}") {
		Swal({
			title: '정말 ${param.name}님과 <br>화상채팅 하시겠습니까?',
			text: "화상채팅 연결 시, 1,000 포인트가 차감됩니다.",
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '네 연결해주세요!',
			cancelButtonText : "아니요, 취소할게요.."
		}).then((result) => {
			console.log(result) //{value: true}
			if (result.value) {
				var $call = $.ajax({
								url : "<c:url value='/point/checkpoint.mn'/>",
								data : "id=${user.id}",
								type : "POST"
							})
							//console.log($call)
				$.when($call).done(function(totalSum){
					//console.log(totalSum)
					//console.log(totalSum >1000)
					if(totalSum >= 1000){
						//보유 포인트가 1000 이상일때 실행..
					   btnSetupNewRoom.onclick = setupNewRoomButtonClickHandler;
					} else if(totalSum < 1000){
						swal({
							  type: 'error',
							  title: '포인트가 모자라요...',
							  text: totalSum+ " 포인트 밖에 없어요..",
							  showConfirmButton: false,
							  timer: 2500
							});
						
						setTimeout(function(){
							window.close()}, 
						2500);
					}
				}) //when done...
			} else {
				window.close();
			}
			/* btnSetupNewRoom.trigger("click");  */
		}) // swal..then..	
	} 

 // on.ready
	

//if (btnSetupNewRoom) btnSetupNewRoom.onclick = setupNewRoomButtonClickHandler;

var sender = "";

var config = {
    openSocket: function (config) {
    	//console.log(1234);
        var SIGNALING_SERVER = 'https://socketio-over-nodejs2.herokuapp.com:443/';
        console.log(config.channel, location.href)
        config.channel = config.channel || location.href.replace(/\/|:|#|%|\.|\[|\]/g, '');

        //sender 난수
//        sender = Math.round(Math.random() * 999999999) + 999999999;
        sender = 1000;
       console.log("channel : "+config.channel);
       console.log("sender : "+sender);
       
        io.connect(SIGNALING_SERVER).emit('new-channel', {
            channel: config.channel,
            sender: sender
        });

        var socket = io.connect(SIGNALING_SERVER + config.channel);
        socket.channel = config.channel;
        socket.on('connect', function () {
        	console.log("연결 완료")
            if (config.callback) config.callback(socket);
//	        	join();
        });
        
        socket.send = function (message) {
        	
            socket.emit('message', {
                sender: sender,
                data: message
            });
        };

        socket.on('message', config.onmessage);
    },
    onRemoteStream: function(media) {
    	console.log("리모트 스트림")
    	
        var mediaElement = getMediaElement(media.video, {
            width: $(document).width(),
            buttons: ['mute-audio', 'mute-video', 'volume-slider']
        });
        mediaElement.id = "remoteVideo";
        $("body").waitMe("hide")
        /* ment.removeClass("show")
        ment.addClass("hidden") */
        //상대방과 연결이 되었을때..반려인의 경우..포인트 차감 alert가 뜬다!!
        if("${user.id}"!="${param.id}") {
        	$.ajax({
				   url : "<c:url value='/point/usefacechat.mn'/>",
				   data : {
					   id : "${user.id}",
					   minusPoint : 1000,
					   minusUse : "2",
					   fees : 100,
					   absId : "${param.id}"
				   },
				   type : "POST"
			   }).done(function(resultSum){
				   var resultSum = String(resultSum).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				   swal({
					   type: 'success',
					   title: resultSum + " 포인트 남았습니다.",
					   showConfirmButton: false,
					   timer: 3000
					 });
			   }) //minus ajax.. 
        }
        //clearInterval(joinStart);
//        mediaElement.onclick = function(event) {
//        	$('div.main-doc > .media-container').remove();
//        	/* 화면복사 */      	
//        	let dom = $('.main-doc');
//        	var video = document.createElement('video');
//        	    video.muted = true;
//        	    video.volume = 0;
//    	    try {
//    	        video.setAttributeNode(document.createAttribute('autoplay'));
//    	        video.setAttributeNode(document.createAttribute('playsinline'));
//    	        video.setAttributeNode(document.createAttribute('controls'));
//    	    } catch (e) {
//    	        video.setAttribute('autoplay', true);
//    	        video.setAttribute('playsinline', true);
//    	        video.setAttribute('controls', true);
//    	    }
//    	    getUserMedia({
//    	        video: video,
//    	        onsuccess: function(stream) {
//		            config.attachStream = media.video.srcObject;
//		            video.srcObject = media.video.srcObject;
//		            var mediaElement = getMediaElement(video, {
//		                width: '100%',
//		                buttons: ['stop']
//		            });
//		            dom.append(mediaElement);
//    	        },
//    	        onerror: function() {
//    	        }
//    	    });
//		}; //onclick
        videosContainer.appendChild(mediaElement);
    },
    onRoomFound: function(room) {
    	console.log("room:" +room.roomName)
    	console.dir(room)
        var alreadyExist = document.querySelector('button[data-broadcaster="' + room.broadcaster + '"]');
        if (alreadyExist) return;

        if (typeof roomsList === 'undefined') roomsList = document.body;

        var tr = document.createElement('tr');
        tr.innerHTML = '<td><strong>' + room.roomName + '</strong> shared a conferencing room with you!</td>' +
            '<td><button class="join">Join</button></td>';
        roomsList.appendChild(tr);

        //조인 버튼은 위에서 만들어줌...
        var joinRoomButton = tr.querySelector('.join');
        joinRoomButton.setAttribute('data-broadcaster', room.broadcaster);
        joinRoomButton.setAttribute('data-roomToken', room.roomToken);
        //조인 버튼 누르면..
        joinRoomButton.onclick = function() {
            this.disabled = true;

            var broadcaster = this.getAttribute('data-broadcaster');
            var roomToken = this.getAttribute('data-roomToken');
            captureUserMedia(function() {
                conferenceUI.joinRoom({
                    roomToken: roomToken,
                    joinUser: broadcaster
                });
            }, function() {
                joinRoomButton.disabled = false;
            });
        };
        /* setTimeout(function(){
        	let joinBtn = $('.join');
        	if(joinBtn.attr('data-roomToken')){ //기존 접속자가 있을때
        		joinBtn.trigger("click"); 
        	}else{
        		$('#setup-new-room').trigger("click");
        	}
        }, 2000); */
    },
    onRoomClosed: function(room) {
        var joinButton = document.querySelector('button[data-roomToken="' + room.roomToken + '"]');
        if (joinButton) {
            // joinButton.parentNode === <li>
            // joinButton.parentNode.parentNode === <td>
            // joinButton.parentNode.parentNode.parentNode === <tr>
            // joinButton.parentNode.parentNode.parentNode.parentNode === <table>
            joinButton.parentNode.parentNode.parentNode.parentNode.removeChild(joinButton.parentNode.parentNode.parentNode);
        }
    }
} //config;

var conferenceUI = conference(config);

setTimeout(function(){
	let joinBtn = $('.join');
	if(joinBtn.attr('data-roomToken')){ //기존 접속자가 있을때
		joinBtn.trigger("click"); 
	}else{
		$('#setup-new-room').trigger("click");
	}
}, 3000);

function setupNewRoomButtonClickHandler() {
    btnSetupNewRoom.disabled = true;
    document.getElementById('conference-name').disabled = true;
    captureUserMedia(function() {
        conferenceUI.createRoom({
            /* roomName: (document.getElementById('conference-name') || { }).value || 'Anonymous' */
            roomName: "${user.id}"
        });
        //웹소켓에 보내기..
        alarmSocket.send("facechat:" + "${param.id}")
        $("body").waitMe({
				effect : 'roundBounce',
				text : "${param.name} 님의 요청 수락을 기다리는 중입니다.",
				bg : 'rgba(255,255,255,0.7)',
				color : '#000'
				
			});
       /*  ment.removeClass("hidden")
        ment.addClass("show")
        var inProgress = false;
        var anim = ment.data( 'anim' ),
			animEl = document.querySelector( '.' + anim );
    	if( inProgress ) return false;
		inProgress = true;
		classie.add( animEl, 'la-animate' );

		if( anim === 'la-anim-6' ) {
			PieDraw();
		}

		setTimeout( function() {
			classie.remove( animEl, 'la-animate' );
			
			if( anim === 'la-anim-6' ) {
				PieReset();
			}
			
			inProgress = false;
		}, 6000 ); */
    }, function() {
        btnSetupNewRoom.disabled = document.getElementById('conference-name').disabled = false;
    });
}


function captureUserMedia(callback, failure_callback) {
    var video = document.createElement('video');
    video.muted = true;
    video.volume = 0;

    try {
        video.setAttributeNode(document.createAttribute('autoplay'));
        video.setAttributeNode(document.createAttribute('playsinline'));
        video.setAttributeNode(document.createAttribute('controls'));
    } catch (e) {
        video.setAttribute('autoplay', true);
        video.setAttribute('playsinline', true);
        video.setAttribute('controls', true);
    }
    // 클릭시 핀고정 전체화면
//    video.onclick = function() {
//    	console.log("새로만든 비디오 클릭함..")
//    }
    //video.onclick = pinVideo;
    
    getUserMedia({
        video: video,
        onsuccess: function(stream) {
            config.attachStream = stream;

            var mediaElement = getMediaElement(video, {
//                width: 400,
                width: $(document).width()*0.25,
                buttons: ['mute-audio', 'mute-video', 'volume-slider']
            });
            /*let span = document.createElement('span');
            let name = ${user};
            let txt = document.createTextNode(name);
            span.appendChild(txt);*/
            mediaElement.id = "localVideo";
            mediaElement.toggle('mute-audio');
            videosContainer.appendChild(mediaElement);

            callback && callback();
            //pinVideo(stream);
        },
        onerror: function() {
            alert('unable to get access to your webcam');
            callback && callback();
        }
    });
}

//유니크토큰이 있는지 없는지... 판단..
//유니크 토큰이 roomtoken 이 되는 비밀은 conference.js 에 있다...
//(function() {
//	console.log("유니크 토큰을 찾자..")
//	let joinBtn = $('.join');
//	console.log(joinBtn)
////	var uniqueToken = document.getElementById('unique-token');
//    var uniqueToken = joinBtn.data("roomtoken");
//	console.log("roomtoken==uniquetoken : " + uniqueToken);
//	if(uniqueToken){
//    	console.log("location.hash :" + location.hash);
//    	if (location.hash.length > 2) uniqueToken.parentNode.parentNode.parentNode.innerHTML = '<h2 style="text-align:center;display: block;"><a href="' + location.href + '" target="_blank">Right click to copy & share this private link</a></h2>';
//    	else uniqueToken.innerHTML = uniqueToken.parentNode.parentNode.href = '#' + (Math.random() * new Date().getTime()).toString(36).toUpperCase().replace( /\./g , '-');    	
//    }
//})();
//(function() {
//    var uniqueToken = document.getElementById('unique-token');
//    if (uniqueToken)
//        if (location.hash.length > 2) uniqueToken.parentNode.parentNode.parentNode.innerHTML = '<h2 style="text-align:center;display: block;"><a href="' + location.href + '" target="_blank">Right click to copy & share this private link</a></h2>';
//        else uniqueToken.innerHTML = uniqueToken.parentNode.parentNode.href = '#' + (Math.random() * new Date().getTime()).toString(36).toUpperCase().replace( /\./g , '-');
//})();


//클릭시 이벤트 설정 함수
function pinVideo(stream) {
	let dom = $('.main-doc');
	var video = document.createElement('video');
    video.muted = true;
    video.volume = 0;
    //$('div.main-doc > .media-container').remove();
    try {
        video.setAttributeNode(document.createAttribute('autoplay'));
        video.setAttributeNode(document.createAttribute('playsinline'));
        video.setAttributeNode(document.createAttribute('controls'));
    } catch (e) {
        video.setAttribute('autoplay', true);
        video.setAttribute('playsinline', true);
        video.setAttribute('controls', true);
    }
    getUserMedia({
        video: video,
        onsuccess: function(stream) {
            config.attachStream = stream;
            var mediaElement = getMediaElement(video, {
                width: '100%',
                buttons: ['stop']
            });
            dom.append(mediaElement);
        },
        onerror: function() {
        }
    });
}
</script>
</body>
</html>