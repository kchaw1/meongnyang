<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<!--user 아이콘-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
<!-- 배민폰트 -->
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="<c:url value="/resources/css/common/bootstrap.min.css"/>">
<script src="<c:url value="/resources/js/common/bootstrap.min.js"/>"></script>
<!--ajax jquery -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->

<link rel="stylesheet" href="<c:url value="/resources/css/common/headerfooter.css"/>">

<script src="<c:url value="/resources/js/common/notify.min.js"/>"></script>

<!-- 파비곤 -->
<link rel="shortcut icon" href="<c:url value="/resources/img/common/meongvicon.png" />" type="image/x-icon">
<link rel="icon" href="<c:url value="/resources/img/common/meongvicon.png" />" type="image/x-icon">

<script>
$(function() {
  $('.dropdown-toggle').dropdown()	
});
</script>