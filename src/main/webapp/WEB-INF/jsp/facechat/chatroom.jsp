<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/facechat/facechat.css"/>">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
</head>
<body>
<div id="content">
  <div class="wrap">
    <section id="share-wrap">
      <a href="#" id="unique-token">Share this room link</a>
    </section>

    <section id="enter-wrap">
      <div id="create-wrap">
        <p>영상회의를 시작하시겠습니까?</p>
        <button id="btn-start">Start</button>
      </div>
      <div id="wait-wrap"></div>
    </section>

    <section id="video-wrap">
      <div class="buttons">
        <button id="btn-camera">Camera Pause</button>
        <button id="btn-mic">Mic Mute</button>
      </div>
    </section>
  </div>
</div>
</body>
<c:import url="./mainJS.jsp"/>
<c:import url="./mediaHandlerJS.jsp"/>
<c:import url="./peerHandlerJS.jsp"/>
</html>