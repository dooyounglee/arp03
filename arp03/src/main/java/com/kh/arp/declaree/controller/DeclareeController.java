package com.kh.arp.declaree.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.declaree.model.service.DeclareeService;
import com.kh.arp.declaree.model.vo.Declaree;
import com.kh.arp.member.model.vo.Member;

@Controller
public class DeclareeController {

	@Autowired
	private DeclareeService ds;
	
	@GetMapping("insert.de")
	public ModelAndView declareGet(ModelAndView mv) {
		mv.setViewName("declare/declare");
		return mv;
	}
	
	@PostMapping("insert.de")
	public ModelAndView declarePost(Declaree d, HttpSession session, ModelAndView mv) {
		Member m=(Member)session.getAttribute("mem");
		d.setM_no(m.getM_no());
		
		int result=ds.declare(d);
		mv.setViewName("declare/declare");
		return mv;
	}
}
