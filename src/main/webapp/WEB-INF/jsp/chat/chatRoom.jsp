<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
     <!-- ä�ù渮��Ʈ css -->
    <link rel="stylesheet" href="<c:url value="/resources/css/chat/chatRoom.css"/>">
  
</head>
<body>

                    <div class="people" style="position: fixed;">
                      
                      </div>
                      <div class="list-head">
                            <div class="animate"><img src="/nmcat/resources/img/common/teddy_food_dribbble.gif" /></div>
                        <p>���ϰ� ��� ä�ù�
                        <a  id="chatRoom" data-toggle="modal" href="#myModal"><img id="plus" src="/nmcat/resources/img/chat/noun_Plus_1853024.png"></a>
                        </p>
                        </div>
                      <div class="list">
                      
                      <c:forEach var="c" items="${map}">
                        <div class="list-item">
                            <a href="#" onclick="doChatExit()"><img id="exit" src="/nmcat/resources/img/chat/xbox.png"/></a>                              
                          <p class="pull-left" >${c.chTitle}</p>
                              <a href="#" onclick="doChat()"><img src="/nmcat/resources/img/chat/KakaoTalk_20181122_180513355.png"/></a>
                        </div>
                      </c:forEach>

                      </div>
                    </div>
                 

                  <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
        
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">��</button>
              <h4 class="modal-title">�� �߰�</h4>
            </div>
            <div class="modal-body">
                �������� �Է��ϼ���: <input type="text" />
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">����</button>
              <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
            </div>
          </div>
          
        </div>
      </div>
        <script>
        function doChat() {
             window.open("<c:url value='/chat/chat.mn' />", "chat", "width=562, height=600, scrollbars=yes");
        }
        function doChatExit() {
                alert("ä�ù��� �����Ͻðڽ��ϱ�??");
        }
       /*  $('#chatRoom').click(function() { 
        	$.ajax({
        		url: "<c:url value='/websocket/login.do' />",
        		type: "POST",
        		data: {
        			id: $("#id").val(),
        			pass: $("#pass").val()
        		}
        	})
        	.done(function (result) {
        	
        	}); */
        
        </script>
</body>
</html>