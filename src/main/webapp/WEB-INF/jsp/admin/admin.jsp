<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
					<a href="admin.jsp"><img
						src="https://66.media.tumblr.com/avatar_faa95867d2b3_128.png" /></a>
				</div>
				<br>
				<div class="log-out">LOG OUT</div>
				<div class="seperator"></div>
				<div class="list">
					<div id="board" class="item">게시판</div>
					<div class="board-hidden youtube">
						<a href="youtube.html">유튜브</a>
					</div>
					<div class="board-hidden crowd-fund">
						<a href="crowd-funding.html">크라우드펀딩</a>
					</div>
					<div class="board-hidden notice">
						<a href="notice.html">공지사항</a>
					</div>
					<div id="management" class="item">관리</div>
					<div class="mgm-hidden abs-member">
						<a href="mgm-ABS.html">행동전문가</a>
					</div>
					<div class="mgm-hidden gen-member">
						<a href="mgm-general.html">일반회원</a>
					</div>
					<div id="statistics" class="item">
						<a href="statistics.html" style="color: black;">통계</a>
					</div>
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
						<h2 class="timer count-title count-number" data-to="300"
							data-speed="2000"></h2>
						<p class="count-text ">방문자수</p>
					</div>

					<div class="counter col_fourth">
						<i class="fas fa-newspaper fa-2x"></i>
						<h2 class="timer count-title count-number" data-to="1700"
							data-speed="2000"></h2>
						<p class="count-text ">오늘 올라온 게시글</p>
					</div>

					<div class="counter col_fourth">
						<i class="fas fa-users fa-2x"></i>
						<h2 class="timer count-title count-number" data-to="11900"
							data-speed="2000"></h2>
						<p class="count-text ">신규 회원 수</p>
					</div>

					<div class="counter col_fourth end">
						<i class="fa fa-bug fa-2x"></i>
						<h2 class="timer count-title count-number" data-to="157"
							data-speed="2000"></h2>
						<p class="count-text ">기타</p>
					</div>
				</div>
				<!-- /카운터-->

				<!-- 탭 -->
				<hr>
				<h1>게시판</h1>


				<div class="tabs">
					<ul>
						<li><a href="#tabs-1">유튜브</a></li>
						<li><a href="#tabs-4">크라우드펀딩</a></li>
					</ul>
					<div id="tabs-1">
						<p>탭1</p>
						<iframe width="30%" height="20%"
							src="https://www.youtube.com/embed/fdsZrJIUVXo" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
						<iframe width="30%" height="20%"
							src="https://www.youtube.com/embed/fdsZrJIUVXo" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
						<iframe width="30%" height="20%"
							src="https://www.youtube.com/embed/fdsZrJIUVXo" frameborder="0"
							allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
					</div>
					<div id="tabs-4"></div>
				</div>

				<h1 style="clear: both;">사용자 관리</h1>
				<div class="tabs">
					<ul>
						<li><a href="#tabs-5">행동전문가</a></li>
						<li><a href="#tabs-6">일반회원</a></li>
					</ul>
					<div id="tabs-5">
						<p>탭5</p>
					</div>
					<div id="tabs-6">
						<p>탭6</p>
					</div>
				</div>

				<h1>통계</h1>
				<div class="tabs">
					<ul>
						<li><a href="#tabs-7">통계</a></li>
					</ul>
					<div id="tabs-7">
						<p>탭7</p>
					</div>
				</div>
				<!-- /탭 -->

				<!-- 카드형 DIV 
        <div class="column">
          <div class="portlet">
            <div class="portlet-header" style="background:#a4cca0;">유튜브</div>
            <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
          </div>

          <div class="portlet">
            <div class="portlet-header" style="background:#a4cca0;">크라우드펀딩</div>
            <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
          </div>

          <div class="portlet">
            <div class="portlet-header" style="background:#a4cca0;">관리</div>
            <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
          </div>

        </div>

        <div class="column">

          <div class="portlet">
            <div class="portlet-header" style="background:#a4cca0;">뉴스</div>
            <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
          </div>

          <div class="portlet">
            <div class="portlet-header" style="background:#a4cca0;">유기견정보</div>
            <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
          </div>

          <div class="portlet">
            <div class="portlet-header" style="background:#a4cca0;">통계</div>
            <div class="portlet-content">Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
          </div>
        </div>
        <!-- /카드형 DIV-->
			</div>
			<!-- /우측 콘텐츠 영역-->
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
  </script>
</body>
</html>