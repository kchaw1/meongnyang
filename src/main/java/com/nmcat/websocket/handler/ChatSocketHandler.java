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
import org.springframework.web.server.WebSession;
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
		 Member id = (Member)session.getAttributes().get("user");
		Set<String> keys = users.keySet();
		for(String key : keys) {
			users.get(key).remove(session);
			List<WebSocketSession> wss = users.get(key);
			for(WebSocketSession ws : wss) {
				System.out.println("id="+id.getId()+"아이디가여기까지");
				ws.sendMessage(new TextMessage(id.getId() + "퇴장 하셨습니다."));
			}
		}
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	
		try {	
		debug("보낸 메세지 - " + message.getPayload());
		Set<String> keys = users.keySet();
		
		String Msg = message.getPayload(); //input : bbbb,chNo : 13
		System.out.println("msg"+Msg);
		String sendMsg = "";
		String chNo = Msg.substring(Msg.indexOf(",")+1); //chNo : 13
		System.out.println("1차확인"+chNo);
		//방번호
		String Room = chNo.substring("chNo : ".length()); //13
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
				
				List<WebSocketSession> wss = users.get(Room); //			
				System.out.println("Wss"+wss);
				
				for(WebSocketSession ws : wss) {
					try {
						ws.sendMessage(new TextMessage(Msg.substring(0,Msg.indexOf(","))));
					}catch (Exception e) {
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
				List<WebSocketSession> wss = users.get(Msg.substring(0,Msg.indexOf(","))); //
				
				for(WebSocketSession ws : wss) {
					try {
						System.out.println("MSG: "+Msg);
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
