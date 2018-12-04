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
<c:import url="listCSSJS.jsp" />
<style>
</style>
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<c:import url="../../common/header.jsp" />
	</div>
	
	<!-- start -->
	 <div id="container">
    
      <!-- 우측 콘텐츠 영역-->
      <div class="content-area">
        
        <div class="main-title"><h1>크라우드 펀딩</h1></div>
        <div class="seperator"></div>
        <div style="float: right;">
          <button class="btn btn-default btn-lg" id="create-button">크라우펀딩 만들기</button>
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
		<c:import url="../../common/footer.jsp" />
	</div>
	
	<script>
	
	$(document).ready(function() {
		ajaxCrowdList(1);
	})
	
	var pageNo = 1;
	
	var ajaxCrowdList = function(pageNo) {
		$.ajax({
			url: "<c:url value='/admin/crowd/printList.mn' />",
			type: "POST",
			data: "pageNo=" + pageNo
		}).done(function(result) {
			console.log(result)
			
			var crowdList = result.crowdList;
			
			var html = "";
			if(crowdList.length != 0) {
				for(var i in crowdList) {
					html += "<div class='list-item'>"
							+ "<div class='image-area'><a href='detail.mn?crNo="+ crowdList[i].crNo +"'>"
							+ "<img src='<c:url value='/common/download.mn?sysName="+ crowdList[i].crFileName +"&path="+ crowdList[i].crFilePath +"&oriName="+ crowdList[i].crFileOriName +"'/>' style='width:100%; height:290px;' />"
							+ "</a></div>"
							+ "<div class='cr-title'>"
							+ 	"<h4>"+ crowdList[i].crTitle +"</h4>"
							+ "</div>"
							+ "<div class='progress'>"
							+	"<div class='progress-bar progress-bar-warning progress-bar-striped active' role='progressbar' aria-valuenow='100'"
							+ 	"aria-valuemin='0' aria-valuemax='100' style='width: 40%;' >" // width 값 변수로 받아야함
								// 이부분 도 width 랑 같은값
							+ 	"</div>"
							+ "</div>"
							+ 	"<div>"
							+  		"<span class='now-money'>원 달성</span>"
							+  		"<span class='remain-day'>일 남음</span>"
							+ 	"</div>"
							+ "</div>"
				} // for
			} else {
				html +=   "크라우드펀딩이 없습니다."
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