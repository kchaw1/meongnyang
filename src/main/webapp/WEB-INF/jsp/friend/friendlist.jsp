<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List of Friends</title>
<c:import url="../common/headerfooterCSSJS.jsp"/>
<c:import url="friendCSS.jsp"/>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="top-section" id="lookhere">
  <div class="tab-menu" >
  <ul class="nav nav-tabs" >
    <li role="presentation" class="active"><a href="#friend" class="tab" data-toggle="tab">친구인 회원</a></li>
    <li role="presentation" ><a href="#search" class="tab" data-toggle="tab">회원 찾기</a></li>
    <li role="presentation" ><a href="#blacklist" class="tab" data-toggle="tab">차단된 회원</a></li>
  </ul>
  </div>
  <div id="myTabContent" class="tab-content">
  <!-- 친구 탭 -->
    <div class="tab-pane active" id="friend">
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
        
      </div>
      <div id="paging" class="text-center">
      
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

      </div>
      <div id="paging" class="text-center">
      
      </div>
    </div>
    <!-- 차단된 회원 리스트 -->
    <div class="tab-pane fade" id="blacklist">
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
        
      </div>
      <div id="paging" class="text-center">
      
      </div>
    </div>
  </div>
</div>
<c:import url="./memberJS.jsp"/>
<c:import url="./friendJS.jsp"/>
<c:import url="./blacklistJS.jsp"/>
</body>
</html>