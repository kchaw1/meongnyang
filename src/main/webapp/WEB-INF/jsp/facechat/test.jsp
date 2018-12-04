<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
</head>
<body>
<a href="#" class="pointcharge">웹RTC 테스트</a>
<script>
$("a.pointcharge").click(function(e){
    var left = (screen.width-1000) /2
    var top = (screen.height-600) /2
    window.open(
    	"<c:url value='/facechat/chatroom.mn'/>", "facechat", "width=1000, height=600, left="+left+", top="+top
    )
})
</script>
</body>
</html>