<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="absListCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>
	
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
          <div class="mgm-hidden abs-member"><a href="<c:url value="/admin/abs/list.mn" />">행동전문가</a></div>
          <div class="mgm-hidden gen-member"><a href="mgm-general.html">일반회원</a></div>
          <div id="statistics" class="item"><a href="statistics.html" style="color:black;">통계</a></div>
        </div>

      </div>
      <!-- /좌측 메뉴 -->

      <!-- 우측 콘텐츠 영역-->
      <div class="view">
        <div class="sub-title">Management > ABS</div>
        <div class="main-title">행동전문가</div>
        <div class="seperator"></div>
        <div class="tabs">
          <ul>
            <li><a href="#tabs-1">행동전문가</a></li>
            <li><a href="#tabs-4">승인대기중</a></li>
          </ul>
          <div id="tabs-1">
            <h2>목록</h2>
            <div class="search-area">
                <div class="search">
                  <input type="text" id="y-keyword" name="name" class="form-control" placeholder="검색할 이름을 입력하세요">
                </div>
                &nbsp;
                <div class="btn-area">
                  <button id="searchYBtn" class="btn btn-default">검색</button>
                </div>
            </div>
			<br>                            
            <div class="clear-fix"></div>
            <div class="header-area">
              <div class="no-area">회원번호 <a href="#"><i class="fas fa-sort no" data-sort="1"></i></a></div>
              <div class="id-area">아이디 <a href="#"><i class="fas fa-sort id" data-sort="2"></i></a></div>
              <div class="name-area">이름 <a href="#"><i class="fas fa-sort name" data-sort="3"></i></a></div>
              <div class="sign-area">가입일 <a href="#"><i class="fas fa-sort sign_up_date" data-sort="4"></i></a></div>
              <div class="recent-area">최근접속일 <a href="#"><i class="fas fa-sort login_date_time" data-sort="login_date_time"></i></a></div>
              <div class="active-area">활동점수 <a href="#"><i class="fas fa-sort score" data-sort="5"></i></a></div>
              <div class="point-area">포인트 <a href="#"><i class="fas fa-sort point" data-sort="6"></i></a></div>
            </div>
            <div class="clear-fix"><hr></div>
             
          </div>
          <div id="tabs-4">
            <div>
              <h2>승인대기중</h2>
              <div class="search-area">
                  <div class="search">
                  	<input type="text" id="n-keyword" name="name" class="form-control" placeholder="검색할 이름을 입력하세요">
                  </div>
                  &nbsp;
                  <div class="btn-area">
                  	<button id="searchNBtn" class="btn btn-default">검색</button>
                  </div>
              </div>
              <br>
              <div class="clear-fix"></div>
              <div class="header-area">
	              <div class="no-area">회원번호 <a href="#"><i class="fas fa-sort no" data-sort="1"></i></a></div>
	              <div class="id-area">아이디 <a href="#"><i class="fas fa-sort id" data-sort="2"></i></a></div>
	              <div class="name-area">이름 <a href="#"><i class="fas fa-sort name" data-sort="3"></i></a></div>
	              <div class="sign-area">가입일 <a href="#"><i class="fas fa-sort sign_up_date" data-sort="4"></i></a></div>
	              <div class="recent-area">최근접속일 <a href="#"><i class="fas fa-sort login_date_time" data-sort="login_date_time"></i></a></div>
	              <div class="active-area">활동점수 <a href="#"><i class="fas fa-sort score" data-sort="5"></i></a></div>
	              <div class="point-area">포인트 <a href="#"><i class="fas fa-sort point" data-sort="6"></i></a></div>
              <div class="clear-fix"><hr></div>
                  
                </div>
            </div>
          </div>
          <!-- /우측 콘텐츠 영역-->
        </div>
        <div class="clear-fix"></div>
        </div>
        </div>
        </div>
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
	
	<script>
	
	var pageNo = 1;
	
	$(document).ready(function () {
		
		      ajaxYList(pageNo,1);
		      ajaxNList(pageNo,1);

		  $(document).scroll(function() {
			    var maxHeight = $(document).height();
			    var currentScroll = $(window).scrollTop() + $(window).height();

			    if (maxHeight <= currentScroll + 120) {
			      ajaxYList(++pageNo);
			      ajaxNList(++pageNo);
			      console.log(pageNo)
			    }
			 })
	})
	
	var ajaxYList = function(pageNo, sort) { 
		$.ajax({
       		url: "<c:url value='/admin/abs/printYList.mn'/>",
       		type: "POST",
       		data: {
       				"pageNo" : pageNo,
       				"sort" : sort
       			  }
        }).done(function (result) {
	    	   console.log(result)
	    	   
	    	   var html ="";
	    	   for(var i in result.yList) {
	    		   
		       html +=     "<div class='content-area'>"
			            +  "<div class='no-area'>"+ result.yList[i].no +"</div>"
			            +  "<div class='id-area'>"+ result.yList[i].id +"</div>"
			            +  "<div class='name-area'>"+ result.yList[i].name +"</div>"
			            +  "<div class='sign-area'>"+ result.yList[i].signUpDate +"</div>"
			            +  "<div class='recent-area'>"+ result.yRLDList[i] + "</div>"
			            +  "<div class='active-area'>"+ result.yList[i].score +"</div>"
			            +  "<div class='point-area'>"+ result.yList[i].point +"</div>"
			            +  "<button class='btn btn-default btn-sm move-detail' data-no='" + result.yList[i].no + "' data-id='" + result.yList[i].id + "'>상세</button> "
			            +  "<button class='btn btn-default btn-sm delete' data-no="+ result.yList[i].no +">탈퇴</button>"
			            +  "</div>"
			            +  "<div class='clear-fix'></div>"
	    	   }
				$("#tabs-1").append(html);			          
        });
	} // ajaxYList
	
	var ajaxNList = function(pageNo, sort) { 
		$.ajax({
       		url: "<c:url value='/admin/abs/printNList.mn'/>",
    	   type: "POST",
      		   data: {
	       				"pageNo" : pageNo,
	       				"sort" : sort
	       			  }
        }).done(function (result) {
	    	   console.log(result)
	    	   var html ="";
	    	   for(var i in result.nList) {
	    		   
		       html +=     "<div class='content-area'>"
			            +  "<div class='no-area'>"+ result.nList[i].no +"</div>"
			            +  "<div class='id-area'>"+ result.nList[i].id +"</div>"
			            +  "<div class='name-area'>"+ result.nList[i].name +"</div>"
			            +  "<div class='sign-area'>"+ result.nList[i].signUpDate +"</div>"
			            +  "<div class='recent-area'>"+ result.nRLDList[i] + "</div>"
			            +  "<div class='active-area'>"+ result.nList[i].score +"</div>"
			            +  "<div class='point-area'>"+ result.nList[i].point +"</div>"
			            +  "<button class='btn btn-default btn-sm move-detail' data-no='" + result.nList[i].no + "' data-id='" + result.nList[i].id + "'>상세</button> "
			            +  "<button class='btn btn-default btn-sm delete' data-no="+ result.nList[i].no +">탈퇴</button>"
			            +  "</div>"
			            +  "<div class='clear-fix'></div>"
	    	   }
				$("#tabs-4").append(html);			          
        });
	} // ajaxNList
	
	
	var ajaxYSearchList = function(pageNo, sort) { 
		$.ajax({
       		url: "<c:url value='/admin/abs/ySearch.mn'/>",
    	   type: "POST",
   		   data: {
   			   		"pageNo" : pageNo,
   			   		"authState" : 'y',
   			   		"name" : $("#y-keyword").val(),
   			   		"sort" : sort
   		   		 }
        }).done(function (result) {
	    	   console.log(result)
	    	   var html ="";
	    	   for(var i in result.searchYList) {
	    		   
		       html +=     "<div class='content-area'>"
			            +  "<div class='no-area'>"+ result.searchYList[i].no +"</div>"
			            +  "<div class='id-area'>"+ result.searchYList[i].id +"</div>"
			            +  "<div class='name-area'>"+ result.searchYList[i].name +"</div>"
			            +  "<div class='sign-area'>"+ result.searchYList[i].signUpDate +"</div>"
			            +  "<div class='recent-area'>"+ result.searchYRLDList[i] + "</div>"
			            +  "<div class='active-area'>"+ result.searchYList[i].score +"</div>"
			            +  "<div class='point-area'>"+ result.searchYList[i].point +"</div>"
			            +  "<button class='btn btn-default btn-sm move-detail' data-no='" + result.searchYList[i].no + "' data-id='" + result.searchYList[i].id + "'>상세</button> "
			            +  "<button class='btn btn-default btn-sm delete' data-no="+ result.searchYList[i].no +">탈퇴</button>"
			            +  "</div>"
			            +  "<div class='clear-fix'></div>"
	    	   }
				$("#tabs-1").append(html);			          
        });
	} // ajaxYSearchList
	
	var ajaxNSearchList = function(pageNo, sort) { 
		$.ajax({
       		url: "<c:url value='/admin/abs/nSearch.mn'/>",
    	   type: "POST",
   		   data: {
   			   		"pageNo" : pageNo,
   			   		"authState" : 'n',
   			   		"name" : $("#n-keyword").val(),
   			   		"sort" : sort
   		   		 }
        }).done(function (result) {
	    	   console.log(result)
	    	   var html ="";
	    	   for(var i in result.searchNList) {
	    		   
		       html +=     "<div class='content-area'>"
		    	    +  "<div class='no-area'>"+ result.searchNList[i].no +"</div>"
		    	    +  "<div class='id-area'>"+ result.searchNList[i].id +"</div>"
		            +  "<div class='name-area'>"+ result.searchNList[i].name +"</div>"
		            +  "<div class='sign-area'>"+ result.searchNList[i].signUpDate +"</div>"
		            +  "<div class='recent-area'>"+ result.searchNRLDList[i] + "</div>"
		            +  "<div class='active-area'>"+ result.searchNList[i].score +"</div>"
		            +  "<div class='point-area'>"+ result.searchNList[i].point +"</div>"
		            +  "<button class='btn btn-default btn-sm move-detail' data-no='" + result.searchNList[i].no + "' data-id='" + result.searchNList[i].id + "'>상세</button> "
		            +  "<button class='btn btn-default btn-sm delete' data-no="+ result.searchNList[i].no +">탈퇴</button>"
			            +  "</div>"
			            +  "<div class='clear-fix'></div>"
	    	   }
				$("#tabs-4").append(html);			          
        });
	} // ajaxNSearchList
	
	/*
	var ajaxDeleteMember = function(no) {
				$.ajax ({
					url: "<c:url value='/admin/abs/delete.mn'/>",
			    	   type: "POST",
		       		   data: "no=" + no
				}).done(function(result) {
					ajaxYList(pageNo);
				})
	} // ajaxDeleteMember
	*/
	
	// 상세 버튼 클릭
	$(document).on("click", ".move-detail", function() {
		location.href = "detail.mn?no=" + $(this).data("no") + "&id=" + $(this).data("id");
	});
	
	// 삭제 버튼 클릭
	$(document).on("click", ".delete", function() {
		location.href = "delete.mn?no=" + $(this).data("no");
		//ajaxDeleteMember($(this).data("no"));
	});
	
	// 승인페이지에서 검색
	$("#searchYBtn").click(function() {
		$("#tabs-1 > .content-area").remove();
		ajaxYSearchList(1);
	})
	
	// 미승인페이지에서 검색
	$("#searchNBtn").click(function() {
		$("#tabs-4 > .content-area").remove();
		ajaxNSearchList(1);
	})
	
	// 정렬
	$(".no").click(function() { // 번호순		
		 if($(this).closest("div#tabs-1").length == 1) {
			 $("#tabs-1 > .content-area").remove();
			 ajaxYList(1,$(this).data("sort"));
			 
			 return;
		 } 
			 $("#tabs-4 > .content-area").remove();
			 ajaxNList(1,$(this).data("sort"));
	})
	$(".id").click(function() { // 아이디순
		if($(this).closest("div#tabs-1").length == 1) {
			 $("#tabs-1 > .content-area").remove();
			 ajaxYList(1,$(this).data("sort"));
			 
			 return;
		 } 
			 $("#tabs-4 > .content-area").remove();
			 ajaxNList(1,$(this).data("sort"));
	})
	$(".name").click(function() { // 이름순
		if($(this).closest("div#tabs-1").length == 1) {
			 $("#tabs-1 > .content-area").remove();
			 ajaxYList(1,$(this).data("sort"));
		 } else {
			 $("#tabs-4 > .content-area").remove();
			 ajaxNList(1,$(this).data("sort"));
		 }
	})
	$(".sign_up_date").click(function() { // 가입일순
		if($(this).closest("div#tabs-1").length == 1) {
			 $("#tabs-1 > .content-area").remove();
			 ajaxYList(1,$(this).data("sort"));
		 } else {
			 $("#tabs-4 > .content-area").remove();
			 ajaxNList(1,$(this).data("sort"));
		 }
	})
	$(".login_date_time").click(function() { // 최근접속일순
		if($(this).closest("div#tabs-1").length == 1) {
			 $("#tabs-1 > .content-area").remove();
			 ajaxYList(1,$(this).data("sort"));
		 } else {
			 $("#tabs-4 > .content-area").remove();
			 ajaxNList(1,$(this).data("sort"));
		 }
	})
	$(".score").click(function() { // 활동점수순
		if($(this).closest("div#tabs-1").length == 1) {
			 $("#tabs-1 > .content-area").remove();
			 ajaxYList(1,$(this).data("sort"));
		 } else {
			 $("#tabs-4 > .content-area").remove();
			 ajaxNList(1,$(this).data("sort"));
		 }
	})
	$(".point").click(function() { // 포인트순
		if($(this).closest("div#tabs-1").length == 1) {
			 $("#tabs-1 > .content-area").remove();
			 ajaxYList(1,$(this).data("sort"));
		 } else {
			 $("#tabs-4 > .content-area").remove();
			 ajaxNList(1,$(this).data("sort"));
		 }
	})

	</script>
</body>
</html>