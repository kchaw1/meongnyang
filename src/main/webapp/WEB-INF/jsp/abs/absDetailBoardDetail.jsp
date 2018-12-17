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
          <div class="hero" style="background:linear-gradient(to bottom, rgba(0, 0, 0, 0.4) 0%, rgba(0, 0, 0, 0) 30%),url(<c:url value='/common/download.mn?sysName=${map.a.imageName}&path=${map.a.imagePath}&oriName=${map.a.imageOriName}'/>);
          background-size: cover;
  		  background-position: center;">
            <div class="hamb-wrap">
              <div class="hamb"></div>
            </div>
            <p class="logo">${map.a.name}</p>
            <nav>
              <ul>
                <li>
                  <a href="absDetail.mn?no=${map.a.no}">경력 및 인사말</a>
                </li>
                <li>
                  <a href="#">1:1 화상채팅하기</a>
                </li>
                <li>
                  <a href="absDetailBoard.mn?no=${map.a.no}">질문게시판</a>
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
            <c:choose>
              <c:when test="${user.no==map.b.no}">
           	 	<c:choose >
            		<c:when test="${map.b.absComplete =='n'}">
            			<button id="complete" class="btn btn-success">답변완료</button>		
            		</c:when>
            		<c:otherwise>
        	    		<h3 id="completeCheck"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;답변이 완료된 게시물입니다.</h3>
    	        	</c:otherwise>
	            </c:choose>
              </c:when>
              <c:otherwise>
              	<c:choose>
              		<c:when test="${map.b.absComplete =='y'}">
        	    		<h3 id="completeCheck"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span>&nbsp;답변이 완료된 게시물입니다.</h3>
              		</c:when>
              		<c:otherwise></c:otherwise>
              	</c:choose>
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
              <c:choose>
              	<c:when test="${map.b.absComplete =='n'}">
                <form method="POST">
                  <div class="form-group">
                    <textarea id="writecomment" class="form-control status-box" rows="2" placeholder="Enter your comment here..."></textarea>
                  </div>
                </form>
                <div class="button-group pull-right">
                  <p class="counter">250</p>
                  <a href="#" class="btn btn-primary" id="post">Post</a>
              	</c:when>
              	<c:otherwise>
              	
              	</c:otherwise>
              </c:choose>
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

                if('${map.b.no}'=='${user.no}'){
            		  
                $('<li class="comment">').text(post).prependTo('.posts');
                $('.status-box').val('');
                $('.counter').text('250'); 
                $('#post').addClass('disabled');
            	  }else{
            		  $('<li class="comment">').text(post).prependTo('.posts');
                      $('.status-box').val('');
                      $('.counter').text('250'); 
                      $('#post').addClass('disabled');
            	  }
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
            $("#update").click(function(){
            	 location.href="absDetailBoardUpdate.mn?absNo="+ ${map.b.absNo}+"&no="+${map.b.no};
             }) 
             
             $("#complete").click(function(){
            		 
            	 if('${map.b.no}'=='${user.no}'){
        			 alert("답변이 채택되었습니다");
        	    	 location.href="absBoardComplete.mn?absNo="+ ${map.b.absNo}+"&no="+${map.b.no};
    	    	 }else{
	        		 alert("자기 페이지에서만 답변을 채택할 수 있습니다.");
            	 }
             })
             
             //-----------------------------------------------------------------------------
             //댓글작성
   				$("#post").click(function() {
    				$.ajax({
    					url : "<c:url value='/abs/comment/write.mn'/>",
    					data : {
    						"abscContent" :  $('.status-box').val(),
    						"absWriter" : "${user.id}",
    						"absNo" : "${map.b.absNo}",
    						"no" : "${user.no}"
    						   },
    						type : "POST"
    				}).done(function(result){
           				 	commentList();

    		});
  		 });
            //댓글 삭제
       	 $(document).on("click", "li > a" , function(e) {
         	e.preventDefault();
         	var abscNo = $(this).attr("href");
         	if('${user.id}' !== $(this).data("writer")) {
         		alert("본인이 작성한 댓글만 삭제할 수 있습니다.")
     			return;
         	}
         	
         	$.ajax({
	            	url: "<c:url value='/abs/comment/delete.mn' />",
	            	type: "POST",
	            	data: "abscNo=" + abscNo
	            }).done(function (result) {
	            	/* console.log(result) */
	            	commentList();
	            });
         })

             //댓글 조회
    		var commentList = function(){
       
       			
    			$.ajax({
    				url : "<c:url value='/abs/comment/list.mn'/>",
    				type : "POST",
    				data : "absNo=${map.b.absNo}"
    			}).done(function(result){
    				console.log(result);
    				$("ul.posts").html("");
    					for(let i=0; i<result.length; i++){
    						console.log("A + ${map.b.absWriter}");
    						console.log("b " + result[i].absWriter);
    						console.log("C+ ${user.id}");
    						console.log("D: +${user.no}")
    						console.log("param.no +${param.no}");
    						
    						if("${param.no}" == result[i].no ){
    							
  			  					$("ul.posts").append(
									"<li class='comment' data-no="+result[i].no+" data-writer=" + result[i].absWriter + " data-no=" + result[i].abscNo +">"
									+""
									+"<span class='glyphicon glyphicon-star' aria-hidden='true' style='color:#f2809f;'></span>행동전문가의 한마디:"  
									+ result[i].abscContent
									+"<br>"
									+"<p id='commentDate'>"+result[i].abscRegDate+"</p>"
	                           		+"<a href=" + result[i].abscNo + " data-writer=" + result[i].absWriter + "><span id='deleteicon' class='glyphicon glyphicon-trash' aria-hidden='true'></span></a>"
									+"</li>"
  			  					);
    						}else{
    							$("ul.posts").append(
    									"<li class='comment'  data-no="+result[i].no+" data-writer=" + result[i].absWriter + " data-no=" + result[i].abscNo +">"
    									+""
    									+result[i].absWriter+" 한마디:"  
    									+ result[i].abscContent
    									+"<br>"
    									+"<p id='commentDate'>"+result[i].abscRegDate+"</p>"
    	                           		+"<a href=" + result[i].abscNo + " data-writer=" + result[i].absWriter + "><span id='deleteicon' class='glyphicon glyphicon-trash' aria-hidden='true'></span></a>"
    									+"</li>"
      			  					);
    						}
    			         	
    					}
    			})            	 
    		};
    		
    		//댓글뿌려주기
         	commentList();
          
        </script>
</body>
</html>