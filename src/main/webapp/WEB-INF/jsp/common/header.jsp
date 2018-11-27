ㅠㅊㅎㅍ   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<header class="dogcat">
  <div class="logo"><span class="logo-title"><a href="">멍하고노냥</a></span></div>
  <div class="animate"><img src="<c:url value='/resources/img/common/teddy_food_dribbble.gif'/>" /></div>
  <nav>
    <ul class="nav navbar-nav">
      <li><a href="<c:url value='/resources/img/common/teddy_food_dribbble.gif'/>">반려인 커뮤니티</a></li>
      <li><a href="<c:url value='/abs/absList.mn'/>">행동전문가</a></li>
      <li><a href="<c:url value='/admin/abs/list.mn'/>">관리자</a></li>
      <li><a href="">포인트 충전</a></li>
      <li class="dropdown">  
        <a href="#" id="user" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
        <i class="fas fa-user-circle fa-2x"></i>
        </a>
        <ul class="dropdown-menu pull-right" role="menu" id="drop">
        <%-- <c:choose>
        </c:choose> --%>
        <c:if test="${empty user.id}">
          <li><a href="<c:url value='/member/login.mn'/>">로그인</a></li>        
        </c:if>
          <li><a href="<c:url value='/login/login.mn'/>">내 정보</a></li>
		  <li><a href="<c:url value='/diary/writeform.mn'/>">마이펫 다이어리</a></li>
		  <li><a href="#">쪽지함</a></li>
		  <li><a href="#">내 등급</a></li>
		  <li><a href="#">내 활동</a></li>
		  <li><a href="#">쪽지함</a></li>
		  <li><a href="#">포인트 충전</a></li>
		  <li class="divider"></li>
		  <li><a href="<c:url value='/member/logout.mn'/>" id="logout" >로그아웃</a></li>
        </ul>
      </li>
     </ul>
   </nav>
  <div class="clear-fix"></div>
</header>

<script>
	var ws = null;
	$(function() {
		ws = new WebSocket('wss://localhost:443/nmcat/alarm.mn');
		ws.onopen = function() {
			console.log("헤더 웹소켓 서버 접속 성공");
		}
		
		ws.onmessage = function(evt){
			alert(evt.data)
		}
		
	}) //function
	$("a#logout").click(function() {
		alert("로그아웃 되었습니다.")
		location.href = "<c:url value='/member/logout.mn'/>";
		});
</script>