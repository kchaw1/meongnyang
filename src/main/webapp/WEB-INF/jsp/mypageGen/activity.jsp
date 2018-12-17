<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="listCSSJS.jsp"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
  <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
  
  <!-- hederfooter css -->
  <link rel="stylesheet" href="<c:url value="/resources/css/common/headerfooter.css"/>">
  
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<style>
.forImg2{
  float: left;
  padding: 2px;
  border: 1px solid #eaeaea;
  cursor: pointer;
  width: auto;
  height: auto;
  margin-right: 2px;
}
.li2{
  background-color: #f7fafc;
  float: left;
  position: relative;
  border-right: 1px solid #ccd5dc;
    border-left: 1px solid #ccd5dc;
    border-top: 1px solid #ccd5dc;
    width: 850px;
    height: 87px;
    vertical-align: top;
    list-style: none;
    padding: 16px;
}
.li3{
  background-color: #f7fafc;
  float: left;
  position: relative;
  border: 1px solid #ccd5dc;
    width: 99.8%;
    height: 88px;
    vertical-align: top;
    list-style: none;
    padding: 16px;
    /* margin-bottom: 4px; */
}
.li4{

  background-color: #f7fafc;
  float: left;
  position: relative;
  border-right: 1px solid #ccd5dc;
    border-left: 1px solid #ccd5dc;
    border-top: 1px solid #ccd5dc;
    width: 99.8%;
    height: 87px;
    vertical-align: top;
    list-style: none;
    padding: 16px;
}

.li6{

background-color: #f7fafc;
float: left;
position: relative;
border-right: 1px solid #ccd5dc;
  border-left: 1px solid #ccd5dc;

  width: 99.8%;
  height: 87px;
  vertical-align: top;
  list-style: none;
  padding: 16px;
}
.li5{
  background-color: #f7fafc;
  float: left;
  position: relative;
  border: 1px solid #ccd5dc;
  width: 99.758%;
    height: 88px;
    vertical-align: top;
    list-style: none;
    padding: 16px;
    margin-bottom: 4px;
}
.labelC{
  font-size: 14px;
    font-weight: 600;
    color: #6e7c8c;
    font-style: normal;
    line-height: 1.2;
    letter-spacing: -0.03em;
    font-family: 'Roboto', 'Noto Sans', '맑은 고딕', 'Malgun Gothic', '돋움', dotum, "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
    
}
.spanC{
  font-size: 20px;
  font-weight: 600;
  color: #adb7c3 !important;
  font-family: 'Roboto', 'Noto Sans', '맑은 고딕', 'Malgun Gothic', '돋움', dotum, "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
.btn.edit{
  float: right;
  background: rgb(65, 192, 142);
    color: #fff;
    border-color: rgb(65, 192, 142);
    width: 160px;
    height: 60px;
    line-height: 60px;
    font-size: 22px;
    padding: 0 10px;
    margin-right: 2px;
    border-radius: 0px
    
}
.form-control.form-control2{
  cursor: not-allowed;
  background-color: #e3eaee;
}
div.modal-header {
    min-height: 16.43px;
    padding: 15px 15px 0px 15px;
    border-bottom: 1px solid #e5e5e5;
}
.star{
  color: red;
  font-family: 'Roboto', 'Noto Sans', '맑은 고딕', 'Malgun Gothic', '돋움', dotum, "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
}

#serchType {
    width: 80px;
    height: 28px;
    font-family: 'Jua', sans-serif;
}

#keyword {
    width: 150px;
    height: 28px;
    font-family: 'Jua', sans-serif;
}

#search {
    position: relative;
}

#searchBtn {
    width: 45px;
    height: 30px;
    font-family: 'Jua', sans-serif;
}
#searchBtn {
    margin: 3px;
    width: 60px;
    height: 30px;
    border-radius: 5px;
    font-size: 16px;
    color: white;
    background-color: rgb(65, 192, 142, 0.7);
    border-color: rgb(65, 192, 142, 0.7);
    font-family: 'Jua', sans-serif;
}

#tabs {
	font-family: 'Jua', sans-serif;
}

</style>


</head>
<body>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div id="container">
    <div class="panel">
      <!-- 좌측 메뉴 -->
      <div class="aside">
        <div class="avatar"><a href="admin1.html"><img src="https://66.media.tumblr.com/avatar_faa95867d2b3_128.png" /></a></div>
        <br>
        <div class="log-out">LOG OUT</div>
        <div class="seperator"></div>
           <div class="list"> 
          <div id="board" class="item statistics" ><a href="<c:url value="/mypageGen/list.mn"/>">기본정보</a></div>
          
          <c:if test="${member.type == 2}">
          <div class="item static"><a href="<c:url value="/mypageGen/list.mn"/>">경력 및 인사말</a></div>
          </c:if>
           <c:if test="${member.type == 1}">
          <div class="item" id="grade"><a href="<c:url value="/mypageGen/grade.mn"/>">내 등급</a></div>
          </c:if>
          
          <div class="item" id="mypoint"><a href="<c:url value="/mypageGen/point.mn"/>">내 포인트</a></div>
          <div id="management" class="item"><a href="<c:url value="/mypageGen/activity.mn"/>">내 활동</a></div>
        </div>



      </div>
      <!-- /좌측 메뉴 -->

      <!-- 우측 콘텐츠 영역-->
      <div class="view">
            <div class="main-title">내 활동</div>
            <div class="seperator"></div>
            <div id="tabs">
            <form name="active" action="<c:url value='/mypageGen/comment.mn'/>" method="post">
                    <input type="hidden" name="tab">
                    <ul style="background:none;">
                        <li><a href="#tabs-1" onclick="tab1();">내가 쓴 게시글</a></li>
                        <li><a href="#tabs-2" onclick="tab2();">내가 쓴 댓글</a></li>
                    </ul>
                    <c:if test="${empty param.tab or param.tab == 1}">
                    <div id="tabs-1">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>카테고리</th>
                                    <th>조회</th>
                                    <th>날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="b" items="${myBoardList}">
                                <tr>
                                    <td>${b.comNo}</td>
                                    <td>${b.comTitle}</td>
                                    <td>${b.comCategory}</td>
                                    <td>${b.comViewCnt}</td>
                                    <td><fmt:formatDate value="${b.comRegDate}" pattern="yyyy-MM-dd" /></td>
                                </tr>
                                </c:forEach>                              
                            </tbody>
                        </table>
                        
                        <nav>
			<div class="text-center">

				<ul class="pagination">
					<li><a
						<c:choose>
      <c:when test="${beginPage!=1}">href="activity.mn?pageNo=${beginPage-1}"</c:when>
      <c:otherwise>href="#"</c:otherwise>
	    </c:choose>
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach var="i" begin="${beginPage}" end="${endPage}">
						<li><a
							<c:choose>
   	<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/activity.mn"}'>
    href="<c:url value='activity.mn?pageNo=${i-1}' />"
    </c:when> 
   	<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/activity.mn"}'>
    href="activity.mn?pageNo=${i}"
    </c:when>
    <c:otherwise>
     href="activity.mn?pageNo=${i}"
     </c:otherwise>
      </c:choose>>

								${i}</a></li>
					</c:forEach>

					<li><a
						<c:choose>
      <c:when test="${endPage != lastPage}"> href="activity.mn?pageNo=${endPage+1}" </c:when>
    	<c:otherwise>href="#"</c:otherwise>
    	</c:choose>
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</div>
		</nav>
	
                            <div id="search">
                                <div class="search-group">
                                    <select id="serchType" name="serchType" class="form-search">
                                        <option value="0">선택</option>
                                        <option value="1">제목</option>
                                        <option value="2">내용</option>
                                        <option value="3">제목+내용</option>
                                    </select> <input type="text" id="keyword" name="keyword" class="form-search" placeholder="검색하세요" />
                                    <button type="submit" id="searchBtn" class="searchBtn btn-default">검색</button>
                                </div>
                            </div>

                    </div>
                    </c:if>
                    <c:if test="${param.tab == 2}" >
                    <div id="tabs-2">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>내용</th>
                                    <th>날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="m" items="${myComment}">
                                <tr>
                                    <td>${m.comcNo}</td>
                                    <td>${m.comcContent}</td>
                                    <td><fmt:formatDate value="${m.comcRegDate}" pattern="yyyy-MM-dd" /></td>
                                </tr>
                              </c:forEach>
                            </tbody>
                        </table>
                        
                        <nav>
			<div class="text-center">

				<ul class="pagination">
					<li><a
						<c:choose>
      <c:when test="${beginPage!=1}">href="comment.mn?pageNo=${beginPage-1}&tab=2"</c:when>
      <c:otherwise>href="#"</c:otherwise>
	    </c:choose>
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach var="i" begin="${beginPage}" end="${endPage}">
						<li><a
							<c:choose>
   	<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/comment.mn"}'>
    href="<c:url value='comment.mn?pageNo=${i-1}&tab=2' />"
    </c:when> 
   	<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/comment.mn"}'>
    href="comment.mn?pageNo=${i}&tab=2"
    </c:when>
    <c:otherwise>
     href="comment.mn?pageNo=${i}&tab=2"
     </c:otherwise>
      </c:choose>>

								${i}</a></li>
					</c:forEach>

					<li><a
						<c:choose>
      <c:when test="${endPage != lastPage}"> href="minusPoint.mn?pageNo=${endPage+1}&tab=2" </c:when>
    	<c:otherwise>href="#"</c:otherwise>
    	</c:choose>
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</div>
		</nav>

                            <div id="search">
                                <div class="search-group">
                                    <select id="serchType" name="serchType" class="form-search">
                                        <option value="0">선택</option>
                                        <option value="1">내용</option>
                                    </select> <input type="text" id="keyword" name="keyword" class="form-search" placeholder="검색하세요" />
                                    <button type="submit" id="searchBtn" class="searchBtn btn-default">검색</button>
                                </div>
                            </div>

                    </div>
                    </c:if>
                    </form>
                </div>

      </div>
    </div>
<c:import url="activityJS.jsp" />
<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
<script>
function tab1() {
	
	document.active.tab.value=1
	document.active.action = "<c:url value='/mypageGen/activity.mn'/>";
	document.active.submit();
}

function tab2() {
	
	document.active.tab.value=2
	document.active.action = "<c:url value='/mypageGen/comment.mn'/>";
	document.active.submit();
}
$("#tabs").tabs({active: 0});
if("${param.tab}" == "2") {
	$("#tabs").tabs({active: 1});
}
</script>
</body>
</html>