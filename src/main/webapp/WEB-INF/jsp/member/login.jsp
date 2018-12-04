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
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- 모달  -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 탭 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">
	span[id^='warn'] {
    font-family: 'Poor Story', cursive;
    font-size: 15px;
    margin-left: 15px;
    color: #ff7680;
  }
  
.u-form-group input[type="email"],
.u-form-group input[type="password"]{
    width: calc(54% - 22px);
}    

#sendMail {
    height: 33px;
    width: 50px;
    float: right;
    margin-right: 115px;
}

#email {
    display: inline-block;
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
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
          반려인 회원가입
        </button>
      </div>
      <div class="u-form-group">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2">
         	 행동전문가 회원가입
        </button>
      </div>
    </form>
  </div>
  <c:import url="loginJS.jsp" />

  <!-- 반려인 회원가입 Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">반려인 회원가입</h4>
      </div>
	<form name="signup" enctype="multipart/form-data" method="post" action="<c:url value="/member/signup.mn"/>">
      					<div class="modal-body">     
          					<div id="pho">                                          
                              <span>프로필 사진</span><br>
                               <input id="file" type="file" name="profile" accept=".gif, .jpg, .png" />
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
                                            <span id='warnemail'></span><br>
                                                <input id="email" type="text" class="form-control" name="email" placeholder="이메일">                     
                                                <button id="sendMail" class="btn btn-default" type="button" data-toggle="modal" data-target="#certify">인증</button>             
                                            <span class="input-group-btn"></span>
                                        </div>
                          				<hr>
			                         	 <span id="animal">반려동물 : <select id="catdog" name="category">
			                                  <option value="0">선택</option>
			                                  <option value="dog">개</option>
			                                  <option value="cat">고양이</option>
			                                  <option value="all">ALL</option>
			                              </select></span>			                      			                  
			              <div class="modal-footer">
				        	<button type="button" class="btn btn-primary" id="newmember">회원가입</button>
				        	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      		</div>
			         </div>
			         </form>
			        </div>
			       </div>
			      </div>
			           <!-- 행동전문가 회원가입 Modal -->
						<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">행동전문가 회원가입</h4>
									</div>
									<div class="modal-body">
										<div id="tabs">
											<ul style="border: 1px solid #dddddd; background: none;">
												<li><a href="#tabs-1">행동전문가 회원가입</a></li>
												<li><a href="#tabs-2">경력 및 기타 사항</a></li>
											</ul>
											<div id="tabs-1">
												<div class="abs_signup">
													<h1>행동전문가 회원가입</h1>
													<hr>
													<div id="pro">
														<div id="poto">
															<span>프로필 사진</span><br> <input id="file" type="file" name="profile" accept=".gif, .jpg, .png" />
															<div class="img_wrap">
																<label for="image1"> <img id="img" />
																</label>
															</div>
														</div>
														<hr>
														<span>이름 : </span><input type="text" name="username" placeholder="이름" />
														<hr>
														<span>아이디 : </span><input type="text" name="id" placeholder="아이디를 입력하세요.">
														<hr>
														<span>비밀번호 : </span><input type="password" name="password" placeholder="비밀번호" />
														<hr>
														<span>비밀번호 확인 : </span><input type="password" name="password2" placeholder="비밀번호 확인" />
														<hr>
														<span>E-mail : </span><input type="text" id="email2" name="email" placeholder="E-mail" /> <span class="input-group-btn">
															<button id="sendMail" class="btn btn-default" type="button" data-toggle="modal" data-target="#certify">인증</button>
														</span>
														<hr>
														<span>인사말 : </span>
														<textarea rows="8" cols="80" placeholder="인사말을 적어주세요." value=""></textarea>
														<hr>
														<div style="clear: both;"></div>
														<span id="animal">담당 반려동물 : <select id="catdog">
																<option value="0">선택</option>
																<option value="1">개</option>
																<option value="2">고양이</option>
																<option value="3">ALL</option>
														</select></span>
													</div>
												</div>
											</div>
											<div id="tabs-2">
												<span id="car">경력 :</span> <input type="date" name="career1" id="career1" /> <span id="car2">~ </span><input type="date" name="career2" id="career2" />
												<button type="button" id="combtn"
													class="btn pull-right btn-success">추가</button>
												<hr>
												<span>상세경력 : </span>
												<textarea rows="8" cols="80" placeholder="업무내용을 적어주세요." value=""></textarea>
												<hr>
												<div class="file_input">
													<label> 자격증 첨부 : <input type="file" onchange="javascript:document.getElementById('file_route').value=this.value">
													</label> <input type="text" readonly="readonly" title="File Route" id="file_route">
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										<button type="button" class="btn btn-primary">가입하기</button>
									</div>
								</div>
							</div>
						</div>
	<div class="modal fade" id="certify">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h3 class="modal-title">이메일 인증</h3>
				</div>
				<div class="modal-body">
					<h4>
						입력한 이메일로 인증번호를 보냈습니다.
					</h4><br>
					<div class="input-group input-group-lg">
                         <span class="input-group-addon"><i class="fas fa-key"></i></span>
                         <input id="certifyNo" type="text" class="form-control" name="certifyNo" placeholder="인증번호">
                    </div>
				</div>
				<div class="modal-footer text-center">
					<button id="auth" type="button" class="btn btn-primary btn-lg">인증하기</button>
				</div>
			</div>
		</div>
	</div> 
      
<c:import url="signupJS.jsp" />
<script>
$( function() {
    $( "#tabs" ).tabs();
  } );

  $(document).ready(
    function() {
        // 태그에 onchange를 부여한다.
        $('#file').change(function() {
                addPreview($(this)); //preview form 추가하기
        });
    });
 
    // image preview 기능 구현
    // input = file object[]
    function addPreview(input) {
        if (input[0].files) {
            //파일 선택이 여러개였을 시의 대응
            for (var fileIndex = 0 ; fileIndex < input[0].files.length ; fileIndex++) {
                var file = input[0].files[fileIndex];
                var reader = new FileReader();
 
                reader.onload = function (img) {
                    //div id="preview" 내에 동적코드추가.
                    //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
                    $(".img_wrap").html(
                        "<img src=\"" + img.target.result + "\"\/>"
                    );
                };
                
                reader.readAsDataURL(file);
            }
        } else alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
    }
</script>
  <script>
			Kakao.init('a48660e1ad76fecc7e41245f473d42cb');
			Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
					Kakao.API.request({
						url : '/v1/user/me',
						success : function(res) {
							console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
						}
					})
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
		</script>
  <script>
  $("input[name='name']").blur(function(){
  	//console.log($(this).val())
  	//alert($(this).val().length)
  	if(isValidName($(this).val()) == false) {
  		 $("span#warnname").text("잘못된 형식의 이름입니다.")
  	} else {
  		$("span#warnname").text("")
  	}
  }) //이름 유효성에 따른 경고창

  $("input[name='id']").blur(function(){
  	//console.log($(this).val())
  	$warnid = $("span#warnid");
  	if(isValidId($(this).val()) == false) {
  		$warnid.removeClass("green")
  		$warnid.text("영문 대소문자, 숫자만 가능합니다.")
  	} else if(isValidId($(this).val()) == true) {
  		$.ajax({
  			url : "<c:url value='/member/checkid.mn'/>",
  			data : "id="+$(this).val(),
  			type : "POST"
  		}).done(function(result) {
  			if(result) {
  				$warnid.removeClass("green")
  				$warnid.text("이미 등록되어있는 아이디 입니다.")
  			} else {
  				$warnid.addClass("green")
  				$warnid.text("사용가능한 아이디 입니다.")
  			}
  		}) //done
  	} else if(isValidId($(this).val()) == 0){
  		$warnid.text("3글자 이상 입력해주세요.")
  	}  
  	//if-else
  }) //id 유효성에 따른 경고창

  $("input[name='passcheck']").blur(function(){
  	let form = document.signup;
  	if(form.pass.value != form.passcheck.value) {
  		$("span#warnpasscheck").text("입력된 패스워드가 서로 다릅니다.")
  		form.passcheck.value ="";
  		form.pass.focus();
  		form.pass.select();
  		
  		return;
  	} //비밀번호와 확인과 서로 다른지 확인
  	else {
  		$("span#warnpasscheck").text("")
  	}
  })

  $("button#newmember1").click(function(){
  	let f = document.signup;
  	if(f.name.value==""){
          alert("이름을 입력하세요")
          f.name.focus()
          return;
      }
  	if(isValidName(f.name.value)==false) {
  		alert("형식에 맞는 이름을 입력해주세요.")
  		f.name.focus()
          return;
  	}
  	
  	if(f.id.value==""){
          alert("아이디를 입력하세요")
          f.id.focus()
          return;
      }
  	if(isValidId(f.id.value) == false) {
  		alert("형식에 맞는 아이디를 입력해주세요.")
  		f.id.focus()
          return;
  	}
  	
      if(f.pass.value==""){
          alert("비밀번호를 입력하세요")
          f.pass.focus()
          return;
      }

      if(f.passcheck.value==""){
          alert("비밀번호 확인을 입력하세요")
          f.passcheck.focus()
          return;
      }
      
    
      alert("회원가입이 완료되었습니다.")
  	
  	f.submit()

  })

  function isValidName(name) {	//이름 유효성 확인..정규식으로
    if(name.length > 20 ){
      return false;
    }
   if(name.length <2){
  	 return false;
   }
    let regx = /[^가-힣]/;
    return !regx.test(name);      // 유효하면 true반환
  }

  function isValidId(emailId){ 	//아이디 유효성 확인..정규식으로
  	if(emailId.length < 2) {
  		return 0;
  	}
    let regx = /[^\w]/;
    return !regx.test(emailId);   // 유효하면 true반환
  }
  </script>
</body>
</html>