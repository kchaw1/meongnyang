   function doChatList() {
    	if("${user.no}" != null ){
    		
       	window.open("<c:url value='/chat/chatRoom.mn?no=${user.no}' />", "chatList", "width=400, height=600, scrollbars=yes");
    	}else{
    		alert("채팅을 하려면 로그인을 해주십시오.");
    	}
    }