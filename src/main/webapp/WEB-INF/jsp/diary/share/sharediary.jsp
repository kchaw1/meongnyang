<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="../../common/headerfooterCSSJS.jsp"/>
<c:import url="./sharediaryCSSJS.jsp"/>
</head>
<body>
<c:import url="../../common/header.jsp"/>
<div class="top-section">
	<div class="sharediaryList">
        <ul id="stickies">
        <c:choose>
        <c:when test="${empty user.id}">
        	<c:forEach var="dr" items="${list1}">
            <li class="diary" data-toggle="modal" data-target="#share"  data-no="${dr.drNo}">
				<div class="dr-title">
	               <div class="title">${dr.drTitle}</div>
	               <div class="writer dropdown">
	               <div class="image">
	               	
	               </div>
	               <a href="#1" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	               ${dr.drWriter}</a>
	               </div>
	               <div class="date"><fmt:formatDate value="${dr.drRegDateTime}" pattern="yyyy-MM-dd HH:mm"/></div>
              	</div>
              	<div class="dr-content">${dr.drContent}</div>
              	<div class="dr-comments"> 댓글없음</div>
			</li>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<c:forEach var="dr2" items="${list2}">
			<c:if test="${(dr2.friendsId!=null && dr2.drShare=='2') || dr2.drShare=='1' || dr2.drWriter ==user.id}">
            <li class="diary" data-toggle="modal" data-target="#share"  data-no="${dr2.drNo}">
				<div class="dr-title">
	               <div class="title">${dr2.drTitle}</div>
	               <div class="writer dropdown show" data-id="${dr2.drWriter}">
	               <div class="image">
	               	
	               </div>
	               <c:choose>
	               <c:when test="${dr2.friendsId == dr2.drWriter }">
		               <a href="#1" class="btn-secondary dropdown-toggle" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		               ${dr2.drWriter}</a><span class="label label-friend">친구</span>
		               <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenuLink">
					     <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
					     <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
					     <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
					     <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
					   </ul>
	               </c:when>
	               <c:when test="${dr2.drWriter == user.id }">${dr2.drWriter}<span class="label label-me">나</span></c:when>
	               <c:otherwise>${dr2.drWriter}</c:otherwise></c:choose></div>
	               <div class="date"><fmt:formatDate value="${dr2.drRegDateTime}" pattern="yyyy-MM-dd HH:mm"/></div>
              	</div>
              	<div class="dr-content">${dr2.drContent}</div>
              	<div class="dr-comments"> 댓글없음</div>
			</li>
			</c:if>
			</c:forEach>
		</c:otherwise>
		</c:choose>
        </ul>
    </div>
    
    <div class="modal fade" id="share" tabindex="-1" role="dialog" aria-hidden="true">
	    <div class="modal-dialog modal-center">
	      <div class="modal-content">
	        <!-- <img src="./img/diary.png"/ class="diary"> -->
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	              <span aria-hidden="true">&times;</span>
	            </button>
	          <h3 class="header"><span id="writer"></span> 일기</h3>
	        </div>
	        <div class="modal-body">
	          <div class="diaryList">
	
	          </div>
	      	</div>
	      </div>
	  </div>
	</div> 
</div>
<c:import url="../../common/footer.jsp"/>
<c:import url="./sharediaryJS.jsp"/>
</body>
</html>