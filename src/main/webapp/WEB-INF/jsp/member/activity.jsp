<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- activity css -->
<link rel="stylesheet" href="<c:url value="/resources/css/member/activity.css"/>">

<!--------------------------------- 아래부터 tab -------------->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<!-- hederfooter css -->
<link rel="stylesheet" href="<c:url value="/resources/css/common/headerfooter.css"/>">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">
</head>
<body>
<c:import url="../common/header.jsp" />
<div id="allact">
        <div class="activity">
            <span id="myAty">내 활동</span>
        </div>
        <br>
        <div id="tabs">
            <ul style="background:none;">
                <li><a href="#tabs-1">게시글</a></li>
                <li><a href="#tabs-2">댓글</a></li>
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
<c:import url="../common/footer.jsp"/>
<script>
$( function() {
    $( "#tabs" ).tabs();
  } );
</script>
</body>
</html>