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
    <link rel="stylesheet" href="<c:url value="/resources/css/member/Mypage.1.css"/>">
    
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
    <div id="mypageAll">
        <div class="allpage">
            <span id="mpall">Mypage</span>
        </div>
        <div class="container">
            <div id="page">
                <div class="wrap-custom-file">
                    <input type="file" name="image1" id="image1" accept=".gif, .jpg, .png" />
                    <label for="image1">
                        <span>Select Image One</span>
                        <i class="fa fa-plus-circle"></i>
                    </label>
                </div>
            </div>
            <div class="member">
                <!-- <input type="text" name="level" id="level" /> <input type="text" name="name" id="name" />님 회원정보<br> -->
                <div id="grdname">다이아&nbsp;</div><div id="username">김병관</div> <span id="ptext">님의 회원정보입니다.</span><br>
                <!-- <input type="text" name="grade" id="grade"> 레벨점수 : <div id="point"> - </div>입니다. -->
                <hr style="width: 350px; margin-left: 0px;">
                <span id="sptext">다음 레벨까지&nbsp;</span> <div id="lvpoint">0</div> <span id="sptext2">점 남았습니다.</span>
                <br>
                <br>
                <a href="#" id="update">회원정보 변경</a>
            </div>
            <hr style="width: 1px; height: 200px; float: left; background: black">
            <div class="MyPoint">
                <a href="#"><p id="mypoint">내 포인트</p></a>
                <div id="repoint">999,999&nbsp;</div> <span>포인트</span><br>
                <button type="button" id="btn1">충전하기</button>
            </div>
            <hr style="width: 1px; height: 200px; float: left; background: black">
            <div class="movePoint">
                <p id="actPoint">활동점수</p>
                <div id="move">7500&nbsp;</div><span id="movepp">점</span>
            </div>
            <hr style="width: 1px; height: 200px; float: left; background: black">
            <div class="grade">
                <p id="mygrade">내 등급</p>
                <img src="diamond_i.png"/><br>
                <button type="button" id="btn2" onclick="mygrade()">등급 정보확인하기</button>
            </div>
        </div>
        <hr>
        <!-- <div class="subTitle">
            반려동물 커뮤니티
        </div> -->
        <br>
        <div class="Allmenu">
            <table>
                <tr>
                    <th colspan="2">내 활동 <button type="button" name="all" id="all" onclick="activity()">전체보기</button></th>
                    <th>마이펫 다이어리 <button type="button" name="all2" id="all2">전체보기</button></th>
                </tr>
                <tr>
                    <td>등록한 게시물이 없습니다.</td>
                    <td>등록한 댓글이 없습니다.</td>
                    <td>등록된 다이어리가 없습니다.</td>
                </tr>
                <tr>
                    <th colspan="2">내 게시물에 달린 댓글<button type="button" name="all3" id="all3" onclick="myboardcomn()">전체보기</button></th>
                    <th colspan="2">친구 관리 <button type="button" name="all4" id="all4">전체보기</button></th>
                </tr>
                <tr>
                    <td colspan="2">등록된 댓글이 없습니다.</td>
                    <td colspan="2">등록된 친구가 없습니다.</td>
                </tr>
            </table>
        </div>
    </div>
    </div>

<c:import url="../common/footer.jsp"/>
   <script>
        $('.dropdown-toggle').dropdown()
    </script>
 <script>
 $('input[type="file"]').each(function(){
     // Refs
     var $file = $(this),
         $label = $file.next('label'),
         $labelText = $label.find('span'),
         labelDefault = $labelText.text();
     
     // When a new file is selected
     $file.on('change', function(event){
       var fileName = $file.val().split( '\\' ).pop(),
           tmppath = URL.createObjectURL(event.target.files[0]);
       //Check successfully selection
           if( fileName ){
         $label
           .addClass('file-ok')
           .css('background-image', 'url(' + tmppath + ')');
               $labelText.text(fileName);
       }else{
         $label.removeClass('file-ok');
               $labelText.text(labelDefault);
       }
     });
     
   // End loop of file input elements  
   });    
 </script>
<script>
function myboardcomn(){
    window.location.href="myboardcomn.mn";
}

function mygrade(){
    window.location.href="mygrade.mn";
}

function activity() {
	window.location.href="activity.mn"
}
</script>
</body>
</html>