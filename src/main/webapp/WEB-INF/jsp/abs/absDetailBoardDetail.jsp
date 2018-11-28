<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <p class="logo"></p>
            <nav>
              <ul>
                <li>
                  <a href="absDetail.mn?no=${map.b.no}">경력 및 인사말</a>
                </li>
                <li>
                  <a href="#">1:1 화상채팅하기</a>
                </li>
                <li>
                  <a href="absDetailBoard.mn?no=${map.b.no}">질문게시판</a>
                </li>
              </ul>
            </nav>
          </div>
        </header>
        <section class="content">
          <h1>상세 정보</h1>
          <hr>
          <div>
          <div>
            <h4>작성자:${map.b.absWriter}</h4>
            <c:choose >
            	<c:when test="${map.b.absComplete =='n'}">
            		<button id="complete" class="btn btn-success">답변완료</button>		
            	</c:when>
            	<c:otherwise>
            		<h3 id="completeCheck"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;답변이 완료된 게시물입니다.</h3>
            	</c:otherwise>
            </c:choose>
            	</div>
            <hr>
            <h4>제목:${map.b.absTitle}</h4>
  
            <span>내용: ${map.b.absContent}</span>
          </div><br>
          <div class="optionButton">
          <button type="button" class="btn btn-primary" id="rev">이전으로</button>
           <c:if test="${map.b.absWriter == user.id }">
			<button type="button" class="btn btn-danger" id="del">삭제</button> 	
			<button type="button" class="btn btn-info update"id="update">수정</button>
		   </c:if>
		   
          </div>
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
            	 location.href="absDetailBoard.mn?no="+ ${map.b.no};
             }) 
            $("#del").click(function(){
            	 location.href="absBoardDelete.mn?absNo="+ ${map.b.absNo}+"&no="+${map.b.no};
             }) 
             
             $("#complete").click(function(){
            		 
            	 if('${map.b.no}'=='${user.no}'){
        			 alert("답변이 채택되었습니다");
        	    	 location.href="absBoardComplete.mn?absNo="+ ${map.b.absNo}+"&no="+${map.b.no};
    	    	 }else{
	        		 alert("행동전문가만 답변을 채택할 수 있습니다.");
            	 }
             })
          
        </script>
</body>
</html>