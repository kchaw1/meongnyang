<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.3.1/velocity.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
     <!-- ����Ʈ css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/abs/absDetailBoardWrite.css"/>">
  

      <!--���ӳ�Ʈ-->
      <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

  <!--�۾�ü-->
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
            <p class="logo">������</p>
            <nav>
              <ul>
                <li>
                  <a href="ABSDetail.html">��� �� �λ縻</a>
                </li>
                <li>
                  <a href="#">1:1 ȭ��ä���ϱ�</a>
                </li>
                <li>
                  <a href="ABSDetailBoard.html">�����Խ���</a>
                </li>
              </ul>
            </nav>
          </div>
        </header>
        <section class="content">
          <h1>���� �ϱ�</h1>
          <hr>
          <div>
            <h4>�ۼ���:</h4>
            <hr>
            ����: <input type="text" id="titleBox"/>
          </div><br>
          
          <div class="smt" style="z-index: 110">
              <textarea name="content" id="summernote" value=""></textarea>
          </div>
          <button type="button" class="btn btn-primary" id="write">�ۼ��Ϸ�</button>

          </section>

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