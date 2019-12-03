package com.kh.arp.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.arp.common.PageInfo;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.message.model.service.messageService;
import com.kh.arp.message.model.vo.Dto;
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
	public ModelAndView sendMsgForm(ModelAndView mv) {
		
	  ArrayList<Member> list = mService.selectMember();
	 
	  mv.addObject("list",list).setViewName("message/sendMessage");
	  System.out.println("list"+list);
				  
		  return mv;
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
	
	// 보낸 쪽지
	@RequestMapping("listMsg.do")
	public ModelAndView listMsg(ModelAndView mv, HttpSession session) {
	
		int m_no =	((Member)session.getAttribute("mem")).getM_no();
		ArrayList<Message> mList = mService.selectList(m_no);
		mv.addObject("mList",mList).setViewName("message/listMessage");
		
		return mv;
		
	}
	
	// 받은 쪽지
	@RequestMapping("listSendMsg.do")
	public ModelAndView listSendMsg(ModelAndView mv, HttpSession session,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		

		int m_no =	((Member)session.getAttribute("mem")).getM_no();
		int listCount = mService.getListCount(m_no);
		System.out.println("lc"+listCount);
		PageInfo pi = new PageInfo(currentPage, listCount, 5, 10);
		
		ArrayList<Message> mList = mService.listSendMsg(m_no);
		System.out.println("받은쪽지"+mList);
		mv.addObject("mList",mList).addObject("pi", pi).setViewName("message/listSendMessage");
		
		return mv;
		
	}
	
	@RequestMapping("detailMsg.do")
	public ModelAndView detailMsg(int ms_no,ModelAndView mv,HttpSession session) {
		
		int m_no =	((Member)session.getAttribute("mem")).getM_no();
		Message m = mService.detailMsg(ms_no);

		if( m_no == m.getG_no()) {
			
			 mService.updateDate(ms_no);	// 보낸사람이 보게될 수신확인여부 + 받은 당사자가 확인했는지 여부
			
	
		}
		 mv.addObject("m",m).setViewName("message/detailMsg");
		 return mv;
	}
	
	// 받는사람 자동완성용
	@RequestMapping(value="autocomplete", method=RequestMethod.POST)
	public void auto(Locale locale,Model m, HttpServletRequest request,
					HttpServletResponse resp,Dto dto,HttpSession session) throws IOException {
	
		dto.setName(request.getParameter("term"));
		dto.setM_no(((Member)session.getAttribute("mem")).getM_no());
		System.out.println(dto);
		List<Dto> list = mService.searchList(dto);
		System.out.println("list"+list);
		JSONArray j = new JSONArray();
		for(Dto jlist : list) {
			String text = jlist.getName() + "-"+ jlist.getM_no() ;
			j.add(text);
		}
		
		PrintWriter out = resp.getWriter();
		out.print(j.toString());
		
	}
	
	  @ResponseBody
	  @RequestMapping("selectMcount.do")
	  public int selectMcount(int m_no) {
		  
	  int result = mService.selectMcount(m_no);
	  
	  return result;
	  
	  }
	  
	  @ResponseBody
	  @RequestMapping(value = "selectNList.do", 
	  produces = "application/text; charset=utf8")

	  public String selectNList(int m_no) {
		  ArrayList<Message> mlist = mService.selectNList(m_no);
		  
		    
		  Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			
			return gson.toJson(mlist);
	  }
	  
	  @ResponseBody
	  @RequestMapping("updateAlram.do")
	  public String updateAlram(int m_no) {
		  
		  int result = mService.updateAlram(m_no);
		  
		  if(result > 0) {
			  return "success";
		  }else {
			  return "fail";
		  }
	  }
	  
	  
	  @RequestMapping("reMsg.do")
	  public ModelAndView reSendMsgForm(int ms_no,ModelAndView mv) {
		  ArrayList<Member> list = mService.selectMember();
		  
		  Message msg = mService.reSendMsgForm(ms_no);
		  System.out.println("답장"+msg);
		  
		  mv.addObject("msg",msg).addObject("list",list).setViewName("message/sendMessage");
		  
		  return mv;
	  }
	  
	  
	
	  
	 
		  
		 
		  
	  }

	  

