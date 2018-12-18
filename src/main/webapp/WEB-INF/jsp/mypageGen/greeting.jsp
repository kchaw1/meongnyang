<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <c:import url="listCSSJS.jsp" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 <!-- hederfooter css -->
  <link rel="stylesheet" href="<c:url value="/resources/css/common/headerfooter.css"/>">
</head>

<style>
.justforSize{
  margin-top: 40px;
}
button{
  float: right;
  margin-top: -30px;
}

div.modal-footer {
    padding: 15px;
    text-align: right;
     border-top: 1px solid white;
}
button.btn-lg {
    padding: 10px 16px;
   font-size: 14px; 
    line-height: 1.3333333;
    border-radius: 6px;
    height: 35px;
    }

.wysiwyg-editor {
 
  margin: 30px;

}

.wysiwyg-controls {
  display: block;
  width: 100%;
  height: 35px;
  border: 1px solid #C2CACF;
  border-bottom: none;
  border-radius: 3px 3px 0 0;
  background: #fff;

}
.wysiwyg-controls a {
  display: inline-block;
  width: 35px;
  height: 35px;
  vertical-align: top;
  line-height: 38px;
  text-decoration: none;
  text-align: center;
  cursor: pointer;
  color: #ADB5B9;
}
.wysiwyg-controls [data-role="bold"] {
  font-weight: bold;
}
.wysiwyg-controls [data-role="italic"] {
  font-style: italic;
}
.wysiwyg-controls [data-role="underline"] {
  text-decoration: underline;
}

[class^="menu"], [class^="menu"]:before, [class^="menu"]:after {
  position: relative;
  top: 48%;
  display: block;
  width: 65%;
  height: 2px;
  margin: 0 auto;
  background: #ADB5B9;
}
[class^="menu"]:before {
  content: '';
  top: -5px;
  width: 80%;
}
[class^="menu"]:after {
  content: '';
  top: 3px;
  width: 80%;
}

.menu-left:before, .menu-left:after {
  margin-right: 4px;
}

.menu-right:before, .menu-right:after {
  margin-left: 4px;
}

.wysiwyg-content {
  max-width: 100%;
  width: 100%;
 height: 300px;
  padding: 12px;
  resize: both;
  overflow: auto;
  font-family: Helvetica, sans-serif;
  font-size: 12px;
  border: 1px solid #C2CACF;
  border-radius: 0 0 3px 3px;
  background: #F2F4F6;
}
div.careerLeft1{
  border-left: 7px solid #FFF498;
  padding-left: 10px;
  width : 500px;
  height : 100%;
}

.modal-content {
    margin-top: 150px;
    position: relative;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #999;
    border: 1px solid rgba(0,0,0,.2);
    border-radius: 6px;
    outline: 0;
    -webkit-box-shadow: 0 3px 9px rgba(0,0,0,.5);
    box-shadow: 0 3px 9px rgba(0,0,0,.5);
}


</style>
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
          <div id="board" class="item statistics" ><a href="<c:url value="/mypageGen/list.mn"/>">기본정보</a></div>
          
          <c:if test="${member.type == 2}">
          <div class="item static"><a href="<c:url value="/mypageGen/greeting.mn"/>">경력 및 인사말</a></div>
          </c:if>
           <c:if test="${member.type == 1}">
          <div class="item" id="grade"><a href="<c:url value="/mypageGen/grade.mn"/>">내 등급</a></div>
          </c:if>
          
          <div class="item" id="mypoint"><a href="<c:url value="/mypageGen/point.mn"/>">내 포인트</a></div>
          <div id="management" class="item"><a href="<c:url value="/mypageGen/activity.mn"/>">내 활동</a></div>
        </div>

      </div>
      
      <div class="view">
      
        <div class="main-title">경력 </div>
         <!-- 경력 수정 모달이 들어감 -->

                  <!-- 회원 정보 수정 모달창-->
                  <button type="button" class="btn btn-primary edit" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">경력 수정</button>
                  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">경력 수정</h4>
                            <h6>행동전문가 개인페이지의 경력 정보를 수정해보세요!</h6>
                          </div>
                          <div class="modal-body">
                            <!--이곳이 비밀번호 확인할 form자리-->
                            <form>
                                
                              
                            <form>
                            
                              
                                

                                
                            </form>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary">수정</button>
                          </div>
                        </div>
                      </div>
                    </div>




        <div class="seperator"></div>

            <div class = "creerForm">
                <div class = "careerLeft1">
                2007~2012 : 온누리 국악 예술학원 운영<br>
                2008~2012 : 찾아가는 문화 활동 사업<br>
                2009~2011 : 울산광역시 문화 예술 지원사업 작품평가 위원<br>
                2009~2011 : 울산 21세기 평생교육원 국악지도자 강사<br>
                2009~2011 : 신세계 이마트 문화센터 민요/장구 전문강사<br>
                2009~2011 : 창우예술단 "우리가락우리소리 공연"<br>
                2009~2011 : 범어사포교원 "여여선원" 문화대학 민요반 전문강사<br>
                </div>
            </div>

      <div class ="justforSize">
        <div class="main-title">인사말 </div>
          <!-- 인사말 수정 모달이 들어감 -->
          <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary btn-lg edit" data-toggle="modal" data-target="#myModal">
                          인사말 수정
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">인사말 수정</h4>
                                <h6>행동전문가 개인페이지의 인사말 정보를 수정해보세요!</h6>
                              </div>
                      	<form action = "updateGreeting.mn" Method = "POST">
                                   <textarea> ${member.content}</textarea>
                                      <input type = "hidden" name = "id" value = "${user.id}"/>
                              
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button  class="btn btn-primary">Save changes</button>
                                
                              </div>
                              </form>
                            </div>
                          </div>
                        </div>
        <div class="seperator forsize3"></div>

        <div class = "greetingForm">
            <div class = "careerLeft1" >
                       ${member.greetings}
               </div>
            </div>
         </div>
         
       
      


        <div class="clear-fix"></div>

      </div>
      
      
      
      </div><!-- panel end -->
	</div><!-- container end -->


<c:import url="/WEB-INF/jsp/common/footer.jsp"/>
</body>
</html>