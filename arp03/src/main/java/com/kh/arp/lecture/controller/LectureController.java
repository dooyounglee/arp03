package com.kh.arp.lecture.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.lecture.model.service.LectureService;
import com.kh.arp.lecture.model.vo.Attendence;
import com.kh.arp.lecture.model.vo.Classdate;
import com.kh.arp.lecture.model.vo.Exam;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.lecture.model.vo.MyClass;
import com.kh.arp.lecture.model.vo.Score;
import com.kh.arp.member.model.vo.Member;

@Controller
public class LectureController {

	@Autowired
	private LectureService ls;
	
	@RequestMapping("/main.lec")
	public ModelAndView lectureList(int lec_no, HttpSession session, ModelAndView mv) {
		Lecture lec=ls.getLecture(lec_no);
		
		session.setAttribute("lec", lec);
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
		System.out.println(lec+ "lec");
		System.out.println(mem+"mem");
		lec.setM_no(mem.getM_no());
		lec.setDayofweek(String.join(",", week));
		System.out.println(lec);
		
		int result=ls.makeLecture(lec);
		System.out.println(result+"ddddddddd");
		if(result>0) {
			Lecture newlec=ls.getLastestLecture();
			System.out.println(newlec);
			ArrayList<Classdate> list=new ArrayList<>();
			for(int i=0;i<classdate.length;i++) {
				Classdate cd=new Classdate(newlec.getLec_no(),classdate[i],i+1);
				list.add(cd);
			}
			System.out.println(list);
			
			int result1=ls.insertClassdate(list);
			mv.setViewName("redirect:/lectureList.ad");
		}else {
			;
		}
		return mv;
	}
	
	@GetMapping("/test")
	public ModelAndView test(ModelAndView mv) {
		mv.setViewName("son");
		return mv;
	}
	
	@GetMapping("/info.lec")
	public ModelAndView info(HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");
		mv.addObject("lec", lec);
		mv.setViewName("lecture/info");
		return mv;
	}
	
	@GetMapping("/list.ex")
	public ModelAndView examList(HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");
		
		List<Exam> list=ls.getExamList(lec.getLec_no());
		
		mv.addObject("list", list);
		mv.addObject("lec", lec);
		mv.setViewName("mypage/teacher/exam/list");
		return mv;
	}
	
	@GetMapping("/make.ex")
	public ModelAndView makeExamGet(ModelAndView mv) {
		mv.setViewName("mypage/teacher/exam/make");
		return mv;
	}
	
	@PostMapping("/make.ex")
	public ModelAndView makeExamPost(Exam e, HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");
		e.setLec_no(lec.getLec_no());
		
		Exam newe=ls.makeExam(e);
		newe=ls.getExam(newe.getE_no());
		mv.setViewName("redirect:/list.ex");
		return mv;
	}
	
	@GetMapping("/get.ex")
	public ModelAndView getExam(int e_no, ModelAndView mv) {
		Exam e=ls.getExam(e_no);
		
		mv.addObject("e", e);
		mv.setViewName("mypage/teacher/exam/get");
		return mv;
	}
	
	@GetMapping("/edit.ex")
	public ModelAndView editExamGet(int e_no, ModelAndView mv) {
		Exam e=ls.getExam(e_no);
		
		mv.addObject("e", e);
		mv.setViewName("mypage/teacher/exam/make");
		return mv;
	}
	
	@PostMapping("/edit.ex")
	public ModelAndView editExamPost(Exam e, ModelAndView mv) {
		int result=ls.editExam(e);
		mv.setViewName("redirect:/get.ex?e_no="+e.getE_no());
		return mv;
	}
	
	@GetMapping("/list.sc")
	public ModelAndView listScoreGet(HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");

		List<Exam> elist=ls.getExamList(lec.getLec_no());
		List<MyClass> mlist=ls.getStudentList(lec.getLec_no());
		List<Score> slist=ls.getLectureScore(lec.getLec_no());
		
		mv.addObject("elist", elist);
		mv.addObject("mlist", mlist);
		mv.addObject("slist", slist);
		mv.setViewName("mypage/teacher/score/list");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/insert.sc")
	public String insertScoreGet(Score s, ModelAndView mv) {
		int result=ls.insertScore(s);
		return "success";
	}
	
	@GetMapping("/list.at")
	public ModelAndView listAttendenceGet(HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");

		List<Classdate> dlist=ls.getLectureDatesList(lec.getLec_no());
		List<MyClass> mlist=ls.getStudentList(lec.getLec_no());
		//List<Score> slist=ls.getLectureScore(lec.getLec_no());
		
		mv.addObject("dlist", dlist);
		mv.addObject("mlist", mlist);
		//mv.addObject("slist", slist);
		mv.setViewName("mypage/teacher/attendence/list");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/insert.att")
	public String insertAttendencePost(Attendence att, HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");
		att.setLec_no(lec.getLec_no());
		System.out.println(att);
		int result=ls.insertAttendence(att);
		return "success";
	}
}
