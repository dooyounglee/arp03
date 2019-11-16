package com.kh.arp.attendence.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.member.model.service.MemberService;
import com.kh.arp.member.model.vo.Member;

@Controller
public class AdminControllerbro {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping("DetailStudent.ad")
	public ModelAndView DetailStudentAttendence(ModelAndView mv, int m_no ) {
		System.out.println(m_no);
		List<Member> mem = ms.getMemberList();
		mv.addObject("mem", mem).setViewName("mypage/admin/memberDetailStudent");
		return mv;
		
	}
}
