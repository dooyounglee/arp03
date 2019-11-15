package com.kh.arp.attendence.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.attendence.model.service.AttendenceService;
import com.kh.arp.attendence.model.vo.Attendence;

@Controller
public class AttendenceController {

	@Autowired
	private AttendenceService atService;
	
	@RequestMapping("attendence.at")
	public ModelAndView attendence(ModelAndView mv) {
		
		Attendence at= atService.selectStudentAttendence();
		mv.addObject("at", at).setViewName("attendence/studentat");
		return mv;
	}
}