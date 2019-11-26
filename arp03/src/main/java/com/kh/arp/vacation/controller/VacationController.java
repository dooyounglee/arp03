package com.kh.arp.vacation.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView sVlistForm(ModelAndView mv , HttpSession session) {
		
		int m_no = ((Member)session.getAttribute("mem")).getM_no();
		
		ArrayList<Vacation> list = vService.selectStudentList(m_no);
		
		mv.addObject("list",list).setViewName("vacation/studentVacationListForm");
		
		return mv;
	}
	
	@RequestMapping("companiForm.me")
	public ModelAndView companiForm(int v_no , ModelAndView mv) {
		
		mv.addObject("v_no",v_no).setViewName("vacation/companion");
		
		return mv;
	}
	
	
	@RequestMapping("permission.te")
	public String permission(int v_no) {
		
		int result = vService.permission(v_no);
		
		if(result >0) {
			return "redirect:sVlist.te";
		}else {
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("cReason.te")
	public String companion(Vacation v) {
		
		System.out.println("v"+v);
		int result = vService.companion(v);
		
		 
		if(result > 0) {
			return "redirect:sVlist.te";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("sVlist.ad")
	public ModelAndView adminpermission(HttpSession session, ModelAndView mv) {
		int m_no = ((Member)session.getAttribute("mem")).getM_no();
		ArrayList<Vacation> list = vService.selectList(m_no);
		
		mv.addObject("list" , list).setViewName("vacation/adminVacation");
		
		return mv;
		
	}
	
	@ResponseBody  
	@RequestMapping("permission.ad")
	public int checkVnoTest(@RequestParam(value="checkList[]") List<String> Number) {
		
		
	//	System.out.println(Number);
		
		int result=0;
		
		
		for(String v : Number ) {
			//System.out.println(v);
			
			int num =Integer.parseInt(v);
			
			result =vService.adminpermission(num); 	
			//System.out.println(result);
		}
		
		return result;

		
	}
	
	@ResponseBody  
	@RequestMapping("multiPermission.ad")
	public int MultiCheck(@RequestParam(value="MultiList[]") List<String> Number) {
		//System.out.println(Number);
		
		int result =0;
		
		for(String v : Number) {
			int num = Integer.parseInt(v);
			
			result = vService.multiPermission(num);
			//System.out.println(result);
		}
		
		//System.out.println(result);
		return result;
	}
	
	@RequestMapping("signature-pad.te")
	public String signaturePad() {
		return "vacation/signature-pad";
	}
}
