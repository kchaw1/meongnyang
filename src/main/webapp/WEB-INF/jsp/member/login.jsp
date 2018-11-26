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
<c:import url="loginCSSJS.jsp" />
<c:import url="signupCSSJS.jsp" />
<script src="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">
	span[id^='warn'] {
    font-family: 'Poor Story', cursive;
    font-size: 15px;
    margin-left: 15px;
    color: #ff7680;
}
</style>
</head>
<body>
	<div class="login-box">
    <div class="lb-header">
      <a href="#" class="active" id="login-box-link">로그인</a>
      <a href="#" id="signup-box-link">회원가입</a>
    </div>
    <div class="social-login">
      <a href="#">
        <img src="./네이버 아이디로 로그인_완성형_White.PNG"/>
      </a>
      <!-- <a href="#">
        <img src="./kakao_account_login_btn_medium_narrow.png"/>
      </a> -->
      <div id="kakao-login-btn"></div>
    </div>
    <form class="email-login" name="login">
      <div class="u-form-group">
        <input type="email" name="loginid" placeholder="Email 또는 id"/>    
      </div>
      <div class="u-form-group">
        <input type="password" name="loginpass" placeholder="Password"/>
      </div>
      <div class="u-form-group">
      	<button type="button" class="btn btn-default" id="loginform">로그인</button>
        <!-- <a class="btn" data-toggle="modal" data-target="#logInModal" 
	            data-whatever="@getbootstrap" id="login" href="#">로그인</a> --> 
      </div>
      <div class="u-form-group">
        <a href="#" class="forgot-password">비밀번호를 잊으셨습니까?</a>
      </div>
    </form>
    <form class="email-signup">
      <div class="u-form-group">
        <input type="email" placeholder="Email"/>
      </div>
      <div class="u-form-group">
        <input type="password" placeholder="Password"/>
      </div>
      <div class="u-form-group">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
          반려인 회원가입
        </button>
      </div>
      <div class="u-form-group">
        <button>행동전문가 회원가입</button>
      </div>
    </form>
  </div>
  <c:import url="loginJS.jsp" />

  <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">반려인 회원가입</h4>
      </div>
      <div class="modal-body">
      	<form action="<c:url value="/member/signup.mn"/>"  name="signup">
          <div id="login-box">
              <div class="sign_up">
                  <div id="sign">
                      <div id="pro">
                          <div id="poto">
                              <span>프로필 사진</span><br>
                              <input id="file" type="file" accept=".gif, .jpg, .png" />
                              <div class="img_wrap">
                                  <label for="image1">
                                      <img id="img" />
                                  </label>
                              </div>
                          </div>
                          <hr>
                          <div class="form-group">
                                            <label for="recipient-name" class="control-label" id="name"><span id="red">*</span>이름</label>
                                            <span id='warnname'></span>
                                            <input type="text" class="form-control" name="name">
                                        </div>
                                        <hr>
                                        <!-- <span>아이디</span><br><input type="text" name="id" placeholder="아이디를 입력하세요." /> -->
                                        <div class="form-group">
                                            <label for="recipient-name" class="control-label"><span id="red">*</span>아이디</label>
                                            <span id='warnid'></span>
                                            <input type="text" class="form-control" name="id">
                                        </div>
                                        <hr>
                                        <!-- <span>비밀번호</span><br><input type="password" name="pass" placeholder="비밀번호를 입력하세요." /> -->
                                        <div class="form-group">
                                            <label for="recipient-name" class="control-label"><span id="red">*</span>비밀번호</label>
                                            <span id='warnpass'></span>
                                            <input type="password" class="form-control" name="pass">
                                        </div>
                                        <hr>
                                        <!-- <span>비밀번호 확인</span><br><input type="password" name="pass" placeholder="비밀번호를 다시 입력하세요." /> -->
                                        <div class="form-group">
                                            <label for="recipient-name" class="control-label"><span id="red">*</span>비밀번호 확인</label>
                                            <span id='warnpasscheck'></span>
                                            <input type="password" class="form-control" name="passcheck">
                                        </div>
                                        <hr>
                                        <div class="row" id="ckNameMsg"></div>                           
                                        <div class="form-group">
                                            <label for="recipient-name" class="control-label"><span id="red">*</span>E-mail</label>
                                            <span id='warnemail'></span>
                                                <input id="email" type="text" class="form-control" name="email" placeholder="이메일">
                                                <button id="sendMail" class="btn btn-default" type="button" data-toggle="modal" data-target="#certify">인증</button>             
                                            <span class="input-group-btn">
                                            </span>
                                        </div>
                          				<hr>
			                         	 <span id="animal">반려동물 : <select id="catdog">
			                                  <option value="0">선택</option>
			                                  <option value="1">개</option>
			                                  <option value="2">고양이</option>
			                                  <option value="3">ALL</option>
			                              </select></span>
			                         </form>
			                      </div>
			                  </div>
			              </div>
			          </div>
			      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="newmember">회원가입</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<c:import url="signupJS.jsp" />
  <script>
      Kakao.init('a48660e1ad76fecc7e41245f473d42cb');
      Kakao.Auth.createLoginButton({

container: '#kakao-login-btn',

success: function(authObj) { 

  Kakao.API.request({

     url: '/v1/user/me',

     success: function(res) {



           console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
  

         }



       })

},

fail: function(err) {

 alert(JSON.stringify(err));

}



});
  </script>
</body>
</html>