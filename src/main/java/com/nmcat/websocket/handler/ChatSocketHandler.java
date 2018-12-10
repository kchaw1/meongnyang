package com.nmcat.websocket.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.transaction.config.TxNamespaceHandler;
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
	private Map<String, List<WebSocketSession>> users = new HashMap<>();
//	Map<String, Object> attrs;
	Member member;
	
	public ChatSocketHandler() {
		System.out.println("chat 객체 생성");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		attrs = session.getAttributes();
//		member = (Member) attrs.get("user");
//		debug(member.getId() + "연결");
//		users.put(member.getId(), session);
		
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
//		attrs = session.getAttributes();
//		member = (Member) attrs.get("user");
//		debug(member.getId() + " 연결 종료됨");
//		users.remove(member.getId());
//		
//		System.out.println(users.keySet());
		Set<String> keys = users.keySet();
		for(String key : keys) {
			users.get(key).remove(session);
		}
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	
		try {	
//		attrs = wss.getAttributes();
//		member = (Member) attrs.get("user");
//		debug("보낸 아이디 - " + member.getId());
		debug("보낸 메세지 - " + message.getPayload());
		Set<String> keys = users.keySet();
//		String id = member.getId();
		
		String Msg = message.getPayload();
		String sendMsg = "";
		String chNo = Msg.substring(Msg.indexOf(",")+1);
		System.out.println("1차확인"+chNo);
		//방번호
		String Room = chNo.substring("chNo : ".length());
		System.out.println("room"+Room);
		if(chNo.startsWith("chNo : ")) {
			try{
				if(!users.containsKey(Room)) {				
					users.put(Room,new ArrayList<>()); // 방만들고 세션정보가 들어갈 리스트 생성
					users.get(Room).add(session); //방안에 세션정보 등록
				}else {				
					users.get(Room).add(session); //방안에 세션정보 등록
				}
				System.out.println("확인"+users.toString());
				sendMsg = Room + "번 채팅방에 입장 하셨습니다.";
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("확인요잉용"+chNo);

//		if(Msg.startsWith("input : ")) {
//			String login = Msg.substring("input : ".length());
//			users.put(login, wss);
//			sendMsg = login + "님이 채팅방에 입장 하셨습니다.";
//		}else if(Msg.startsWith("output : ")) {
//			String logout = Msg.substring("output : ".length());
//			users.remove(logout);
//			sendMsg = logout + "님이 채팅방에서 퇴장 하셨습니다.";
//		}else {
//			
//		String[] arr = Msg.split(":");
//		sendMsg = arr[0]+ ":" + arr[1];
//		}
//		
//				
//		for (String key : keys) {
//			WebSocketSession wSession = users.get(key);
//			System.out.println("key"+keys);
//			System.out.println("key : "+key);
//			System.out.println("member : "+member.getId());
//			System.out.println("wSeesion: " + wSession.getId());
//			System.out.println("wSession:"+wSession.getAttributes());
//			System.out.println("member.no :" + member.getNo());
//
//	     	wSession.sendMessage(new TextMessage(sendMsg));
//			
//	
//		}
		
	try {
		
		List<WebSocketSession> wss = users.get(Msg.substring(0,Msg.indexOf(",")));
		for(WebSocketSession ws : wss) {
			try {
				System.out.println("MSG: "+Msg);
//			System.out.println(ws.toString());
//			if(session.getId().equals(ws.getId())) continue;
			ws.sendMessage(new TextMessage(Msg));
			}catch (Exception e) {
			}
		}
	}catch (Exception e) {
		// TODO: handle exception
	}
		}catch (Exception e) {
			// TODO: handle exception
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
