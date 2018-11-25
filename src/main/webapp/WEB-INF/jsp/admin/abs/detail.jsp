<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="absDetailCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>

	<div id="container">
			<!-- 좌측 메뉴 -->
		<div class="panel">
			<div class="aside">
				<div class="avatar">
					<a href="admin1.html"><img
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
						<a href="<c:url value="/admin/abs/detail.mn" />">행동전문가</a>
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
				<div class="sub-title">Management > ABS</div>
				<div class="main-title">행동전문가</div>
				<div class="seperator"></div>

				<div class="tabs">
					<ul>
						<li><a href="#tabs-1">정보</a></li>
						<li><a href="#tabs-2">작성한 게시글</a></li>
						<li><a href="#tabs-3">작성한 댓글</a></li>
					</ul>

					<div id="tabs-1">
						<div id="info-area">
							<h1>개인정보</h1>
							<div>
								<!-- <div style="font-size: 20px;">이름 : 강형욱</div>
                      <div style="font-size: 20px;">나이 : 45</div>
                      <div style="font-size: 20px;">이메일 : kang@naver.com</div>
                      <div style="font-size: 20px;">성별 : 남</div> -->
								<table>
									<tr>
										<td>이름</td>
										<td>강형욱</td>
									</tr>
									<tr>
										<td>나이</td>
										<td>45</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>kang@naver.com</td>
									</tr>
									<tr>
										<td>성별</td>
										<td>남</td>
									</tr>
								</table>
							</div>
						</div>
						<div id="img-area">
							<img
								src="https://post-phinf.pstatic.net/MjAxNzEyMjhfMjc1/MDAxNTE0NDQwMDQ3MDQz.jAzATJmNbLbERcMt6hm01vOwJZTulYER_z63d6m4fM8g.QjKmA8EPdjkJy_QXpCx4vOjQOTSyG3vbtJZmwJX6wMMg.JPEG/%EC%84%A4%EC%B1%84%ED%98%84.JPG?type=w1200" />
						</div>
						<div id="attach-area">
							<h1>첨부파일</h1>
							<!-- <div><span style="margin-right:20px;">animal.jpg</span><button class="btn btn-default">다운</button></div> -->
							<table>
								<tr>
									<td>animal.jpg</td>
									<td><button class="btn btn-default btn-xs">다운</button></td>
								</tr>

							</table>
						</div>

						<!-- <hr style="clear:both; border-color: orange;"> -->

						<div id="career-area">
							<h1>경력사항</h1>
							<!-- <table style="text-align: left; font-size:20px;">
                        <tr>
                          <td style="padding:5px;">1</td>
                          <td style="padding:5px;">세상에 나쁜개는 없다 출연</td>
                        </tr>
                        <tr>
                          <td style="padding:5px;">2</td>
                          <td style="padding:5px;">강형욱 동물행동 교정소 대장</td>
                        </tr>
                        <tr>
                          <td style="padding:5px;">3</td>
                          <td style="padding:5px;">비트캠프 수료</td>
                        </tr>
                        <tr>
                          <td style="padding:5px;">4</td>
                          <td style="padding:5px;">마이 리틀 텔레비전 출연</td>
                        </tr>
                      </table> -->

							<div>
								<span>1.</span><span>세상에 나쁜개는 없다 출연</span>
							</div>
							<div>
								<span>2.</span><span>강형욱 동물행동 교정소 대장</span>
							</div>
							<div>
								<span>3.</span><span>비트캠프 수료</span>
							</div>
							<div>
								<span>4.</span><span>마이 리틀 텔레비전 출연</span>
							</div>
						</div>
						<div id="vertical-sep"></div>
						<!-- <hr style="clear: both; border-color: orange;"> -->
						<div id="introduce-area">
							<h1>소개글</h1>
							<div>안녕하세요 강형욱입니다.</div>
						</div>

						<div id="button-area">
							<!-- 승인대기중일경우에만 표시 -->
							<button class="btn btn-default btn-lg">승인</button>
							<button class="btn btn-default btn-lg">취소</button>
						</div>

					</div>
					<div id="tabs-2">

						<div id="posts-area">
							<h1>작성한 게시글 목록</h1>
							<div>
								<!-- <div>작성한 게시글이 없습니다.</div> -->
								<div id="posts-header">
									<div class="no-area">글번호</div>
									<div class="title-area">제목</div>
								</div>
								<div class="posts-content">
									<div class="no-area">1</div>
									<div class="title-area">
										<a href="#">안녕하세요</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="tabs-3">
						<div id="comment-area">
							<h1>작성한 댓글 목록</h1>
							<div>
								<div id="comment-header">
									<div class="no-area">댓글번호</div>
									<div class="title-area">제목</div>
								</div>
								<div class="comment-content">
									<div class="no-area">1</div>
									<div class="title-area">
										<a href="#">안녕하세요</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		<!-- /우측 콘텐츠 영역-->
		</div>
	</div>
	<div class="clear-fix"></div>


	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
</body>
</html>