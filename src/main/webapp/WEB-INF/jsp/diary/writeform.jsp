<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../common/headerfooterCSSJS.jsp"/>
<c:import url="calendarCSSJS.jsp"/>
</head>
<body>
<c:import url="../common/header.jsp"/>
  <div class="top-section">
    <div id="calendar">
      <div class="year"></div>
      <div class="month">
        <ul class="months">
          <li><a href="#1" class="prev"> << </a></li>
          <li><a href="#1" title="Jan" data-value="1">Jan</a></li>
          <li><a href="#1" title="Feb" data-value="2">Feb</a></li>
          <li><a href="#1" title="Mar" data-value="3">Mar</a></li>
          <li><a href="#1" title="Apr" data-value="4">Apr</a></li>
          <li><a href="#1" title="May" data-value="5">May</a></li>
          <li><a href="#1" title="Jun" data-value="6">Jun</a></li>
          <li><a href="#1" title="Jul" data-value="7">Jul</a></li>
          <li><a href="#1" title="Aug" data-value="8">Aug</a></li>
          <li><a href="#1" title="Sep" data-value="9">Sep</a></li>
          <li><a href="#1" title="Oct" data-value="10">Oct</a></li>
          <li><a href="#1" title="Nov" data-value="11">Nov</a></li>
          <li><a href="#1" title="Dec" data-value="12">Dec</a></li>
          <li><a href="#1" class="next"> >> </a></li>
        </ul>
      </div>
      <div id="calendarContent">
        <div class="yoil">
          <ul class="yoils">
            <li>일</li>
            <li>월</li>
            <li>화</li>
            <li>수</li>
            <li>목</li>
            <li>금</li>
            <li>토</li>
          </ul>
        </div>
        <div class="date">
          
        </div>
      </div>
    </div> 
    <div class="form">
      <div id="input form-group" class="write">
        <div class="submit">
          <table class="submit">
            <tr>
              <td class="date">오늘 날짜</td>
              <td class="input-form">
                <input type="text" name="date" class="form-control" disabled="disabled"/>
              </td>
              <td>
                <button>작성</button>
              </td>
            </tr>
          </table>
        </div>
        </div> 
        <table class="writeform">
          <tr >
            <th class="up" colspan="2">내 다이어리 쓰기</th>
          </tr>
          <tr>
            <td class="text">제목</td>
            <td>
              <div class="title form-group">
                <input type="text" name="title" class="form-control" />
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="textarea">
              <textarea name="content" id="summernote" value=""></textarea>
            </td>
          </tr>
        </table>
      </div>
    </div> 
  </div>
  <!-- 다이어리 모달-->
  <div class="modal fade" id="diary" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-center">
      <div class="modal-content">
        <!-- <img src="./img/diary.png"/ class="diary"> -->
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          <h3 class="header"><span> 2018.11.23 </span>일기</h3>
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
  </div> <!--모달-->
  <c:import url="../common/footer.jsp"/>
<script>

</script>
</body>
</html>