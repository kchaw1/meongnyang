/**
 * 
 */
(function(){
	var video = document.querySelector("video");
	var canvas = document.querySelector("canvas");
	var img = document.querySelector("img");
	var context = canvas.getContext('2d')
	//ws = new WebSocket('wss://localhost:443/nmcat/alarm.mn');
	var url = 'wss://localhost:443/nmcat/alarm.mn';
	var socket = new WebSocket(url);
	
	socket.onopen = onOpen;
	function onOpen(evt) {
		
	}
	var constraints = {
			video : true,
			audio : false
	};
	
	navigator.mediaDevices.getUserMedia(constraints)
			.then(function(stream){
				video.srcObject = stream;
				video.play();
			})
			.catch(function(err){
				
			});
	
	//setInterval(main,1000);
	
	function main() {
		drawCanvas();
		readCanvas();
	}
	
	function drawCanvas(){
		context.drawImage(video,0,0,canvas.width, canvas.height);
	}
	console.log(canvas.toDataURL('image/jpeg',1));
	
	function readCanvas(){
		var canvasData = canvas.toDataURL('image/jpeg',1) //1 is highest quality
		//data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCACWASwDAREAAhEBAxEB/8QAFQABAQAAAAAAAAAAAAAAAAAAAAv/xAAUEAEAAAAAAAAAAAAAAAAAAAAA/8QAFAEBAAAAAAAAAAAAAAAAAAAAAP/EABQRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/AJ/4AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAP/Z
		var decodeAstring = atob(canvasData.split(',')[1]); //쉽표 뒤쪽에 있는 것은 버리겠다는..[1]
		
		var charArray = [];
		for(var i = 0; i<decodeAstring.length;i++){
			charArray.push(decodeAstring.charCodeAt(i));
		}
		socket.binaryData = "blob";
		//socket.send(charArray);
		socket.send(new Blob([new Uint8Array(charArray)], {
			type : "image/jpeg"
		}))
		
		socket.onmessage = function(evt){
			img.src = window.URL.createObjectURL(evt.data);
		}
	} //readCanvas
	
})();