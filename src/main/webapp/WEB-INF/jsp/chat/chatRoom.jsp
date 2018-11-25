<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?1">
    <link rel="stylesheet" href="/static/css/cafetalk/channel-1533720572000-61397.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    
     <!-- 채팅방리스트 css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/chat/chatRoom.css"/>">
  
</head>
<body>

                    <div class="people" style="position: fixed;">
                      
                      </div>
                      <div class="list-head">
                            <div class="animate"><img src="header/teddy_food_dribbble.gif" /></div>
                        <p>멍하고 노냥 채팅방
                        <a  data-toggle="modal" href="#myModal"><img id="plus" src="header/noun_Plus_1853024.png"></a>
                        </p>
                        </div>
                      <div class="list">
                        <div class="list-item">
                            <a href="#" onclick="doChatExit()"><img id="exit" src="header/xbox.png"/></a>                              
                          <p class="pull-left" >서울 채팅방 </p>
                              <a href="#" onclick="doChat()"><img src="header/KakaoTalk_20181122_180513355.png"/></a>
                        </div>
                        <div class="list-item">
                                <a href="#" onclick="doChatExit()"><img id="exit" src="header/xbox.png"/></a>                              
                          <p class="pull-left">경기도 채팅방 </p>
                        <a href="#"><img src="header/KakaoTalk_20181122_180513355.png"/></a>
                        </div>
                        <div class="list-item">
                                <a href="#" onclick="doChatExit()"><img id="exit" src="header/xbox.png"/></a>                              
                          <p class="pull-left">충청도 채팅방</p>
                        <a href="#"><img src="header/KakaoTalk_20181122_180513355.png"/></a>
                        </div>
                        <div class="list-item">
                                <a href="#" onclick="doChatExit()"><img id="exit" src="header/xbox.png"/></a>                              
                            <p class="pull-left" onclick="doChatExit()">경상도 채팅방</p>
                                <a href="#"><img src="header/KakaoTalk_20181122_180513355.png"/></a>
                        </div>
                        <div class="list-item">
                                <a href="#" onclick="doChatExit()"><img id="exit" src="header/xbox.png"/></a>                              
                          <p class="pull-left">전라도 채팅방</p>
                              <a href="#"><img src="header/KakaoTalk_20181122_180513355.png"/></a>
                        </div>
                        <div class="list-item">
                                <a href="#" onclick="doChatExit()"><img id="exit" src="header/xbox.png"/></a>                              
                          <p class="pull-left">대형견 집사분들!!!</p>
                              <a href="#"><img src="header/KakaoTalk_20181122_180513355.png"/></a>
                        </div>

                      </div>
                    </div>
                 

                  <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
        
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">×</button>
              <h4 class="modal-title">방 추가</h4>
            </div>
            <div class="modal-body">
                방제목을 입력하세요: <input type="text" />
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">저장</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
          </div>
          
        </div>
      </div>
        <script>
        function doChat() {
             window.open("chat2.html", "chat", "width=700, height=600, scrollbars=yes");
        }
        function doChatExit() {
                alert("채팅방을 삭제하시겠습니까??");
        }
        </script>
</body>
</html>