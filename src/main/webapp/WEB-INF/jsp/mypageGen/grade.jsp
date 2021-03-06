<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <c:import url="/WEB-INF/jsp/common/headerfooterCSSJS.jsp" />
  <c:import url="listCSSJS.jsp"/>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">
	
  <!-- hederfooter css -->
  <link rel="stylesheet" href="<c:url value="/resources/css/common/headerfooter.css"/>">
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
.grade4 img {
    width: 50%;
    height: auto;
}
p#memgrd {
	font-size : 20px;
}

.grade4 {
	margin-top : 10px;
	width : 100%;
    text-align : center;
    margin-bottom: 20px;
    display: inline-block;
    font-size : 20px;
}
.grade5 {
	display : block;
	text-align : center;
	font-size : 28px;
}
.grade4 .img-responsive {
    float: left;
    width: 25%;
}
#grdname {
    font-size: 30px;
    text-align: center;
}
#grdImg {
    text-align: center;
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
        <c:if test="${member.type == 1}">
        <div class="log-out">반려인</div>
        </c:if>
        <c:if test="${member.type == 2}">
        <div class="log-out">행동전문가</div>
        </c:if>
        <c:if test="${member.type == 3}">
        <div class="log-out">admin</div>
        </c:if>
        <div class="seperator"></div>
        <div class="list">
          <div id="board" class="item" ><a href="<c:url value="/mypageGen/list.mn"/>">기본정보</a></div>
          <!-- 일반회원일땐 경력 및 인사말 카테고리는 뜨지 않게하기. -->
          <!-- <div id="statistics" class="item"><a href="" style="color:black;">경력 및 인사말</a></div> -->
          <div class="item" id="grade"><a href="<c:url value="/mypageGen/grade.mn"/>">내 등급</a></div>
          <div class="item" id="mypoint"><a href="<c:url value="/mypageGen/point.mn"/>">내 포인트</a></div>
          <div id="management" class="item"><a href="<c:url value="/mypageGen/activity.mn"/>">내 활동</a></div>
        </div>

      </div>
      <!-- /좌측 메뉴 -->

      <!-- 우측 콘텐츠 영역-->
      <div class="view">
            <div id="allgrade">
                        <div class="main-title">내 등급</div>
                        <div class="seperator"></div>
                    <div id="t-grd">
                    <div class="grd">
                        <div id="grdname">
                            	${member.codeName}
                        </div>
                        <div id="grdImg">
                            <%-- <img src="<c:url value="/resources/img/member/diamond_i.png"/>"/> --%>
                            <c:choose>
                              <c:when test="${member.codeName == '뉴비'}">
                              	<img src="<c:url value="/resources/img/member/newbee.png"/>"/>
                              </c:when>
                              
                              <c:when test="${member.codeName == '루키'}">
                              	<img src="<c:url value="/resources/img/member/rookie.png"/>" />
                              </c:when> 
                              
                               <c:when test="${member.codeName == '골드'}">
                              	<img src="<c:url value="/resources/img/member/gold.png"/>" />
                              </c:when>
                              
                              <c:when test="${member.codeName == '플래티넘'}">
                              	<img src="<c:url value="/resources/img/member/platinum.png"/>" />
                              </c:when>
                              
                              <c:when test="${member.codeName == '다이아몬드'}">
                              	<img src="<c:url value="/resources/img/member/diamond.png"/>" />
                              </c:when>
                                                                                                        	
                            </c:choose>
                        </div>
                    </div>
                    </div>
                    <div style="clear: both;"></div>
                    <hr>
                    <div class="w-grd">
                        <p id="memgrd">- 활동점수<br>
						                <br>
						                게시글 작성시 활동점수 +50<br>
						                댓글 작성시 활동점수 +30<br>
						                로그인시 활동점수 +10<br>
						                <br></p>
                    </div>
                    <div class="grade4">
                    <div class="img-responsive">
                        <img src="<c:url value="/resources/img/member/newbee.png"/>" />
                        <div style="text-align: center;">
                           	뉴비<br>1 ~ 299
                        </div>
                    </div>
                    <div class="img-responsive">
                        <img src="<c:url value="/resources/img/member/rookie.png"/>" />
                        <div style="text-align: center;">
                            	루키<br>300 ~ 499
                        </div>
                    </div>
                    <div class="img-responsive">
                        <img src="<c:url value="/resources/img/member/gold.png"/>" />
                        <div style="text-align: center;">
                              	골드<br>500 ~ 999
                        </div>
                    </div>
                    <div class="img-responsive">
                        <img src="<c:url value="/resources/img/member/platinum.png"/>" />
                        <div style="text-align: center;">
                               	플래티넘<br>1000 ~ 1499
                        </div>
                    </div>
                </div>
                <div class="grade5">
                    <div class="img-responsive">
                        <img src="<c:url value="/resources/img/member/diamond.png"/>" />
                        <div style="text-align: center;">
                               	다이아<br>1500 ~ 
                        </div>
                    </div>
                </div>

      </div>
    </div>
<c:import url="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>