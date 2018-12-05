<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/community/mainPage.css"/>">
<c:import url="../common/headerfooterCSSJS.jsp"/>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
 integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
 <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
 <!--user 아이콘-->
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
 <!-- 배민폰트 -->
 <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">

 
 <!-- 부트스트랩 -->
<!--  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> -->
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<style>
.pclass{
color: gray;
 line-height: 20px;
}
</style>
<body>
	<c:import url = "../common/header.jsp"/>

   
    <!-- 전체화면  -->
    <div class = "content">
        <!-- 헤더부분 -->
        
        <div class="main-container">
            <!-- 첫번째 파트 -->
            <div class = "main-visual-container"></div>
            <div class = "main-column">
                
                <div class = "main-items recruit-item">
                        <img src="<c:url value = "/resources/img/community/line.png"/>">
                        <div class = "leftRight">
                                <h2 class = "leftRight1" style="font-family: 'Jua'">크라우드 펀딩</h2>
                                <button class ="btn2 leftRight1">더보기 </button>
                            </div>
                       <!-- 크라우드 펀딩 1개 -->
                        <div class = "crowdImg">
                        <img src="<c:url value = "/resources/img/community/치아미백.PNG"/>" width="300" class = "crowdImg">

                            <p class = "fontp">치아미백부터 구취및 잇몸 케어까지 우리가족 구강건강을 책임질 맞춤형 치약 클로라</p>
                            
                            <div class="progress">
                                    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                      60%
                                    </div>
                                  </div>
                        </div>
                        <!-- 크라우드 펀딩 12개 -->
                        <div class = "crowdImg">
                                <img src="<c:url value = "/resources/img/community/치아미백.PNG"/>" width="300" class = "crowdImg">
                                <p class = "fontp">치아미백부터 구취및 잇몸 케어까지 우리가족 구강건강을 책임질 맞춤형 치약 클로라</p>
                                <div class="progress">
                                        <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                          60%
                                        </div>
                                      </div>
                            </div>
                           
                
                </div>
                <div class = "main-items5">
                    <img src="<c:url value = "/resources/img/community/line.png"/>">
                    <div class = "leftRight">
                    <h1 class = "leftRight1" style="font-family: 'Jua'">최신동영상</h1>
                    <button class ="btn1 leftRight1">더보기 </button>
                    </div>
                    <div class = "youtube"><img src="<c:url value = "/resources/img/community/캡처.PNG"/>" width="300"></div>
                    <p class = "pclass"style="font-family: 'Jua'">제목제목 <span>2018-11-17</span></p>
                    <div class = "youtube"><img src="<c:url value = "/resources/img/community/캡처.PNG"/>" width="300"></div>
                    <p class = "pclass"style="font-family: 'Jua'">제목제목 <span>2018-11-17</span></p>
                   
                    
                </div>
                  
                
            </div>

            <!-- 두번째 파트 -->
            <div class = "main-column forimg1">
                    <div class = "main-items">
                    <img src="<c:url value = "/resources/img/community/main-outlink-store.png"/>" class ="forimg2">
                    </div>
                    <div class = "main-items">
                            <img src="<c:url value = "/resources/img/community/line.png"/>">
                            <div>
                            <div class = "font2">커뮤니티</div>
                            
                            </div>

                        
                            <p class = "fontp">낭만코양이 회원들과 일상, 팁, 사진 등을 공유해 보세요!</p>
                        <div class = "caption2" style="font-family: 'Jua'">최신글</div>
                        <hr>
                         <c:forEach var = "b" items = "${list}">
                        <p style="font-family: 'Jua'">${b.comTitle}</p>
                        <!-- 이클립스주기 -->
                        <p>${b.comContent}</p>
                        <p class = "pclass" style="font-family: 'Jua'">${b.comWriter} <span><fmt:formatDate value = "${b.comRegDate}" pattern="yyyy-MM-dd"/></span></p>
                        <hr>
                       </c:forEach>
                        
                        <button class ="btn3 leftRight1">더보기 </button>
                    </div>
                    
                    <div class = "main-items"></div>
            </div>
            <!-- 세번쨰 파트 -->
            <div class = "main-column main-column3">
                    <div class = "main-items">
                            <img src="<c:url value = "/resources/img/community/line.png"/>">
                            <div class = "leftRight">
                                    <h2 class = "leftRight1" style="font-family: 'Jua'">마이펫 다이어리</h2>
                                    <button class ="btn4 leftRight1">더보기 </button>
                                </div>
                                <img src="<c:url value = "/resources/img/community/diary.jpg"/>" class = "fordiary">
                            <p class = "fontp">멍멍냥냥이들과 함께 만들어가는 일기 지금 당장 써보세요!</p>

                            <div class = "caption2" style="font-family: 'Jua'">공개글</div>
                            <hr>
                            <p style="font-family: 'Jua'">멍하고노냥, 격월간 반려견 잡지 '매거진A' 창간</p>
                            <!-- 이클립스주기 -->
                            <p>반려동물 전문 커뮤니티 '멍하고노냥'이 격--</p>
                            <p style="font-family: 'Jua'">이데일리 <span>2018-11-17</span></p>
                            <hr>
                        <p style="font-family: 'Jua'">멍하고노냥, 격월간 반려견 잡지 '매거진A' 창간</p>
                        <!-- 이클립스주기 -->
                        <p>반려동물 전문 커뮤니티 '멍하고노냥'이 격--</p>
                        <p style="font-family: 'Jua'">이데일리 <span>2018-11-17</span></p>
                        <hr>
                        <p style="font-family: 'Jua'">멍하고노냥, 격월간 반려견 잡지 '매거진A' 창간</p>
                        <!-- 이클립스주기 -->
                        <p>반려동물 전문 커뮤니티 '멍하고노냥'이 격--</p>
                        <p style="font-family: 'Jua'">이데일리 <span>2018-11-17</span></p>
                        
                            
                            
                        </div>
                        <!-- 나중 이름과 메달부분 가운데 정렬 하기 -->
                       
                            <div class = "main-items main-items2">
                            <img src="<c:url value = "/resources/img/community/line.png"/>" class = "formargin2"> 
                                    <div class = "leftRight">
                                            <h2 class = "leftRight1" style="font-family: 'Jua'">랭킹</h2>
                                            <button class ="btn5 leftRight1">더보기 </button>
                                        </div>
                                    <table style = "margin-top:10px" class = "tabletext">
                                            <caption class = "caption" style="font-family: 'Jua'">행동전문가</caption>
                                            <tbody>
                                                <tr>
                                                    <th><i class="fas fa-medal gold"></i></th>
                                                    <td>박아란</td>
                                                </tr>
                                                <tr>
                                                    <th><i class="fas fa-medal silver"></i></th>
                                                    <td>김병관</td>
                                                </tr>
                                                <tr>
                                                    <th><i class="fas fa-medal bronze"></i></th>
                                                    <td>김세영</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                       
                                        <br>

                                        <table style = "margin-top:10px" class = "tabletext">
                                                <caption class = "caption" style="font-family: 'Jua'">회원</caption>
                                                <tbody>
                                                    <tr>
                                                        <th><i class="fas fa-medal gold"></i></th>
                                                        <td>현규브로</td>
                                                    </tr>
                                                    <tr>
                                                        <th><i class="fas fa-medal silver"></i></th>
                                                        <td>갓차원</td>
                                                    </tr>
                                                    <tr>
                                                        <th><i class="fas fa-medal bronze"></i></th>
                                                        <td>김병봉</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                
                            </div>
                            <div class = "main-items"></div>
                           
                       </div>

                    </div>
                    


            </div>


    -->


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
    <!-- 푸터! -->
    <footer></footer>
    <script>
    // 크라우드펀딩으로 가는 url
    $(".btn2").on('click', function(){
    	location.href = "<c:url value = '/admin/crowd/list.mn'/>";
    });
    // 최신동영상으로 가는 url
    $(".btn1").on('click', function(){
    	location.href = "communityPage.mn";
    });
    // 커뮤니티로 가는 url
    $(".btn3").on('click', function(){
    	location.href = "communityPage.mn";
    });
    // 마이펫다이어리로 가는 url
    $(".btn4").on('click', function(){
    	location.href = "communityPage.mn";
    });
    // 랭킹으로 가는 url
    $(".btn5").on('click', function(){
    	location.href = "communityPage.mn";
    });
        $(function () {
    $('.chat-launcher').on('click', function () {
        $('.chat-launcher').toggleClass('active');
        $('.chat-wrapper').toggleClass('is-open');
    });
});
        </script>
</body>
</html>