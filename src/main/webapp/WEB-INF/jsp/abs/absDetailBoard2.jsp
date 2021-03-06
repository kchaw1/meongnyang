<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<div class="hero" style="background:linear-gradient(to bottom, rgba(0, 0, 0, 0.4) 0%, rgba(0, 0, 0, 0) 30%),url(<c:url value='/common/download.mn?sysName=${map.a.imageName}&path=${map.a.imagePath}&oriName=${map.a.imageOriName}'/>);
          background-size: cover;
  		  background-position: center;">            
  		  <div class="hamb-wrap">
              <div class="hamb"></div>
            </div>
            <p class="logo">${map.a.name}</p>
            <nav>
              <ul>
                <li>
                  <a href="absDetail.mn?no=${map.a.no}">경력 및 인사말</a>
                </li>
                <li>
                  <a href="#">1:1 화상채팅하기</a>
                </li>
                <li>
                  <a href="absDetailBoard.mn?no=${map.a.no}">질문게시판</a>
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
     				전체 : ${map.pageResult2.count}개 
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
                
               
                     <c:forEach var="b" items="${map.ca}">    
                        <tr class="clickde">
                        	<td><a href="absDetailBoardDetail.mn?absNo=${b.absNo}&no=${map.a.no}" id="detailboard">${b.absTitle}</a></td>
                        	<td>${b.absWriter}</td>
                            <td><fmt:formatDate value="${b.absRegDate}" pattern="yyyy-MM-dd" /></td>
                        	<td>${b.absViewCnt}</td>
                            <td>
                            <c:choose>
                            <c:when test="${b.absComplete=='n'}">
                            	<span class="glyphicon glyphicon-remove" aria-hidden="true" style="color: red;"></span>                           	
                            </c:when>
                      		<c:otherwise>
                      			<span class="glyphicon glyphicon-ok" aria-hidden="true" style="color: green;"></span>
                      		</c:otherwise>
                            </c:choose>
                            </td>                        	
                        </tr>
                      </c:forEach>
                
                
                </thead>
            
              </table>
              </div><br>
                <form method="POST"  role="search" action="<c:url value='/abs/absDetailBoard2.mn?no=${map.a.no}+"&pageNo="+pageNo;'/>" class="navbar-form" name="searchForm" > 
         	<input type="hidden" name="pageNo" value="1"> 
               	<input type="hidden" name="no" value="${param.no}">
              <div class="search-container">
              		<select id="searchType" name="searchType"class="">
                         <option value="1">제목</option>
                         <option value="2">작성자</option>
                	</select> 
                  <input type="text" name="keyword" id="search-bar" placeholder="제목을 입력하세요..."> 
                  <button type="submit"  id="search-button" class="btn btn-default">검색</button>
                  
              </div>
          </form> 
             <c:if test="${map.pageResult2.count != 0 }">
                       	<input type="hidden" name="pageNo" value="1"> 
				<div id="paging" class="text-center">
  				<ul class="pagination">
			        <li<c:if test="${map.pageResult2.prev eq false }"> class="disabled"</c:if>>
			          <a href="${map.pageResult2.beginPage-1}" aria-label="Previous">
			            <span aria-hidden="true">&laquo;</span>
			          </a>
			        </li>
			    
			    <c:forEach var="i" begin="${map.pageResult2.beginPage}" end="${map.pageResult2.endPage}">
			        		<li<c:if test="${i eq map.pageResult2.pageNo }"> class="active"</c:if>>
			        			<a href="${i}">${i}</a>
			        		</li>
			    </c:forEach>
			        <li <c:if test="${map.pageResult2.next eq false}"> class=""</c:if>>
			          <a href="${map.pageResult2.endPage }" aria-label="Next">
			            <span aria-hidden="true">&raquo;</span>
			          </a>
			        </li>
  				</ul>
				</div>
		</c:if>  
                
              <hr> 
              <div id="wirte"> 
           		  <button class="btn btn-primary" id="return">전체 목록으로</button>
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
        $("#return").click(function(){
            	 location.href="absDetailBoard.mn?no="+ ${map.a.no};
             }) 
       $("div > ul.pagination > li > a").click(function(e){
				e.preventDefault();
		
				var pageNo = $(this).attr("href")
				if(pageNo == 0)return false;
					
				location.href = "absDetailBoard2.mn?no="+ ${map.a.no}+"&pageNo="+pageNo; //넘어온 페이지를 스크립에서 처리
				
				
				});
        
     // 검색버튼 클릭
 // 검색버튼 클릭

        </script>

</body>
</html>