<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="generalListCSSJS.jsp" />
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
						<a href="<c:url value="/admin/abs/list.mn" />">행동전문가</a>
					</div>
					<div class="mgm-hidden gen-member">
						<a href="<c:url value="/admin/general/list.mn" />">일반회원</a>
					</div>
					<div id="statistics" class="item">
						<a href="statistics.html" style="color: black;">통계</a>
					</div>
				</div>
			</div>
			<!-- /좌측 메뉴 -->

			<!-- 우측 콘텐츠 영역-->
			<div class="view">
				<div class="sub-title">Management > General Membership</div>
				<div class="main-title">일반 회원</div>
				<div class="seperator"></div>

				<!-- 탭 -->
				<div class="tabs">
					<ul>
						<li><a href="#tabs-1">일반 회원</a></li>
					</ul>
					<div id="tabs-1">
						<h2>목록</h2>
						<div class="search-area">
							<div class="select-area">
								<select id="y-searchType" class="form-control">
									<option value="0">선택</option>
									<option value="1">아이디</option>
									<option value="2">이름</option>
									<option value="3">가입일</option>
									<option value="5">활동점수</option>
									<option value="6">포인트</option>
								</select>
							</div>
							<div class="search">
								<input type="text" id="y-keyword" name="name"
									class="form-control" placeholder="검색어를 입력하세요">
							</div>
							&nbsp;
							<div class="btn-area">
								<button type="button" id="searchYBtn" class="btn btn-default">검색</button>
							</div>
						</div>
						<br>
						<div class="clear-fix"></div>
						<div class="header-area">
							<div class="no-area">회원번호 <a href="#"><i class="fas fa-sort no" data-sort="1" data-flag="1" data-search="n"></i></a></div>
			                <div class="id-area">아이디 <a href="#"><i class="fas fa-sort id" data-sort="2" data-flag="1" data-search="n"></i></a></div>
			                <div class="name-area">이름 <a href="#"><i class="fas fa-sort name" data-sort="3"  data-flag="1" data-search="n"></i></a></div>
			                <div class="sign-area">가입일 <a href="#"><i class="fas fa-sort sign_up_date" data-sort="4"  data-flag="1" data-search="n"></i></a></div>
			                <div class="active-area">활동점수 <a href="#"><i class="fas fa-sort score" data-sort="6" data-flag="1" data-search="n"></i></a></div>
			                <div class="point-area">포인트 <a href="#"><i class="fas fa-sort point" data-sort="7" data-flag="1" data-search="n"></i></a></div>
			                <div class="grade-area">등급 <a href="#"><i class="fas fa-sort grade" data-sort="8" data-flag="1" data-search="n"></i></a></div>
							<div class="clear-fix">
							<hr>
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
	
<script>
	// 상세 버튼 클릭
	$(document).on("click", ".move-detail", function() {
	    var windowW = 1000;  // 창의 가로 길이
	    var windowH = 700;  // 창의 세로 길이
	    var left = Math.ceil((window.screen.width - windowW)/2);
	    var top = Math.ceil((window.screen.height - windowH)/2);
		
		 window.open("detail.mn?no="+$(this).data("no")+ "&id=" + $(this).data("id"), "Detail", "top="+top+", left="+left+", height="+windowH+", width="+windowW);
	});
	
	// 삭제 버튼 클릭
	$(document).on("click", ".delete", function() {
		if (confirm($(this).data("id") + "회원을 탈퇴처리 하시겠습니까?") == true){    //확인
			location.href = "delete.mn?no=" + $(this).data("no");
		}else{   //취소
		    return;
		}
		//ajaxDeleteMember($(this).data("no"));
	});
</script>
</body>
</html>