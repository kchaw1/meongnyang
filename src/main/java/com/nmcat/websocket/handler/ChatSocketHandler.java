package com.nmcat.websocket.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.nmcat.repository.domain.Member;

@Component("chat")
public class ChatSocketHandler extends TextWebSocketHandler{

	
	private Map<String, List<WebSocketSession>> users = new HashMap<>();
	
	public ChatSocketHandler() {
		System.out.println("chat 객체 생성");
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		/*
		String id = ((Member)session.getAttributes().get("user")).getId();
		 System.out.println("1"+id);
		Set<String> keys = users.keySet();
		users.remove(id);
		for(String key : keys) {
			users.get(key).remove(session);
			List<WebSocketSession> wss = users.get(key);
			for(WebSocketSession ws : wss) {
				ws.sendMessage(new TextMessage("out:"+id +":"+id+ "님이 퇴장 하셨습니다."));
			}

		}
*/
	}
	
	/**
	 * 데이터 메세지 프로토콜 정의
	 * ra(room-access) : 방 접속 ->      
	 * ra:방번호:접속아이디
	 * ra:12:abc
	 * 
	 * rm(room-message) : 방 메세지 전송
	 * rm:방번호:전송메세지
	 * rm:12:hello
	 */
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		try {	
			String msg = message.getPayload(); //input : bbbb,chNo : 13
			debug("받은 메세지" + msg);
			try {
			
//			String[] msgArr = msg.split(":");
				String[] listmsgArr = msg.split(",");
				System.out.println("뭐가들어올까"+listmsgArr[0]+"다음"+listmsgArr[1]);
			 String[] msgArr = listmsgArr[0].split(":");
			 System.out.println("뭐가들어올까"+msgArr[0]+"다음"+msgArr[1]);
			switch (msgArr[0]) {
			case "roomaccess": // 방 접속
//				roomAccess(msgArr[1], session, msgArr[2]);
				roomAccess(msgArr[1], session, msgArr[2], listmsgArr[1]);
				break;
				
			case "chat":
				System.out.println("메세지 : " + users.get(msgArr[1]));
				List<WebSocketSession> wss = users.get(msgArr[1]); //

				for(WebSocketSession ws : wss) {
					try {
						System.out.println("MSG: "+msg);
						ws.sendMessage(new TextMessage(msg));
					}catch (Exception f) {
						f.printStackTrace();
					
					}
				}
				
				break;
			
			case "roomout":
				roomExit(msgArr[1], session, msgArr[2],listmsgArr[1]);
				break;
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 방에 사용자가 접속했을 때
	 * @param msgArr
	 * @param session
	 * @param msgArr2
	 * @throws Exception
	 */
	private void roomAccess(String roomNo, WebSocketSession session, String accessId, String image) throws Exception {
		
		// 사용자가 접속한 방이 존재하지 않을 경우 방을 새롭게 생성
		if (!users.containsKey(roomNo)) {				
			users.put(roomNo, new ArrayList<>()); // 방만들고 세션정보가 들어갈 리스트 생성
		}
		
		// 접속한 사용자를 방의 사용자 목록에 추가
		users.get(roomNo).add(session); 
		System.out.println("확인"+users.toString());
		
		List<WebSocketSession> wss = users.get(roomNo); 			
		System.out.println("Wss" + wss);
		String roomUserIds = "";
		for(WebSocketSession ws : wss) {
			try {
				String id = ((Member)ws.getAttributes().get("user")).getId();
				String imageName = ((Member)ws.getAttributes().get("user")).getImageName();
				String imagePath = ((Member)ws.getAttributes().get("user")).getImagePath();
				
				if (roomUserIds.length() != 0) roomUserIds += ","; 
//				roomUserIds += id;
				roomUserIds += id+"-sysName="+imageName+"&path="+imagePath;
				
				// 자신은 받지 않도록
				if (ws.getId() == session.getId()) continue;
				
				System.out.println("보내주는 메세지:in:" + accessId + ":" + accessId + "님이 입장하셨습니다.");
				ws.sendMessage(new TextMessage("in:" + accessId+ ":" + accessId+ "님이 입장하셨습니다."+"-"+image));
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		session.sendMessage(new TextMessage("roomlist:" + roomUserIds));
	}
	
	private void roomExit(String roomNo, WebSocketSession session, String accessId, String image) {
 
		System.out.println("확인"+users.toString());
		
		List<WebSocketSession> wss = users.get(roomNo); 
		wss.remove(session);
		System.out.println("Wss" + wss);
		String roomUserIds = "";
		for(WebSocketSession ws : wss) {
			try {
				String id = ((Member)ws.getAttributes().get("user")).getId();
				if (roomUserIds.length() != 0) roomUserIds += ","; 
				roomUserIds += id+"-"+image;
				
				System.out.println("보내주는 메세지:in:" + accessId + ":" + accessId + "님이 퇴장하셨습니다.");
				ws.sendMessage(new TextMessage("out:" + accessId+ ":" + accessId + "님이 퇴장하셨습니다."+"-"+image));
			}catch (Exception e) {
				e.printStackTrace();
			}
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
