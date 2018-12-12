<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../common/headerfooterCSSJS.jsp" />
<c:import url="../admin/adminCommonCSSJS.jsp" />
<c:import url="listCSSJS.jsp" />
<style>
</style>
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../common/header.jsp" />
		
	</div>
	
	<!-- start -->
	 <div id="container">
    
      <!-- 우측 콘텐츠 영역-->
      <div class="content-area">
        
        <div class="main-title"><h1><a href="<c:url value='/crowd/list.mn'/>">크라우드 펀딩</a></h1></div>
        <div class="seperator"></div>
        <div class="btn-area">
          <c:if test="${user.type eq 3}">	
          	<button class="btn btn-default btn-lg" id="create-button">크라우펀딩 만들기</button>
          </c:if>
        </div>
        <div class="clear-fix"></div>
        <hr>
        <div class="clear-fix"></div>
         <div class="btn-area">
         	<a id="ing">진행중</a>
         	<span>|</span>
         	<a id="end">종료</a>         	
         </div>
           <div class="clear-fix"></div>
        <div class="list-item-area">
                
        </div>
        <div class="clear-fix"></div>        
      </div>
    
    <!-- /우측 콘텐츠 영역-->
  </div>
  <div class="clear-fix"></div>
	
	
	<!-- end -->
	
	<!-- 푸터 -->
	<div id="footer">
		<c:import url="../common/header.jsp" />
	</div>
	
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
	$(document).ready(function() {
		ajaxCrowdList(1);
	})
	
	// 전역변수
	var pageNo = 1;
	var flag = 1;
	var isLastPage = false;
	
	// 스크롤 페이징
	$(document).ready(function () {
	      $(document).scroll(function() {
	        var maxHeight = $(document).height();
	        var currentScroll = $(window).scrollTop() + $(window).height();
			
	        if (maxHeight <= currentScroll) {
	        	if(flag == 1) {
	        		if(isLastPage == false) {
	        			ajaxCrowdList(++pageNo)
	        		} else {
	        			return;
	        		}
	        	} else {
	        		if(isLastPage == false) {
	        			ajaxCrowdEndList(++pageNo)
	        		} else {
	        			return;
	        		}
	        	}
        	}
      	})
    });
	
	// 진행중 버튼 클릭
	$("#ing").click(function() {
		$(document).scrollTop(0);
		$(".list-item-area").html("");
		flag = 1;
		pageNo = 1;
		isLastPage = false;
		ajaxCrowdList(pageNo);
	})
	
	// 종료 버튼 클릭
	$("#end").click(function() {
		$(document).scrollTop(0);
		$(".list-item-area").html("");
		flag = 2;
		pageNo = 1;
		isLastPage = false;
		ajaxCrowdEndList(pageNo);
	})
	
	var ajaxCrowdList = function(pageNo) {
		$.ajax({
			url: "<c:url value='/crowd/printList.mn' />",
			type: "POST",
			data: "pageNo=" + pageNo
		}).done(function(result) {
			console.log(result)
			
			var crowdList = result.crowdList;
			var remainDaysList = result.remainDaysList;
			
			if(crowdList.length == 0) isLastPage = true; 
			
			var html = "";
			if(crowdList.length != 0) {
				for(var i in crowdList) {
					var progress = Math.floor((crowdList[i].crNowMoney/crowdList[i].crGoalMoney)*100)
					
					html += "<div class='list-item'>"
							+ "<div class='image-area'><a href='detail.mn?crNo="+ crowdList[i].crNo +"'>"
							if(crowdList[i].crFileName != null) {
								html += "<img src='<c:url value='/common/download.mn?sysName="+ crowdList[i].crFileName +"&path="+ crowdList[i].crFilePath +"&oriName="+ crowdList[i].crFileOriName +"'/>' style='border-radius:5px; width:100%; height:290px;' />"
							} else {
								html += "<img src='<c:url value='/resources/img/admin/crowd/01_preview.__large_preview.png' />' />"
							}
					html +=	  "</a></div>"
							+ "<div class='cr-title'>"
							+ 	"<h4>"+ crowdList[i].crTitle +"</h4>"
							+ "</div>"
							+ "<div class='progress'>"
							+	"<div class='progress-bar progress-bar-warning progress-bar-striped active' role='progressbar' aria-valuenow='100'"
							+ 	"aria-valuemin='0' aria-valuemax='100' style='width:"
							if(progress > 100) { html += "100%;' >" }  
							else { html += progress + "%;' >" }
					html +=  progress
							+ "%</div>"
							+ "</div>"
							+ 	"<div>"
							+  		"<span class='now-money'>"+ comma(crowdList[i].crNowMoney) +"원 달성</span>"
							+  		"<span class='remain-day'>"+ remainDaysList[i] +"일 남음</span>"
							+ 	"</div>"
							+ "</div>"
				} // for
			} else {
				html = "<div class='no-exist'>더이상 게시물이 없습니다.</div>"
			}
			 
			
			$("div.list-item-area").append(html);
		}); // done();
	} // ajaxCrowdList()
	
	var ajaxCrowdEndList = function(pageNo) {
		$.ajax({
			url: "<c:url value='/crowd/printEndList.mn' />",
			type: "POST",
			data: "pageNo=" + pageNo
		}).done(function(result) {
			console.log(result)
			
			var crowdList = result.crowdList;
			
			if(crowdList.length == 0) isLastPage = true;
			
			var html = "";
			if(crowdList.length != 0) {
				for(var i in crowdList) {
					var progress = Math.floor((crowdList[i].crNowMoney/crowdList[i].crGoalMoney)*100)
					
					html += "<div class='list-item'>"
							+ "<div class='image-area'>"
							if(crowdList[i].crFileName != null) {
								if('${user.type}' == 3) {
									html +=   "<a href='detail.mn?crNo="+ crowdList[i].crNo +"'>"
											+ "<img src='<c:url value='/common/download.mn?sysName="+ crowdList[i].crFileName +"&path="+ crowdList[i].crFilePath +"&oriName="+ crowdList[i].crFileOriName +"'/>' style='border-radius:5px; width:100%; height:290px;' />"
											+ "</a>"
								} else {
									html += "<img src='<c:url value='/common/download.mn?sysName="+ crowdList[i].crFileName +"&path="+ crowdList[i].crFilePath +"&oriName="+ crowdList[i].crFileOriName +"'/>' style='border-radius:5px; width:100%; height:290px;' />"
								}
							} else {
								html += "<img src='<c:url value='/resources/img/admin/crowd/01_preview.__large_preview.png' />' />"
							}
					html +=	  "</div>"
							+ "<div class='cr-title'>"
							+ 	"<h4>"+ crowdList[i].crTitle +"</h4>"
							+ "</div>"
							+ "<div class='progress'>"
							+	"<div class='progress-bar progress-bar-warning progress-bar-striped active' role='progressbar' aria-valuenow='100'"
							+ 	"aria-valuemin='0' aria-valuemax='100' style='width:"
							if(progress > 100) { html += "100%;' >" }  
							else { html += progress + "%;' >" }
					html +=  progress
							+ "%</div>"
							+ "</div>"
							+ 	"<div>"
							+  		"<span class='now-money'>"+ comma(crowdList[i].crNowMoney) +"원 달성</span>"
							+  		"<span class='remain-day'>종료되었습니다.</span>"
							+ 	"</div>"
							+ "</div>"
				} // for
			} else {
				html = "<div class='no-exist'>더이상 게시물이 없습니다.</div>"
			}
			 
			
			$("div.list-item-area").append(html);
		}); // done();
	} // ajaxCrowdList()
	
	$("#create-button").click(function() {
		location.href = "writeForm.mn"
	})
	

	</script>
</body>
</html>