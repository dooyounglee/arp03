package com.kh.arp.question.controller;


import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class QWebsocket {
/***
* 웹 소켓이 연결되면 호출되는 이벤트
*/
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
			
@OnOpen
public void handleOpen(Session session){
	clients.add(session);
	System.out.println(clients.size());
System.out.println("확인요");
}
/**
* 웹 소켓으로부터 메시지가 오면 호출되는 이벤트
* @param message
* @return
*/
@OnMessage
public void handleMessage(String message, Session session){
System.out.println("클라이언톡보낸거 : "+message);
synchronized (clients) {
	for(Session client:clients) {
		try {
			client.getBasicRemote().sendText(message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
}
/**
* 웹 소켓이 닫히면 호출되는 이벤트
*/
@OnClose
public void handleClose(Session session){
	clients.remove(session);
System.out.println("client is now disconnected...");
}
/**
* 웹 소켓이 에러가 나면 호출되는 이벤트
* @param t
*/
@OnError
public void handleError(Throwable t){
t.printStackTrace();
}
}