package com.nmcat.websocket.handler;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("alarm")
public class AlarmHandler extends TextWebSocketHandler {
	Map<String, WebSocketSession> users = new HashMap<>();
	
	public AlarmHandler() {
		System.out.println("alarmHandler 객체 생성");
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getId() + " 연결 됨!!");
		users.put(session.getId(), session);
		Map<String, Object> map = session.getAttributes();
		System.out.println("map : " + map.toString());
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("신호 받음");
		String msg = message.getPayload();
		Set<String> keys = users.keySet();
		if(msg.startsWith("friend:")) {
			for(String key : keys) {
				WebSocketSession wss = users.get(key);
				wss.sendMessage(new TextMessage("친구 추가했어요"));				
			}
		} else {
			session.sendMessage(new TextMessage("쪽지 왔어요"));
		}
		
	}
	
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	
}
