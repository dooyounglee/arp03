package com.kh.arp.qna.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.kh.arp.member.model.service.MemberService;
import com.kh.arp.member.model.vo.Member;

public class WebsocketTestInterceptor extends HttpSessionHandshakeInterceptor {
	
	@Autowired
	private MemberService ms;
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String,Object> mpAttributes) throws Exception {
		ServletServerHttpRequest sshRequest = (ServletServerHttpRequest)request;
        HttpServletRequest hsrRequest =  sshRequest.getServletRequest();
        HttpSession session=hsrRequest.getSession();
        
        int m_no = Integer.parseInt(hsrRequest.getParameter("m_no"));
        mpAttributes.put("m_no", m_no);
        
        Member mem=new Member();mem.setM_no(m_no);
        mem=ms.getMember(mem);
        session.setAttribute("myLec", ms.getLectureList(mem));
        return super.beforeHandshake(request, response, wsHandler, mpAttributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception ex)
	{
		super.afterHandshake(request, response, wsHandler, ex);
	}
}
