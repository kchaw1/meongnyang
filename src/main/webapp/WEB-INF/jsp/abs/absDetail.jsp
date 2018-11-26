<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>행동전문가 팝업창</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.3.1/velocity.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
    <!-- 행동전문가 상세 팝업창 CSS -->
        <link rel="stylesheet" href="<c:url value="/resources/css/abs/absDetail.css"/>">
        
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
            <p class="logo">${map.b.name}</p>
            <nav>
              <ul>
                <li>
                  <a href="absDetail.mn?no=${map.b.no}">경력 및 인사말</a>
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
          <h1>경력 및 인사말</h1>
          <h4 >
          <button type="button" id="like-button">
            <svg class="heart-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><path d="M91.6 13A28.7 28.7 0 0 0 51 13l-1 1-1-1A28.7 28.7 0 0 0 8.4 53.8l1 1L50 95.3l40.5-40.6 1-1a28.6 28.6 0 0 0 0-40.6z"/></svg>
            Like
          </button>
              좋아요: 
              <span class="counter" data-count="${map.b.absLikeCnt}">0</span>
            </h4>
          <hr> 
          <div class="DetailContainer">
               <p id="name">"${map.b.name}"</p>
              <p>출생: 1985년 5월 27일 (33세)</p> 
              <p>가족: 배우자 수잔 엘더, 아들 강주운</p>
              <p>소속: 보듬컴퍼니 (대표)</p>
              <p>무조건 칭찬만 하는 교육을 하진 않습니다.
                때로는 거절을 통해 옳고 그른 행동을 알려주어, 우리가 사는 이 복잡한 도시환경에 적응하여
                함께 잘 살아갈 수 있게 보듬어 주는 교육을 보듬교육이라고 말합니다.   
                보듬교육은 보호자님과 반려견이 항상 행복하기를 바랍니다.</p>
                
              </div>
          </div>
        
         </section>
        <script>
        $('.hamb-wrap').on('click', function(){
          $(this).parent().children('p').toggle();
          $(this).children().toggleClass('active');
          $('nav').fadeToggle(200);
        
        }) 


        /*--------좋아요--------------*/
        document.addEventListener('DOMContentLoaded', function() {
         var likeButton = document.getElementById('like-button');
        likeButton.addEventListener('click', function() {
         window.lb = likeButton;
          likeButton.classList.toggle('selected');
       });
        }, false);

        /*좋아요 개수*/
        $('.counter').each(function() {
  var $this = $(this),
      countTo = $this.attr('data-count');
  
  $({ countNum: $this.text()}).animate({
    countNum: countTo
  },

  {

    duration: 5000,
    easing:'linear',
    step: function() {
      $this.text(Math.floor(this.countNum));
    },
    complete: function() {
      $this.text(this.countNum);
      //alert('finished');
    }

  });   
});

        </script>
</body>
</html>