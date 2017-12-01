package kr.co.hangsho.privatedeal.websocket;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatHandler extends TextWebSocketHandler {

	// 현재 접속중인 클라이언트와 통신하기 위한 WebSocketSession을 담아두는 Map객체
	Map<String, WebSocketSession> establishedSessionMap = new HashMap<String, WebSocketSession>();
	
	// 클라이언트로부터 메세지가 수신되면 실행되는 메소드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String payload = message.getPayload();
		String[] payloadItems = payload.split(":");
		String protocol = payloadItems[0];
		
		if ("CONNECT".equals(protocol)) {
			String requestId = getSessionUserId(session);
			String responseId = payloadItems[1];
			
			session.sendMessage(new TextMessage("ON_CHAT:" + responseId));
			establishedSessionMap.get(responseId).sendMessage(new TextMessage("ON_CHAT:" + requestId));
		} else if ("CLOSE".equals(protocol)) {
			String requestId = getSessionUserId(session);
			String responseId = payloadItems[1];
			
			session.sendMessage(new TextMessage("OFF_CHAT:" + responseId));
			establishedSessionMap.get(responseId).sendMessage(new TextMessage("OFF_CHAT:" + requestId));
		} else if ("MSG".equals(protocol)) {
			String messageSendId = getSessionUserId(session);
			String messageReceiveId = payloadItems[1];
			String chatMessage = payloadItems[2];
			
			session.sendMessage(new TextMessage("CHAT_MSG:" + messageReceiveId + ":" + messageSendId + ":" + chatMessage));
			establishedSessionMap.get(messageReceiveId).sendMessage(new TextMessage("CHAT_MSG:" + messageSendId + ":" + messageSendId + ":" + chatMessage));
		}
	}
	
	// WebSocket 연결이 완료되면 실행되는 메소드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// Map객체에 <사용자아이디, WebSocketSession>객체의 쌍으로 저장하기
		establishedSessionMap.put(getSessionUserId(session), session);
		sendAllEstablishedUsers();
	}
	
	// WebSocket 연결이 종료되면 실행되는 메소드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// Map객체에서 해당 아이디의 WebSocketSession객체를 삭제하기
		establishedSessionMap.remove(getSessionUserId(session));
		sendClosedUsers(getSessionUserId(session));
	}
	
	// WebSocket 통신중 에러가 발생되면 실행되는 메소드
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// Map객체에서 해당 아이디의 WebSocketSession객체를 삭제하기
		establishedSessionMap.remove(getSessionUserId(session));
		sendClosedUsers(getSessionUserId(session));
	}
	
	// 현재 온라인 상태인 사용자아이디를 접속된 모든 클라이언트에게 전달한다.
	private void sendAllEstablishedUsers() {
		Collection<WebSocketSession> sessions = establishedSessionMap.values();
		for (WebSocketSession session : sessions) {
			try {
				session.sendMessage(new TextMessage("ON_USERS:" + getAllEstablishedUsers()));
			} catch (IOException e) {}
		}
	}
	
	// 지금 오프라인 상태가 된 사용자아이디를 접속된 모든 클라이언트에게 전달한다.
	private void sendClosedUsers(String userId) {
		Collection<WebSocketSession> sessions = establishedSessionMap.values();
		for (WebSocketSession session : sessions) {
			try {
				session.sendMessage(new TextMessage("OFF_USER:" + userId));
			} catch (IOException e) {}
		}
	}

	// HttpSessionHandshakeInterceptor에서 Attribute로 저장한 사용자아이디를 반환한다.
	private String getSessionUserId(WebSocketSession session) {
		Map<String, Object> attributes = session.getAttributes();
		return (String) attributes.get("LOGIN_USER_NICKNAME");
	}
	
	// 
	private String getAllEstablishedUsers() {
		return StringUtils.collectionToDelimitedString(establishedSessionMap.keySet(), ",");
	}
	
}
