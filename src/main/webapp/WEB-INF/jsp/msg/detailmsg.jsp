<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">
</head>
<body>
<div id="dialog-form" title="Create new user">
			<form action="<c:url value="/msg/msgwrite.mn"/>" method="post">
				<fieldset>
					<div class="contents">
						<div class="memopop">
							<div id=sendId>${user.id}</div>
        					<input type="hidden" name="sendId" value="${user.id}" />
							<span>받는사람 : </span> <p>${msg.recvId}</p>
						</div>
						<hr>
						<span>제목 : </span> <p>${msg.msgTitle}</p>
						<hr>
						<div class="content">
							<p>${msg.msgContent}</p>
						</div>
						<!-- <div class="check">
							<input id="check" type="checkbox" name="check" value="1" />
							<span id="check1">보낸 쪽지함에 저장<span id="check2">(보낸쪽지함에 저장하면수신 확인이 가능합니다.) </span></span>
						</div> -->
					</div>
				</fieldset>
			</form>
		</div> 
</body>
</html>