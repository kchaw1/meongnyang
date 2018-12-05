<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp" />
<c:import url="../adminCommonCSSJS.jsp" />
<c:import url="detailCSSJS.jsp" />
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>
	
	<!-- start -->
	  <div id="detail-container">
      
      <!-- 우측 콘텐츠 영역-->
          <div id="content-container">
	          <div class="main-title"><h1><a href="<c:url value='/admin/crowd/list.mn'/>">크라우드 펀딩</a></h1></div>
	          	<div id="content-wrapper">
	          		<div id="cf-img"><img style="border-radius: 10%;" src="<c:url value='/common/download.mn?sysName=${detail.crFileName}&path=${detail.crFilePath}&oriName=${detail.crFileOriName}'/>" /></div>
	          			<div id="content-area1">
		           			<div id="cf-title" style="margin-bottom:30px;"><h3>${detail.crTitle}</h3></div>
		            	    <div id="content1">
		              			<span><h2>현재: <span id="now-money">${detail.crNowMoney} 원</span></h2></span>
		             			<span id="goal-span">(목표: <span id="goal-money">${detail.crGoalMoney}</span>원)</span>
		             			<button id="heart-btn" class="btn btn-default btn-lg">
			                  		<span class="glyphicon glyphicon-heart-empty" aria-hidden="true">
			                  		<span id="like-count">${detail.crLikeCnt}</span></span>
		              			</button>
		              		</div>
				            <div class="progress">
				                <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${(detail.crNowMoney/detail.crGoalMoney*100)+(1-((detail.crNowMoney/detail.crGoalMoney*100)%1))%1}%;">
				                      <fmt:parseNumber var="progress" value="${(detail.crNowMoney/detail.crGoalMoney*100)+(1-((detail.crNowMoney/detail.crGoalMoney*100)%1))%1}" integerOnly="true"/>
				                      ${progress} %
				                 </div>
				            </div>
		              		<div id="remain-days">
		                		<h2>남은일수:</h2>
		                		<h2><span class="remain-days">${remainDays} 일</span></h2>
		              		</div>
		              		<div id="end-day">
		               			 <h2>마감 날짜:</h2>
		               			 <h2><span class="end-day">${detail.crEndDay}</span></h2>
		             		</div>
		              		<div id="donate-area">
		            		  <input id="input-money" class="form-control" type="text" placeholder="기부 금액을 입력하세요"  id="recycle_result_amt" value="" onkeyup="inputNumberFormat(this)" />
		            		  <button type="button" class="btn btn-default btn-default">기부하기</button>
		            		</div>
	            		</div>
	          </div>
	          <div class="clear-fix"></div>
	          <hr>
	          <div id="content-area2">
	             ${detail.crContent}
	          </div>
	          <div id="button-area">
	                <button type="button" class="btn btn-default btn-default" onclick="window.location='crowd-funding-mod.html'">수정</button>
	                <button type="button" class="btn btn-default btn-default">삭제</button>
	          </div>
	          <div class="panel-footer">댓글 목록</div>
	          <div class="panel-body">
	              <div id="cmt_container">
	                  <ul id="cmt_list">
	                    <!-- 댓글 들어가는부분 -->
	                  </ul> 
	              </div>
	          </div>
	    </div>
	</div>
      
    <!-- /우측 콘텐츠 영역-->
    <div class="clear-fix"></div>
    <!-- end -->
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../../common/footer.jsp" />
	</div>
	
	<script>
	$(document).on("click", "#heart-btn", function() {
	      var count = parseInt($(this).children().children().text());
	      // console.log($(this).children().attr("class")=="glyphicon glyphicon-heart-empty");
	      if($(this).children().attr("class")=="glyphicon glyphicon-heart-empty") {
	        $("span.glyphicon").removeClass();
	        $(this).children().addClass("glyphicon glyphicon-heart");
	        ++count
	        $(this).children().children().text(count)
	      } else {
	        $("span.glyphicon").removeClass();
	        $(this).children().addClass("glyphicon glyphicon-heart-empty");
	        --count
	        $(this).children().children().text(count)
	      }
	    });
	</script>
</body>
</html>