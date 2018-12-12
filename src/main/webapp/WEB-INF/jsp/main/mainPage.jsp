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
.container{
margin-top: 120px;
width: 100%;
height: 100%;

padding-left : 10%;
padding-right : 10%;
}
.secondContainer{
width: 100%;
height : 100%;
}
.left{
    float: left;
    
    width: 28%;
    height: 100%;
}
.center{
    float : left;
    padding-left: 80px;
    padding-right: 80px;
    width: 44%;
    height : 100%;

}
.forLine{
    width: 98%;
}

.forLine2{
    margin-top: 130px;
    width: 98%;
}
.title2{
    float: left;
    /* padding-top: 22px; */
    margin-bottom: 16px;
    font-family: 'Jua', sans-serif;
    font-size: 36px;
    line-height: 42px;
    font-weight: 400;
}

.btn2 {
  
    font-family: 'Jua', sans-serif;
   
    margin-top: 20px;
    color: #ffffff;
    float: right;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    background: #f2809f;
}

.btn3 {

    font-family: 'Jua', sans-serif;
   
    margin-top: 20px;
    color: #ffffff;
    float: right;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    background: #f2809f;
}
.btn4 {
    font-family: 'Jua', sans-serif;
   
    margin-top: 20px;
    color: #ffffff;
    float: right;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    background: #f2809f;
}

.btn5 {
    font-family: 'Jua', sans-serif;
   
    margin-top: 20px;
    color: #ffffff;
    float: right;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    background: #f2809f;
}

.btn6 {
    font-family: 'Jua', sans-serif;
   
    margin-top: 20px;
    color: #ffffff;
    float: right;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    background: #f2809f;
}
.btn7 {
    font-family: 'Jua', sans-serif;

    margin-top: 20px;
    color: #ffffff;
    float: right;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px;
    background: #f2809f;
}
.crowdImg {
    border-radius: 5px;
    
}
div.progress-bar {
    background-color: #f2809f;
	min-width:5%;
	max-width:100%;
}
.fontp {
    font-size: 16px;
    line-height: 1.625em;
    font-weight: 300;
    font-family: Jua;
    -webkit-font-smoothing: antialiased;
    word-break: keep-all;
    color: gray;
}
.fontp2{
    margin-top: -16px;
    text-align: left;
    font-size: 16px;
    line-height: 1.625em;
    font-weight: 300;
    font-family: "Noto Sans KR", sans-serif;
    -webkit-font-smoothing: antialiased;
    word-break: keep-all;
    color: gray;
    
}
.pclass {
    color: gray;
    font-size: 15px;
    font-family: Jua;
}
.caption2 {
    font-weight: bold;
    text-align: left;
    line-height: 1em;
    margin-bottom: -15px;
    width: 100px;
    display: table-caption;
}
hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
}
.caption {
    font-weight: bold;
    text-align: left;
    line-height: 1em;
    width: 100px;
    display: table-caption;
}
tbody{
        display: table-row-group;
        vertical-align: middle;
        border-color: inherit;
    }
    .main-items table{
        margin-bottom: 20px;
        table-layout: fixed;
        width: 100%;
        border-collapse: collapse;
        border: 0;
        border-top: 1px solid #111111;
        border-bottom: 1px solid #111111;

        border-spacing: 2px;
    }
    .main-items table th{
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        width: 80px;
        padding-right: 10px;
        position: relative;
        
        font-weight: 500;
        border: 0;
        height: 36px;
        font-size: 15.6px;
        text-align: center;
        
    }
    p{
        line-height: 6.5px;
      
    }

 .gold{
    color: gold;
    
    }
    .silver{
    color: silver;
    }
    .bronze{
    color: brown;
    }
    .caption{
        font-weight: bold;
        text-align: left;
        line-height: 1em;
        width: 100px;
        display: table-caption;
    }
    .caption2{
        font-weight: bold;
        text-align: left;
        line-height: 1em;
        margin-bottom: -15px;
        width: 100px;
        display: table-caption;
    }

.forLine4{
    width: 98%;
}
.pclass{
color: gray;
 line-height: 20px;
}
.fordiary{
width: 350px;
}
.forlinefor:after{

	display: block;
	clear: both;
	content:'';
}
.pclass{
color: gray;
 line-height: 20px;
}
.forlinefor{
margin-bottom: -24px;
}
.forimg{
margin-top: 60px;
}

.clear-fix{
	clear: both;
}


/* 채팅 */
.chat-launcher {
position: fixed;
bottom: 20px;
right: 20px;
width: 60px;
height: 60px;
z-index: 9999;
background: orange;
color: white;
border-radius: 50%;
cursor: pointer;
box-shadow: 0 1px 6px rgba(0, 0, 0, 0.06), 0 2px 32px rgba(0, 0, 0, 0.16);
}
.chat-launcher:before, .chat-launcher:after {
font-family: FontAwesome;
font-size: 34px;
position: absolute;
-webkit-transition: transform 180ms linear, opacity 130ms linear;
transition: transform 180ms linear, opacity 130ms linear;
}
.chat-launcher:before {
content: "\f086";

margin: 6px 0px 0px 13px;
opacity: 1;
-webkit-transform: rotate(0deg) scale(1);
transform: rotate(0deg) scale(1);
}

/*챠팅  */
.chat-launcher:after {
content: "\f00d";
padding-top: 20px;
margin: 13px 17px;
opacity: 0;
-webkit-transform: rotate(-30deg);
transform: rotate(-30deg);
}
.chat-launcher:hover {
background: #ffb329;
}
.chat-launcher.active:before {
opacity: 0;
-webkit-transform: rotate(70deg) scale(0);
transform: rotate(70deg) scale(0);
}
.chat-launcher.active:after {
opacity: 1;
-webkit-transform: rotate(0deg);
transform: rotate(0deg);
}
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
                        <c:forEach var="c" items="${crowdList}">
                            <fmt:parseNumber var="progress" value="${(c.crNowMoney/c.crGoalMoney*100)-((c.crNowMoney/c.crGoalMoney*100)%1)}" integerOnly="true"/>
	                        <div class = "crowdImg">
	                                <a href="<c:url value='/crowd/detail.mn?crNo=${c.crNo}' />"><img src="<c:url value='/common/download.mn?sysName=${c.crFileName}&path=${c.crFilePath}'/>" width="355" class = "crowdImg"></a>
	                                <p class = "fontp">${c.crTitle}</p>
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
                            <h2 class = "title2">최신동영상</h2>
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
                    <hr>
                    <c:forEach var = "b" items = "${list}">
                    <p style="font-family: 'Jua'">${b.comTitle}</p>
                    <!-- 이클립스주기 -->
                    <div class = "comComtent">${b.comContent}</div>
                    <p  class = "pclass"style="font-family: 'Jua'">${b.comWriter} <span><fmt:formatDate value = "${b.comRegDate}" pattern="yyyy-MM-dd"/></span></p>        
                    <hr>
                    </c:forEach>
                   
                    
                    <img  class = "forLine" src="<c:url value = "/resources/img/community/line.png"/>">
                    <div>
                    <h2 class = "title2">공지사항</h2>
                    <button class="btn6 leftRight1">더보기 </button>
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
    	location.href = "<c:url value = '/crowd/list.mn'/>";
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
    $(".btn5").on('click', function(){
    	location.href = "<c:url value = '/diary/share/sharediary.mn'/>?pageNo=1&userId=${user.id}";
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