<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>행동전문가 리스트</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
  <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css"/>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  
  <!-- 리스트 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/abs/absList.css"/>">
  
  <!-- 폰트 -->
  <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
  
  <!-- header,footer  css -->
  <link rel="stylesheet" href="<c:url value="/resources/css/common/headerfooter.css"/>">
  
</head>
<body>
<c:import url="../common/header.jsp" />
 <div class="slide--parent">
 
	<c:forEach var="b" items="${map.list}">
        <div class="parent--el">
          <div class="two--col">
            <div class="is-item has--img">
              <figure class="the-img">
                <img src="http://www.topstarnews.net/news/photo/first/201702/img_242167_1.jpg" alt="">
              </figure>
            </div>
            <div class="is-item has--content">
              <div class="is-item--inner">
                <h1 class="name"><span class="nameSpan">${b.name}</span></h1>
                <small>${b.category} 행동전문가</small>
                <hr>
                <button type="button" class="btn btn-primary btn-sm" onclick="doDetail()">More</button>
                <p>${b.greetings}</p>
              </div>
            </div>
          </div>
        </div>
	</c:forEach>
      <!-- 
        <div class="parent--el">
            <div class="two--col">
              <div class="is-item has--img">
                <figure class="the-img">
                  <img src="https://scontent-atl3-1.cdninstagram.com/vp/8161dd67653f813ca1da895a36ea4bd4/5C64CB80/t51.2885-15/e35/42888152_323397778240080_4632234264009469420_n.jpg" alt="">
                </figure>
              </div>
              <div class="is-item has--content">
                <div class="is-item--inner">
                    <h1 class="name"><span class="nameSpan">설채현</span></h1>
                  <small>강아지 행동전문가</small>
                  <hr>
                  <button type="button" class="btn btn-primary btn-sm" onclick="doChatList() ">More</button>
                  <p>국내 유일 수의사 + 반려견 행동트레이너</p>
                  <p> 그녀의 동물병원 원장 </p>
                  <p>  KPA PROFESSIONAL TRAINER</p>
                </div>
              </div>
            </div>
          </div>
          <div class="parent--el">
              <div class="two--col">
                <div class="is-item has--img">
                  <figure class="the-img">
                    <img src="http://www.topstarnews.net/news/photo/first/201702/img_242167_1.jpg" alt="">
                  </figure>
                </div>
                <div class="is-item has--content">
                  <div class="is-item--inner">
                      <h1 class="name"><span class="nameSpan">강형욱</span></h1>
                    <small>강아지 행동전문가</small>
                    <hr>
                    <button type="button" class="btn btn-primary btn-sm" onclick="doChat()">More</button>
                    <p>무조건 칭찬만 하는 교육을 하진 않습니다.</p>
                      <p>때로는 거절을 통해 옳고 그른 행동을 알려주어, 우리가 사는 이 복잡한 도시환경에 적응하여</p> 
                      <p>함께 잘 살아갈 수 있게 보듬어 주는 교육을 보듬교육이라고 말합니다.</p>   
                          <p>보듬교육은 보호자님과 반려견이 항상 행복하기를 바랍니다.</p>
                  </div>
                </div>
              </div>
            </div> -->
      
      </div>
<script>
  var slideEl = $(".slide--parent");

slideEl.flickity({
	imagesLoaded: true,
	wrapAround: true,
	autoPlay: true,
	pauseAutoPlayOnHover: false
});

function doDetail() {
   window.open("absDetailMain.mn", "Detail", "width=1000, height=700,resizable=no");
}

function doChatList() {
   window.open("chat.html", "chatList", "width=400, height=600, scrollbars=yes");
}


</script>
		<c:import url="../common/footer.jsp" />

</body>
</html>