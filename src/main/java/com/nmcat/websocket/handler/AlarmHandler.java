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

@Component("alarm")
public class AlarmHandler extends TextWebSocketHandler {
	
	Map<String, WebSocketSession> users = new HashMap<>();
	private SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Map<String, Object> attrs;
	Member member;
	
	public AlarmHandler() {
		System.out.println("alarmHandler 객체 생성");
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		attrs = session.getAttributes();
		System.out.println("map : " + attrs.toString());
		member = (Member) attrs.get("user");
//		log(session.getId() + " 연결 됨!!");
		log(member.getId() + " 연결 됨!!");
		users.put(member.getId(), session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		debug(session.getId() + " 연결 종료됨");
		attrs = session.getAttributes();
		member = (Member) attrs.get("user");
		debug(member.getId() + " 연결 종료됨");
		users.remove(member.getId());
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("신호 받음");
		attrs = session.getAttributes();
		member = (Member) attrs.get("user");
		String msg = message.getPayload();
		String callerId = member.getId();
		System.out.println("callerId:" +callerId);
		Set<String> keys = users.keySet();
		System.out.println("keys: "+ keys);
		
		if(msg.startsWith("friend:")) {
			String calleeId = msg.substring("friend:".length());
			System.out.println("callerId:" +calleeId);
			//users map 중에 실시간 calleeid 없으면 메소드 중단
			if(users.get(calleeId)==null) return;
			
			for(String key : keys) {
				System.out.println("key : " +key);
				if(key.equals(callerId)) continue;
				if(key.equals(calleeId)) {
					WebSocketSession wss = users.get(key);
					System.out.println("wss : " +wss);
					wss.sendMessage(new TextMessage("friend:" + callerId));				
					return;
				}
			}
		} else {
			session.sendMessage(new TextMessage("쪽지 왔어요"));
		}
	}//handleTextMessage
	
	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		debug(session.getId() + " 익셉션 발생 - " + exception.getMessage());
	}//handleTransportError
	
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	
	private void debug(String msg) {
		System.out.printf(this.getClass().getSimpleName() + 
				"(%s) : %s\n", time.format(new Date()), msg);
	}
	
}
