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
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
 <!-- 유튜브 iframe api -->
 <script src="https://www.youtube.com/iframe_api"></script>

<!-- 네이버 -->
<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->
</head>
<style>

</style>
<body>

<c:import url = "../common/header.jsp"/>

 <div class = "container">
        <div class = "secondContainer">
            <!--왼쪽-->
            <div class = "left">
                <div class = "item">
                 <img  class = "forLine" src="<c:url value = "/resources/img/community/line.png"/>">
                
                        <div>
                        <h2 class = "title2">크라우드 펀딩</h2>
                        <button class="btn2 leftRight1">더보기 </button>
                        </div>
						<div class="clear-fix"></div>
                            <!--첫번째 클라우드 펀딩-->
                        <c:forEach var="c" items="${crowdList}" varStatus="status">
                            <fmt:parseNumber var="progress" value="${(c.crNowMoney/c.crGoalMoney*100)-((c.crNowMoney/c.crGoalMoney*100)%1)}" integerOnly="true"/>
	                        <div class = "crowdImg">
	                                <a href="<c:url value='/crowd/detail.mn?crNo=${c.crNo}' />"><img src="<c:url value='/common/download.mn?sysName=${c.crFileName}&path=${c.crFilePath}'/>" width="100%" class = "crowdImg"></a>
	                                <p class ="fontp">${c.crTitle}</p>
	                                <span class ="remain-days">D - ${remainDays[status.index]}</span>
	                                <div class="progress">
	                                       <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: ${progress}%;">
	                                       		${progress}%
	                                       </div>
	                                </div>
	                        </div>
                        </c:forEach>
                    </div> <!-- end item-->

                    <div class = "item">
                            <img  class = "forLine" src="<c:url value = "/resources/img/community/line.png"/>">
                            <div>
                            <h2 class = "title2">추천 동영상</h2>
                            <button class="btn3 leftRight1">더보기 </button>
                            </div>
                            <div class="clear-fix"></div>
                            	<c:forEach var="ytb" items="${youtubeList}">
		                            <div class= "youtube">
			                                <p class="pclass">${ytb.ytbKeyword}</p>
			                                <div class = "youtube"><iframe type="text/html" style="margin-right:10px;" width="100%" height="180" src="${ytb.ytbURL}" allowfullscreen="allowfullscreen" frameborder="0"></iframe></div>
			                                <br>
		                            </div>
                                </c:forEach>
                    </div>

            </div>


            <!--가운데-->
            <div class = "center">
            
          
				<div>
                    <img src="<c:url value = "/resources/img/community/main-outlink-store.png"/>" class ="forimg2">
                </div>
                    <div class = "forlinefor">
                    <img class ="forimg" src="<c:url value = "/resources/img/community/line.png"/>" width="100%";>
                    <h2 class = "title2">커뮤니티</h2>
                    <button class="btn4 leftRight1">더보기 </button>
                    </div>
                    <br>
                    <br>
                    <div class="fontp2">낭만코양이 회원들과 일상, 팁, 사진 등을 공유해 보세요!</div>

                    <div class = "caption2" style="font-family: 'Jua'">최신글</div>
                    <hr class = "forhr">
                    <c:forEach var = "b" items = "${list}">
                    <p style="font-family: 'Jua'">${b.comTitle}</p>
                    <!-- 이클립스주기 -->
                    <div class = "comComtent">${b.comContent}</div>
                    <p  class = "pclass"style="font-family: 'Jua'">${b.comWriter} <span><fmt:formatDate value = "${b.comRegDate}" pattern="yyyy-MM-dd"/></span></p>        
                    <hr class = "forhr">
                    </c:forEach>
                   
                    
                    <img  class = "forLine" src="<c:url value = "/resources/img/community/line.png"/>">
                    <div>
	                    <h2 class = "title2">공지사항</h2>
	                    <button class="btn6 leftRight1">더보기 </button>
	                    <div class="clear-fix"></div>
                    	<c:forEach var="n" items="${noticeList}">
                    			<div class="notice-title"><a href="<c:url value="/notice/detail.mn?ntcNo=${n.ntcNo}" />">${n.ntcTitle}</a></div>
                    			<div class="notice-reg-date"><fmt:formatDate value="${n.ntcRegDate}" pattern="yyyy-MM-dd" /></div>
                    			<div class="clear-fix"></div>
                    	</c:forEach>
                    </div>
                            

            </div>
            <!--오른쪽-->
            <div class = "left">
                    
                            <div><img  class = "forLine" src="<c:url value = "/resources/img/community/line.png"/>">
                            <h2 class = "title2">마이펫 다이어리</h2>
                            <button type="button" class="btn5 leftRight1">더보기 </button>
                            </div>
                    <img src="<c:url value = "/resources/img/community/diary.jpg"/>" class = "fordiary">
                    <p class="fontp">멍멍냥냥이들과 함께 만들어가는 일기 지금 당장 써보세요!</p>

                    <div class = "caption2" style="font-family: 'Jua'">공개글</div>
                            <c:forEach var = "d" items = "${list2}">
                            <hr class = "forhr">
                            <p style="font-family: 'Jua'">${d.drTitle}</p>
                            <!-- 이클립스주기 -->
                            <div class = "drContent">${d.drContent}</div>
                            <p class ="forColor"style="font-family: 'Jua'">${d.drWriter} <span><fmt:formatDate value = "${d.drRegDateTime}" pattern="yyyy-MM-dd"/></span></p>
                        </c:forEach>





                        <div class = "main-items main-items2">
                                <div><img  class = "forLine" src="<c:url value = "/resources/img/community/line.png"/>">
                                    <h2 class = "title2">랭킹</h2>
                                    <button class="btn7 leftRight1">더보기 </button>
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
            </div>
        </div>

      </div>



   
	            <div class="chat-launcher" onclick="doChatList()"></div>
	            
    		 <c:import url = "../common/footer.jsp"/>
    
  <script>
    // 크라우드펀딩으로 가는 url
    $(".btn2").on('click', function(){
    	location.href = "<c:url value ='/crowd/list.mn'/>";
    });
    // 최신동영상으로 가는 url
    $(".btn3").on('click', function(){
    	location.href = "<c:url value ='/youtube/list.mn'/>";
    });
    // 커뮤니티로 가는 url
    $(".btn4").on('click', function(){
    	location.href = "<c:url value ='/community/communityPage.mn' />";
    });
    // 마이펫다이어리로 가는 url
    $(".btn5").on('click', function(){
    	location.href = "<c:url value = '/diary/share/sharediary.mn'/>?pageNo=1&userId=${user.id}";
    });
    // 공지사항으로 가는 url
    $(".btn6").on('click', function(){
    	location.href = "<c:url value ='/notice/list.mn' />";
    });
    // 랭킹으로 가는 url
    /* $(".btn5").on('click', function(){
    	location.href = "communityPage.mn";
    }); */
    
    function doChatList() {
    	if("${user.no}" != null ){
    		
       	window.open("<c:url value='/chat/chatRoom.mn?no=${user.no}' />", "chatList", "width=400, height=600, scrollbars=yes");
    	}else{
    		alert("채팅을 하려면 로그인을 해주십시오.");
    	}
    }
    
    
    $(function(){
    	var contentList = document.querySelectorAll(".drContent");
    			console.log(contentList);
    	for(let content of contentList){
    		console.log($(content))
    		$content = $(content);
    		if($content.html().indexOf("img")!=-1){
    		  	$content.find("img").remove();
    	}	
    }}); 

    $(function(){
    	var contentList = document.querySelectorAll(".comComtent");
    			console.log(contentList);
    	for(let content of contentList){
    		console.log($(content))
    		$content = $(content);
    		if($content.html().indexOf("img")!=-1){
    		  	$content.find("img").remove();
    	}	
    }}); 

        </script>
<script>
var naver_id_login = new naver_id_login("yf6XqSXCa0vHUbfIL8Ll", "http://localhost:8000/nmcat/member/login.mn");
// 접근 토큰 값 출력
/* alert(naver_id_login.oauthParams.access_token); */
// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");
// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
  var email = naver_id_login.getProfileData('email');
  var name = naver_id_login.getProfileData('name');
  window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/nmcat/member/naverlogin.mn?email=" + email+ "&name="+name); // 파라미터값 연결
}
</script>

</body>
</html>