package com.kh.arp.vacation.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.vacation.model.service.VacationServiceImpl;
import com.kh.arp.vacation.model.vo.Vacation;

@Controller
public class VacationController {
	@Autowired
	private VacationServiceImpl vService;
	
	@RequestMapping("myLlist.me")
	public ModelAndView myLectrueList(ModelAndView mv ,int m_no) {
		ArrayList<Lecture> list = vService.selectLectureList(m_no);	
		mv.addObject("list" , list).setViewName("vacation/myLectureListForm");
		return mv;
	}
	
	
	@RequestMapping("vlist.me")
	public ModelAndView vacationListForm(ModelAndView mv) {
		
		ArrayList<Vacation> list = vService.selectList();
		
		mv.addObject("list" , list).setViewName("vacation/vacationListForm");
		
		return mv;
	}
	
	@RequestMapping("vinsertForm.me")
	public String vInsertForm() {
		
		return "vacation/insertVacationForm";
	}
	
	@RequestMapping("vinsert.me")
	public String vInsert(Vacation v) {
		
		int result = vService.insertVacation(v);
			
		if(result>0) {
			return "redirect:vlist.me";
		
		}else {
			return null;
		}
		
	
	}
	
	
}
