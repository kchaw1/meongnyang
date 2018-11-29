<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>행동전문가 리스트</title>
<c:import url="../common/headerfooterCSSJS.jsp"/>
  <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
  <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css"/>
  
  
  <!-- 리스트 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/abs/absList.css"/>">
  
  
  <!-- header,footer  css -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/solid.css" integrity="sha384-rdyFrfAIC05c5ph7BKz3l5NG5yEottvO/DQ0dCrwD8gzeQDjYBHNr1ucUpQuljos" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/fontawesome.css" integrity="sha384-u5J7JghGz0qUrmEsWzBQkfvc8nK3fUT7DCaQzNQ+q4oEXhGSx+P2OqjWsfIRB8QT" crossorigin="anonymous">

</head>
<body>
<c:import url="../common/header.jsp" />
 <div class="slide--parent">
 
    <c:forEach var="b" items="${map.list}">
        <div class="parent--el">
          <div class="two--col">
            <div class="is-item has--img">
              <figure class="the-img">
                <img src="https://collaborativecbt.com/wp-content/uploads/2016/12/default-avatar.png" alt="">
              </figure>
            </div>
            <div class="is-item has--content">
              <div class="is-item--inner">
                <h1 class="name"><span class="nameSpan">${b.name}</span></h1>
                <small>${b.category} 행동전문가</small>
                <hr>
                <button type="button" class="btn btn-primary btn-sm" onclick="doDetail(${b.no})">More</button>
                <p>${b.greetings}</p>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
    
      
      </div>
<script>
  var slideEl = $(".slide--parent");

slideEl.flickity({
	imagesLoaded: true,
	wrapAround: true,
	autoPlay: true,
	pauseAutoPlayOnHover: false
});

function doDetail(no) {
    var left = (screen.width-1000) /2
       var top = (screen.height-700) /2
   window.open("absDetailMain.mn?no="+no, "Detail", "width=1000, height=700, left="+left+", top="+top);
}

function doChatList() {
   window.open("chat.html", "chatList", "width=400, height=600, scrollbars=yes");
}


</script>
		<c:import url="../common/footer.jsp" />

</body>
</html>