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
          <div class="mgm-hidden abs-member"><a href="mgm-ABS.html">행동전문가</a></div>
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
            <div id="search-area">
                <form action="" method="POST" id="searchForm" class="navbar-form navbar" role="search">
                <div id="search">
                  <div class="form-group">
                     <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search">
                  </div>
                  <button type="submit" id="searchBtn" class="btn btn-default">검색</button>
                </div>
              </form>
            </div>
            <div class="clear-fix"></div>
            <div class="header-area">
              <div class="no-area">회원번호 <a href="#"><i class="fas fa-sort"></i></a></div>
              <div class="name-area">이름 <a href="#"><i class="fas fa-sort"></i></a></div>
              <div class="sign-area">가입일 <a href="#"><i class="fas fa-sort"></i></a></div>
              <div class="recent-area">최근접속일 <a href="#"><i class="fas fa-sort"></i></a></div>
              <div class="active-area">활동점수 <a href="#"><i class="fas fa-sort"></i></a></div>
              <div class="point-area">포인트 <a href="#"><i class="fas fa-sort"></i></a></div>
            </div>
            <div class="clear-fix"><hr></div>
             
          </div>
          <div id="tabs-4">
            <div>
              <h2>승인대기중</h2>
              <div id="search-area">
                  <form action="" method="POST" id="searchForm" class="navbar-form navbar" role="search">
                  <div id="search">
                    <div class="form-group">
                       <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" id="searchBtn" class="btn btn-default">검색</button>
                  </div>
                </form>
              </div>
              <div class="clear-fix"></div>
              <div class="header-area">
                  <div class="no-area">회원번호 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="name-area">이름 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="sign-area">가입일 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="recent-area">최근접속일 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="active-area">활동점수 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="point-area">포인트 <a href="#"><i class="fas fa-sort"></i></a></div>
                  <div class="clear-fix"><hr></div>
                   <c:forEach var="abs" items="${nlist}" varStatus="status">
	            <div class="clear-fix">
	              <div class="content-area">
	                <div class="no-area">${abs.no}</div>
	                <div class="name-area">${abs.name}</div>
	                <div class="sign-area"><fmt:formatDate value="${abs.signUpDate}" pattern="yy-MM-dd hh:mm:ss" /></div>
	                <div class="recent-area">${nRLDList[status.index]}</div>
	                <div class="active-area">${abs.score}</div>
	                <div class="point-area">${abs.point}</div>
	
	                <button class="btn btn-default btn-sm" onclick="window.location='detail.mn?no=${abs.no}&id=${abs.id}'">상세</button>
	                <button class="btn btn-default btn-sm">탈퇴</button>
	              </div>
	            </div>
              </c:forEach>
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
	 

    var pageNo=1;
	$(document).ready(function () {
		  ajaxYList(pageNo);
		  ajaxNList(pageNo);
		  
		  $(document).scroll(function() {
				++pageNo;
			    var maxHeight = $(document).height();
			    var currentScroll = $(window).scrollTop() + $(window).height();

			    if (maxHeight <= currentScroll + 120) {
			      ajaxYList(pageNo);
			      ajaxNList(pageNo);
			      console.log(pageNo)
			    }
			 })
		
// 		  ajaxNList();	  
	})
	
	var ajaxYList = function(pageNo) { 
								$.ajax({
						       		url: "<c:url value='/admin/abs/printYList.mn'/>",
						       		type: "POST",
						       		data: "pageNo=" + pageNo
						        }).done(function (result) {
							    	   console.log(result)
							    	   
							    	   var html ="";
							    	   for(var i in result.yList) {
							    		   
								       html +=     "<div class='content-area'>"
									            +  "<div class='no-area'>"+ result.yList[i].no +"</div>"
									            +  "<div class='name-area'>"+ result.yList[i].name +"</div>"
									            +  "<div class='sign-area'>"+ result.yList[i].signUpDate +"</div>"
									            +  "<div class='recent-area'>"+ result.yRLDList[i] + "</div>"
									            +  "<div class='active-area'>"+ result.yList[i].score +"</div>"
									            +  "<div class='point-area'>"+ result.yList[i].point +"</div>"
									            +  "<button class='btn btn-default btn-sm move-detail' data-no='" + result.yList[i].no + "' data-id='" + result.yList[i].id + "'>상세</button> "
									            +  "<button class='btn btn-default btn-sm'>탈퇴</button>"
									            +  "</div>"
									            +  "<div class='clear-fix'></div>"
							    	   }
										$("#tabs-1").append(html);			          
						        });
	} // ajaxYList
	
	var ajaxNList = function(pageNo) { 
								$.ajax({
						       		url: "<c:url value='/admin/abs/printNList.mn'/>",
						    	   type: "POST",
					       		   data: "pageNo=" + pageNo
						        }).done(function (result) {
							    	   console.log(result)
							    	   var html ="";
							    	   for(var i in result.nList) {
							    		   
								       html +=     "<div class='content-area'>"
									            +  "<div class='no-area'>"+ result.nList[i].no +"</div>"
									            +  "<div class='name-area'>"+ result.nList[i].name +"</div>"
									            +  "<div class='sign-area'>"+ result.nList[i].signUpDate +"</div>"
									            +  "<div class='recent-area'>"+ result.nRLDList[i] + "</div>"
									            +  "<div class='active-area'>"+ result.nList[i].score +"</div>"
									            +  "<div class='point-area'>"+ result.nList[i].point +"</div>"
									            +  "<button class='btn btn-default btn-sm move-detail' data-no='" + result.nList[i].no + "' data-id='" + result.nList[i].id + "'>상세</button> "
									            +  "<button class='btn btn-default btn-sm'>탈퇴</button>"
									            +  "</div>"
									            +  "<div class='clear-fix'></div>"
							    	   }
										$("#tabs-4").append(html);			          
						        });
	} // ajaxNList
	
	
	$(document).on("click", ".move-detail", function() {
		location.href = "detail.mn?no=" + $(this).data("no") + "&id=" + $(this).data("id");
	});
	

	</script>
</body>
</html>