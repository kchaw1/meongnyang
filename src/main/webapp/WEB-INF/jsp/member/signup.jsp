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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
        crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous">
        </script>
	<c:import url="signupCSSJS.jsp"/>
</head>

<body>
  <form method="post" enctype="multipart/form-data" action="/signup.mn">
    <div id="login-box">
        <div class="sign_up">
            <h1>반려인 회원가입</h1>
            <div id="sign">
                <div id="pro">
                    <div id="poto">
                        <span>프로필 사진</span><br>
                        <input id="file" type="file" name="profile" accept=".gif, .jpg, .png" />
                        <div class="img_wrap">
                            <label for="image1">
                                <img id="img" />
                            </label>
                        </div>
                       
                    </div>
                    <hr>
                    <span>이름</span><br><input type="text" name="name" placeholder="이름을 입력하세요." />
                    <hr>
                    <span>아이디</span><br><input type="text" name="id" placeholder="아이디를 입력하세요." />
                    <hr>
                    <span>비밀번호</span><br><input type="password" name="pass" placeholder="비밀번호를 입력하세요." />
                    <hr>
                    <span>비밀번호 확인</span><br><input type="password" name="pass" placeholder="비밀번호를 다시 입력하세요." />
                    <hr>
                    <span>E-mail</span><br><input type="email" id="repass" name="repass" placeholder="email을 입력하세요." />
                    <span class="input-group-btn">
                        <button id="sendMail" class="btn btn-default" type="button" data-toggle="modal" data-target="#certify">인증</button>
                    </span>
                    <hr>
                    <span id="animal">반려동물 : <select id="catdog">
                            <option value="0">선택</option>
                            <option value="1">개</option>
                            <option value="2">고양이</option>
                            <option value="3">ALL</option>
                        </select></span>
                </div>
            </div>
        </div>
    </div>
    <div id="signbtn">
        <button type="submit" id="sup">가입하기</button>
        <button type="submit" id="cancel">취소</button>
    </div>
   </form>
</body>

</html>