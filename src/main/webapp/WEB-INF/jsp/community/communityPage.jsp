<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<c:url value="/resources/css/community/communityMain.css"/>">


<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- 배민폰트 -->
<link href="https://fonts.googleapis.com/css?family=Jua"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon"
	rel="stylesheet">


<!-- 배민폰트 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css"
	integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="headerfooter.css">

<!-- 부트스트랩 -->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
	<!-- header -->
	<header class="dogcat">
	<div class="logo">
		<span class="logo-title"><a href="">멍하고노냥</a></span>
	</div>
	<div class="animate">
		<img src="teddy_food_dribbble.gif" />
	</div>
	<nav>
	<ul class="nav navbar-nav">
		<li><a href="">반려인 커뮤니티</a></li>
		<li><a href="">행동전문가와 상담</a></li>
		<li><a href="">Locations</a></li>
		<li class="dropdown"><a href="#" id="user"
			class="dropdown-toggle" data-toggle="dropdown" role="button"
			aria-expanded="false"> <i class="fas fa-user-circle fa-2x"></i>
		</a>
			<ul class="dropdown-menu pull-right" role="menu" id="drop">
				<li><a href="#">내 정보</a></li>
				<li><a href="#">마이펫 다이어리</a></li>
				<li class="divider"></li>
				<li><a href="#">로그아웃</a></li>
			</ul></li>
	</ul>
	</nav>
	<div class="clear-fix"></div>

	</header>
	<div class="body">
		<div class="body2">
			<div class="left">
				<!-- 여기서부터 컨텐츠 시작 -->
<c:forEach var = "b" items="${list}">
				<div class="mainContents contentsBox">
					<div class="contentsContainer">
						<div class="maincontentProfile marginContainer">
							<i class="fas fa-user-circle"><span class="writer">
									${b.comWriter}</span><span class="regDate"> · <fmt:formatDate value = "${b.comRegDate}" pattern="yyyy-MM-dd"/></span></i><span
								class="category">${b.comCategory}</span>
						</div>
						<br>
						<div class="marginContainer">
							<p class="title">${b.comTitle}</p>

						</div>
						<div class="marginContainer">
							<p class="content">${b.comContent}</p>
						</div>
					</div>
					<div class="buttonContainer">
						<span class="formargin"></span> <span><i
							class="fas fa-comment-dots formargin"> 2 Comments</i></span> <span><i
							class="far fa-eye formargin" style="font-weight: 900"> ${b.comViewCnt} View</i></span>
						<span><i class="fas fa-wrench formargin"> Edit</i></span> <span><i
							class="fas fa-trash-alt formargin"> Delete</i></span>
					</div>
				</div>
</c:forEach>


				<!-- 갤러리 연습용 -->
				<div class="mainContents contentsBox">
					<div class="contentsContainer">
						<div class="maincontentProfile marginContainer">
							<i class="fas fa-user-circle"><span class="writer">
									아란누나</span><span class="regDate"> · 2018-11-17</span> </i><span
								class="category">꿀팁</span>
						</div>
						<br>
						<div class="marginContainer">
							<p class="title">이 고양이가 사는법.jpg</p>

						</div>
						<div class="marginContainer">
							<p class="content"></p>
							<p class="inputImg"></p>
						</div>
					</div>
					<div class="buttonContainer">
						<span class="formargin"></span> <span><i
							class="fas fa-comment-dots formargin"> 2 Comments</i></span> <span><i
							class="far fa-eye formargin" style="font-weight: 900"> 1 View</i></span>
						<span><i class="fas fa-wrench formargin"> Edit</i></span> <span><i
							class="fas fa-trash-alt formargin"> Delete</i></span>
					</div>
				</div>


			</div>
			<!--END LEFT-->
			<div class="right">
				<div class="main-column2">
					<div>
						<div class="imgsize2"></div>
						<div class="linemargin">
							<div>
								<span class="writeContainer1">커뮤니티</span>
							</div>
						</div>

						<p class="writeContainer" style="font-family: 'Jua'">여러분들의 일상을
							공유해보세요!</p>
						<button class="writeBtn">
						<a href="<c:url value="/community/writeForm.mn"/>">글 작성하기</a>
						</button>
					</div>
					<div class="main-column5">

						<div class="row">
							<div id="shearchsize" class="col-lg-10">
								<div class="input-group">
									<span class="input-group-btn">
										<button class="btn btn-default" type="button">Go</button>
									</span> <input type="text" class="form-control"
										placeholder="Search for...">
								</div>
								<!-- /input-group -->
							</div>
							<!-- /.col-lg-6 -->
							<select id="searchsel" class="form-control searchselect">
								<option value="alphabet">제목</option>
								<option value="regdate">ID</option>
							</select>
							<div class="col-lg-6"></div>
						</div>


						<div class="main-column6">
							<div class="categoryname">카테고리 :</div>
							<label> <select class="searchCategory2">
									<option selected>전체보기</option>
									<option>자유게시판</option>
									<option>꿀팁</option>
									<option>갤러리</option>
									<option>QnA</option>
							</select>
							</label>
						</div>

					</div>
				</div>
			
			</div>
				<!-- rihgt-->
			</div>
		<!-- body2-->
		</div>
		<!-- body-->
		<footer>
		<div class="chat-launcher"></div>
		<div class="chat-wrapper" data-headline="Chat"></div>
		</footer>
</body>
</html>