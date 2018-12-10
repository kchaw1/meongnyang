<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="absDetailCSSJS.jsp" />
<c:import url="../adminCommonCSSJS.jsp" />
</head>
<body>
				<!-- /좌측 메뉴 -->

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
										<td>${abs.name}</td>
									</tr>
									<tr>
										<td>전문분야</td>
										<td>
										<c:if test="${abs.category=='dog'}">강아지</c:if>
										<c:if test="${abs.category=='cat'}">고양이</c:if>
										<c:if test="${abs.category=='all'}">모두</c:if>
										</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>${abs.email}</td>
									</tr>
									<tr>
										<td>성별</td>
										<td>없어짐</td>
									</tr>
								</table>
							</div>
						</div>
						<div id="img-area">
							<img src="<c:url value='/common/download.mn?sysName=${abs.imageName}&path=${abs.imagePath}&oriName=${abs.imageOriName}'/>" />
						</div>
						<div id="attach-area">
							<h1>첨부파일</h1>
							<!-- <div><span style="margin-right:20px;">animal.jpg</span><button class="btn btn-default">다운</button></div> -->
							<table>
								<c:forEach var="l" items="${licenseList}">
									<tr>
										<td>${l.lifOriName}</td>
										<td><button type="button" class="btn btn-default btn-xs downBtn" data-sysname="${l.lifSysName}" data-path="${l.lifPath}" data-oriname="${l.lifOriName}">다운</button></td>
									</tr>
								</c:forEach>
							</table>
						</div>

						<!-- <hr style="clear:both; border-color: orange;"> -->

						<div id="career-area">
							<h1>경력사항</h1>
							 <table style="text-align: center; font-size:20px;">
							 <tbody>
								 <c:forEach var="c" items="${careerList}">
								 	<tr>
									 	<td>${c.careerStart} ~ ${c.careerEnd}</td>
									 	<td>${c.careerContent}</td>
								 	</tr>	
								 </c:forEach>	
                        	</tbody>
                      </table> 

<!-- 							<div> -->
<!-- 								<span>1.</span><span>세상에 나쁜개는 없다 출연</span> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<span>2.</span><span>강형욱 동물행동 교정소 대장</span> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<span>3.</span><span>비트캠프 수료</span> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<span>4.</span><span>마이 리틀 텔레비전 출연</span> -->
<!-- 							</div> -->
						</div>
						<div id="vertical-sep"></div>
						<!-- <hr style="clear: both; border-color: orange;"> -->
						<div id="introduce-area">
							<h1>소개글</h1>
							<div>${abs.greetings}</div>
						</div>

						<div id="button-area">
							<!-- 승인대기중일경우에만 표시 -->
							<c:if test="${abs.authState eq 'n'}">
								<button class="btn btn-default btn-lg" id="approve">승인</button>
							</c:if>
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
									<div class="reg-date-area">등록일</div>
									<div class="view-cnt-area">조회수</div>
									<div class="rec-cnt-area">추천수</div>
									<div class="category-area">카테고리</div>
									
								</div>
								<div class="clear-fix"></div>
								<c:forEach var="post" items="${myPosts}">
								<div class="posts-content">
									<div class="no-area">${post.comNo}</div>
									<div class="title-area">
										${post.comTitle}
									</div>
									<div class="reg-date-area"><fmt:formatDate value="${post.comRegDate}" pattern="yyyy-MM-dd hh:mm:ss" /></div>
									<div class="view-cnt-area">${post.comViewCnt}</div>
									<div class="rec-cnt-area">${post.comRecCnt}</div>
									<div class="category-area">${post.comCategory}</div>
									<div class="btn-area"><button class="btn btn-default btn-xs" onclick="window.location='<c:url value='/community/detailPage.mn?comNo=${post.comNo}'/>'">이동</button></div>
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

		<!-- /우측 콘텐츠 영역-->
		
	<div class="clear-fix"></div>
	

	<!-- 푸터 -->
	
	
	<script>
	$("#approve").click(function() {
		$.ajax({
			url: "approve.mn",
			type: "POST",
			data: "no=" + ${abs.no}
		}).done(function (result) {
			alert("승인되었습니다.");
			window.opener.location.reload();
		});
	});
	

	$(document).on("click", ".downBtn", function() {
// 		console.log($(this).data("sysname"))
// 		console.log($(this).data("oriname"))
// 		console.log($(this).data("path"))
		
		location.href = "<c:url value='/common/download.mn?sysName="+ $(this).data("sysname") +"&path=" + $(this).data("path") + "&oriName=" + $(this).data("oriname") + "'/>"
	})
	</script>
</body>
</html>