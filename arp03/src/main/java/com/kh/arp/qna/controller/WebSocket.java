package com.kh.arp.qna.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocket extends TextWebSocketHandler {
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	// 클라이언트와 연결 이후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		System.out.println("세션리스트?"+sessionList);
		System.out.println(session.getAttributes().get("m_no"));
	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		
		for (WebSocketSession sess : sessionList) {
			int m_no=(int)sess.getAttributes().get("m_no");
			if((m_no+"").equals(message.getPayload())) {
			//sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
			sess.sendMessage(new TextMessage("6번 학생한테만 가지롱"));
			}
		}
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		System.out.println("세션리스트라고?"+sessionList);
	}
}
