<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List of Friends</title>
<c:import url="../common/headerfooterCSSJS.jsp"/>
<c:import url="friendCSSJS.jsp"/>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="top-section">
  <div class="tab-menu">
  <ul class="nav nav-tabs">
    <li role="presentation" class="active"><a href="#friend" class="tab" data-toggle="tab">친구인 회원</a></li>
    <li role="presentation" ><a href="#search" class="tab" data-toggle="tab">회원 찾기</a></li>
    <li role="presentation" ><a href="#blocked" class="tab" data-toggle="tab">차단된 회원</a></li>
  </ul>
  </div>
  <div id="myTabContent" class="tab-content">
  <!-- 친구 탭 -->
    <div class="tab-pane fade" id="friend">
      <div class="searchbox">
        <div class="input form-group">
          <input type="text" class="form-control" name="id" placeholder="아이디로 검색하세요"/ >
        </div>
        <div class="select form-group">
          <select id="searchsel" class="form-control searchselect">
            <option value="alphabet">알파벳순</option>
            <option value="regdate">회원가입순</option>
          </select> 
        </div>
        <div class="button form-group">
          <button type="button" class="btn btn-success">검색</button>
        </div>
      </div>
      <div class="list">
        <div class="line1">
          <div class="users" name="users">
            <div class="profile">
              <span class="online"></span>
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="채팅 하기">
                    <i class="far fa-comments fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="다이어리 보기">
                  <i class="fas fa-address-book fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="채팅 하기">
                  <i class="far fa-comments fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="다이어리 보기">
                  <i class="fas fa-address-book fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="채팅 하기">
                  <i class="far fa-comments fa-2x"></i>
                </a>  
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="다이어리 보기">
                  <i class="fas fa-address-book fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="채팅 하기">
                  <i class="far fa-comments fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="다이어리 보기">
                  <i class="fas fa-address-book fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="line2">

        </div>
      </div>
    </div>
    <!--회원 찾기 탭 -->
    <div class="tab-pane fade" id="search">
      <div class="searchbox">
        <div class="input form-group">
          <input type="text" class="form-control" name="id" placeholder="아이디로 검색하세요"/ >
        </div>
        <div class="select form-group">
          <select id="searchsel" class="form-control searchselect">
            <option value="alphabet">알파벳순</option>
            <option value="regdate">회원가입순</option>
          </select> 
        </div>
        <div class="button form-group">
          <button type="button" class="btn btn-success">검색</button>
        </div>
      </div>
      <div class="list">
        <div class="line1">
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" id="plusfriend" title="친구 추가">
                  <i class="fas fa-user-plus fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" id="sendmsg" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" id="blockuser" title="회원 차단">
                  <i class="fas fa-user-slash fa-2x"></i>
                </a>
              </div>
            </div>
          </div>
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="친구 추가">
                  <i class="fas fa-user-plus fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="친구 추가">
                  <i class="fas fa-user-plus fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="친구 추가">
                  <i class="fas fa-user-plus fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="line2">

        </div>
      </div>
    </div>
    <!-- 차단된 회원 리스트 -->
    <div class="tab-pane fade" id="blocked">
      <div class="searchbox">
        <div class="input form-group">
          <input type="text" class="form-control" name="id" placeholder="아이디로 검색하세요"/ >
        </div>
        <div class="select form-group">
          <select id="searchsel" class="form-control searchselect">
            <option value="alphabet">알파벳순</option>
            <option value="regdate">회원가입순</option>
          </select> 
        </div>
        <div class="button form-group">
          <button type="button" class="btn btn-success">검색</button>
        </div>
      </div>
      <div class="list">
        <div class="line1">
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="차단 해제">
                  <i class="fas fa-lock fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="차단 해제">
                  <i class="fas fa-lock-open fa-2x" id="hidden"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="차단 해제">
                  <i class="fas fa-lock fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="차단 해제">
                  <i class="fas fa-lock-open fa-2x" id="hidden"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="차단 해제">
                  <i class="fas fa-lock fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="차단 해제">
                  <i class="fas fa-lock-open fa-2x" id="hidden"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
          <div class="users" name="users">
            <div class="profile">
              <div class="image">
                <i class="fas fa-user-circle fa-7x"></i>
              </div>
              <div class="text">
                <span class="id">${user.id}</span>
              </div>
            </div>
            <div class="info">
              <div class="grade">
                <i class="fas fa-trophy fa-2x"></i>
                뉴비
              </div>
              <div class="icons">
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="차단 해제">
                  <i class="fas fa-lock fa-2x"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="차단 해제">
                  <i class="fas fa-lock-open fa-2x" id="hidden"></i>
                </a>
                <a href="#1" data-toggle="tooltip" data-placement="bottom" title="쪽지 쓰기">
                  <i class="far fa-envelope fa-2x" ></i>
                </a>
              </div>
            </div>
          </div>
        </div>
        <div class="line2">

        </div>
      </div>
    </div>
  </div>
</div>
<script>
	var friend = new WebSocket('wss://localhost:443/nmcat/alarm.mn');
    $(function () {
   		friend.onopen = function() {
			console.log("바디 웹소켓 서버 접속 성공");
		}
    	
      $('[data-toggle="tooltip"]').tooltip()
    
      $("a.tab").click(function(){
        var id = $(this).attr("href").substring(1)
        // alert(id)
        $("div#"+id).siblings().css("display", "none")
        $("div#"+id).css("display", "block")
      })
      
      $("i.fa-lock").mouseenter(function(){
        $(this).attr("id", "hidden")
        $("i.fa-lock-open").attr("id", "show");
      })
      
      $("i.fa-lock-open").mouseleave(function(){
        $("i.fa-lock-open").attr("id", "hidden")
        $("i.fa-lock").removeAttr("id");
      })
      
     
    }) //$function
    
    $("a#plusfriend").click(function() {
    	//console.log($(this))
    	friend.send("friend:")
    })
  </script>
</body>
</html>