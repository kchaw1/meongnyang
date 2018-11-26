<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="modal fade" id="diary" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-center">
      <div class="modal-content">
        <!-- <img src="./img/diary.png"/ class="diary"> -->
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          <h3 class="header"><span id="setdate"> 2018.11.23 </span> 일기</h3>
        </div>
        <div class="modal-body">
          <div class="diaryList">
            <div class="diary">
              <div class="dr-title">
                <span class="title">${dr.title}</span>
                <span class="date">${dr.regDate}</span>
                <span class="label label-friend">친구에게만 공개</span>
              </div>
              <div class="dr-content">
                ${dr.content}<br>
                111<br>
                11111<br>
                1111<br>
                11111<br>
                1111<br>
                1111<br>
                111<br>
                111<br>
                1111<br>
              </div>
              <div class="buttons">
                <div class="button-box">
                  <button class="dr-delete">삭제</button>
                  <button class="dr-update">수정</button>
                </div>
              </div>
            </div>
            <div class="diary">
              <div class="dr-title">
                <span class="title">${dr.title}</span>
                <span class="date">${dr.regDate}</span>
                <span class="label label-share">전체 공개</span>
              </div>
              <div class="dr-content">
                ${dr.content}<br>
                111<br>
                11111<br>
                1111<br>
                11111<br>
                1111<br>
                1111<br>
                111<br>
                111<br>
                1111<br>
              </div>
              <div class="buttons">
                <div class="button-box">
                  <button class="dr-delete">삭제</button>
                  <button class="dr-update">수정</button>
                </div>
              </div>
            </div>
            <div class="diary">
              <div class="dr-title">
                <span class="title">${dr.title}</span>
                <span class="date">${dr.regDate}</span>
                <span class="label label-noshare">나만 보기</span>
              </div>
              <div class="dr-content">
                ${dr.content}<br>
                111<br>
                11111<br>
                1111<br>
                11111<br>
                1111<br>
                1111<br>
                111<br>
                111<br>
                1111<br>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div> 