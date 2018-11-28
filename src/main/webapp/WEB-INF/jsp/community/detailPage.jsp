<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/community/detailPage.css"/>">
<c:import url="../common/headerfooterCSSJS.jsp"/>
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
.body1{

height: 100%;
margin-top: 105px;
/* padding-right: 270px;
padding-left: 270px; */
}
/* .left{
margin-top: 70px;
float: left;
width: 650px;
height: 100%;

} */
/* .right{
    float: left;
width: 320px;
height: 100%;

} */

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
  <c:import url = "../common/header.jsp"/>


    <div class = "body1">
        <div class = "body2">
            <div class = "left">
                    <p style = "font-family: 'Jua'">${communityBoard.comTitle}</p>
                    <div class= "justforHr1"></div>
                    <br>
                   <div class = "category"><i class="fas fa-user-circle"> ${communityBoard.comWriter}<span class="regDate"> ·<fmt:formatDate value="${communityBoard.comRegDate}" pattern="yyyy-MM-dd HH:mm"/></span></i></div>
                    <br>
                    <div class= "writeContainer">
                        <div class = "writeMargin">
                          ${communityBoard.comContent}
                        </div>
                    </div>
                    
                     <!-- 댓글 -->
                     <div class = "commentHr">
                         <div class ="commentmargin">
                            <div class = "coWriter">rlaqudrhks258</div>
                            <form>
                            <textarea class = "commentForm"></textarea>
                        </form>
                            <button class = "commentBtn">등록</button>
                            <div class = "brbr"></div>
                        </div>
                     </div>

                     <div class ="commnetsHr">Comments</div>
                   <br>
                   <br>
                   
                   <div class = "commentList">
                        <div class ="commentWriter"></div>
                        <ul class="comments">
                                <li class="comment">
                                  <a href="#" title="View this user profile" class="photo"><img src="https://placehold.it/32x32" alt="Kasper"></a>
                                  <div class="meta">박아란 | 2018.07.24 14:58 <a class="reply">Reply</a></div>
                                  <div class="body">하하하하</div>
                                </li>
                                <li class="comment level-2">
                                  <a href="#" title="View this user profile" class="photo"><img src="https://placehold.it/32x32" alt="Photo"></a>
                                  <div class="meta">박아란 | 2018.07.24 14:58 <a class="reply">Reply</a></div>
                                  <div class="body">하하하하</div>
                                </li>
                                
                                <li class="comment">
                                  <a href="#" title="View this user profile" class="photo"><img src="https://placehold.it/32x32" alt="Kasper"></a>
                                  <div class="meta">박아란 | 2018.07.24 14:58 <a class="reply">Reply</a></div>
                                  <div class="body">하하하하.</div>
                                </li>
                              </ul>
                   </div>
                   

            </div>
            <div class = "right">
                    <div class = "main-column2">
                            <div class = "ruleContainer">
                                <div class = "beforeWrite">게시판 규칙</div>
                                <div class = "spanwrite">게시글 개당 활동점수 +1</div>
                                <div class = "spanwrite">댓글 개당 활동점수 +1</div>
                                <div class = "spanwrite">악의적인 댓글 지양해주세요</div>
                                <div class = "spanwrite">상담게시판은 일정레벨이상 댓글작성 가능합니다.</div>
                                <div class = "spanwrite">중복된 글을 지양해주세요</div>
                                <div class = "spanwrite">양심체크 하셨나요?</div>
                                <div class = "spanwrite spanwrite1">딱봤을때 하면 안될거같죠? 하지마세요</div>
        
                                
                            </div>
                            <div class = "main-column3">
                                    <div class = "imgsize2"></div>
                                    <div class = "goWrite">작성자세요?</div>
                                    <button class= "writeBtn btnEdit" id = "${communityBoard.comNo}">글 수정하기</button>
                                    <button class= "writeBtn btnDelete" id = "${communityBoard.comNo}">글 삭제하기</button>
                                </div>
                            
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
//클릭시 글 삭제
$("button.btnDelete").click(function() {
	var no = $(this).attr('id');
	console.log(no);
	location.href = "delete.mn?comNo="+no;
	
});
//클릭시 글 수정
$("button.btnEdit").click(function() {
	var no = $(this).attr('id');
	location.href = "editWriteForm.mn?comNo="+no;
});
</script>
    
</body>
</html>