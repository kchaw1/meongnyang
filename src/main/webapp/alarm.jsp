<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="headerfooterCSSJS.jsp"/>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<style>
div.test {
margin-top : 200px;
font-size : 30px;
}
</style>

</head>

<body>
<c:import url="header.jsp"/>
<div class="test">
	<a href="#1" class="plusfriend">친구 추가</a><br>
	<a href="#1" class="sendmessage">쪽지 보내기</a>
</div>

<script>
	var ws = null;
	$(function() {
		ws = new WebSocket('ws://localhost:8000/nmcat/alarm.mn');
		ws.onopen = function() {
			console.log("웹소켓 서버 접속 성공");
		}
		
		ws.onmessage = function(evt){
			alert(evt.data)
		}
		
	})
	$(".plusfriend").click(function(){
		ws.send("friend:");
	})
	$(".sendmessage").click(function(){
		ws.send("message:");
	})
	
</script>
</body>
</html>