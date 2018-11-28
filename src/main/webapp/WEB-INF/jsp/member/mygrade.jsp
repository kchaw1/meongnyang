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
    
    <!-- MyPage css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/member/mygrade.css"/>">
    
    <!-- font -->
    <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
    
    <!-- hederfooter css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/common/headerfooter.css"/>">
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">
    <!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
</head>
<body>
<c:import url="../common/header.jsp" />
<div id="allgrade">
    <div class="grade">
        <span id="mygrade">내 등급</span>
    </div>
    <hr>
    <div id="t-grd">
    <div class="grd">
        <!-- <p id="g-writer">내 등급</p> -->
        <!-- <input type="text" id="mygrd" name="mygrd" value=""/> -->
        <div id="grdname">
            다이아
        </div>
        <div id="grdImg">
            <img src="diamond_i.png"/>
        </div>
    </div>
    <!-- <hr style="width: 0px; height: 150px; float: left; margin: 0 0 0 15px;"> -->
        <!-- <div class="wrap-custom-file">
            <input type="file" name="image1" id="image1" accept=".gif, .jpg, .png" />
            <label  for="image1">
                <span>Select Image One</span>
                <i class="fa fa-plus-circle"></i>
            </label>
        </div> -->
        <!-- <div class="rpoint">
            <p id="p-writer">현재 포인트 점수</p>
            <input type="text" id="point" name="point" value=""/> <span id="s-writer">점</span>
        </div> -->
    </div>
    <div style="clear: both;"></div>
    <hr>
    <div class="w-grd">
        <p id="memgrd">회원등급은 로그인 시와 마이페이지 접속시 갱신됩니다.</p>
    </div>
    <div class="image">
    <div class="new">
        <img src="뉴비.jpg" />
        <div style="text-align: center;">
            1 ~ 199
        </div>
    </div>
    <div class="new">
        <img src="루키.png" />
        <div style="text-align: center;">
                200 ~ 299
        </div>
    </div>
    <div class="new">
        <img src="멤버.jpg" />
        <div style="text-align: center;">
                300 ~ 399
        </div>
    </div>
    <div class="new">
        <img src="bronze_i.png" />
        <div style="text-align: center;">
                400 ~ 499
        </div>
    </div>
    <div class="new">
        <img src="silver_i.png" />
        <div style="text-align: center;">
                500 ~ 699
        </div>
    </div>
    <div class="new">
        <img src="gold_i.png" />
        <div style="text-align: center;">
                700 ~ 999
        </div>
    </div>
    <div class="new">
        <img src="platinum_i.png" />
        <div style="text-align: center;">
                1000 ~ 1499
        </div>
    </div>
    <div class="new">
        <img src="diamond_i.png" />
        <div style="text-align: center;">
                1500 ~ 
        </div>
    </div>
</div>
</div>
<c:import url="../common/footer.jsp"/>
</body>
</html>