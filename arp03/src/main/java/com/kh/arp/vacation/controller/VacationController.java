package com.kh.arp.vacation.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.vacation.model.service.VacationServiceImpl;
import com.kh.arp.vacation.model.vo.Vacation;

@Controller
public class VacationController {
	@Autowired
	private VacationServiceImpl vService;
	
	@RequestMapping("myLlist.me")
	public ModelAndView myLectrueList(ModelAndView mv, HttpSession session) {
		int m_no =	((Member)session.getAttribute("mem")).getM_no();
		
		
		ArrayList<Lecture> list = vService.selectLectureList(m_no);	
		System.out.println(list);
		mv.addObject("list" , list).setViewName("vacation/myLectureListForm");
		
		return mv;
	}
	
	
	@RequestMapping("vlist.me")
	public ModelAndView vacationListForm(ModelAndView mv, HttpSession session ) {
		
		int m_no = ((Member)session.getAttribute("mem")).getM_no();
		
		ArrayList<Vacation> list = vService.selectList(m_no);
				
		mv.addObject("list" , list).setViewName("vacation/vacationListForm");
		
		
		return mv;
	}
	
	@RequestMapping("vinsertForm.me")
	public String vInsertForm() {
		
		return "vacation/insertVacationForm";
	}
	
	@RequestMapping("vupdateForm")
	public ModelAndView vupdate(int v_no , ModelAndView mv) {
		
	Vacation v = vService.updateVacationForm(v_no);	
	
	
	mv.addObject("v" , v).setViewName("vacation/updateVacationForm");
		
	return mv;
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
	
	@RequestMapping("vDetail.me")
	public ModelAndView vDetail(ModelAndView mv,int v_no) {
		
		Vacation v = vService.selectVacation(v_no);
		
		if(v!= null) {
			
			mv.addObject("v", v).setViewName("vacation/detailVacation");
			
		}else {
			mv.addObject("msg","게시글조회실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("vupdate.me")
	public ModelAndView vUpdate(ModelAndView mv,Vacation v) {
		
		int result  = vService.updateVacation(v);
		
		if(result >0) {
			mv.addObject(v).setViewName("redirect:vlist.me");
		}else {
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("vdelete.me")
	public String vDelete(Vacation v) {
		int result = vService.deleteVacation(v);
		
		if(result>0) {
			return "redirect:vlist.me";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("sVlist.te")
	public ModelAndView sVlistForm(ModelAndView mv) {
		
		ArrayList<Vacation> list = vService.selectStudentList();
		
		mv.addObject("list",list).setViewName("vacation/studentVacationListForm");
		
		return mv;
	}
}
