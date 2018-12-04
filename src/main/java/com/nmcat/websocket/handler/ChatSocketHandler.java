package com.nmcat.websocket.handler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.nmcat.repository.domain.Member;

@Component("chat")
public class ChatSocketHandler extends TextWebSocketHandler{

	/*private Map<String,Map<String,Object>> rooms = new HashMap<>();
	private Map<String,Object> room = new HashMap<>();
	private List<WebSocketSession> userlist = new ArrayList<>();*/
	private Map<String, WebSocketSession> users = new HashMap<>();
	Map<String, Object> attrs;
	Member member;
	
	public ChatSocketHandler() {
		System.out.println("chat 객체 생성");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		attrs = session.getAttributes();
		member = (Member) attrs.get("user");
		debug(member.getId() + "연결");
		users.put(member.getId(), session);
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		attrs = session.getAttributes();
		member = (Member) attrs.get("user");
		debug(member.getId() + " 연결 종료됨");
		users.remove(member.getId());
	}
	
	@Override
	public void handleTextMessage(WebSocketSession wss, TextMessage message) throws Exception {
		attrs = wss.getAttributes();
		member = (Member) attrs.get("user");
		debug("보낸 아이디 - " + member.getId());
		debug("보낸 메세지 - " + message.getPayload());
		Set<String> keys = users.keySet();
		for (String key : keys) {
			WebSocketSession wSession = users.get(key);
			wSession.sendMessage(new TextMessage(member.getId() + " : " + message.getPayload()));
		
		}
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		debug(session.getId() + " 익셉션 발생 - " + exception.getMessage());
	}
	
	private SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private void debug(String msg) {
		System.out.printf(this.getClass().getSimpleName() + "(%s) : %s\n", time.format(new Date()), msg);
	}
}
