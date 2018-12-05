<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<div id="setup-room">
  	  <input type="text" id="conference-name">
      <button id="setup-new-room" class="setup">new</button>
      <!-- list of all available conferencing rooms -->
      <table id="rooms-list"></table>
  </div>

<table id="videos-container"></table>
<!-- 영상회의 -->
	<script src="https://cdn.webrtc-experiment.com/getMediaElement.min.js"> </script>
    <script src="https://cdn.webrtc-experiment.com/socket.io.js"> </script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="https://cdn.webrtc-experiment.com/IceServersHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/CodecsHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/video-conferencing/RTCPeerConnection-v1.5.js"> </script>
    <script src="https://cdn.webrtc-experiment.com/video-conferencing/conference.js"> </script>
    <script src="video.js"></script>
</body>
</html>