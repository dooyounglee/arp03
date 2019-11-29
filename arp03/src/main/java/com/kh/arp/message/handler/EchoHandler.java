package com.kh.arp.message.handler;

import java.util.ArrayList;
import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.arp.member.model.vo.Member;

public class EchoHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
		
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	  @Override

		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		  sessionList.remove(session);
		}



	  @Override

		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		  sessionList.add(session);

		}



	 @Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		 	System.out.println("me"+ message.getPayload());
		 
		 	int gno = Integer.parseInt(message.getPayload());	
		

		 	int mCount = sqlSession.selectOne("msg-mapper.selectMcount", gno); 
		 	System.out.println("mCount"+mCount);


			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			String g_no= gson.toJson(gno);
		/* gson.toJson(mCount); */
		/* String list = gson.toJson(gno)+","+gson.toJson(mCount); */
				

			

		
		for(WebSocketSession s : sessionList) {
		 
		  s.sendMessage(new TextMessage(g_no)); 
		  System.out.println(g_no);
		}
		
		
	

		}





	}



