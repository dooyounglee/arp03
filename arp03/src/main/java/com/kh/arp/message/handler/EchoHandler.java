package com.kh.arp.message.handler;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import oracle.net.aso.s;

public class EchoHandler extends TextWebSocketHandler{

		
	@Autowired
	private SqlSessionTemplate sqlSession;

	  @Override

		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		  System.out.println("after");
		}



	  @Override

		public void afterConnectionEstablished(WebSocketSession session) throws Exception {


		}



	 @Override

		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		 	
		 	int mno = Integer.parseInt(message.getPayload());

			int mCount = sqlSession.selectOne("msg-mapper.selectMcount", mno);


			

			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

			String count = gson.toJson(mCount);

			/*

			for(WebSocketSession s : sessionList) {

				s.sendMessage(new TextMessage(alarmList));

			}*/

			session.sendMessage(new TextMessage(count));

		}





	}



