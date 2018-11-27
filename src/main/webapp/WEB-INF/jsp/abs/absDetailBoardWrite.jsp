<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.3.1/velocity.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
     <!-- 리스트 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/abs/absDetailBoardWrite.css"/>">
  

      <!--섬머노트-->
      <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

  <!--글씨체-->
  <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
</head>
<body>

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300|Raleway:200,900|Over+the+Rainbow' rel='stylesheet' type='text/css'>
        <meta name="viewport" content="width=device-width, user-scalable=no">
        
        <header style="nav-index: 100;">
          <div class="hero">
            <div class="hamb-wrap">
              <div class="hamb"></div>
            </div>
            <p class="logo"></p>
            <nav>
              <ul>
                <li>
                  <a href="absDetail.mn?no=${param.no}">경력 및 인사말</a>
                </li>
                <li>
                  <a href="#">1:1 화상채팅하기</a>
                </li>
                <li>
                  <a href="absDetailBoard.mn?no=${param.no}">질문게시판</a>
                </li>
              </ul>
            </nav>
          </div>
        </header>
        
       	  <form action="write.mn" method="post">
        <section class="content">
          <h1>질문 하기</h1>
          <hr>
          	<div>
            	<h4>작성자:${user.id}</h4>
            	<input type="hidden" name="absWriter" value="${user.id}"/>
            	<input type="hidden" name="no" value="${param.no}">
            	<hr>
               	제목: <input type="text" id="titleBox" name="absTitle"/>
               	
          	</div><br>
          
          <div class="smt" style="z-index: 110">
	            <textarea name="absContent" id="summernote" value=""></textarea>
          </div>
    	      <button  class="btn btn-primary" id="write">작성완료</button>

          </section>

          </form>  
        <script>
          $('.hamb-wrap').on('click', function(){
            $(this).parent().children('p').toggle();
            $(this).children().toggleClass('active');
            $('nav').fadeToggle(200);
            
          })
          
          $(document).ready(function() {
          $('#summernote').summernote({
            width: 560,
             height: 300,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true
          })
           });
        </script>
</body>
</html>