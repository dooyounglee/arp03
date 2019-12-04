package com.kh.arp.lecture.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
import com.kh.arp.lecture.model.vo.ScoreH;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.problem.model.service.ProblemService;
import com.kh.arp.problem.model.vo.Answer;
import com.kh.arp.problem.model.vo.Homework;
import com.kh.arp.problem.model.vo.Problem;
import com.kh.arp.problem.model.vo.ProblemRelated;
import com.kh.arp.problem.model.vo.Variables;

@Controller
public class LectureController {

	@Autowired
	private LectureService ls;
	
	@Autowired
	private ProblemService ps;
	
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
		lec.setM_no(mem.getM_no());
		String str_week=(String.join(",", week)).replace('0','일').replace('1','월').replace('2','화').replace('3','수').replace('4','목').replace('5','금').replace('6','토');
		lec.setDayofweek(str_week);
		System.out.println(lec);
		int result=ls.makeLecture(lec);
		if(result>0) {
			//Lecture newlec=ls.getLastestLecture();
			ArrayList<Classdate> list=new ArrayList<>();
			for(int i=0;i<classdate.length;i++) {
				Classdate cd=new Classdate(0,classdate[i],i+1);
				list.add(cd);
			}
			
			int result1=ls.insertClassdate(list);
			mv.setViewName("redirect:/applyList.lec");
		}else {
			;
		}
		return mv;
	}
	
	@GetMapping("/applyList.lec")
	public ModelAndView apply(HttpSession session, ModelAndView mv) {
		Member mem=(Member)session.getAttribute("mem");
		List<Lecture> list=ls.applylectureList(mem.getM_no());
		mv.addObject("list", list);
		mv.setViewName("mypage/teacher/applyList");
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
		
		List<Classdate> list=ls.getLectureDatesList(lec.getLec_no());
		
		mv.addObject("list", list);
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
		
		e.setExamdate(e.getExamdate().replace("T", " "));
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
		e.setExamdate(e.getExamdate().replace("T", " "));
		int result=ls.editExam(e);
		mv.setViewName("redirect:/get.ex?e_no="+e.getE_no());
		return mv;
	}
	
	@GetMapping("/list.sc")
	public ModelAndView listScoreGet(HttpSession session, ModelAndView mv) {
		Member mem=(Member)session.getAttribute("mem");
		Lecture lec=(Lecture)session.getAttribute("lec");

		
		List<Exam> elist=ls.getExamList(lec.getLec_no());
		List<MyClass> mlist=null;
		if(mem.getTypee().equals("s")) {
			mlist=new ArrayList<MyClass>();
			MyClass mc=new MyClass();
			mc.setLec_no(lec.getLec_no());
			mc.setM_no(mem.getM_no());
			mc.setName(mem.getName());
			mlist.add(mc);
		}else if(mem.getTypee().equals("t")) {
			mlist=ls.getStudentList(lec.getLec_no());
		}
		List<Score> slist=ls.getLectureScore(lec.getLec_no());
		List<ScoreH> shlist=ls.getHomeworkScore(lec.getLec_no());
		List<Homework> hlist=ls.getHomeworkListInLecture(lec.getLec_no());
		//List<Homework> hlist=ls.getHomeworkListInLectureForScore(lec.getLec_no());
		
		
		mv.addObject("elist", elist);
		mv.addObject("mlist", mlist);
		mv.addObject("slist", slist);
		
		
		mv.addObject("hlist", hlist);
		mv.addObject("shlist", shlist);
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
		Member mem=(Member)session.getAttribute("mem");
		Lecture lec=(Lecture)session.getAttribute("lec");

		List<Classdate> dlist=ls.getLectureDatesList(lec.getLec_no());
		List<MyClass> mlist=null;
		if(mem.getTypee().equals("s")) {
			mlist=new ArrayList<MyClass>();
			MyClass mc=new MyClass();
			mc.setLec_no(lec.getLec_no());
			mc.setM_no(mem.getM_no());
			mc.setName(mem.getName());
			mlist.add(mc);
		}else if(mem.getTypee().equals("t") || mem.getTypee().equals("a")) {
			mlist=ls.getStudentList(lec.getLec_no());
		}
		List<Attendence> alist=ls.getLectureAttendence(lec.getLec_no());
		
		mv.addObject("dlist", dlist);
		mv.addObject("mlist", mlist);
		mv.addObject("alist", alist);
		mv.setViewName("mypage/teacher/attendence/list");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/insert.at")
	public String insertAttendencePost(Attendence att, HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");
		att.setLec_no(lec.getLec_no());
		System.out.println(att);
		int result=ls.insertAttendence(att);
		return "success";
	}
	
	@GetMapping("/homeworklist.lec")
	public ModelAndView homeworkListInLectureGet(HttpSession session, ModelAndView mv) {
		Member mem=(Member)session.getAttribute("mem");
		Lecture lec=(Lecture)session.getAttribute("lec");
		
		List<Homework> list=ls.getHomeworkListInLecture(lec.getLec_no());

		mv.addObject("list", list);
		mv.setViewName("mypage/teacher/homework/list");
		return mv;
	}
	
	@GetMapping("/homework.te")
	public ModelAndView teacherHomeworkList(HttpSession session, ModelAndView mv) {
		Member mem=(Member)session.getAttribute("mem");
		Lecture lec=(Lecture)session.getAttribute("lec");
		
		List<Homework> list=ps.getHomeworkList(mem.getM_no());

		mv.addObject("list", list);
		mv.setViewName("mypage/teacher/homework/add");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/addHomework.lec")
	public String addHomeworkInLecturePost(ProblemRelated hw_lec, HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");
		hw_lec.setLec_no(lec.getLec_no());
		
		int result=ls.addHomeworkInLecture(hw_lec);
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/delHomework.lec")
	public String delHomeworkInLecturePost(ProblemRelated hw_lec, HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");
		hw_lec.setLec_no(lec.getLec_no());
		
		int result=ls.delHomeworkInLecture(hw_lec);
		return "success";
	}
	
	@GetMapping("/getHomework.lec")
	public ModelAndView getHomeworkInLecture(ProblemRelated hw_m_lec, HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");
		System.out.println(hw_m_lec);
		if(hw_m_lec.getM_no()==0) {
			Member mem=(Member)session.getAttribute("mem");
			hw_m_lec.setM_no(mem.getM_no());
		}
		hw_m_lec.setLec_no(lec.getLec_no());
		Homework hw=ps.getHomeworkInLecture(hw_m_lec);
		List<Problem> plist=ps.getProblemListInHomework(hw_m_lec.getHw_no());
		List<Problem> newplist=new ArrayList<Problem>();
		for(Problem p:plist) {
			newplist.add(abc(p,hw_m_lec.getM_no()));
		}
		List<Answer> alist=ps.getHomeworkAnswer(hw_m_lec);

		mv.addObject("hw", hw);
		mv.addObject("plist", newplist);
		mv.addObject("alist",alist);
		mv.setViewName("mypage/teacher/homework/get");
		return mv;
	}
	
	/*
	 * @GetMapping("/getHomeworkforStudent.lec") public ModelAndView
	 * getHomeworkForStudentInLecture(int hw_no, int m_no, HttpSession session,
	 * ModelAndView mv) { Homework hw=ps.getHomework(hw_no); List<Problem>
	 * plist=ps.getProblemListInHomework(hw_no); List<Problem> newplist=new
	 * ArrayList<Problem>(); for(Problem p:plist) { newplist.add(abc(p,m_no)); }
	 * 
	 * mv.addObject("hw", hw); mv.addObject("plist", newplist);
	 * mv.setViewName("mypage/teacher/homework/get"); return mv; }
	 */
	
	@GetMapping("/checkAnswer.hw")
	public ModelAndView checkAnswerHomework(ProblemRelated lec_hw_m, HttpSession session, ModelAndView mv) {
		Member mem=(Member)session.getAttribute("mem");
		if(lec_hw_m.getM_no()==0) {
			lec_hw_m.setM_no(mem.getM_no());
		}
		Lecture lec=(Lecture)session.getAttribute("lec");
		lec_hw_m.setLec_no(lec.getLec_no());
		
		
		
		Homework hw=ps.getHomework(lec_hw_m.getHw_no());
		List<Problem> plist=ps.getProblemListInHomework(lec_hw_m.getHw_no());
		List<Problem> newplist=new ArrayList<Problem>();
		for(Problem p:plist) {
			newplist.add(abc(p,lec_hw_m.getM_no()));
		}
		
		List<Answer> alist=ps.getHomeworkAnswer(lec_hw_m);
		System.out.println(alist);
		
		mv.addObject("hw", hw);
		mv.addObject("plist", newplist);
		mv.addObject("alist", alist);
		mv.setViewName("mypage/teacher/homework/answer");
		return mv;
	}
	
	@PostMapping("/end.hw")
	public ModelAndView endHomework(ProblemRelated lec_hw, HttpSession session, ModelAndView mv) {
		Lecture lec=(Lecture)session.getAttribute("lec");
		lec_hw.setLec_no(lec.getLec_no());
		
		int result=ps.endHomework(lec_hw);
		mv.setViewName("redirect:homeworklist.lec");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/submitAnswer.hw")
	public String submitAnswer(Answer ans, HttpSession session, ModelAndView mv) {
		System.out.println("===========제출하고 넘겨받은 값"+ans);
		Member mem=(Member)session.getAttribute("mem");
		Lecture lec=(Lecture)session.getAttribute("lec");
		ans.setLec_no(lec.getLec_no());
		ans.setM_no(mem.getM_no());
		
		Problem p=ps.getProblem(ans.getP_no());
		Problem ranp=abc(p,mem.getM_no());
		
		System.out.println("학생꺼 문제"+ranp);
		System.out.println("여전히 넘겨받은 값"+ans);
		
		if(ranp.getSolution().equals("\\("+ans.getAnswer()+"\\)")) {
			ans.setOx("O");
		}else {
			ans.setOx("X");
		}
		System.out.println("ox까지 넘겨받은 값"+ans);
		System.out.println("=====================");
		int result=ls.submitAnswer(ans);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@PostMapping("/del.lec")
	public ModelAndView deleteLecturePost(Lecture lec, ModelAndView mv) {
		int result=ls.deleteLecture(lec);
		mv.setViewName("redirect:/lectureList.ad");
		return mv;
	}
	@PostMapping("/delCancel.lec")
	public ModelAndView deleteLectureCanclePost(Lecture lec, ModelAndView mv) {
		int result=ls.deleteLectureCancle(lec);
		mv.setViewName("redirect:/lectureList.ad");
		return mv;
	}
	
	@PostMapping("/accept.lec")
	public ModelAndView acceptLecturePost(Lecture lec, ModelAndView mv) {
		int result=ls.acceptLecture(lec);
		mv.setViewName("redirect:/lectureList.ad");
		return mv;
	}
	@PostMapping("/reject.lec")
	public ModelAndView rejectLectureCanclePost(Lecture lec, ModelAndView mv) {
		int result=ls.rejectLecture(lec);
		mv.setViewName("redirect:/lectureList.ad");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public Problem abc(Problem p,int m_no) {
		//Problem p=sqlSession.selectOne("problemMapper.getProblem",p_no);
		List<Variables> vlist=ps.getVariables(p.getP_no());
		Problem ranp=null;
		if(vlist.size()>0) {
			//int random=(int)(Math.random()*vlist.size());
			int random=m_no%vlist.size();
			Variables v=vlist.get(random);
			
			String strp=p.getProblem();
			String strs=p.getSolve();
			String strsolu=p.getSolution();
			String[] keyval=p.getKeyval().split(",");
			String[] val=v.getVal().split(",");
			
			JSONObject jo=new JSONObject();
			for(int i=0;i<keyval.length;i++) {
				jo.put(keyval[i], val[i]);
			}
			
			Set<String> i=jo.keySet();
			Iterator<String> it=i.iterator();
			while(it.hasNext()){
				String temp=it.next();
				strp=strp.replaceAll(temp, (String)jo.get(temp));
				strs=strs.replaceAll(temp, (String)jo.get(temp));
				strsolu=strsolu.replaceAll(temp, (String)jo.get(temp));
			}
			
			ranp=p;
			ranp.setProblem(strp);
			ranp.setSolve(strs);
			ranp.setSolution(strsolu);
		}
		return ranp;
	}
}
