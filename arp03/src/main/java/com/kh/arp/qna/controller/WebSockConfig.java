//package com.kh.arp.qna.controller;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.EnableWebMvc;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
//import org.springframework.web.socket.config.annotation.EnableWebSocket;
//import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
//import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
//
//@Configuration
//@EnableWebMvc
//@EnableWebSocket
//public class WebSockConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer {
//	@Override
//	public void registerWebSocketHandlers(WebSocketHandlerRegistry wshrRegistry) {
//		// 웹소켓
//		wshrRegistry.addHandler(monHandler(), "/websocket/monHandler.ws")
//				.addInterceptors(new MonHandshakeInterceptor());
//
//		// SockJs
//		wshrRegistry.addHandler(monHandler(), "/websocket/monHandler.sockjs")
//				.addInterceptors(new MonHandshakeInterceptor()).withSockJS();
//	}
//
//	@Bean
//	public MonHandler monHandler() {
//		return new MonHandler();
//	}
//
//	@Override
//	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
//		configurer.enable();
//	}
//}
