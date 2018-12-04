<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<header class="dogcat">
  <div class="logo"><span class="logo-title"><a href="<c:url value='/main/mainPage.mn'/>">멍하고노냥</a></span></div>
  <div class="animate"><img src="<c:url value='/resources/img/common/teddy_food_dribbble.gif'/>" /></div>
  <nav>
    <ul class="nav navbar-nav">
      <li><a href="<c:url value='/admin/notice/list.mn'/>">공지사항</a></li>
      <li><a href="<c:url value='/community/communityPage.mn'/>">반려인 커뮤니티</a></li>
      <li><a href="<c:url value='/abs/absList.mn'/>">행동전문가</a></li>
      <c:if test= "${user.type eq 3}">
      	<li><a href="<c:url value='/admin/abs/list.mn'/>">관리자</a></li>
      </c:if>
      <li class="dropdown">
		<span class="headeralarm" id="hidden">1</span>
        <a href="#" id="user" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
        <i class="fas fa-user-circle fa-2x"></i>
        </a>
        <ul class="dropdown-menu pull-right" role="menu" id="drop zindex">
        <c:choose>
        <c:when test="${empty user.id}">
          <li><a href="<c:url value='/member/login.mn'/>">로그인</a></li>                
          <li><a href="<c:url value='/member/signup.mn'/>">회원가입</a></li>                
        </c:when>
        <c:otherwise>
          <li><a href="<c:url value='/member/MyPage.mn'/>" id="mypdage">내 정보</a></li>
		  <li><a href="<c:url value='/diary/writeform.mn'/>" id="diary">마이펫 다이어리</a></li>
		  <li><a href="<c:url value='/facechat/test.mn'/>" id="diary">영상통화 연습</a></li> 
		 <li><a href="<c:url value='/msg/msgsend.mn'/>" id="msg">쪽지함<span class="lialarm msg" id="hidden">1</span></a></li>
		  <li><a href="<c:url value='/friend/friendlist.mn'/>" id="friend">내 친구<span class="lialarm friend" id="hidden">1</span></a></li>
		  <!-- <li><a href="#">내 활동<span class="lialarm" id="hidden">1</span></a></li> -->
		  <li><a href="#1" class="pointcharge" id="point">포인트 충전<span class="lialarm point" id="hidden">1</span></a></li>
		  <li class="divider"></li>
		  <li><a href="<c:url value='/member/logout.mn'/>" id="logout" >로그아웃</a></li>
        </c:otherwise>
        </c:choose>
          
        </ul>
      </li>
     </ul>
   </nav>
  <div class="clear-fix"></div>
</header>
<script>
	var ws = null;
	var callerId = null;
	var $friendSpan = $("span.friend");
	var $headerSpan = $("span.headeralarm");
	var $msgSpan = $("span.msg");
	var $pointSpan = $("span.point");
	
	$(function() {
		selectFriendRequest("${user.id}")
		
		ws = new WebSocket('wss://localhost:443/nmcat/alarm.mn');
		//ws = new WebSocket('wss://192.168.0.63:443/nmcat/alarm.mn');
		//ws = new WebSocket('wss://10.0.1.5:443/nmcat/alarm.mn');
		ws.onopen = function() {
			console.log("헤더 웹소켓 서버 접속 성공");
		}
		
		ws.onmessage = function(evt){
			//alert(evt.data)
			if(evt.data.startsWith("friend:")){
				callerId = evt.data.substring("friend:".length)
				//alert(id)
				$headerSpan.attr("id", "show");
				$friendSpan.attr("id", "show")
				
			} //친구 추가..
		}
		ws.onclose = function() {
	   	    console.log("헤더 웹소켓 연결 종료.");
	    };
		 
	}) //function
	var callerList = null;
	function selectFriendRequest(userId) {
		$.ajax({
			url : "<c:url value='/friend/selectrequest.mn'/>",
			data : "calleeId=" + userId,
			type : "POST"
		}).done(function(map){
			if(map.count!=0){
				$friendSpan.attr("id", "show")
				$friendSpan.html(map.count)
				$headerSpan.attr("id", "show").html(map.count);
				callerList = map.callerList;
			}
		})
	}
	
	//동적 이벤트 적용은 document.ready안에서 작용하지 않는다.
	$("ul.dropdown-menu").on("click", "a#friend", function (e){
		if($(this).find("span").attr("id")=="show"){
			e.preventDefault();
			console.log($(this))
			
			for(let caller of callerList){

				$.notify({
					title : caller + " 님이<br> 친구 요청을<br> 하셨습니다.",
					caller : caller
				}, {
					style : "foo",
					autoHide : false,
					clickToHide : false
				}) //notify 

					
			} // caller List 대로 notify 뿌려줌..
		} // span show 일때만..
	})
	
	//foo style 만들기..
	$.notify.addStyle("foo", {
		html : "<div>" +
	      "<div class='clearfix'>" +
	        "<div class='title' data-notify-html='title'/>" +
	        "<div class='buttons'>" +
	        " <input type='hidden' name='caller' data-notify-text='caller'/>" +
	          "<button class='wait'>보류</button>" +
	          "<button class='no'>거절</button>" +
	          "<button class='yes' data-notify-text='button'>요청 수락</button>" +
	        "</div>" +
	      "</div>" +
	    "</div>"
	}) //foo addStyle
	
	//listen for click events from this style
	$(document).on('click', '.notifyjs-foo-base .no', function() {
	  answerRequest($(this).siblings("input").text(), 'n');
	  //alert($(this).prevAll("input").text() + " clicked!");
	  $(this).trigger('notify-hide');
	});
	$(document).on('click', '.notifyjs-foo-base .wait', function() {
	  //programmatically trigger propogating hide event
	  answerRequest($(this).siblings("input").text(), 'w');
	  //alert($(this).siblings("input").text() + " clicked!");
	  $(this).trigger('notify-hide');
	});
	$(document).on('click', '.notifyjs-foo-base .yes', function() {
	  //show button text
	  //alert($(this).text() + " clicked!");
	  //hide notification
	  answerRequest($(this).siblings("input").text(), 'y');
	  $(this).trigger('notify-hide');
	});
	
	function answerRequest(callerId, answer) {
		$.ajax({
			url : "<c:url value='/friend/answer.mn'/>",
			data : {
				"answer" : answer,
				"callerId" : callerId,
				"calleeId" : "${user.id}"
			},
			type : "POST"
		})
	}
	
	$("a#logout").click(function() {
		alert("로그아웃 되었습니다.")
		location.href = "<c:url value='/member/logout.mn'/>";
	});
	
	$("a.pointcharge").click(function(e){
	    var left = (screen.width-1000) /2
	    var top = (screen.height-600) /2
	    window.open(
	    	"<c:url value='/member/pointcharge.mn'/>", "payment", "width=1000, height=600, left="+left+", top="+top
	    )
	})
</script>


