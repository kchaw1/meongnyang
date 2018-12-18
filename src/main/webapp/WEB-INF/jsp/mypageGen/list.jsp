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
  width: 902px;
    height: 94px;
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
.img-responsive {
	display: block;
    max-width: 100%;
    height: 180px;
}

.modal-dialog {
    margin-top: 100px;
}
.spanC2{
    font-size: 20px;
    font-weight: 600;
    color: #adb7c3 !important;
    font-family: 'Roboto', 'Noto Sans', '맑은 고딕', 'Malgun Gothic', '돋움', dotum, "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
    margin-top: 10px;
    }

#a1, #a2 {
  text-decoration:none;
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
        <c:if test="${member.type == 1}">
        <div class="log-out">반려인</div>
        </c:if>
        <c:if test="${member.type == 2}">
        <div class="log-out">행동전문가</div>
        </c:if>
        <c:if test="${member.type == 3}">
        <div class="log-out">admin</div>
        </c:if>
        <div class="seperator"></div>
        <div class="list"> 
          <div id="board" class="item statistics" ><a href="<c:url value="/mypageGen/list.mn"/>">기본정보</a></div>
          
          <c:if test="${member.type == 2}">
          <div class="item static"><a href="<c:url value="/mypageGen/list.mn"/>">경력 및 인사말</a></div>
          </c:if>
           <c:if test="${member.type == 1}">
          <div class="item" id="grade"><a href="<c:url value="/mypageGen/grade.mn"/>">내 등급</a></div>
          </c:if>
          
          <div class="item" id="mypoint"><a href="<c:url value="/mypageGen/point.mn"/>">내 포인트</a></div>
          <div id="management" class="item"><a href="<c:url value="/mypageGen/activity.mn"/>">내 활동</a></div>
        </div>

      </div>
      <!-- /좌측 메뉴 -->

      <!-- 우측 콘텐츠 영역-->
      <div class="view">
        <div class="sub-title">MyPage</div>
        <div class="main-title">기본정보</div>
        <div class="seperator"></div>
        <div>
          <div class ="forImg2">
          <img src="<c:url value='/common/download.mn?sysName=${member.imageName}&path=${member.imagePath}&oriName=${member.imageOriName}'/>" class="img-responsive" alt="Responsive image" width="183" height="280">
          </div>
          <!-- 회원구분 -->
          <ul class ="ul2">
          	<c:if test="${member.type == 1}">
		            <li class = "li2">
		              <label class ="labelC">회원등급</label><br>
		              <div class ="spanC2"><a id="a1" href="#" onclick="grade();">${member.codeName}</a></div>
		            </li>
            </c:if>
            <c:if test = "${member.type == 2}">
              <li class = "li2">
		              <label class ="labelC">회원구분</label><br>
		              <div class ="spanC2">행동전문가</div>
		            </li>
            </c:if>
            <c:if test = "${member.type == 3}">
              <li class = "li2">
		              <label class ="labelC">회원구분</label><br>
		              <span class ="spanC2">관리자</span>
		            </li>
            </c:if>
            <!-- -------------------------------------------------------------------- -->
            
            <li class = "li2">
                <label class ="labelC">회원이름</label><br>
                <div class ="spanC2">${member.name}</div>
            </li>
            <li class = "li3">
                <label class ="labelC">회원아이디</label><br>
                <span class ="spanC">${member.id}</span>
            </li>
          </ul>
       </div>
       <ul class = "ul3">
          <li class = "li6">
              <label class ="labelC">이메일</label><br>
              <span class ="spanC">${member.email}</span>
          </li>
          <li class = "li4">
             <label class ="labelC">일반인 랭킹</label><br>
             <span class ="spanC">6위</span>
         </li>
         
         <c:if test="${member.category == 'dog'}">
          <li class = "li4">
              <label class ="labelC">반려동물</label><br>
              <span class ="spanC">개</span>
          </li>
          </c:if>
          <c:if test="${member.category == 'cat'}">
          <li class = "li4">
              <label class ="labelC">반려동물</label><br>
              <span class ="spanC">고양이</span>
          </li>
          </c:if>
          <c:if test="${member.category == 'all'}">
          <li class = "li4">
              <label class ="labelC">반려동물</label><br>
              <span class ="spanC">ALL</span>
          </li>
          </c:if> 
          
          <li class = "li4">
              <label class ="labelC">포인트</label><br>
              <span class ="spanC"><a id="a2" href='#' onclick="point();"><fmt:formatNumber value="${member.point}" pattern="#,###"/></a></span>
              
          </li>
          <li class = "li4">
              <label class ="labelC">활동점수</label><br>
              <span class ="spanC">${member.score}</span>
          </li>
          <!-- <li class = "li4">
              <label class ="labelC">받은좋아요</label><br>
              <span class ="spanC">520개</span>
          </li> -->
          <li class = "li4">
              <label class ="labelC">최근접속일</label><br>
              <span class ="spanC"><fmt:formatDate value='${lastlogin}' pattern="yyyy-MM-dd HH:mm:ss"/></span>
          </li>
          <li class = "li5">
              <label class ="labelC">가입일</label><br>
              <span class ="spanC"><fmt:formatDate value='${member.signUpDate}' pattern="yyyy-MM-dd" /></span>
          </li>

       </ul>
       <div class ="btnGroup">

          <!-- 회원정보수정전 비밀번호 확인 -->
          <button type="button" class="btn btn-primary edit" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">회원정보 수정</button>
          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
              <div class="modal-dialog">
              <form name="loginck"  method="post" id="loginck">
               
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">회원 비밀번호 확인</h4>
                    <h6>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.</h6>
                  </div>
                  <div class="modal-body">
                    <!--이곳이 비밀번호 확인할 form자리-->
                      <div class="form-group">
                        <label for="recipient-name" class="control-label">회원 아이디</label>
                        <input type="text" class="form-control form-control2" id="recipient-name" name="id" value = "${member.id}" readonly>
                      </div>
                      <div class="form-group">
                          <label for="recipient-name" class="control-label">회원 비밀번호<span class ="star">*</span></label>
                          <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="pass">
                        </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-primary" id ="enter" >확인하기</button>
                  </div>
                </div>
                </form>
              </div>
            </div>
        </div>
	</div>
       
      


        <div class="clear-fix"></div>

      </div>
    </div>
<c:import url="/WEB-INF/jsp/common/footer.jsp"/>

<script>
$("button#enter").click(function(){
 
	$.ajax({
		url: "<c:url value='/mypageGen/loginck.mn'/>",
		type: "POST",
		data: $("#loginck").serialize() // form에 있는 데이터정보를 serialize로 받음
	}).done(function(result){
		console.log(result);
		if(result == 0) {
			alert("비밀번호가 다릅니다!")
		}else{
			location.href = "edit.mn"
		}
	});	
});

function point() {
	location.href = "point.mn";
}

function grade() {
	location.href = "grade.mn";
}
</script>
</body>
</html>