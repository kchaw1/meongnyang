<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ൿ������ ����Ʈ</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
  <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css"/>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  
  <!-- ����Ʈ css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/abs/absList.css"/>">
  
  <!-- ��Ʈ -->
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
                <small>${b.category} �ൿ������</small>
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
                    <h1 class="name"><span class="nameSpan">��ä��</span></h1>
                  <small>������ �ൿ������</small>
                  <hr>
                  <button type="button" class="btn btn-primary btn-sm" onclick="doChatList() ">More</button>
                  <p>���� ���� ���ǻ� + �ݷ��� �ൿƮ���̳�</p>
                  <p> �׳��� �������� ���� </p>
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
                      <h1 class="name"><span class="nameSpan">������</span></h1>
                    <small>������ �ൿ������</small>
                    <hr>
                    <button type="button" class="btn btn-primary btn-sm" onclick="doChat()">More</button>
                    <p>������ Ī���� �ϴ� ������ ���� �ʽ��ϴ�.</p>
                      <p>���δ� ������ ���� �ǰ� �׸� �ൿ�� �˷��־�, �츮�� ��� �� ������ ����ȯ�濡 �����Ͽ�</p> 
                      <p>�Բ� �� ��ư� �� �ְ� ����� �ִ� ������ ���뱳���̶�� ���մϴ�.</p>   
                          <p>���뱳���� ��ȣ�ڴ԰� �ݷ����� �׻� �ູ�ϱ⸦ �ٶ��ϴ�.</p>
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