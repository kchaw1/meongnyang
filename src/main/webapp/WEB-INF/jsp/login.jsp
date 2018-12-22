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

<!-- 네이버 아이디 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<script src="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"></script>
  
<!-- 모달  -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 탭 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC:700|Do+Hyeon|Sunflower:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poor+Story" rel="stylesheet">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">
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

#sendMail2 {
    height: 33px;
    width: 50px;
    float: right;
    margin-right: 115px;
}

#email {
    display: inline-block;
}

#email2 {
    display: inline-block;
    width: 350px;
}

#loginform {
	margin-top: -15px;
	height: 30%;
}

.login-box, #myModal, #tabs, #myModal2 {
	font-family: 'Jua', sans-serif;
}

.btn-primary:focus {
    background-color: #2e6da4;
    border-color: #2e6da4;
}

.img_wraps {
  width: 300px;
  margin-top: 10px;
}

.img_wraps img {
  max-width: 100%;
  max-height: 200px;
}

#potocancel, #potocancel2 {
	background-color: white;
	border-color: white;
	width: 50px;
    height: 30px;
}

 .social-login a:first-child{
     background-color: transparent; 
  }
  
  .social-login {
    position: relative;
    float: left;
   /*  width: 100%;
    height: auto; */
    padding: 10px 0 15px 0;
    border-bottom: 1px solid #eee;
}

img {
	width: 100%;
	height: 20%;
}

#kakao-login-btn{
    float: right;
    width: 48%;
    margin-top: 10px;
    margin-left: -1%;
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
      <div id="naverIdLogin" style="width: 50%">
      	 <%--   <a id="naver-login-btn" href="#" role="button">
      	  	<img src="<c:url value="/resources/img/member/네이버 아이디로 로그인_완성형_White.PNG"/>" />
      	  </a>   --%>
      </div>
  
      <div id="kakao-login-btn"></div>
    </div>
    <form class="email-login" name="login">
      <div class="u-form-group">
        <input type="email" name="loginid" placeholder="Email 또는 id"/>    
      </div>
      <div class="u-form-group">
        <input type="password" name="loginpass" placeholder="Password"  onkeyup="enterkey();"/>
      </div>
      <div class="u-form-group">
      	<button type="button" class="btn btn-primary" id="loginform">로그인</button>
      </div>
      <div class="u-form-group">
        <a href="#" class="forgot-password">비밀번호를 잊으셨습니까?</a>
      </div>
    </form>
    <form class="email-signup" id="abnsin">
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
                                       <img id="img" src="<c:url value="/resources/img/member/profile.png"/>"/> 
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
                                        <input type="hidden" name="type" value="1" />
                                        <div class="form-group">
                                            <label for="recipient-name" class="control-label"><span id="red">*</span>아이디</label>
                                            <span id='warnid'></span>
                                            <input type="text" class="form-control" name="id">
                                        </div>
                                        <hr>
                                        <div class="form-group">
                                            <label for="recipient-name" class="control-label"><span id="red">*</span>비밀번호</label>
                                            <span id='warnpass'></span>
                                            <input type="password" class="form-control" name="pass">
                                        </div>
                                        <hr>
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
                                                <!-- <button id="sendMail" class="btn btn-default" type="button" data-toggle="modal" data-target="#certify">인증</button>             
                                            <span class="input-group-btn"></span> -->
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
			<!-- <div class="modal fade" id="certify">
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
	</div> --> 
    
			       
	<!-- 행동전문가 회원가입 Modal -->
						 <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					        <div class="modal-dialog">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <button type="button" class="close" data-dismiss="modal"aria-label="Close">
					                        <span aria-hidden="true">&times;</span>
					                    </button>
					                    <h4 class="modal-title" id="myModalLabel">행동전문가</h4>
					                </div>
					      <form name="absignup" id="abscar" enctype="multipart/form-data" method="post" action="<c:url value="/member/absignup.mn"/>">
					                <div class="modal-body">
					                    <div id="tabs">
					                        <ul style="border: 1px solid #dddddd; background: none;">
					                            <li><a href="#tabs-1">행동전문가 회원가입</a></li>
					                            <li><a href="#tabs-2">경력 및 기타 사항</a></li>
					                        </ul>
					                        <div id="tabs-1">
					                            <div class="abs_signup">
					                                <div id="pro2">
					                                    <div id="poto2">
					                                        <span>프로필 사진</span><br> <input id="file2" type="file" name="profile" accept=".gif, .jpg, .png" />
					                                        <div class="img_wraps" id="signimg">
					                                            <label for="image1"> 
					                                            	 <img id="img2" src="<c:url value="/resources/img/member/profile.png"/>"/> 
					                                            </label>
					                                        </div>
					                                    </div>
					                                    <hr>
					                                    <input type="hidden" name="type" value="2" />
					                                    <div class="form-group">
					                                            <label for="recipient-name" class="control-label" id="name2"><span id="red2">*</span>이름</label>
					                                            <span id='warnname2'></span>
					                                            <input type="text" class="form-control" name="name" id="absname">
					                                    </div>
					                                    <hr>
					                                    <div class="form-group">
					                                            <label for="recipient-name" class="control-label"><span id="red2">*</span>아이디</label>
					                                            <span id='warnid2'></span>
					                                            <input type="text" class="form-control" name="id" id="absid">
					                                    </div>
					                                    <hr>
					                                    <div class="form-group">
					                                            <label for="recipient-name" class="control-label"><span id="red2">*</span>비밀번호</label>
					                                            <span id='warnpass2'></span>
					                                            <input type="password" class="form-control" name="pass" id="abspass">
					                                    </div>
					                                    <hr>
					                                    <div class="form-group">
					                                            <label for="recipient-name" class="control-label"><span id="red2">*</span>비밀번호 확인</label>
					                                            <span id='warnpasscheck2'></span>
					                                            <input type="password" class="form-control" name="passcheck" id="abspasscheck">
					                                    </div>
					                                    <hr>
					                                    <div class="row" id="ckNameMsg2"></div>
					                                    <div class="form-group">
					                                            <label for="recipient-name" class="control-label"><span id="red2">*</span>E-mail</label>
					                                            <span id='warnemail2'></span><br>
					                                                <input id="email2" type="text" class="form-control" name="email" placeholder="이메일">                     
					                                                <!-- <button id="sendMail2" class="btn btn-default" type="button" data-toggle="modal" data-target="#certify">인증</button>             
					                                            <span class="input-group-btn"></span> -->
					                                    </div>
					                                    <hr>
					                                    <label for="recipient-name" class="control-label"><span id="red2">*</span>인사말</label>
					                                    <span id='warngree'></span>
					                                    <textarea rows="8" cols="70" placeholder="인사말을 적어주세요." value="" name="greetings"></textarea>
					                                    <hr>
					                                    <span id="animal">담당 반려동물 : <select id="catdog2" name="category" value="">
					                                            <option value="0">선택</option>
					                                            <option value="dog">개</option>
					                                            <option value="cat">고양이</option>
					                                            <option value="all">ALL</option>
					                                    </select></span>
					                                </div>
					                            </div>
					                            
					                        </div>
					                        <div id="tabs-2">
					                        	<div id="allcareer">
					                        	<div class="form-group">					                   	
						                        <div class="file_input">
						                            <label> 자격증 첨부 :<div><input id="lifile" type="file" name="lifile" multiple /></div></label>
						                        </div>
						                        <hr>
						                       <!-- <div id="addcar" class="addcare"></div> 클론했다가 취소한거 -->
					                            <span id="car">경력 :</span> <input type="date" name="careerStart" id="career1" /> <span id="car2">~ </span><input type="date" name="careerEnd" id="career2" />
					                            <button type="button" id="combtn" class="btn pull-right btn-success">추가</button>
					                            				                            
					                            <hr>
					                            <span>상세경력 : </span>
					                            <textarea rows="8" cols="70" placeholder="업무내용을 적어주세요." value="" name="careerContent"></textarea>	
					                            	
					                            <!-- <div class="adcar"></div> 클론했다 취소한거-->
					                            			                            
					                            </div> 
					                            </div>				                            
					                            <hr>					                       					                          
					                        </div>
					                        
					                    </div>
					                </div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" id="newmember2">가입하기</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									</div>
								</form>
							  </div>
							</div>
						</div>
					
<c:import url="loginJS.jsp" />     
<c:import url="signupJS.jsp" />
<script>
$( function() {
    $( "#tabs" ).tabs();
  } );

  $(document).ready(
    function() {
        // 태그에 onchange를 부여한다.
        $('#file').change(function() {
                addPreviews($(this)); //preview form 추가하기
        });
    });
 
    // image preview 기능 구현
    // input = file object[]
    function addPreviews(input) {
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
				url : '/v2/user/me',
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
	    /* 이력서 사진 미리보기 */
        function readURL(input) {
           if(input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function (e) {
                 $("#img2").attr("src", e.target.result);
              }
              reader.readAsDataURL(input.files[0]);
           }
        };
        $("#file2").change(function () {
           
           readURL(this);
        })
</script>

<script>
/*네이버 로그인*/
 
		
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "yf6XqSXCa0vHUbfIL8Ll",
				callbackUrl: "https://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port) + "/nmcat/main/mainPage.mn",
				isPopup: false,
				loginButton: {color: "white", type: 3, height: 25} 
			}
		);
		/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
		
		/* (4-1) 임의의 링크를 설정해줄 필요가 있는 경우 */
		$("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());

		/* (5) 현재 로그인 상태를 확인 */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
					setLoginStatus();
				}
			});
		});

		/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
		function setLoginStatus() {
			var profileImage = naverLogin.user.getProfileImage();
			var nickName = naverLogin.user.getNickName();
			$("#naverIdLogin_loginButton").html('<br><br><img src="' + profileImage + '" height=50 /> <p>' + nickName + '님 반갑습니다.</p>');
			$("#gnbLogin").html("Logout");
			$("#gnbLogin").attr("href", "#");
			/* (7) 로그아웃 버튼을 설정하고 동작을 정의합니다. */
			$("#gnbLogin").click(function () {
				naverLogin.logout();
				location.reload();
			});
		}
</script>
<script>
 var html ="";
$("#combtn").click(function() {

	   html += "<div id='allcareer'>"
	          	+ "<div class='form-group'>" 
	          	+ "<span id='car'>경력 :</span>&nbsp" 
	          	+ "<input type='date' name='careerStart' id='career1'/>"
	          	+ "<span id='car2'> ~ </span>"
	          	+ "<input type='date' name='careerEnd' id='career2' />"
	          	+ "<button type='button' name='cardel' class='btn pull-right btn-success' id='cardel' style='width:70px; height: 30px;'>삭제</button>	"
	          	+ "<hr>"
	          	+ "<span>상세경력 : </span>"
	          	+ "<textarea rows='8' cols='70' placeholder='업무내용을 적어주세요.' value='' name='careerContent'></textarea>"
	          	+ "</div>" 
	          	+ "</div>"
	   $("#tabs-2").append(html)
	}) 

/* $("#addcar").on("click", function(e){
	$(".addcare").clone().appendTo(".adcar")
}); */
	
 $(document).on("click", "#newmember2", function() {
  $("form#abscar").submit();
 }); 
 
 $(document).on("click", "#cardel", function() {
	$(this).parent().remove(); 
 });
</script>
<script>
function enterkey() {
	if(window.event.keyCode == 13) {
	var f = document.login;
	//alert(f.loginid.value)
	//alert(f.loginpass.value)
	$.ajax({
		url : "<c:url value='/member/loginform.mn'/>",
		data : {
				"id" : f.loginid.value,
				"pass" : f.loginpass.value
				},
		type : "POST"
	}).done(function(result){
		if(result == false) {
			swal({
			  type: 'error',
			  title: '아이디와 비밀번호를 다시 입력해주세요.',
			  timer : 3000
			}) //sweetalert
			setTimeout(function() {
				f.loginpass.value = "";
				f.loginid.focus();
				f.loginid.select();
			}, 1500)
		} else {
			location.href = "<c:url value='/main/mainPage.mn'/>"
			
		}
		})
	}
}
</script>

</body>
</html>