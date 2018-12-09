<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp" />
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="youtubeCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>
	
	<!-- start -->

  <div id="container">
    <div class="panel">
      <!-- 좌측 메뉴 -->
      <div class="aside">
        <div class="avatar"><a href="admin1.html"><img src="https://66.media.tumblr.com/avatar_faa95867d2b3_128.png" /></a></div>
        <br>
        <div class="seperator"></div>
        <div class="list">
          	 <div id="board" class="item">게시판</div>
	         <div class="board-hidden notice"><a href="<c:url value="/admin/notice/list.mn" />">공지사항</a></div>
	         <div class="board-hidden youtube"><a href="<c:url value="/admin/youtube/youtube.mn" />">유튜브</a></div>
	         <div class="board-hidden crowd-fund"><a href="<c:url value="/admin/crowd/list.mn" />">크라우드펀딩</a></div>
	         <div id="management" class="item">관리</div>
	         <div class="mgm-hidden abs-member"><a href="<c:url value="/admin/abs/list.mn" />">행동전문가</a></div>
	         <div class="mgm-hidden gen-member"><a href="<c:url value="/admin/general/list.mn" />">일반회원</a></div>
	         <div id="statistics" class="item"><a href="<c:url value="/admin/statistics/day.mn" />" style="color:black;">통계</a></div>
        </div>

      </div>
      <!-- /좌측 메뉴 -->

      <!-- 우측 콘텐츠 영역-->
      <div class="view">
        <div class="sub-title">Board > Youtube</div>
        <div class="main-title">유튜브</div>
        <div class="seperator"></div>

        <!-- 리스트 -->
        <div class="list-container">
          <div class="list-row">
            <input class="list-input" type="text" placeholder="추가할 검색어를 입력하세요">
            <div class="input-buttons">
              <a href="#" class="clear-text"><i class="fa fa-trash fa-2x"></i></a>
              <a href="#" class="add-todo"><i class="fa fa-plus fa-2x"></i></a>
            </div> <!-- div.input-buttons-->
          </div> <!-- div.row -->
          <div class="list-row">
            <div class="list-error">
              <a href="#"><i class="fa fa-times"></i></a>
              <p>검색어를 입력해주세요</p>
            </div> <!-- div.error -->
            <!-- Start to-do list -->
            <ul class="todo-list">
            </ul>
          </div> <!-- div.row -->
        </div> <!-- div#container -->
        <!-- /리스트 -->

        <div id="youtube-area" style="margin-top:10px; width:100%;">
        
        </div>

      </div>
      <!-- /우측 콘텐츠 영역 view-->
    </div>
    <!-- /pannel-->
    <div class="clear-fix"></div>
  </div>
  <!-- /pannel-->
  
	
	<!-- end -->
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
  <script>
    $(document).ready(function () {
      $("#board").addClass("selected");
      $(".board-hidden").toggle();
      $(".youtube").css("font-weight", "bold");
    })

    //좌측 메뉴 스크립트


    $("#board").click(function () {
      $(".board-hidden").slideToggle(500);
    })

    $("#management").hover(function () {
      $(this).addClass("selected");
    })

    $("#management").click(function () {
      $(".mgm-hidden").slideToggle(500);
    })

    $("#statistics").hover(function () {
      $(this).addClass("selected");
    })

    $(".item").mouseleave(function () {
      $(this).removeClass("selected");
    })
  </script>

  <script>
  // 랜덤 문자열 생성
    function randomString() {
        var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
        var string_length = 8;
        var randomstring = '';
        for (var i=0; i<string_length; i++) {
        var rnum = Math.floor(Math.random() * chars.length);
        randomstring += chars.substring(rnum,rnum+1);
      }
      //document.randform.randomfield.value = randomstring;
      return randomstring;
    }

    //==================== todo list =========================
    $(function () {

     

      // Input gains focus on document ready
      //$('input').focus();
      var html = "";
      // Define function to add tasks to list
      function addTodo() {
        var randomStr = randomString();

        if ($('.list-input').val().trim() == "") {
          // Show error message
          $('.list-error').fadeIn(200);
        } else {
          // Hide error message
          $('.list-error').hide();

          // Get input value
          var $todo = $('.list-input').val();

          // Create new list item
          if($(".todo").text().includes($todo)) {
            alert("이미 등록된 검색어입니다.");
            $('.list-input').val("");
            return; 
          } 

          var $newListItem = $('<li class="todo">' + $todo + '<span class="list-span">' +
            '<a href="#" data-random="'+ randomStr +'" class="delete-todo">' + '<i class="fa fa-trash fa-lg"></i>' + '</a>' +
            '<input type="hidden" value="' + randomStr + '">' +
            '</span>' + '</li>');

          // Add list item to end of list
          var $addListItem = $('.todo-list').append($newListItem);

          // Hide list item before fading it into view
          $newListItem.hide().fadeIn(500);

          // Refocus input box for next task
          $('.list-input').val("").focus();


          if($("#youtube-area").text().includes($todo)) return;

           html =  "<div class='"+ randomStr +"' style='margin-bottom: 50px;'>"
                + "<div class='content-title'><h1>" + $todo + "</h1></div>" 

            /* ------------------------- 유튜브api ---------------------------- */
            function getRequest(searchTerm) {
                var url = 'https://www.googleapis.com/youtube/v3/search';
                var params = {
                    part: 'snippet',
                    key: 'AIzaSyBhomSVCcyHNr7jCxxVe04ITSZXYqg0wHY',
                    q: searchTerm,
                    regionCode:"KR",
                    type: "video",
                    videoEmbeddable: "true",
                    maxResults:2
                };
                $.getJSON(url, params, showResults);
            }

            function showResults(results) {
                console.log(results)
                var result ="";
                var entries = results.items;
                
                $.each(entries, function (index, value) {
                    var title = value.snippet.title;
                    var thumbnail = value.snippet.thumbnails.default.url;
                    var videoId = value.id.videoId;
                    
                    result += '<iframe id="'+ videoId +'" type="text/html" style="margin-right:10px;" width="48%" height="360" src="http://www.youtube.com/embed/' + videoId + '?enablejsapi=1" frameborder="0"></iframe>'
                  }); 
                  $("." + randomStr).append(result);
            }

            html +=   "</div>"

            console.log(html)

            getRequest($todo)

            /* ------------------------- /유튜브api ---------------------------- */
          
          $("#youtube-area").append(html);
          
            console.log($todo);
        }
      };

      // Clear error message when 'x' icon is clicked
      $('i.fa-times').on('click', function () {
        $('.list-error').hide();
      });

      // Call addTodo function on click
      $('.add-todo').on('click', addTodo);


      // Call addTodo function when enter key is pressed
      $(document).on('keypress', function (e) {
        if (e.which == 13) {
          addTodo();
        }
      });


      // Clear typed text and refocus input box
      $('.clear-text').on('click', function (e) {
        e.preventDefault();
        $('.list-input').val("").focus();
      });


      // Mark list item complete
      $(document).on('click', '.check', function (e) {
        e.preventDefault();
        $(this).closest('li').toggleClass('complete');
      });


      // Fade list item and delete from DOM
      $(document).on('click', '.delete-todo', function (e) {
        e.preventDefault();
        $(this).closest('li').fadeOut(500, function () {
          $(this).remove();
        });

        console.log($(this).siblings('input').val());

        $('div.' + $(this).data('random')).remove();
      });

    });

    
  </script>
</body>
</html>