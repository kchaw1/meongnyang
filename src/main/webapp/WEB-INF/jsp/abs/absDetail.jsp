<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
          <div class="hero" style="background:linear-gradient(to bottom, rgba(0, 0, 0, 0.4) 0%, rgba(0, 0, 0, 0) 30%),url(<c:url value='/common/download.mn?sysName=${map.b.imageName}&path=${map.b.imagePath}&oriName=${map.b.imageOriName}'/>);
          background-size: cover;
  		  background-position: center;">
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
                  <a href="#" id="dofacechat">1:1 화상채팅하기</a>
                  <form name="dochat" >
	                  <%-- <input type="hidden" name="no" value="${map.b.no}"/> --%>
	                  <input type="hidden" name="name" value="${map.b.name}"/>
	                  <input type="hidden" name="id" value="${map.b.id}"/>                  
                  </form>
                
                </li>
                <li>
                  <a href="absDetailBoard.mn?no=${map.b.no}">질문게시판</a>
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
            <span id="rc" style="float:right;">like</span>
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
        /* document.addEventListener('DOMContentLoaded', function() {
         var likeButton = document.getElementById('like-button');
        likeButton.addEventListener('click', function() {
         window.lb = likeButton;
          likeButton.classList.toggle('selected');
       });
        }, false); */ 
        /*좋아요 개수*/
        $('.counter').each(function() {
  var $this = $(this),
      countTo = $this.attr('data-count');
  
  $({ countNum: $this.text()}).animate({
    countNum: countTo
  },{duration: 4000,
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
    	likeCount();
		
    	//--------------------------------------------------------------------------------------------------
    			var absLikeCnt = ${map.b.absLikeCnt};
    		
    			$("#like-button").click(function(){
    				var LUrl = "insertLike";
    			if (likeExist == 1) {
    				LUrl = "deleteLike";
    			}
    			
    			$.ajax({
    				url : '/nmcat/abs/' + LUrl + '.mn',
    				data : {"no" : "${map.b.no}","id":"${user.id}"}
    			
    			}).done(function(){
    				if (likeExist == 0){
    					likeExist=1;
    					alert("추천되었습니다.");
    					$("#like-button").html("<button type='button' id='like-button' class='selected'><svg class='heart-icon' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><path d='M91.6 13A28.7 28.7 0 0 0 51 13l-1 1-1-1A28.7 28.7 0 0 0 8.4 53.8l1 1L50 95.3l40.5-40.6 1-1a28.6 28.6 0 0 0 0-40.6z'/></svg></button>Like");
    				} else {
    					likeExist = 0;
    					alert("추천취소되었습니다.");
    					$("#like-button").html("<button type='button' id='like-button'><svg class='heart-icon' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><path d='M91.6 13A28.7 28.7 0 0 0 51 13l-1 1-1-1A28.7 28.7 0 0 0 8.4 53.8l1 1L50 95.3l40.5-40.6 1-1a28.6 28.6 0 0 0 0-40.6z'/></svg></button>Like");
    				}
    				like();
    				location.href="absDetail.mn?no=${map.b.no}";
    			});
    			
    			function like () {			
    			$.ajax({
    				url: "<c:url value='/abs/like.mn'/>",
    				data : {"no" : "${map.b.no}"}
    			}).done(function(result){
    				$("#rc").html(result);
    			});
    			}
    			
    		});
    	 
    	 		var likeExist;
    	 
    			function likeCount(){
    				$.ajax({
    					url: "<c:url value='/abs/likecount.mn'/>",
    					data : {"no" : "${map.b.no}","id":"${user.id}"}
    				}).done(function(result){
    					likeExist = result;
    					if (likeExist == 1){
        					$("#like-button").html("<button type='button' id='like-button' class='selected'><svg class='heart-icon' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><path d='M91.6 13A28.7 28.7 0 0 0 51 13l-1 1-1-1A28.7 28.7 0 0 0 8.4 53.8l1 1L50 95.3l40.5-40.6 1-1a28.6 28.6 0 0 0 0-40.6z'/></svg></button>Like");
    					} else {
        					$("#like-button").html("<button type='button' id='like-button'><svg class='heart-icon' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><path d='M91.6 13A28.7 28.7 0 0 0 51 13l-1 1-1-1A28.7 28.7 0 0 0 8.4 53.8l1 1L50 95.3l40.5-40.6 1-1a28.6 28.6 0 0 0 0-40.6z'/></svg></button>Like");
    					}
    				})
    			}      
        
    			var form = document.dochat
    	        $("a#dofacechat").click(function(){
    	          var left = (screen.width-1200) /2
    			  var top = (screen.height-800) /2
    			 /*  var no = $("input#no").val();
    			  var id = $("input#id").val();
    			  var name = $("input#name").val(); */
    			  /* console.log(no)
    			  console.log(id)
    			  console.log(name) */
    		      window.open(
    		    	'', "화상채팅", "width=1200, height=800, left="+left+", top="+top
    		      )
    	        	
    		      form.action = "<c:url value='/facechat/dochat.mn'/>";
    		      form.target ="화상채팅";
    		      /* form.method = "POST" */
    		      form.submit();
    		      /* openwin.document.querySelector("#name").value = name;
    			  openwin.document.querySelector("#no").value = no; */
    		      
    	        })

        </script>
</body>
</html>