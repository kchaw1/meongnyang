<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp" />
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="generalDetailCSSJS.jsp" />
</head>
<body>

			<!-- 우측 콘텐츠 영역-->
			<div class="view">
				<div class="seperator"></div>

				<div class="tabs">
					<ul>
						<li><a href="#tabs-1">정보</a></li>
						<li><a href="#tabs-2">작성한 게시글</a></li>
						<li><a href="#tabs-3">작성한 댓글</a></li>
					</ul>

					<div id="tabs-1">
						<div id="img-area">
							<img src="<c:url value='/common/download.mn?sysName=${general.imageName}&path=${general.imagePath}'/>" />
						</div>
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
										<td>${general.name}</td>
									</tr>
									<tr>
										<td>나이</td>
										<td>없어졌다</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${general.email}</td>
									</tr>
									<tr>
										<td>성별</td>
										<td>없어짐</td>
									</tr>
								</table>
							</div>
						</div>

						<div id="active-area">
							<h1>활동내역</h1>
							<table>
								<tr>
									<td>등급:</td>
									<td><img src="/img/challenger.png"
										style="width: 40px; height: 40px;" />${general.codeName}</td>
								</tr>
								<tr>
									<td>포인트:</td>
									<td>${general.point} 포인트
										<button id="pay" class="btn btn-default btn-xs" data-id="${general.id}" data-no='${general.no}' style="font-size: 14px;">포인트 지급</button>
									</td>
								</tr>
								<tr>
									<td>활동점수:</td>
									<td>${general.score} 점</td>
								</tr>
								<tr>
									<td>가입일:</td>
									<td><fmt:formatDate value='${general.signUpDate}' pattern="yyyy-MM-dd" /></td>
								</tr>
							</table>
						</div>
						<div class="clear-fix"></div>
					</div>
					<div id="tabs-2">

						<div id="posts-area">
							<h1>작성한 게시글 목록</h1>
							<div>
								<!-- <div>작성한 게시글이 없습니다.</div> -->
								<div id="posts-header">
									<div class="no-area">글번호</div>
									<div class="title-area">제목</div>
									<div class="reg-date-area">등록일</div>
									<div class="view-cnt-area">조회수</div>
									<div class="rec-cnt-area">추천수</div>
									<div class="category-area">카테고리</div>
								</div>
								<c:forEach var="post" items="${myPosts}">
								<div class="posts-content">
									<div class="no-area">1</div>
									<div class="title-area">
										제목
									</div>
									<div class="reg-date-area"><fmt:formatDate value="${post.comRegDate}" pattern="yyyy-MM-dd hh:mm:ss" /></div>
									<div class="view-cnt-area">${post.comViewCnt}</div>
									<div class="rec-cnt-area">${post.comRecCnt}</div>
									<div class="category-area">${post.comCategory}</div>
									<div class="btn-area">
										<button class="btn btn-default btn-xs" onclick="window.location='<c:url value='/community/detailPage.mn?comNo=${post.comNo}'/>'">이동</button>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div id="tabs-3">
						<div id="comment-area">
							<h1>작성한 댓글 목록</h1>
							<div>
								<div id="comment-header">
									<div class="no-area">댓글번호</div>
									<div class="cmt-content-area">댓글내용</div>
									<div class="reg-date-area">등록일</div>
									<div class="no-area">게시글 번호</div>
								</div>
								<c:forEach var="cmt" items="${myComments}">
									<div class="comment-content">
										<div class="no-area">${cmt.comcNo}</div>
										<div class="cmt-content-area">${cmt.comcContent}</div>
										<div class="reg-date-area"><fmt:formatDate value="${cmt.comcRegDate}" pattern="yyyy-MM-dd hh:mm:ss" /></div>
										<div class="no-area">${cmt.comNo}</div>
										<div class="btn-area"><button class="btn btn-default btn-xs" onclick="window.location='<c:url value='/community/detailPage.mn?comNo=${cmt.comNo}'/>'">이동</button></div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
	
	<div class="clear-fix"></div>

	<script>
	 $(document).on("click", "#pay", function() {
		    var windowW = 600;  // 창의 가로 길이
		    var windowH = 300;  // 창의 세로 길이
		    var left = Math.ceil((window.screen.width - windowW)/2);
		    var top = Math.ceil((window.screen.height - windowH)/2);
			
			 window.open("pay.mn?no="+$(this).data("no")+"&id="+$(this).data("id") , "포인트 지급", "top="+top+", left="+left+", height="+windowH+", width="+windowW);
		});
	</script>
</body>
</html>