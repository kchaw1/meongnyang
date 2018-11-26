<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ൿ������ �˾�â</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.3.1/velocity.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
    <!-- �ൿ������ �� �˾�â CSS -->
        <link rel="stylesheet" href="<c:url value="/resources/css/abs/absDetail.css"/>">
        
          <!-- ��Ʈ -->
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
            <p class="logo">${map.b.name}</p>
            <nav>
              <ul>
                <li>
                  <a href="absDetail.mn?no=${map.b.no}">��� �� �λ縻</a>
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
          <h1>��� �� �λ縻</h1>
          <h4 >
          <button type="button" id="like-button">
            <svg class="heart-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><path d="M91.6 13A28.7 28.7 0 0 0 51 13l-1 1-1-1A28.7 28.7 0 0 0 8.4 53.8l1 1L50 95.3l40.5-40.6 1-1a28.6 28.6 0 0 0 0-40.6z"/></svg>
            Like
          </button>
              ���ƿ�: 
              <span class="counter" data-count="${map.b.absLikeCnt}">0</span>
            </h4>
          <hr> 
          <div class="DetailContainer">
               <p id="name">"${map.b.name}"</p>
              <p>���: 1985�� 5�� 27�� (33��)</p> 
              <p>����: ����� ���� ����, �Ƶ� ���ֿ�</p>
              <p>�Ҽ�: �������۴� (��ǥ)</p>
              <p>������ Ī���� �ϴ� ������ ���� �ʽ��ϴ�.
                ���δ� ������ ���� �ǰ� �׸� �ൿ�� �˷��־�, �츮�� ��� �� ������ ����ȯ�濡 �����Ͽ�
                �Բ� �� ��ư� �� �ְ� ����� �ִ� ������ ���뱳���̶�� ���մϴ�.   
                ���뱳���� ��ȣ�ڴ԰� �ݷ����� �׻� �ູ�ϱ⸦ �ٶ��ϴ�.</p>
                
              </div>
          </div>
        
         </section>
        <script>
        $('.hamb-wrap').on('click', function(){
          $(this).parent().children('p').toggle();
          $(this).children().toggleClass('active');
          $('nav').fadeToggle(200);
        
        }) 


        /*--------���ƿ�--------------*/
        document.addEventListener('DOMContentLoaded', function() {
         var likeButton = document.getElementById('like-button');
        likeButton.addEventListener('click', function() {
         window.lb = likeButton;
          likeButton.classList.toggle('selected');
       });
        }, false);

        /*���ƿ� ����*/
        $('.counter').each(function() {
  var $this = $(this),
      countTo = $this.attr('data-count');
  
  $({ countNum: $this.text()}).animate({
    countNum: countTo
  },

  {

    duration: 5000,
    easing:'linear',
    step: function() {
      $this.text(Math.floor(this.countNum));
    },
    complete: function() {
      $this.text(this.countNum);
      //alert('finished');
    }

  });   
});

        </script>
</body>
</html>