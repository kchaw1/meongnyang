var videosContainer = document.getElementById('videos-container') || document.body;
var btnSetupNewRoom = document.getElementById('setup-new-room');
var roomsList = document.getElementById('rooms-list');

//new 버튼 눌렀을때..이벤트..
if (btnSetupNewRoom) btnSetupNewRoom.onclick = setupNewRoomButtonClickHandler;
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
    	console.log("room:")
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

//setTimeout(function(){
//	let joinBtn = $('.join');
//	if(joinBtn.attr('data-roomToken')){ //기존 접속자가 있을때
//		joinBtn.trigger("click"); 
//	}else{
//		$('#setup-new-room').trigger("click");
//	}
//}, 6000);

function setupNewRoomButtonClickHandler() {
    btnSetupNewRoom.disabled = true;
    document.getElementById('conference-name').disabled = true;
    captureUserMedia(function() {
        conferenceUI.createRoom({
            roomName: (document.getElementById('conference-name') || { }).value || 'Anonymous'
        });
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
(function() {
	console.log("유니크 토큰을 찾자..")
	let joinBtn = $('.join');
	console.log(joinBtn)
//	var uniqueToken = document.getElementById('unique-token');
    var uniqueToken = joinBtn.data("roomtoken");
	console.log("roomtoken==uniquetoken : " + uniqueToken);
	if(uniqueToken){
    	console.log("location.hash :" + location.hash);
    	if (location.hash.length > 2) uniqueToken.parentNode.parentNode.parentNode.innerHTML = '<h2 style="text-align:center;display: block;"><a href="' + location.href + '" target="_blank">Right click to copy & share this private link</a></h2>';
    	else uniqueToken.innerHTML = uniqueToken.parentNode.parentNode.href = '#' + (Math.random() * new Date().getTime()).toString(36).toUpperCase().replace( /\./g , '-');    	
    }
})();
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