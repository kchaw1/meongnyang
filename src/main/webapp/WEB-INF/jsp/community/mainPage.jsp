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

<script src = "https://code.jquery.com/jquery-latest.min.js"></script>
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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 <link rel="stylesheet" href="headerfooter.css">
 
 <!-- 부트스트랩 -->
 <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
  <!-- 헤더 고정시키기 -->
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
    <!-- 전체화면  -->
    <div class = "content">
        <!-- 헤더부분 -->
        
        <div class="main-container">
            <!-- 첫번째 파트 -->
            <div class = "main-visual-container"></div>
            <div class = "main-column">
                
                <div class = "main-items recruit-item">
                    <div>
                        <img src="줄긋기4.PNG">
                        <h2 style="font-family: 'Jua'">크라우드 펀딩</h2>
                        <p class = "fontp">낭만코양이 회원들과 일상, 팁, 사진 등을 공유해 보세요!</p><br>
                        
                        <table style = "margin-top:10px">
                            <caption class = "caption" style="font-family: 'Jua'">최신글</caption>
                            <tbody>
                                <tr>
                                    <th>개발/서버</th>
                                    <td><a href="/recruit/tech">[미래사업부문] B2B향 신규 서비스 서버 개발자 모집</a></td>
                                </tr>
                                <tr>
                                    <th>개발/인프라</th>
                                    <td><a href="/recruit/tech">DevOps 엔지니어 모집</a></td>
                                </tr>
                                <tr>
                                    <th>개발/앱</th>
                                    <td><a href="/recruit/tech">[미래사업부문] 신규 SNS 서비스 안드로이드 개발자 모집</a></td>
                                </tr>
                            </tbody>
                        </table>
                        <div >
                                <a href="./mainPage1.html" class="btn">커뮤니티 더보기</a>
                            </div>

                    </div>
                </div>
                <div class = "main-items">
                    <img src="줄긋기4.PNG">
                    <h2 style="font-family: 'Jua'">최신동영상</h2>
                </div>
                   <div>
                        <a href="#" class="btn">최신 동영상 더보기</a>
                    </div>
                <div class = "main-items"></div>
            </div>

            <!-- 두번째 파트 -->
            <div class = "main-column forimg1">
                    <div class = "main-items">
                            <img src="img/main-outlink-store.png" class ="forimg2"/>
                    </div>
                    <div class = "main-items">
                            <img src="줄긋기4.PNG">
                        <h2 style="font-family: 'Jua'">커뮤니티</h2>
                        <p class = "fontp">낭만코양이 회원들과 일상, 팁, 사진 등을 공유해 보세요!</p><br>
                        <div class = "caption2" style="font-family: 'Jua'">최신글</div>
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
                    </div>
                    <div>
                            <a href="#" class="btn btn3">뉴스 더보기</a>
                        </div>
                    <div class = "main-items"></div>
            </div>
            <!-- 세번쨰 파트 -->
            <div class = "main-column main-column3">
                    <div class = "main-items">
                            <img src="줄긋기4.PNG">
                            <h2 style="font-family: 'Jua'">마이펫 다이어리</h2>
                            <img src="img/diary.jpg" class = "fordiary">
                            <p class = "fontp">멍멍냥냥이들과 함께 만들어가는 일기 지금 당장 써보세요!</p>
                            
                        </div>
                        <!-- 나중 이름과 메달부분 가운데 정렬 하기 -->
                        <div >
                                <a href="#" class="btn">마이펫 다이어리 더보기</a>
                            </div>
                            <div class = "main-items main-items2">
                                    <img src="줄긋기4.PNG" class = "formargin">
                                    <h2 style="font-family: 'Jua'">랭킹</h2>
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
                                        <div>
                                                <a href="./mainpageRanking.html" class="btn">전문가 랭킹 더보기</a>
                                        </div>
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
                                    <div>
                                            <a href="./mainpageRanking2.html" class="btn">회원 랭킹 더보기</a>
                                    </div>
                            </div>
                            <div class = "main-items"></div>
                           
                       </div>

                    </div>
                    


            </div>



        <!-- 세번째 파트 
       <div class = "main-column">
               <div class = "main-items">
               
                    <img src="줄긋기4.PNG">
                    <h2 style="font-family: BMHANNA">마이펫 다이어리</h2>
                    <p class = "fontp">멍멍냥냥이들과 함께 만들어가는 일기 지금 당장 써보세요!</p>
                    <img src="img/diary.jpg" class = "fordiary">
                    
                </div>
                <div >
                        <a href="#" class="btn">마이펫 다이어리 더보기</a>
                    </div>
               </div>
               
               <div class = "main-items ">
                    <img src="줄긋기4.PNG" class = "formargin">
                    <h2 style="font-family: BMHANNA">랭킹</h2>
                    <div>
                            <a href="./mainpageRanking.html" class="btn">랭킹 더보기</a>
                    </div>
               </div>
               
               <div class = "main-items"></div>
       </div>  -->
           
       
                       
            
          
       <!-- 채팅하기 버튼 -->
       <!-- <div>
            <a href="./mainpageRanking.html" class="btn firstButton">채팅하기</a>
        </div>

   <div class = "forhyungyubro">
            <div class='left forhyungyubro'>
                   
                         
                      
                    <div class='cat'>
                      <div class='ears1'></div>
                      <div class='head1'>
                        <div class='eyes1'></div>
                        <div class='nose1'></div>
                      </div>
                      <div class='body1'>
                        <div class='left-paw1'></div>
                        <div class='right-paw1'></div>
                      </div>
                      <div class='tail1'></div>
                      <div class='PRlaptop'>
                        <div class='PRscreen'></div>
                        <div class='PRkeyboard'></div>
                      </div>
                    </div>
                  </div>
                 
                 
                
                    
                  <div class='right forhyungyubro'>
                       
                    <div class='dog'>
                      <div class='ears2'></div>
                      <div class='head2'>
                        <div class='eyes2'></div>
                        <div class='nose2'></div>
                      </div>
                      <div class='body2'>
                        <div class='left-paw2'></div>
                        <div class='right-paw2'></div>
                      </div>
                      <div class='tail2'></div>
                      <div class='ORlaptop'>
                        <div class='ORscreen'></div>
                        <div class='ORkeyboard'></div>
                      </div>
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
 
    <script>
        $(function () {
    $('.chat-launcher').on('click', function () {
        $('.chat-launcher').toggleClass('active');
        $('.chat-wrapper').toggleClass('is-open');
    });
});
        </script>
</body>
</html>