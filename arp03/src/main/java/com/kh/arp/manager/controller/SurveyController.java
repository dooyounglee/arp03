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
import com.kh.arp.manager.model.vo.CompleteSurvey;
import com.kh.arp.manager.model.vo.ForSurvey;
import com.kh.arp.manager.model.vo.InsertSurvey;
import com.kh.arp.manager.model.vo.SurveyQuestion;
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
	
	@RequestMapping("selectsurvey.ma")
	public ModelAndView selectsurvey(ModelAndView mv) {
		List<InsertSurvey> s= ss.selectsurvey();
		mv.addObject("list", s).setViewName("manager/selectsurvey");
		return mv;
	}
	
	@RequestMapping("daysurvey.ma")
	public ModelAndView daysurvey(ModelAndView mv) {
		mv.setViewName("manager/insertFormSurvey");
		return mv;
	}
	
	@RequestMapping("insertsurvey.ma")
	public ModelAndView insertsurvey(ModelAndView mv, ForSurvey q, InsertSurvey is, HttpSession session) {
		Member m = new Member();
		m.setM_no(((Member)session.getAttribute("mem")).getM_no());
		is.setM_no(m.getM_no());
		System.out.println(is+"-------------");
		System.out.println(q+"model");
		
		int result=ss.insertsurvey(is);	// 설문조사 양식을 insert하는 메소드
		int lec_no=((Lecture)session.getAttribute("lec")).getLec_no();
		//---------------------------- insertSurvey 구문-----------------
		int ds =0;			// 질문이 제대로 꽂혔는지 판단하는 변수
		int dd =0;			// 제대로 트랜잭션 리턴값이 올때 판단하는 번수
		if(result>0) {
			List<SurveyQuestion> sq = ss.selectstudentmember(lec_no);	// 특정 수업의 학생들의 번호를 가져오는 메소드
			int j = 1;		// 질문의 순서를 아는 변수
		
			for( Object qq : q.getQuestion()) {
				System.out.println(qq+"========");
				SurveyQuestion fs= new SurveyQuestion();
				fs.setSq_no(j);
				fs.setQuestion((String)qq);
				for( SurveyQuestion osq:sq ) {
					fs.setM_no(osq.getM_no());
					ds=ss.insertsurveyquestion(fs); 					// 특정설문조사에 질문을 insert하는 메소드
					System.out.println(ds);
						if(ds<=0) {
							dd+=1;
							break;
						}
					}
					if(ds<=0) {
						dd+=1;
						break;
					}
				j+=1;
			}
		}
//, @RequestParam("qlast") int qlast
		
		if(dd==0) {
			mv.setViewName("redirect:/selectsurvey.ma");
		}else {
			mv.setViewName("");
		}
		return mv;
	}
	
	@RequestMapping("detailsurvey.ma")
	public ModelAndView detailsurvey(ModelAndView mv, int su_no, HttpSession session, SurveyQuestion sq) {
		int m_no=((Member)session.getAttribute("mem")).getM_no();
		sq.setM_no(m_no);
		sq.setSu_no(su_no);
		List<SurveyQuestion> s = ss.detailsurvey(sq);
		System.out.println(sq+"김경수");
		System.out.println("dlendud"+s);
		String ssq = s.get(0).getEnrolldate();
		int ssu = s.get(0).getSu_no();
		String title = s.get(0).getTitle();
			System.out.println("------------="+s);
			System.out.println("=-=-=-=-"+ssq);
			mv.addObject("s", s).addObject("ssq", ssq).addObject("ssu", ssu).addObject("title", title).setViewName("manager/detailsurvey");
			
			return mv;
		}
	@RequestMapping("detailsurveystudent")
	public ModelAndView detailsurveystudent(ModelAndView mv, int su_no, SurveyQuestion sq) {
		List<SurveyQuestion> ysq = ss.detailsurveyYstudent(su_no);
		List<SurveyQuestion> nsq = ss.detailsurveyNstudent(su_no);
		mv.addObject("Ysq", ysq).addObject("Nsq",nsq).setViewName("manager/detailsurveystudent");
		return mv;
	}
	@RequestMapping("insertcompletesurvey.ma")
	public ModelAndView updatesurvey(ModelAndView mv, int su_no, ForSurvey q,InsertSurvey is, HttpSession session) {
		
		
		//---------------------------- insertSurvey 구문-----------------
		int ds =0;			// 질문이 제대로 꽂혔는지 판단하는 변수
		int dd =0;			// 제대로 트랜잭션 리턴값이 올때 판단하는 번수
	
		
			int j = 1;		// 질문의 순서를 아는 변수
			SurveyQuestion fs= new SurveyQuestion();
			fs.setM_no(((Member)session.getAttribute("mem")).getM_no());
			fs.setSu_no(su_no);
			for( Object qq : q.getAnswer()) {
				System.out.println(qq+"========");
				fs.setAnswer((String)qq);
				fs.setSq_no(j);
				System.out.println(fs);
					ds=ss.updatesurveyquestion(fs); 					// 특정설문조사에 답을 update하는 메소드
					System.out.println(ds);
						if(ds<=0) {
							dd+=1;
							break;
						}
						j+=1;
					}
					
				
			
//, @RequestParam("qlast") int qlast
		
		if(dd==0) {
			mv.setViewName("redirect:/selectsurvey.ma");
		}else {
			mv.setViewName("");
		}
		return mv;
	}
	}


