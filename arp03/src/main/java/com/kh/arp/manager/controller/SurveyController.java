package com.kh.arp.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.lecture.model.service.LectureService;
import com.kh.arp.manager.model.service.SurveyService;
import com.kh.arp.manager.model.vo.Survey;
import com.kh.arp.member.model.service.MemberService;

@Controller
public class SurveyController {

	@Autowired
	private LectureService ls;
	@Autowired
	private MemberService ms;
	@Autowired
	private SurveyService ss;
	
	
	
	@RequestMapping("daysurvey.ma")
	public ModelAndView daysurvey(ModelAndView mv) {
		mv.setViewName("manager/insertFormSurvey");
		return mv;
	}
	
	@RequestMapping("insertsurvey.ma")
	public ModelAndView insertsurvey(ModelAndView mv, Survey s) {
		int result=ss.insertsurvey(s);		
		if(result>0) {
			mv.setViewName("manager/selectsurvey");
		}else {
			mv.setViewName("");
		}
		return mv;
	}
	
	@RequestMapping("selectsurvey.ma")
	public ModelAndView selectsurvey(ModelAndView mv) {
		List<Survey> s= ss.selectsurvey();
		mv.addObject("list", s).setViewName("manager/selectsurvey");
		return mv;
	}

	@RequestMapping("detailsurvey.ma")
	public ModelAndView detailsurvey(ModelAndView mv, String su_no) {
		System.out.println(su_no);
		List<Survey> s = ss.detailsurvey(su_no); 
		
		System.out.println(su_no);
		System.out.println("============="+s);
		mv.addObject("s", s).setViewName("manager/detailsurvey");
		return mv;
	}
}
