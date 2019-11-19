package com.kh.arp.manager.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.lecture.model.service.LectureService;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.manager.model.service.SurveyService;
import com.kh.arp.member.model.service.MemberService;

@Controller
public class SurveyController {

	@Autowired
	private LectureService ls;
	@Autowired
	private MemberService ms;
	@Autowired
	private SurveyService ss;
	
	@RequestMapping("lecture.ma")
	public ModelAndView lectureList(HttpSession session, ModelAndView mv) {
		List<Lecture> list=ms.getClassList();
		mv.addObject("list", list);
		mv.setViewName("manager/lecturelist");
		return mv;
	}
	@RequestMapping("survey.ma")
	public ModelAndView survey(int lec_no, HttpSession session, ModelAndView mv) {
		Lecture lec=ls.getLecture(lec_no);
		System.out.println(lec);
		mv.addObject("lec", lec);
		mv.setViewName("manager/insertsurvey");
		return mv;
	}
	
	
	@RequestMapping("insertsurvey.ma")
	public ModelAndView insertsurvey(int lec_no, HttpSession session, ModelAndView mv) {
		int result=ss.insertsurvey(lec_no, session);
		if(result>0) {
			mv.setViewName("manager/insertsurvey");			
		}else {
			mv.setViewName("");
		}
		return mv;
	}
}
