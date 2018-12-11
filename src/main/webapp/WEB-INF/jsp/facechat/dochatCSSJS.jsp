<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <!-- 영상회의 -->
	<script src="https://cdn.webrtc-experiment.com/getMediaElement.min.js"> </script>
    <script src="https://cdn.webrtc-experiment.com/socket.io.js"> </script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="https://cdn.webrtc-experiment.com/IceServersHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/CodecsHandler.js"></script>
    <script src="https://cdn.webrtc-experiment.com/video-conferencing/RTCPeerConnection-v1.5.js"> </script>
    <script src="https://cdn.webrtc-experiment.com/video-conferencing/conference.js"> </script>
    <!-- <script src="./js/conference.js"> </script> -->
<!-- sweetalert -->
<script src="<c:url value="/resources/js/common/sweetalert2.all.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/sweetalert2.min.css"/>">

<!-- 보통 CSS  --> 
<link rel="stylesheet" href="<c:url value="/resources/css/facechat/facechat.css"/>">

<!-- 대기중 ... -->
<script src="<c:url value="/resources/js/common/modernizr.custom.js"/>"></script>
<script src="<c:url value="/resources/js/common/classie.js"/>"></script>
<script src="<c:url value="/resources/js/common/notificationFx.js"/>"></script>