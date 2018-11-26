<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>행동전문가 상세 팝업창 메인</title>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.3.1/velocity.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 <!-- 행동전문가 상세 메인 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/abs/absDetailMain.css"/>">
  
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
                  <a href="absDetail.mn">경력 및 인사말</a>
                </li>
                <li>
                  <a href="#">1:1 화상채팅하기</a>
                </li>
                <li>
                  <a href="absDetailBoard.mn">질문게시판</a>
                </li>
              </ul>
            </nav>
          </div>
        </header>
        <section class="content">
          <figure class="snip1091 red" >
            <img src="https://t1.daumcdn.net/cfile/tistory/24FB78335979C45A09" alt="sq-sample6" />
            <figcaption>
              <h2>경력 및 <span>인사말</span></h2>
            </figcaption><a href="absDetail.mn?no=${map.b.no}"></a>
          </figure>
          <figure class="snip1091 green" ><img src="http://img.hankyung.com/photo/201707/01.14272892.1.png" alt="sq-sample14" />
            <figcaption>
              <h2>전문가와 <span>화상채팅</span></h2>
            </figcaption><a href="#"></a>
          </figure>
          <figure class="snip1091 navy"><img src="https://post-phinf.pstatic.net/MjAxNzA5MjBfNTcg/MDAxNTA1ODgzNTk1MDcz.HLD5l_7_XzGcU2Q7pwZAmAAJeIEjmhud7ZbqMOcq-Fsg.G4FlzFGc6wjF03jSb9wXnUNft913XACg_gkKahR8dgUg.JPEG/ask-questions.jpg?type=w1200" alt="sq-sample10" />
            <figcaption>
              <h2>질문 <span>게시판</span></h2>
            </figcaption><a href="absDetailBoard.mn"></a>
          </figure>
            </section>
        <script>
        $('.hamb-wrap').on('click', function(){
          $(this).parent().children('p').toggle();
          $(this).children().toggleClass('active');
          $('nav').fadeToggle(200);
        
        }) 


        /*메인이미지*/
        $("figure").mouseleave(
          function() {
            $(this).removeClass("hover");
          }
        );
        </script>

</body>
</html>