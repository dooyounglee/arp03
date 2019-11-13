package com.kh.arp.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.member.model.service.MemberService;
import com.kh.arp.member.model.vo.Classdate;
import com.kh.arp.member.model.vo.Lecture;
import com.kh.arp.member.model.vo.Member;

@Controller
public class LectureController {

	@Autowired
	private MemberService ms;
	
	@RequestMapping("/main.lec")
	public ModelAndView lectureList(ModelAndView mv, int lec_no) {
		Lecture lec=ms.getLecture(lec_no);
		System.out.println(lec);
		mv.addObject("lec",lec);
		mv.setViewName("lecture/main");
		return mv;
	}
	
	@GetMapping("/make.lec")
	public ModelAndView makeLectureGet(ModelAndView mv) {
		mv.setViewName("mypage/teacher/make");
		return mv;
	}
	
	@PostMapping("/make.lec")
	public ModelAndView makeLecturePost(Lecture lec, HttpSession session, ModelAndView mv, String[] classdate, String[] week) {
		
		Member mem=(Member)session.getAttribute("mem");
		lec.setM_no(mem.getM_no());
		lec.setDayofweek(String.join(",", week));
		System.out.println(lec);
		
		int result=ms.makeLecture(lec);
		if(result>0) {
			Lecture newlec=ms.getLastestLecture();
			System.out.println(newlec);
			ArrayList<Classdate> list=new ArrayList<>();
			for(int i=0;i<classdate.length;i++) {
				Classdate cd=new Classdate(newlec.getLec_no(),classdate[i],i+1);
				list.add(cd);
			}
			System.out.println(list);
			
			int result1=ms.insertClassdate(list);
			mv.setViewName("redirect:/lectureList.ad");
		}else {
			;
		}
		return mv;
	}
}
