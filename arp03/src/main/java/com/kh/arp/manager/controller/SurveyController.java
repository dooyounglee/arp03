package com.kh.arp.manager.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.lecture.model.service.LectureService;
import com.kh.arp.manager.model.service.SurveyService;
import com.kh.arp.manager.model.vo.CompleteSurvey;
import com.kh.arp.manager.model.vo.InsertSurvey;
import com.kh.arp.member.model.service.MemberService;
import com.kh.arp.member.model.vo.Member;

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
	public ModelAndView insertsurvey(ModelAndView mv, InsertSurvey is, HttpSession session) {
		System.out.println(s+"첫번째");
		Member m = new Member();
		m.setM_no(((Member)session.getAttribute("mem")).getM_no());
		System.out.println(m+"엠담기");
		cs.setM_no(m.getM_no());
		System.out.println(s);
		int result=ss.insertsurvey(s);
		if(result>0) {
			mv.setViewName("redirct:/selectsurvey.ma");
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
	public ModelAndView detailsurvey(ModelAndView mv, int su_no) {
		Survey s = ss.detailsurvey(su_no); 
		mv.addObject("s", s).setViewName("manager/detailsurvey");
		return mv;
	}
	@RequestMapping("updatesurvey.ma")
	public ModelAndView updatesurvey(ModelAndView mv, Survey s) {
		System.out.println("-------"+s);
		int result = ss.updatesurvey(s);
		System.out.println("========"+s);
		mv.setViewName("manager/selectsurvey");
		return mv;
	}
}
