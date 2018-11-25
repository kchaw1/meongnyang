<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.3.1/velocity.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 	
 	 <!-- 게시판상세 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/abs/absDetailBoardDetail.css"/>">

<!-- 폰트 -->
  <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
  
</head>
<body>

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300|Raleway:200,900|Over+the+Rainbow' rel='stylesheet' type='text/css'>
        <meta name="viewport" content="width=device-width, user-scalable=no">
        
        <header style="nav-index: 100;">
          <div class="hero">
            <div class="hamb-wrap">
              <div class="hamb"></div>
            </div>
            <p class="logo">강형욱</p>
            <nav>
              <ul>
                <li>
                  <a href="ABSDetail.html">경력 및 인사말</a>
                </li>
                <li>
                  <a href="#">1:1 화상채팅하기</a>
                </li>
                <li>
                  <a href="ABSDetailBoard.html">질문게시판</a>
                </li>
              </ul>
            </nav>
          </div>
        </header>
        <section class="content">
          <h1>상세 정보</h1>
          <hr>
          <div>
            <h4>작성자:</h4>
            <hr>
            <h4>제목: 우리애들이 말을 해요</h4>
  
            <span>내용: 우리애들이 말을 하기 시작했어요!!!!!!!</span>
          </div><br>
          
          <button type="button" class="btn btn-primary" id="rev">이전으로</button>

          <div>
            <h3 class="heading">Comment</h3>
              <div class="con">
                <form method="POST">
                  <div class="form-group">
                    <textarea id="writecomment" class="form-control status-box" rows="2" placeholder="Enter your comment here..."></textarea>
                  </div>
                </form>
                <div class="button-group pull-right">
                  <p class="counter">250</p>
                  <a href="#" class="btn btn-primary" id="post">Post</a>
                </div>
                <ul class="posts">
                  
                </ul>
              </div>
          
          </div>
        </section>
        
        <script>
          $('.hamb-wrap').on('click', function(){
            $(this).parent().children('p').toggle();
            $(this).children().toggleClass('active');
            $('nav').fadeToggle(200);
            
          })

                      var main = function() {
              $('#post').click(function() {
                var post = $('.status-box').val();
                $('<li class="comment">').text(post).prependTo('.posts');
                $('.status-box').val('');
                $('.counter').text('250'); 
                $('#post').addClass('disabled');
              });
              $('.status-box').keyup(function() {
                var postLength = $(this).val().length;
                var charactersLeft = 200 - postLength;
                $('.counter').text(charactersLeft);
                if (charactersLeft < 0) {
                  $('#post').addClass('disabled');
                } else if (charactersLeft === 200) {
                  $('#post').addClass('disabled');
                } else {
                  $('#post').removeClass('disabled');
                }
              });
            }
            $('#post').addClass('disabled');
            $(document).ready(main)


            $("#rev").click(function(){
            	 location.href="absDetailBoard.mn";
             }) 
          
        </script>
</body>
</html>