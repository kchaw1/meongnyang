<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>행동 전문가 질문게시판</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/velocity/1.3.1/velocity.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
  
    <!-- 게시판 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/abs/absDetailBoard.css"/>">

	<!-- 폰트 -->  
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
            <p class="logo">${map.a.name}</p>
            <nav>
              <ul>
                <li>
                  <a href="ABSDetail.html">경력 및 인사말</a>
                </li>
                <li>
                  <a href="#">1:1 화상채팅하기</a>
                </li>
                <li>
                  <a href="ABSDetailBoard.html">질문게시판</a>
                </li>
              </ul>
            </nav>
          </div>
        </header>
        <section class="content">
          <h1>질문 게시판</h1>
          <hr>
          <div class="">
              <div class="row">
                  <div class="col-md-10"></div>
                  <div class="col-md-2" style="text-align: right;font-family: 'Jua', sans-serif;">
     				전체	
                  </div>
              </div>
              <div class="table-responsive">
              <table class="table table-hover">
                <thead>
                <tr>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>등록일</th>
                  <th>조회수</th>
                  <th>답변여부</th>
                </tr>  	 
                     <c:forEach var="b" items="${map.b}">
                        <tr class="clickde">
                        	<td><a href="absDetailBoardDetail.mn?absNo=${b.absNo}">${b.absTitle}</a></td>
                        	<td>${b.absWriter}</td>
                            <td><fmt:formatDate value="${b.absRegDate}" pattern="yyyy-MM-dd" /></td>
                        	<td>${b.absViewCnt}</td>
                            <td>${b.absComplete}</td>                        	
                        </tr>
                      </c:forEach>
                </thead>
                <tbody>
              
                </tbody>
              </table>
              </div><br>
              <div class="search-container">
                  <input type="text" id="search-bar" placeholder="제목을 입력하세요...">
              </div>
              <div>
                  <ul class="pagination">
                    <li class="page-item disabled">
                      <a class="page-link" href="#">&laquo;</a>
                    </li>
                    <li class="page-item active">
                      <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">2</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">3</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">4</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">5</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">&raquo;</a>
                    </li>
                  </ul>
                </div>
                
              <hr>
              <div id="wirte"> 
                  <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                  <button class="btn btn-primary" id="write">글쓰기</button>
                </div>
            
            </div>		
          </section>
        <script>
        $('.hamb-wrap').on('click', function(){
          $(this).parent().children('p').toggle();
          $(this).children().toggleClass('active');
          $('nav').fadeToggle(200);
        
        }) 
        $("#write").click(function(){
            	 location.href="absDetailBoardWrite.mn?no="+${map.a.no};
             }) 
       
        </script>

</body>
</html>