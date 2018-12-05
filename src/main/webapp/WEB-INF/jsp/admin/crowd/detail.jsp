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
		           			<div id="cf-title" style="margin-bottom:30px;"><h1>${detail.crTitle}</h1></div>
		            	    <div id="content1">
		              			<span><h2>현재: <span id="now-money">${detail.crNowMoney} 원</span></h2></span>
		             			<span id="goal-span">(목표: <span id="goal-money">${detail.crGoalMoney}</span>원)</span>
		             			<button id="heart-btn" class="btn btn-default btn-lg">
		             				<c:choose>
		             					<c:when test="${likeCheck eq 0}">
		             						<span class="glyphicon glyphicon-heart-empty" aria-hidden="true">
		             					</c:when>
		             					<c:otherwise>
		             						<span class="glyphicon glyphicon-heart" aria-hidden="true">
		             					</c:otherwise>	
		             				</c:choose>
			                  		<span id="like-count">${detail.crLikeCnt}</span></span>
		              			</button>
		              		</div>
				            <div class="progress">
		                      <fmt:parseNumber var="progress" value="${(detail.crNowMoney/detail.crGoalMoney*100)+(1-((detail.crNowMoney/detail.crGoalMoney*100)%1))%1}" integerOnly="true"/>
				                <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" 
				                <c:choose>
				                	<c:when test="${progress gt 100}">style="width: 100%;"</c:when>
				                	<c:otherwise>style="width: ${progress}%;"</c:otherwise>
				                </c:choose>> <!-- /div -->
				                      <c:choose>
					                      <c:when test="${progress eq 0}">
					                      </c:when>
					                      <c:otherwise>
					                      	${progress} %
					                      </c:otherwise>
				                      </c:choose>
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
		            		<div id="my-point">
		            		  <span>
		            		  	<c:if test="${myPoint ne null}">
		            		   		보유포인트: ${myPoint} 원
		            		   	</c:if>	
		            		  </span>
		            		</div>
		              		<div id="donate-area">
		            		  <input class="form-control" type="text" placeholder="기부 금액을 입력하세요"  id="recycle_result_amt" value="" onkeyup="inputNumberFormat(this)" />
		            		  <button type="button" id="initialize" class="btn btn-default btn-default">초기화</button>
		            		</div>
		            		 
	            		</div>
	          </div>
	          <div class="clear-fix"></div>
	          <hr>
	          <div id="content-area2">
	             ${detail.crContent}
	              <div style="width:10%; margin:0 auto;">
           		  	<button id="donate" type="button" class="btn btn-default btn-lg">기부하기</button>
           		  </div>
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
		$("#initialize").click(function() {
			$("#recycle_result_amt").val("");
		});
		
		$("#donate").click(function() {
			var donateMoney = parseInt(removeComma($("#recycle_result_amt").val()))
			// if 보유포인트가 부족하면 return false;
			if('${myPoint}' < donateMoney) {
				swal("보유포인트가 모자랍니다.", "", "error")
				return;
			}
			// 비로그인이면 return false;
			if('${user.id}'=="") {
				swal("로그인해주세요.", "", "error")
				return;
			}
		    swal("기부되었습니다.", "", "success");
		    setTimeout(function() { location.href="donate.mn?donateMoney=" + donateMoney + "&crNo=" + ${detail.crNo} + "&no=" + ${user.no} }, 1000)
		    
		});
	
	
		$(document).on("click", "#heart-btn", function() {
			 if('${likeCheck}' == 1) {
				swal("이미 추천하셨습니다.")
				return;
			 }
			
		      var count = parseInt($(this).children().children().text());
		      // console.log($(this).children().attr("class")=="glyphicon glyphicon-heart-empty");
		      if($(this).children().attr("class")=="glyphicon glyphicon-heart-empty") {
		        $("span.glyphicon").removeClass();
		        $(this).children().addClass("glyphicon glyphicon-heart");
		        ajaxLike(false)
		      } else {
		        $("span.glyphicon").removeClass();
		        $(this).children().addClass("glyphicon glyphicon-heart-empty");
		        ajaxLike(true)
		      }
	    });
		
		
		ajaxLike = function(check) {
			var url=""
			if(check==false) {
				url = "likeUp.mn"
			} else {
				url = "likeDown.mn"
			}
			
			$.ajax({
				url: url,
				type: "POST",
				data: {
						"crNo": '${detail.crNo}',
						"crId": '${user.id}'
					  } 
			}).done(function(result){
				$("#heart-btn").children().children().text(result)
			});
		}

	</script>
</body>
</html>