<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../common/headerfooterCSSJS.jsp"/>
<link rel="stylesheet" href="<c:url value="/resources/css/community/writeForm.css"/>">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<script src = "https://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

 <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<!-- 부트스트랩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

</head>
<style>

</style>
<body>
<script src="<c:url value="/resources/js/common/chat.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/common/chat.css"/>">
<c:import url = "../common/chat.jsp"/>
	 <c:import url = "../common/header.jsp"/>
	 
	 
	 
	 
<form action = "<c:url value = "/community/edit.mn"/>?comNo=${communityBoard.comNo}" method = "post">
	<div class="body">
		<div class="body2">
			<div class="left">
				<p style="font-family: 'Jua'">글 수정</p>
				<div class="justforHr1"></div>
				<br>
				<div class="column-6 form-select">
					 <select name="comCategory">
                          <option value="자유게시판">자유게시판</option>
	                          <option value="꿀팁">꿀팁</option>
	                          <option value="갤러리">갤러리</option>
	                          <option value="질문">질문</option>
                        </select>
				</div>
				<br>
				<div class="writeContainer">
					<div class="writeMargin">
						<div class="titleContainer">
							<input class="title" name = "comTitle"  type="text" placeholder="Title" style="padding-left: 10px" value = "${communityBoard.comTitle}"/>
							<!-- ${user.id}로 바꾸기 -->
								<input type="hidden" name="comWriter" value="아란누나"/>
						</div>

						<div class="textContainer">
							<textarea name="comContent" id="summernote">${communityBoard.comContent}</textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

			<div class="right">

				<div class="main-column2">
					<div class="ruleContainer">
						 <div class = "beforeWrite">글 수정 전!</div>
                                <div class = "spanwrite">당신은 사람이란걸 다시 한번 생각하세요</div>
                                <div class = "spanwrite">현실에서 다른사람에게 하듯 다시 글 써주세요</div>
                                <div class = "spanwrite">혐오성 발언은 지양해주세요</div>
                                <div class = "spanwrite">이상한 사진 자제해주세요</div>
                                <div class = "spanwrite">중복된 글을 지양해주세요</div>
                                <div class = "spanwrite">당신의 양심은 안녕하시겠죠?</div>
                                <div class = "spanwrite spanwrite1">이정도 말했으면 알아들으셨겠죠?</div>


					</div>

				</div>
				<div class="main-column3">
					<div class="imgsize2"></div>
					<div class="goWrite">위의 글을 읽어보셨다면</div>
					<button type = "submit" class="writeBtn " id = "submit">글 수정하기</button>
					
					<div class="goWrite">맘이 변하셨다구요?</div>
					<button type = "button" class="writeBtn " id = "cancel">목록으로</button>
				</div>
			</div>
</form>
		
	<footer class="dogcat">
	<div class="footertitle">
		<h4 class="dogcat">
			Copyright ⓒ<span>낭만코양이</span> All rights reserved.
		</h4>
		<h4 class="dogcat">with AR, CW, HK, SY, BG</h4>
	</div>
	</footer>


	<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			width : 760,
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true
		// set focus to editable area after initializing summernote
		});
	});
		
		// 버튼 클릭시 글 목록으로
		$("#cancel").click(function() {
			location.href = "communityPage.mn";
		});
	</script>

</body>
</html>