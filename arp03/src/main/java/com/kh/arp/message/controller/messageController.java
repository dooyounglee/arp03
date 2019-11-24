package com.kh.arp.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.member.model.vo.Member;
import com.kh.arp.message.model.service.messageService;
import com.kh.arp.message.model.vo.Message;

@Controller
public class messageController {
	
	@Autowired
	private messageService mService;
	
	@RequestMapping("mainMsg.do")
	public String mainMsg() {
		return "message/main";
	}
	
	@RequestMapping("sendMsgFrom.do")
	public String sendMsgForm() {
		
		return "message/sendMessage";
	}
	
	@RequestMapping("insertMsg.do")
	public String insertMsg(Message m) {
		System.out.println(m);
		int result = mService.insertMsg(m);
		
		if(result >0) {
			System.out.println("저장성공");
		}else {
			System.out.println("저장실패");
		}
		
		return "redirect:listMsg.do";
	}
	
	// 받은 쪽지
	@RequestMapping("listMsg.do")
	public ModelAndView listMsg(ModelAndView mv, HttpSession session) {
	
		int m_no =	((Member)session.getAttribute("mem")).getM_no();
		ArrayList<Message> mList = mService.selectList(m_no);
		mv.addObject("mList",mList).setViewName("message/listMessage");
		
		return mv;
		
	}
	
	@RequestMapping("listSendMsg.do")
	public ModelAndView listSendMsg(ModelAndView mv, HttpSession session) {
		
		int m_no =	((Member)session.getAttribute("mem")).getM_no();
		ArrayList<Message> mList = mService.listSendMsg(m_no);
		mv.addObject("mList",mList).setViewName("message/listSendMessage");
		
		return mv;
		
	}
	
	@RequestMapping("detailMsg.do")
	public ModelAndView detailMsg(int ms_no,ModelAndView mv,HttpSession session) {
		
		int m_no =	((Member)session.getAttribute("mem")).getM_no();
		Message m = mService.detailMsg(ms_no);

		if( m_no == m.getG_no()) {
			
			int result = mService.updateDate(ms_no);
			System.out.println("실행되나여"+result);
		}
		 mv.addObject("m",m).setViewName("message/detailMsg");
		 return mv;
	}

}
