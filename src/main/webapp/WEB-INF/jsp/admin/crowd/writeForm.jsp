<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp" />
<c:import url="writeFormCSSJS.jsp" />
<c:import url="../adminCommonCSSJS.jsp" />
  <!-- timepicker-->
  <link href="<c:url value="/resources/css/admin/tui-time-picker.css"/>" rel="stylesheet">
  <script src="<c:url value="/resources/js/admin/tui-time-picker.js"/>"></script>

  <!-- datepicker-->
  <link href="<c:url value="/resources/css/admin/tui-date-picker.css"/>" rel="stylesheet">
  <script src="<c:url value="/resources/js/admin/tui-code-snippet.js"/>"></script>
  <script src="  <c:url value="/resources/js/admin/tui-date-picker.js"/>"></script>

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
        <div class="log-out">LOG OUT</div>
        <div class="seperator"></div>
        <div class="list">
            <div id="board" class="item">게시판</div>
            <div class="board-hidden youtube"><a href="youtube.html">유튜브</a></div>
            <div class="board-hidden crowd-fund"><a href="crowd-funding.html">크라우드펀딩</a></div>
            <div class="board-hidden notice"><a href="notice.html">공지사항</a></div>
            <div id="management" class="item">관리</div>
            <div class="mgm-hidden abs-member"><a href="mgm-ABS.html">행동전문가</a></div>
            <div class="mgm-hidden gen-member"><a href="mgm-general.html">일반회원</a></div>
            <div id="statistics" class="item"><a href="statistics.html"style="color:black;">통계</a></div>
        </div>

      </div>
      <!-- /좌측 메뉴 -->

      <!-- 우측 콘텐츠 영역-->
      <div class="view">
        <div class="sub-title">Board > Crowd-Funding</div>
        <div class="main-title">크라우드 펀딩</div>
        <div class="seperator"></div>
        <form action="write.mn" method="POST">
        <h2>크라우드 펀딩 만들기</h2>
        <div id="calendar-area">
            <div id="datepicker">
              <div class="tui-datepicker-input tui-datetime-input tui-has-focus"  style="width:276px;">
                  <input type="text" name="" id="datepicker-input-2" aria-label="Date-Time">  <!-- 날짜파라미터 -->
                  <span class="tui-ico-date"></span>
                </div>     
                <div id="wrapper-2"></div>
              </div>
        </div>
        <div id="image-area">
          <!-- 파일첨부 -->
          <div id="page">
              <!-- Our File Inputs -->
              <div class="wrap-custom-file">
                <input type="file" name="image1" id="image1" accept=".gif, .jpg, .png" />
                <label  for="image1">
                  <span>이미지를 첨부하세요</span>
                  <i class="fa fa-plus-circle"></i>
                </label>
              </div>
          </div>
          <!-- /파일첨부 -->
        </div>
        <div id="input-area">
          <input id="cf-title" type="text" class="form-control" name="crTitle" placeholder="제목을 입력하세요"/><br>
          <textarea id="cf-textarea" class="form-control" name="crContent" rows=14 placeholder="내용을 입력하세요" ></textarea><br>
          <div>
            <input id="input-money" class="form-control" type="text" placeholder="목표 금액을 입력하세요"  id="recycle_result_amt" value="" onkeyup="inputNumberFormat(this)" />
            <button type="button" class="btn btn-default btn-default">초기화</button>
          </div>
          </div>
          

              <div id="button-area">
                <button class="btn btn-default btn-lg">등록</button>
                  &nbsp;
                <button type="button" class="btn btn-default btn-lg">취소</button>
              </div>
            </form>
          </div>
          <!-- /우측 콘텐츠 영역-->
        </div>
        <div class="clear-fix"></div>
        
      </div>
	<!-- end -->
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
	
	  <script>
    // 헤더푸터
      // $("#header").load("../headfoot/header.html"); 
      // $("#footer").load("../headfoot/footer.html");

    $(document).ready(function() {
      $("#board").addClass("selected");
      $(".board-hidden").toggle();
      $(".crowd-fund").css("font-weight", "bold");
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
           
    var datepicker2 = new tui.DatePicker('#wrapper-2', {
        date: new Date(),
        language: 'ko',
        input: {
            element: '#datepicker-input-2',
            format: 'yyyy-MM-dd HH:mm A'
        },
        timepicker: {
            layoutType: 'tab',
            inputType: 'spinbox',
        },
        showAlways: true
    });
    
    </script>

    <script>
      // 금액 쉼표
      function inputNumberFormat(obj) { 
        obj.value = comma(uncomma(obj.value)); 
      } 

      function comma(str) { 
          str = String(str); 
          return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
      } 

      function uncomma(str) { 
          str = String(str); 
          return str.replace(/[^\d]+/g, ''); 
      }
    </script>

  <script>
    // 파일업로드
    $('input[type="file"]').each(function(){
  // Refs
  var $file = $(this),
      $label = $file.next('label'),
      $labelText = $label.find('span'),
      labelDefault = $labelText.text();
  
  // When a new file is selected
  $file.on('change', function(event){
    var fileName = $file.val().split( '\\' ).pop(),
        tmppath = URL.createObjectURL(event.target.files[0]);
    //Check successfully selection
		if( fileName ){
      $label
        .addClass('file-ok')
        .css('background-image', 'url(' + tmppath + ')');
			$labelText.text(fileName);
    }else{
      $label.removeClass('file-ok');
			$labelText.text(labelDefault);
    }
  });
  
  // End loop of file input elements  
  });
    </script>
</body>
</html>