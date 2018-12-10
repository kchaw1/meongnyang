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
            <div class="main-title">내 활동</div>
            <div class="seperator"></div>
            <div id="tabs">
                    <ul style="background:none;">
                        <li><a href="#tabs-1">내가 쓴 게시글</a></li>
                        <li><a href="#tabs-2">내가 쓴 댓글</a></li>
                    </ul>
                    <div id="tabs-1">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>조회</th>
                                    <th>날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>오늘은 퇴근</td>
                                    <td>3</td>
                                    <td>2018.11.21</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>병관이</td>
                                    <td>3</td>
                                    <td>2018.11.21</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>허락맡고 퇴근</td>
                                    <td>3</td>
                                    <td>2018.11.21</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>내일은 뭐?</td>
                                    <td>3</td>
                                    <td>2018.11.21</td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>언제끝나?</td>
                                    <td>3</td>
                                    <td>2018.11.21</td>
                                </tr>
                            </tbody>
                        </table>
                        <form id="searchForm">
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
                        </form>
                    </div>
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
                                <tr>
                                    <td>1</td>
                                    <td>병관이 퇴근</td>
                                    <td>2018.11.21</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>병관이 퇴근</td>
                                    <td>2018.11.21</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>병관이 퇴근</td>
                                    <td>2018.11.21</td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>병관이 퇴근</td>
                                    <td>2018.11.21</td>
                                </tr>
                            </tbody>
                        </table>
                        <form id="searchForm">
                            <div id="search">
                                <div class="search-group">
                                    <select id="serchType" name="serchType" class="form-search">
                                        <option value="0">선택</option>
                                        <option value="1">내용</option>
                                    </select> <input type="text" id="keyword" name="keyword" class="form-search" placeholder="검색하세요" />
                                    <button type="submit" id="searchBtn" class="searchBtn btn-default">검색</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

      </div>
    </div>
<c:import url="activityJS.jsp" />
<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>