<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <c:import url="MyPageCSSJS.jsp"/>
</head>

<body>
    <header class="dogcat">
        <div class="logo"><span class="logo-title"><a href="">멍하고노냥</a></span></div>
        <div class="animate"><img src="teddy_food_dribbble.gif" /></div>
        <nav>
            <ul class="nav navbar-nav">
                <li><a href="">반려인 커뮤니티</a></li>
                <li><a href="">행동전문가와 상담</a></li>
                <li><a href="">Locations</a></li>
                <li class="dropdown">
                    <a href="#" id="user" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        <i class="fas fa-user-circle fa-2x"></i>
                    </a>
                    <ul class="dropdown-menu pull-right" role="menu" id="drop">
                        <li><a href="#">내 정보</a></li>
                        <li><a href="#">마이펫 다이어리</a></li>
                        <li><a href="#">쪽지함</a></li>
                        <li><a href="#">내 등급</a></li>
                        <li><a href="#">내 활동</a></li>
                        <li><a href="#">쪽지함</a></li>
                        <li class="divider"></li>
                        <li><a href="#">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="clear-fix"></div>
    </header>
    <div class="clear-fix"></div>
    <br>
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
                <button type="button" id="btn2">등급 정보확인하기</button>
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
                    <th colspan="2">내 활동 <button type="button" name="all" id="all">전체보기</button></th>
                    <th>마이펫 다이어리 <button type="button" name="all2" id="all2">전체보기</button></th>
                </tr>
                <tr>
                    <td>등록한 게시물이 없습니다.</td>
                    <td>등록한 댓글이 없습니다.</td>
                    <td>등록된 다이어리가 없습니다.</td>
                </tr>
                <tr>
                    <th colspan="2">내 게시물에 달린 댓글 <button type="button" name="all3" id="all3">전체보기</button></th>
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
    <footer class="dogcat">
        <div class="footertitle">
            <h4 class="dogcat">Copyright ⓒ<span>낭만코양이</span> All rights reserved.</h4>
            <h4 class="dogcat">with AR, CW, HK, SY, BG</h4>
        </div>
    </footer>
    <!-- <script src="./Mypage.1.js"></script> -->
    <script>
        $('.dropdown-toggle').dropdown()
    </script>
</body>

</html>