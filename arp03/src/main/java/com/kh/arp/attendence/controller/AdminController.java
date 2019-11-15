package com.kh.arp.attendence.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.member.model.service.MemberService;

public class AdminController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping("/DetailStudent")
	public ModelAndView DetailStudentAttendence(ModelAndView mv) {
		ms.
		mv.addObject
	}
}
