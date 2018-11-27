<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/resources/css/community/communityMain.css"/>">
<c:import url="../common/headerfooterCSSJS.jsp"/>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" 
    integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- 배민폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    
    
    <!-- 배민폰트 -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">
   
    
    <!-- 부트스트랩 -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src = "https://code.jquery.com/jquery-latest.min.js"></script>
</head>

<style>
body{background-color: #fafafa;}

</style>
<body>
	<c:import url = "../common/header.jsp"/>

              <div class = "mainContainer">
    <!-- 컨텐츠 나중에 c:forEach들어갈 부분입니다. -->
<c:forEach var = "b" items="${list}">
<!-- 일반글용 -->
                   <div class = "contentsContainer">
                        <div class = "left">
                            <div class = "contentContainer">
                                <!-- 이곳에 프로필 사진과 이름, 날짜가 들어갑니다. -->
                                <div class = "top">
                                    <div class = "locationC">
                                      <img src="<c:url value = "/publishing/bg/img"/>" class ="imgSize">
                                      <!-- 컨텐츠 상단 유저이름 -->
                                      <span class = "userName">${b.comWriter}</span>
                                      <!--  컨텐츠 상단 날짜 -->
                                      <span class = "regDate"> ·<fmt:formatDate value = "${b.comRegDate}" pattern="yyyy-MM-dd"/></span>
                                    </div>
                                </div>
                                <div class = "mid" id = "${b.comNo}">
                                    <!-- 이곳에 내용이 들어갑니다. -->
                                    <div class = "forContent">
                                        <h1 class ="title">${b.comTitle}</h1>
                                        <div class = "content">${b.comContent}</div>
                                    </div>
                                    <!-- 이곳에 이미지가 들어 갑니다. -->
                                    <div class = "forImg"></div>
                                    
                                </div>
                                <!-- 이곳에 카테고리와 댓글 이모지, 조회수 이모지, (글수정 삭제(예정))가 들어갑니다. -->
                                <div class = "bottom">
                                      <div class = "category">${b.comCategory}</div>
                                      <div class = "forCnt">
                                      <div class = "commentCnt"><i class="fas fa-comment-dots"></i> 2 Comments</div>
                                      <div class = "viewCnt"><i class="fas fa-eye"></i> ${b.comViewCnt} View</div>
                                      </div>
  
                                </div>
  
                            </div><!--EndcontentContainer-->
                          
                          </div> <!--EndLeft-->
                    </div> <!--EndcontentsContainer여기까지가 좌측 컨텐츠의 전부!-->
</c:forEach>


<!-- 사진용 -->
                  <div class = "contentsContainer">
                        <div class = "left">
                            <div class = "contentContainer">
                                <!-- 이곳에 프로필 사진과 이름, 날짜가 들어갑니다. -->
                                <div class = "top">
                                    <div class = "locationC">
                                      <img src="./img/userImg.jpg" class ="imgSize">
                                      <!-- 컨텐츠 상단 유저이름 -->
                                      <span class = "userName">Aran자매님</span>
                                      <!--  컨텐츠 상단 날짜 -->
                                      <span class = "regDate"> ·2018-11-27 11:20 AM</span>
                                    </div>
                                </div>
                                <div class = "mid">
                                    <!-- 이곳에 내용이 들어갑니다. -->
                                    <div class = "forContent">
                                        <h1 class ="title">츙뗭!</h1>
                                        <div class = "content">아하핳하하하하하하</div>
                                    </div>
                                    <!-- 이곳에 이미지가 들어 갑니다. -->
                                    <div class = "forImg"><img src="./img/이유비.PNG" width="700.69px"></div>
                                    
                                </div>
                                <!-- 이곳에 카테고리와 댓글 이모지, 조회수 이모지, (글수정 삭제(예정))가 들어갑니다. -->
                                <div class = "bottom">
                                      <div class = "category">자유게시판</div>
                                      <div class = "forCnt">
                                      <div class = "commentCnt"><i class="fas fa-comment-dots"></i> 2 Comments</div>
                                      <div class = "viewCnt"><i class="fas fa-eye"></i> 1 View</div>
                                      </div>
  
                                </div>
  
                            </div><!--EndcontentContainer-->
                          
                          </div> <!--EndLeft-->
                    </div> <!--EndcontentsContainer여기까지가 좌측 컨텐츠의 전부!-->
                

 <!-- 여러 사진용 -->
                  <div class = "contentsContainer">
                        <div class = "left">
                            <div class = "contentContainer">
                                <!-- 이곳에 프로필 사진과 이름, 날짜가 들어갑니다. -->
                                <div class = "top">
                                    <div class = "locationC">
                                      <img src="./img/userImg.jpg" class ="imgSize">
                                      <!-- 컨텐츠 상단 유저이름 -->
                                      <span class = "userName">Aran자매님</span>
                                      <!--  컨텐츠 상단 날짜 -->
                                      <span class = "regDate"> ·2018-11-27 11:20 AM</span>
                                    </div>
                                </div>
                                <div class = "mid">
                                    <!-- 이곳에 내용이 들어갑니다. -->
                                    <div class = "forContent">
                                        <h1 class ="title">#진짜 사나이</h1>
                                        <div class = "content">충성입니다.</div>
                                    </div>
                                    <!-- 이곳에 이미지가 들어 갑니다. -->
                                    <div class = "forImg">
                                            

                                    </div>
                                    
                                </div>
                                <!-- 이곳에 카테고리와 댓글 이모지, 조회수 이모지, (글수정 삭제(예정))가 들어갑니다. -->
                                <div class = "bottom">
                                      <div class = "category">자유게시판</div>
                                      <div class = "forCnt">
                                      <div class = "commentCnt"><i class="fas fa-comment-dots"></i> 2 Comments</div>
                                      <div class = "viewCnt"><i class="fas fa-eye"></i> 1 View</div>
                                      </div>
  
                                </div>
  
                            </div><!--EndcontentContainer-->
                          
                          </div> <!--EndLeft-->
                    </div> <!--EndcontentsContainer여기까지가 좌측 컨텐츠의 전부!-->

 <!-- 사진용 -->
                  <div class = "contentsContainer">
                        <div class = "left">
                            <div class = "contentContainer">
                                <!-- 이곳에 프로필 사진과 이름, 날짜가 들어갑니다. -->
                                <div class = "top">
                                    <div class = "locationC">
                                      <img src="./img/userImg.jpg" class ="imgSize">
                                      <!-- 컨텐츠 상단 유저이름 -->
                                      <span class = "userName">Aran자매님</span>
                                      <!--  컨텐츠 상단 날짜 -->
                                      <span class = "regDate"> 2018-11-27 11:20 AM</span>
                                    </div>
                                </div>
                                <div class = "mid">
                                    <!-- 이곳에 내용이 들어갑니다. -->
                                    <div class = "forContent">
                                        <h1 class ="title">#진짜 사나이</h1>
                                        <div class = "content">충성입니다.</div>
                                    </div>
                                    <!-- 이곳에 이미지가 들어 갑니다. -->
                                    <div class = "forImg">
                                        
                                        

                                    </div>
                                    
                                </div>
                                <!-- 이곳에 카테고리와 댓글 이모지, 조회수 이모지, (글수정 삭제(예정))가 들어갑니다. -->
                                <div class = "bottom">
                                      <div class = "category">자유게시판</div>
                                      <div class = "forCnt">
                                      <div class = "commentCnt"><i class="fas fa-comment-dots"></i> 2 Comments</div>
                                      <div class = "viewCnt"><i class="fas fa-eye"></i> 1 View</div>
                                      </div>
  
                                </div>
  
                            </div><!--EndcontentContainer-->
                          
                          </div> <!--EndLeft-->
                    </div> <!--EndcontentsContainer여기까지가 좌측 컨텐츠의 전부!-->
                   

                  <!----------------------------------------------------------------------->
              </div><!--EndmainContainer-->

              <div class = "profileAndName">
                  <!-- 우측 상단 프로필 사진 -->
                  <img src="./img/userImg.jpg" class ="imgSize">
                  <!-- 우측 상단 유저이름 -->
                  <span class = "userName">byoung_gwan_98</span>
                </div>
                <!-- 글작성 버튼이 들어갑니다. -->
                <div class = "writeForm">
                    <p class = "decoration"></p>
                    <div class = "containSizeControl">
                    <p class = "decoration2">커뮤니티</p>
                    <p class = "decoration3">여러분들의 일상을 공유해보세요!</p>
                    <button class = "writeBtn">글 작성하기</button>
                    </div>

                </div>
                 <!-- 아무거나 넣어주세요 -->
                <div class = "putSomething">
                        <h1 class = "decoration2">카테고리</h1>
                    <div class="select">
                        
                        <select name="slct" id="slct">
                                <option selected>전체보기</option>
									<option>자유게시판</option>
									<option>꿀팁</option>
									<option>갤러리</option>
									<option>QnA</option>
                              </select>
                    </div>
                </div>
                <!-- 낭만 코양이 푸터 -->
                <div class = "mnFooter">
                    <div>Copyright ⓒ 낭만코양이 All rights reserved.<br>
                           with AR, CW, HK, SY, BG
                    </div>
                    
                </div>

              <footer></footer>    
	
<script>
//클릭시 글작성 Form
$(".writeBtn").click(function() {
	location.href = "writeForm.mn";
});
//클릭시 상세 글 보기
$(".mid").click(function() {
	var no = $(this).attr('id');
	location.href = "detailPage.mn?comNo="+no;
});

</script>



</body>
</html>