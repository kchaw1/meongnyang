<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="<c:url value="/resources/css/community/editWriteForm.css"/>">
 <c:import url="../common/headerfooterCSSJS.jsp"/>
 

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<script src = "https://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<!-- 배민폰트 -->
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="headerfooter.css">

<!-- 부트스트랩 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
.body{
height: 100%;
margin-top: 70px;
}
.body2 {
    width: 80%;
    margin:0 auto;
}

.left{
width: 60%;
margin-top: 70px;
float: left;
height: 100%;

}
.right{
margin-top: 120px;   
margin-bottom: 60px;     
float: right;
width:30%;
height: 100%;
}

/*채팅*/
.comments:after { border-color: #fff; }
.comments:before { background-color: #fff; }
.comments .comment {
background: #fff;
border-radius: 10px;
font-size: 11px;
padding: 10px 15px;
}
.comments [class*="level-"] .photo:before { background-color: #fff; }
.comments .meta { color: #ccc; }
.comments .meta a { color: inherit; }
.comments .meta a:hover { color: #34b5d0; }
.comments .body { color: #888; }

/**
* Comments Thread
*/
.comments {
list-style-type: none;
padding: 5px 0 0 46px;
position: relative;
margin: 0 0 0 12px;
}
.comments:before,
.comments .comment,
.comments .comment:after,
.comments .comment:before,
.comments .photo img,
.comments [class*="level-"] .photo:before {
box-shadow: 0 1px 3px rgba(0,0,0,.4);
}
.comments:after,
.comments:before {
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
box-shadow: 0 1px 3px rgba(0,0,0,.4), 0 1px 3px rgba(0,0,0,.4) inset;
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
.comments .comment:after,
.comments .comment:before {
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
.comments .meta { margin-bottom: 5px; }
.comments .meta .reply { display: none; float: right; }
.comments .comment:hover .reply { display: block; }
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
.comments .level-2 { margin-left: 30px; }
.comments .level-3 { margin-left: 50px; }
.comments .level-4 { margin-left: 70px; }
.comments .level-5 { margin-left: 90px; }
.comments .level-6 { margin-left: 110px; }
.comments .level-3 .photo:before { width: 40px; left: -30px;}
.comments .level-4 .photo:before { width: 60px; left: -50px;}
.comments .level-5 .photo:before { width: 80px; left: -70px;}
.comments .level-6 .photo:before { width: 100px; left: -90px;}

</style>
<body>
<header class="dogcat">
                <div class="logo"><span class="logo-title"><a href="">멍하고노냥</a></span></div>
                <div class="animate"><img src="teddy_food_dribbble.gif" /></div>
                <nav>
                  <ul class="nav navbar-nav">
                    <li><a href="">반려인 커뮤니티</a></li>
                    <li><a href="">행동전문가와 상담</a></li>
                    <li><a href="">Locations</a></li>
                    <li class="dropdown">  
                      <a href="#" id="user" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                      <i class="fas fa-user-circle fa-2x"></i>
                      </a>
                      <ul class="dropdown-menu pull-right" role="menu" id="drop">
                        <li><a href="#">내 정보</a></li>
                        <li><a href="#">마이펫 다이어리</a></li>
                        <li class="divider"></li>
                        <li><a href="#">로그아웃</a></li>
                      </ul>
                    </li>
                  </ul>
                </nav>
                <div class="clear-fix"></div>
                
              </header>
    <div class = "body">
        <div class = "body2">
            <div class = "left">
                    <p style = "font-family: 'Jua'">글 수정</p>
                    <div class= "justforHr1"></div>
                    <br>
                    <div class="column-6 form-select">
                            <select name="" id="">
                              <option value=""  selected="selected">자유게시판</option>
                              <option>꿀팁</option>
                              <option>갤러리</option>
                              <option>질문</option>
                            </select>
                          </div>
                    <br>
                    <div class= "writeContainer">
                        <div class = "writeMargin">
                            <div class= "titleContainer"><input class = "title"type= "text" placeholder="Title" style = "padding-left:10px"></div>
                        
                            <div class= "textContainer">
                                    <textarea name="content" id="summernote" value=""></textarea>
                            </div>
                        </div>
                    </div>

            </div>
            <div class = "right">
                    <div class = "main-column2">
                            <div class = "ruleContainer">
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
                        <div class = "main-column3">
                            <div class = "imgsize2"></div>
                            <div class = "goWrite">위의 글을 읽어보셨다면</div>
                            <button class= "writeBtn">글 수정하기</button>
                            <div class = "goWrite">맘이 변하셨다구요?</div>
                            <button class= "writeBtn">목록으로</button>
                        </div>

            </div>
        </div>
    </div>
    <footer class="dogcat">
            <div class="footertitle">
              <h4 class="dogcat">Copyright ⓒ<span>낭만코양이</span> All rights reserved.</h4>
              <h4 class="dogcat">with AR, CW, HK, SY, BG</h4>
            </div>
          </footer>
                
    <footer>
            <div class="chat-launcher"></div>
            <div class="chat-wrapper" data-headline="Chat">
            </div>
    </footer>
    <script>
            $('.dropdown-toggle').dropdown()
    $(document).ready(function() {
     $('#summernote').summernote({
            minwidth: 600,
             height: 300,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
     });
});

    </script>

</body>
</html>