<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../common/headerfooterCSSJS.jsp" />
<c:import url="adminCommonCSSJS.jsp" />
<c:import url="adminCSSJS.jsp" />
<link rel="stylesheet" href="<c:url value="/resources/css/common/headerfooter.css"/>">
</head>
<body>

	<div id="header">
		<c:import url="../common/header.jsp" />
	</div>

	<div id="container">
		<div class="panel">
			<!-- 좌측 메뉴 -->
			<div class="aside">
				<div class="avatar">
					<a href="<c:url value='/admin/main.mn' />"><img src="https://66.media.tumblr.com/avatar_faa95867d2b3_128.png" /></a>
				</div>
				<br>
				<div class="log-out">A D M I N</div>
				<div class="seperator"></div>
				<div class="list">
					 <div id="board" class="item">게시판</div>
			         <div class="board-hidden notice"><a href="<c:url value="/admin/notice/list.mn" />">공지사항</a></div>
			         <div class="board-hidden youtube"><a href="<c:url value="/youtube/youtube.mn" />">유튜브</a></div>
			         <div class="board-hidden crowd-fund"><a href="<c:url value="/crowd/list.mn" />">크라우드펀딩</a></div>
			         <div id="management" class="item">관리</div>
			         <div class="mgm-hidden abs-member"><a href="<c:url value="/admin/abs/list.mn" />">행동전문가</a></div>
			         <div class="mgm-hidden gen-member"><a href="<c:url value="/admin/general/list.mn" />">일반회원</a></div>
			         <div id="statistics" class="item"><a href="<c:url value="/admin/statistics/day.mn" />" style="color:black;">통계</a></div>
				</div>
			</div>
			<!-- /좌측 메뉴 -->

			<!-- 우측 콘텐츠 영역-->
			<div class="view">
				<div class="sub-title">ADMIN PANEL</div>
				<div class="main-title">관리자 메인</div>
				<div class="seperator"></div>
				<!-- 카운터-->
				<div class="wrapper">
					<div class="counter col_fourth">
						<i class="fas fa-users fa-2x"></i>
						<h2 class="timer count-title count-number" data-to="${visitorCount}"
							data-speed="500"></h2>
						<p class="count-text ">방문자수</p>
					</div>

					<div class="counter col_fourth">
						<i class="fas fa-newspaper fa-2x"></i>
						<h2 class="timer count-title count-number" data-to="${boardCount}"
							data-speed="500"></h2>
						<p class="count-text ">오늘 올라온 게시글</p>
					</div>

					<div class="counter col_fourth">
						<i class="fas fa-users fa-2x"></i>
						<h2 class="timer count-title count-number" data-to="${fn:length(newMemberList)}"
							data-speed="500"></h2>
						<p class="count-text ">신규 회원 수</p>
					</div>

					<div class="counter col_fourth end">
						<i class="fa fa-coins fa-2x"></i>
						<h2 class="timer count-title count-number" data-to="${pointCount}"
							data-speed="500"></h2>
						<p class="count-text ">포인트 사용량</p>
					</div>
				</div>
				<!-- /카운터-->
				<div class="clear-fix"></div>

				<!-- panel-container -->
				<div class="panel-container">
          		  
          		  <!-- panel -->
		          <div class="panel panel-default">
		            <div class="panel-heading">
		              <h3 class="panel-title">승인 대기중인 행동전문가</h3>
		            </div>
		            <div class="panel-body">
		                <div class="info-container">
			                <div class="no">회원번호</div>
			                <div class="id">아이디</div>
			                <div class="name">이름</div>
			                <div class="sign-up-date">가입일</div>
			                <div class="button-area"></div>
		                </div>
		                <div class="clear-fix"></div>
		                <c:forEach var="abs" items="${nonAuthABSList}" >
		                	<div class="info-container">
				                <div class="no">${abs.no}</div>
				                <div class="id">${abs.id}</div>
				                <div class="name">${abs.name}</div>
				                <div class="sign-up-date"><fmt:formatDate value="${abs.signUpDate}" pattern="yyyy-MM-dd" /></div>
				                <div class="button-area"><button class="btn btn-default abs-detail"  data-id="${abs.id}" data-no="${abs.no}">상세</button></div>
			                </div>
			                <div class="clear-fix"></div>
		                </c:forEach>
		            </div>
		          </div>
		          <!-- /panel -->
		          
          		  <!-- panel -->
		          <div class="panel panel-default">
		            <div class="panel-heading">
		              <h3 class="panel-title">신규 회원</h3>
		            </div>
		            <div class="panel-body">
		            	<c:choose>
		            	<c:when test="${fn:length(newMemberList) eq 0}">
		            		신규 회원이 없습니다.
		            	</c:when>
		            		<c:otherwise>
		            			<div class="no">회원번호</div>
				                <div class="id">아이디</div>
				                <div class="name">이름</div>
				                <div class="sign-up-date">가입일</div>
				                <div class="button-area"></div>
				                 <div class="clear-fix"></div>
				                <c:forEach var="nm" items="${newMemberList}" >
				                	<div class="info-container">
						                <div class="no">${nm.no}</div>
						                <div class="id">${nm.id}</div>
						                <div class="name">${nm.name}</div>
						                <div class="sign-up-date"><fmt:formatDate value="${nm.signUpDate}" pattern="yyyy-MM-dd" /></div>
						                <div class="button-area"><button class="btn btn-default general-detail" data-id="${nm.id}" data-no="${nm.no}">상세</button></div>
					                </div>
					                <div class="clear-fix"></div>
				                </c:forEach>
				            </c:otherwise>
		                </c:choose>
		            </div>
		          </div>
		          <!-- /panel -->
		          
          		  <!-- panel -->
		          <div class="panel panel-default">
		            <div class="panel-heading">
		              <h3 class="panel-title">금주의 행동전문가</h3>
		            </div>
		            <div class="panel-body">
		                <div class="info-container">
			                <div class="no">회원번호</div>
			                <div class="name">이름</div>
			                <div class="sign-up-date">가입일</div>
			                <div class="button-area">버튼</div>
		                </div>
		            </div>
		          </div>
		          <!-- /panel -->
		          
          		  <!-- panel -->
		          <div class="panel panel-default">
		            <div class="panel-heading">
		              <h3 class="panel-title">금주의 회원</h3>
		            </div>
		            <div class="panel-body">
		                <div class="info-container">
			                <div class="no">회원번호</div>
			                <div class="name">이름</div>
			                <div class="sign-up-date">가입일</div>
			                <div class="button-area">버튼</div>
		                </div>
		            </div>
		          </div>
		          <!-- /panel -->
		          
        		</div>
				<!-- /panel-container -->
			</div>
			<!-- /view 우측 콘텐츠 영역 -->
		</div>
		<div class="clear-fix"></div>
	</div>
	<div id="footer">
		<c:import url="../common/footer.jsp" />
	</div>

<script>
  //좌측 메뉴 스크립트
 $("#board").hover(function () {
   $(this).addClass("selected");
 })

 $("#board").click(function () {
   $(".board-hidden").slideToggle(500);
 })

 $("#management").hover(function () {
   $(this).addClass("selected");
 })

 $("#management").click(function () {
   $(".mgm-hidden").slideToggle(500);
 })

 $("#statistics").hover(function () {
   $(this).addClass("selected");
 })

 $(".item").mouseleave(function () {
   $(this).removeClass("selected");
 })
 
	$(document).on("click", ".abs-detail", function() {
	    var windowW = 1200;  // 창의 가로 길이
        var windowH = 700;  // 창의 세로 길이
        var left = Math.ceil((window.screen.width - windowW)/2);
        var top = Math.ceil((window.screen.height - windowH)/2);
		
		 window.open("<c:url value='/admin/abs/detail.mn?no="+$(this).data("no")+ "&id=" + $(this).data("id") + "' />" , "Detail", "top="+top+", left="+left+", height="+windowH+", width="+windowW);
	});
  
	 $(document).on("click", ".general-detail", function() {
	    var windowW = 1200;  // 창의 가로 길이
	    var windowH = 700;  // 창의 세로 길이
	    var left = Math.ceil((window.screen.width - windowW)/2);
	    var top = Math.ceil((window.screen.height - windowH)/2);
		
		 window.open("<c:url value='/admin/general/detail.mn?no="+$(this).data("no")+ "&id=" + $(this).data("id") + "' />", "Detail", "top="+top+", left="+left+", height="+windowH+", width="+windowW);
	});
  </script>
</body>
</html>