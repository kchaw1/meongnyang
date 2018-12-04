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
body{
  font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 14px;
    line-height: 1.42857143;
    color: #333;
    background-color: #fff;
}
 header.dogcat{
margin: 0 auto; 
 font-family: 'Jua', sans-serif;}
.body {
	height: 100%;
	margin-top: 70px;
}

.body2 {
	width: 80%;
	margin: 0 auto;
}

.left {
	width: 60%;
	margin-top: 70px;
	float: left;
	height: 100%;
}

.right {
	margin-top: 120px;
	margin-bottom: 60px;
	float: right;
	width: 30%;
	height: 100%;
}
.writeMargin{
padding-left : 10px;
padding-right : 20px;
}
.title{
margin-top: 10px;
width: 100%;
height: 30px;
border: 1px solid rgb(230, 219, 219); /* some kind of blue border */

/* other CSS styles */

/* round the corners */
-webkit-border-radius: 4px;
-moz-border-radius: 4px;
border-radius: 4px;

}

/*채팅*/
.comments:after {
	border-color: #fff;
}

.comments:before {
	background-color: #fff;
}

.comments .comment {
	background: #fff;
	border-radius: 10px;
	font-size: 11px;
	padding: 10px 15px;
}

.comments [class*="level-"] .photo:before {
	background-color: #fff;
}

.comments .meta {
	color: #ccc;
}

.comments .meta a {
	color: inherit;
}

.comments .meta a:hover {
	color: #34b5d0;
}

.comments .body {
	color: #888;
}

/**
* Comments Thread
*/
.comments {
	list-style-type: none;
	padding: 5px 0 0 46px;
	position: relative;
	margin: 0 0 0 12px;
}

.comments:before, .comments .comment, .comments .comment:after,
	.comments .comment:before, .comments .photo img, .comments [class*="level-"] .photo:before
	{
	box-shadow: 0 1px 3px rgba(0, 0, 0, .4);
}

.comments:after, .comments:before {
	display: block;
	content: '';
	position: absolute;
}

.comments:before {
	border-radius: 0 0 5px 5px;
	height: 100%;
	width: 8px;
	left: 0;
	top: 0;
}

.comments:after {
	box-shadow: 0 1px 3px rgba(0, 0, 0, .4), 0 1px 3px rgba(0, 0, 0, .4)
		inset;
	border-width: 4px;
	border-style: solid;
	border-radius: 18px;
	height: 10px;
	width: 10px;
	left: -5px;
	top: -16px;
	z-index: -1;
}

.comments .comment {
	margin-bottom: 10px;
	position: relative;
}

.comments .comment:after, .comments .comment:before {
	border-radius: 10px;
	background-color: #fff;
	position: absolute;
	display: block;
	content: '';
}

.comments .comment:after {
	width: 12px;
	height: 12px;
	left: -14px;
	top: 7px;
}

.comments .comment:before {
	width: 5px;
	height: 5px;
	left: -22px;
	top: 16px;
}

.comments .photo {
	position: absolute;
	left: -60px;
	top: 2px;
}

.comments .photo img {
	border: 1px solid #fff;
	border-radius: 32px;
	overflow: hidden;
}

.comments .meta {
	margin-bottom: 5px;
}

.comments .meta .reply {
	display: none;
	float: right;
}

.comments .comment:hover .reply {
	display: block;
}

.comments [class*="level-"] .photo:before {
	display: block;
	content: '';
	position: absolute;
	margin-top: -2px;
	height: 4px;
	width: 20px;
	left: -10px;
	top: 50%;
	z-index: -1;
}

.comments .level-2 {
	margin-left: 30px;
}

.comments .level-3 {
	margin-left: 50px;
}

.comments .level-4 {
	margin-left: 70px;
}

.comments .level-5 {
	margin-left: 90px;
}

.comments .level-6 {
	margin-left: 110px;
}

.comments .level-3 .photo:before {
	width: 40px;
	left: -30px;
}

.comments .level-4 .photo:before {
	width: 60px;
	left: -50px;
}

.comments .level-5 .photo:before {
	width: 80px;
	left: -70px;
}

.comments .level-6 .photo:before {
	width: 100px;
	left: -90px;
}
</style>
<body>
	<c:import url = "../common/header.jsp"/>
<form action = "write.mn" method = "post">
	<div class="body">
		<div class="body2">
			<div class="left">
				<p style="font-family: 'Jua'">글 쓰기</p>
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
							<input class="title" name = "comTitle"  type="text" placeholder="Title" style="padding-left: 10px">
							<!-- ${user.id}로 바꾸기 -->
								<input type="hidden" name="comWriter" value="${user.id}"/>
						</div>

						<div class="textContainer">
							<textarea name="comContent" id="summernote"></textarea>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

			<div class="right">

				<div class="main-column2">
					<div class="ruleContainer">
						<div class="beforeWrite">글쓰기 전!</div>
						<div class="spanwrite">당신은 사람이란걸 생각하세요</div>
						<div class="spanwrite">현실에서 다른사람에게 하듯 글 써주세요</div>
						<div class="spanwrite">혐오성 발언은 지양해주세요</div>
						<div class="spanwrite">이상한 사진 자제해주세요</div>
						<div class="spanwrite">중복된 글을 지양해주세요</div>
						<div class="spanwrite">당신의 양심은 안녕하십니까?</div>
						<div class="spanwrite spanwrite1">이정도 말했으면 알아들으십시오</div>


					</div>

				</div>
				<div class="main-column3">
					<div class="imgsize2"></div>
					<div class="goWrite">위의 글을 읽어보셨다면</div>
					<button type = "submit" class="writeBtn " id = "submit">글 작성하기</button>
					
					<div class="goWrite">맘이 변하셨다구요?</div>
					<button type = "button" class="writeBtn " id = "cancel">목록으로</button>
				</div>
			</div>
			<input id="imageBoard" name="fileUrl" type="hidden"/>
			<input id="imagesysname" name="sysName" type="hidden"/>
			<input id="imagepath" name="path" type="hidden"/>
</form>
		
	<footer class="dogcat">
	<div class="footertitle">
		<h4 class="dogcat">
			Copyright ⓒ<span>낭만코양이</span> All rights reserved.
		</h4>
		<h4 class="dogcat">with AR, CW, HK, SY, BG</h4>
	</div>
	</footer>

	<footer>
	<div class="chat-launcher"></div>
	<div class="chat-wrapper" data-headline="Chat"></div>
	</footer>
	
	
	<script>
	
	 $(document).ready(function() {
		$('#summernote').summernote({
			minwidth : 705,
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true,
			
		// set focus to editable area after initializing summernote
		});
	});  
	
	$(document).ready(function() {
		$('#summernote').summernote({
		    minwidth : 705,
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					console.log(files);
					console.log(this);
					for (let i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		// callbacks
		});
	});
	

   function sendFile(file, ele) {
   	var form_data = new FormData();
   	console.log("form_data", form_data)
   	form_data.append('file', file);
   	$.ajax({
   		data : form_data,
   		type : "POST",
   		url : "<c:url value='/community/uploadfile.mn'/>",
   		cache : false,
   		contentType : false,
   		enctype : "multipart/form_data",
   		processData : false,
   		success : function(cFile) {
   			console.log(cFile.url);
   			$("input#imageBoard").val(cFile.url)
   			$("input#imagesysname").val(cFile.comfSysName)
   			$("input#imagepath").val(cFile.comfPath)
   			$(ele).summernote("editor.insertImage", cFile.url);
   		}
   	})//ajax
   }
	


	// 버튼 클릭시 글 작성

	// 버튼 클릭시 목록으로
	$("#cancel").click(function() {
		location.href = "communityPage.mn";
	});

	
	
	</script>

</body>
</html>