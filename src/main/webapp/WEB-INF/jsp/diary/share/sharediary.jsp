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
        	<c:forEach var="dr" items="${list}">
            <li class="diary">
				<div class="dr-title">
	               <div class="title">${dr.drTitle}</div>
	               <div class="writer">${dr.drWriter}</div>
	               <div class="date"><fmt:formatDate value="${dr.drRegDateTime}" pattern="yyyy-MM-dd HH:mm"/></div>
              	</div>
              	<div class="dr-content">${dr.drContent}</div>
              	<div class="dr-comments"> 댓글없음</div>
			</li>
			</c:forEach> 
            <li><span class="sticky">오늘은 CSS 종료하는 날</span></li>
            <li><span class="sticky">행복한</span></li>
            <li><span class="sticky">행복한</span></li>
            <li><span class="sticky">행복한</span></li>
            <li><span class="sticky">행복한</span></li>
            <li><span class="sticky">수요일</span></li>
            <li><span class="sticky">해피</span></li>
            <li><span class="sticky">파이팅!!</span></li>
            <li><span class="sticky">파이팅!!</span></li>
            <li><span class="sticky">파이팅!!</span></li>
            <li><span class="sticky">파이팅!!</span></li>
            <li><span class="sticky">파이팅!!</span></li>
        </ul>
    </div>
</div>
<c:import url="../../common/footer.jsp"/>
</body>
</html>