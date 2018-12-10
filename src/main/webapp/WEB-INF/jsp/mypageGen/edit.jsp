<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="listCSSJS.jsp" />
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
<style>
.profileEdit{

  float: left;


}
.infoEdit{
  margin-left: 10%;
  float: left;


  
}
.left{
  float: left;
  width:45%;
  height: 100%;


}
.right{
  margin-left: 10%;
  float: right;
  width:45%;
  height: 100%;

}
#container .panel {
    padding: 10px;
    background: white;
    border-radius: 10px;
    box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0);
    z-index: 8;
    overflow: hidden;
}
.forPadding{
  padding: 20px;
}
.forImg{
  width: 189px;
  margin-left: 35px;
  padding: 2px;
  border: 1px solid #eaeaea;
}
.forSpan{
  font-size: 18px;
  margin-left: 70px;
}
.forSpan2{
  font-size: 13px;
  margin-left: 100px;
}
.modal-footer {
    padding: 15px;
    text-align: center;
}
.modal-footer {
    padding: 15px;
    text-align: center;
     border-top: 0px solid #e5e5e5;
}
.modal-sm {
    margin-top: 110px;
}
.modal-dialog {
    margin-top: 110px;
}

/****** CODE ******/

.file-upload{display:block;text-align:center;font-family: Helvetica, Arial, sans-serif;font-size: 12px;}
.file-upload .file-select{display:block;border: 2px solid #dce4ec;color: #34495e;cursor:pointer;height:40px;line-height:40px;text-align:left;background:#FFFFFF;overflow:hidden;position:relative;}
.file-upload .file-select .file-select-button{background:#dce4ec;padding:0 10px;display:inline-block;height:40px;line-height:40px;}
.file-upload .file-select .file-select-name{line-height:40px;display:inline-block;padding:0 10px;}
.file-upload .file-select:hover{border-color:#34495e;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
.file-upload .file-select:hover .file-select-button{background:#34495e;color:#FFFFFF;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
.file-upload.active .file-select{border-color:#3fa46a;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
.file-upload.active .file-select .file-select-button{background:#3fa46a;color:#FFFFFF;transition:all .2s ease-in-out;-moz-transition:all .2s ease-in-out;-webkit-transition:all .2s ease-in-out;-o-transition:all .2s ease-in-out;}
.file-upload .file-select input[type=file]{z-index:100;cursor:pointer;position:absolute;height:100%;width:100%;top:0;left:0;opacity:0;filter:alpha(opacity=0);}
.file-upload .file-select.file-select-disabled{opacity:0.65;}
.file-upload .file-select.file-select-disabled:hover{cursor:default;display:block;border: 2px solid #dce4ec;color: #34495e;cursor:pointer;height:40px;line-height:40px;margin-top:5px;text-align:left;background:#FFFFFF;overflow:hidden;position:relative;}
.file-upload .file-select.file-select-disabled:hover .file-select-button{background:#dce4ec;color:#666666;padding:0 10px;display:inline-block;height:40px;line-height:40px;}
.file-upload .file-select.file-select-disabled:hover .file-select-name{line-height:40px;display:inline-block;padding:0 10px;}

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
        <div class="sub-title">MyPage</div>
        <div class="main-title">내 정보 수정</div>
        <div class="seperator"></div>
          <div class ="editForm">
              <div class ="left">

                  <div class="panel panel-default">
                      <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            프로필 수정
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                          "멍하고노냥"에서 회원님을 표현하는 프로필 사진입니다.
                          <br>
                          수정 화면에서 프로필사진을 변경해 보세요!
                          <hr>
                                <!--프로필 사진 변경 모달-->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">프로필 수정</button>

                                <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                  <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                      <div class ="forPadding">
                                        <span class ="forSpan">프로필 사진 수정</span>
                                        <hr>
                                        <form name="profileupdate" enctype="multipart/form-data" method="post" action="updateProfile.mn">
                                        <div class ="forImg"><img src="<c:url value='/common/download.mn?sysName=${user.imageName}&path=${user.imagePath}&oriName=${user.imageOriName}'/>" width="183" height="220"></div>
                                        <span class ="forSpan2">이력서사진.jpg</span>
                                        <hr>
                                <!--파일첨부 cSS-->
                                <div class="file-upload">
                                    <div class="file-select">
                                    <div class="file-select-button" id="fileName">Choose File</div>
                                    <div class="file-select-name" id="noFile">No file chosen...</div> 
                                    <input type="file" name="profile" id="file" accept=".gif, .jpg, .png" />
                                    </div>
                                </div>
                                <hr>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-primary">수정</button>
                            </div>
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>           
        </div>
        </div>
              </div>
              <div class ="right">
                  <div class="panel panel-default">
                      <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                          <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            회원정보 수정
                          </a>
                        </h4>
                      </div>
                      <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            "멍하고노냥"에서 회원님의 회원정보 창입니다.<BR>
                            수정 화면에서 회원님의 정보를 변경해 보세요!
                            <hr>
         
                              <!-- 회원 정보 수정 모달창-->
                          <button type="button" class="btn btn-primary edit" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">회원정보 수정</button>
                          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                              <div class="modal-dialog">
                              <form id="updateform" name="updateform" action="updatePass.mn" method="post">
                                <div class="modal-content">                                           
                                  <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="exampleModalLabel">회원 비밀번호 확인</h4>
                                    <h6>회원의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</h6>
                                  </div>
                                  <div class="modal-body">
                                    <!--이곳이 비밀번호 확인할 form자리-->
                                        <div class="form-group">
                                          <label for="recipient-name" class="control-label">회원 이름</label>
                                          <input type="text" class="form-control form-control2" id="recipient-name" value = "${user.name}" readonly>
                                        </div>
                                      <div class="form-group">
                                        <label for="recipient-name" class="control-label">회원 아이디</label>
                                        <input type="text" class="form-control form-control2" id="recipient-id" value = "${user.id}" readonly>
                                      </div>
                                      <div class="form-group">
                                          <label for="recipient-name" class="control-label">이메일</label>
                                          <input type="email" class="form-control form-control2" id="recipient-email" value = "${user.email}" >
                                        </div>
                                     <div class="form-group">
                                            <label for="recipient-name" class="control-label"><span id="red">*</span>새 비밀번호</label>
                                            <span id='warnpass'></span>
                                            <input type="password" class="form-control" name="pass">
                                        </div>
                                        <!--유효성 검사배우기-->
                                      <div class="form-group">
                                            <label for="recipient-name" class="control-label"><span id="red">*</span>새 비밀번호 확인</label>
                                            <span id='warnpasscheck'></span>
                                            <input type="password" class="form-control" name="passcheck">
                                        </div>
                                    
                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                    <button type="button" id="update" class="btn btn-primary">수정</button>
                                  </div>
                                  </form>
                                </div>
                              </div>
                            </div>
                        </div>
                      </div>
                    </div>
              </div>
          </div>

        <div class="clear-fix"></div>

      </div>
    </div>
    </div>
	<c:import url="/WEB-INF/jsp/common/footer.jsp" />
<script>
$("input[name='passcheck']").blur(function(){
	let form = document.updateform;
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
$("button#update").click(function(){
	let f = document.updateform;
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
    f.submit();
})
</script>
</body>
</html>