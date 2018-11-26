<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="absListCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>
	
	<div id="container">
    <div class="panel">
      <!-- 좌측 메뉴 -->
      <div class="aside">
        <div class="avatar"><a href="admin1.html"><img src="https://66.media.tumblr.com/avatar_faa95867d2b3_128.png" /></a></div>
        <br>
        <div class="log-out">LOG OUT</div>
        <div class="seperator"></div>
        <div class="list">
          <div id="board" class="item">게시판</div>
          <div class="board-hidden youtube"><a href="youtube.html">유튜브</a></div>
          <div class="board-hidden crowd-fund"><a href="crowd-funding.html">크라우드펀딩</a></div>
          <div class="board-hidden notice"><a href="notice.html">공지사항</a></div>
          <div id="management" class="item">관리</div>
          <div class="mgm-hidden abs-member"><a href="mgm-ABS.html">행동전문가</a></div>
          <div class="mgm-hidden gen-member"><a href="mgm-general.html">일반회원</a></div>
          <div id="statistics" class="item"><a href="statistics.html" style="color:black;">통계</a></div>
        </div>

      </div>
      <!-- /좌측 메뉴 -->

      <!-- 우측 콘텐츠 영역-->
      <div class="view">
        <div class="sub-title">Management > ABS</div>
        <div class="main-title">행동전문가</div>
        <div class="seperator"></div>
        <div class="tabs">
          <ul>
            <li><a href="#tabs-1">행동전문가</a></li>
            <li><a href="#tabs-4">승인대기중</a></li>
          </ul>
          <div id="tabs-1">
            <h2>목록</h2>
            <div id="search-area">
                <form action="" method="POST" id="searchForm" class="navbar-form navbar" role="search">
                <div id="search">
                  <div class="form-group">
                     <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search">
                  </div>
                  <button type="submit" id="searchBtn" class="btn btn-default">검색</button>
                </div>
              </form>
            </div>
            <div class="clear-fix"></div>
            <div class="header-area">
              <div class="no-area">회원번호 <a href="#"><i class="fas fa-sort"></i></a></div>
              <div class="name-area">이름 <a href="#"><i class="fas fa-sort"></i></a></div>
              <div class="sign-area">가입일 <a href="#"><i class="fas fa-sort"></i></a></div>
              <div class="recent-area">최근접속일 <a href="#"><i class="fas fa-sort"></i></a></div>
              <div class="active-area">활동점수 <a href="#"><i class="fas fa-sort"></i></a></div>
              <div class="point-area">포인트 <a href="#"><i class="fas fa-sort"></i></a></div>
            </div>
            <div class="clear-fix"><hr></div>
             <c:forEach var="abs" items="${list}">
            <div class="clear-fix">
              <div class="content-area">
                <div class="no-area">${abs.no}</div>
                <div class="name-area">${abs.name}</div>
                <div class="sign-area"><fmt:formatDate value="${abs.signUpDate}" pattern="yy-MM-dd hh:mm:ss" /></div>
                <div class="recent-area">2018-11-20 06:30</div>
                <div class="active-area">${abs.score}</div>
                <div class="point-area">${abs.point}</div>

                <button class="btn btn-default btn-sm" onclick="window.location='mgm-abs-detail.html'">상세</button>
                <button class="btn btn-default btn-sm">탈퇴</button>
              </div>
            </div>
              </c:forEach>
          </div>
          <div id="tabs-4">
            <div>
              <h2>승인대기중</h2>
              <div id="search-area">
                  <form action="" method="POST" id="searchForm" class="navbar-form navbar" role="search">
                  <div id="search">
                    <div class="form-group">
                       <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" id="searchBtn" class="btn btn-default">검색</button>
                  </div>
                </form>
              </div>
              <div class="clear-fix"></div>
              <div class="header-area">
                  <div class="no-area">회원번호 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="name-area">이름 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="sign-area">가입일 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="recent-area">최근접속일 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="active-area">활동점수 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="point-area">포인트 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="clear-fix"><hr></div>
                  <div class="clear-fix">
                    <div class="no-area">1</div>
                    <div class="name-area">김세영</div>
                    <div class="sign-area">2018-11-20</div>
                    <div class="recent-area">2018-11-20 06:30</div>
                    <div class="active-area">258</div>
                    <div class="point-area">1000</div>

                    <button class="btn btn-default btn-sm" onclick="window.location='mgm-abs-detail.html'">상세</button>
                    <button class="btn btn-default btn-sm">탈퇴</button>
                  </div>
                </div>
            </div>
          </div>
          <!-- /우측 콘텐츠 영역-->
        </div>
        <div class="clear-fix"></div>
        </div>
        </div>
        </div>
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
</body>
</html>