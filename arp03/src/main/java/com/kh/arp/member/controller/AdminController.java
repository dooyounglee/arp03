package com.kh.arp.member.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.declaree.model.vo.Declaree;
import com.kh.arp.lecture.model.vo.Lecture;
import com.kh.arp.lecture.model.vo.MyClass;
import com.kh.arp.member.model.service.MemberService;
import com.kh.arp.member.model.vo.Auth;
import com.kh.arp.member.model.vo.Member;
import com.kh.arp.qna.model.service.QnaService;
import com.kh.arp.qna.model.vo.Qna;

@Controller
public class AdminController {

	@Autowired
	private MemberService ms;
	
	@Autowired
	private QnaService qs;
	
	@Autowired
	private JavaMailSenderImpl javaMailSenderImple;
	
	@RequestMapping("/lectureList.ad")
	public ModelAndView classList(HttpSession session, ModelAndView mv) {
		Member mem=(Member)session.getAttribute("mem");
		//List<Lecture> list=null;
		//if(mem.getTypee().equals("a")) {
		//	list=ms.getClassList();
		//}else {
		List<Lecture> list=ms.getLectureList(mem);
		//}
		mv.addObject("list",list);
		mv.setViewName("mypage/lectureList");
		return mv;
	}
	
	@RequestMapping("/memberList.ad")
	public ModelAndView memberList(ModelAndView mv) {
		List<Member> list=ms.getMemberList();
		mv.addObject("list",list);
		mv.setViewName("mypage/admin/memberList");
		return mv;
	}
	
	@PostMapping("/banish.ad")
	public ModelAndView banish(Member m, ModelAndView mv) {
		int result=ms.banish(m);
		if(result>0) {
			mv.setViewName("redirect:/memberList.ad");
		}
		return mv;
	}
	
	@PostMapping("/banishCancle.ad")
	public ModelAndView banishCancle(Member m, ModelAndView mv) {
		int result=ms.banishCancle(m);
		if(result>0) {
			mv.setViewName("redirect:/memberList.ad");
		}
		return mv;
	}

	@GetMapping("/insertMember.ad")
	public ModelAndView insertStudentGet(Member m, ModelAndView mv) {
		mv.setViewName("mypage/admin/insertStudent");
		return mv;
	}
	
	@PostMapping("/insertMember.ad")
	public ModelAndView insertStudentPost(Member m, HttpServletRequest req, ModelAndView mv) {
		System.out.println(m);
		int result=0;
		
		//이미 있는 email인지 확인. 없으면 insert. 있으면 그걸로.
		Member newm=ms.getMember(m);
		System.out.println("이미있는이메일?"+newm);
		if(newm!=null) {
			result=1;
		}else {
			result=ms.insertMember(m);
		}
		if(result>0) {
			Auth auth=new Auth();
			auth.setEmail(m.getEmail());
			
			//Auth테이블에서 이미 있는 email인지 확인.
			Auth newauth=ms.getAuth(auth);
			if(newauth==null) {//없으면 insert. 
				auth.setCode(randomCode(50));
				int result1=ms.insertAuth(auth);
			}else {//있으면 그거.
				auth=newauth;
			}
			
			//이메일 전송
			/*
			 * SimpleMailMessage simpleMailMessage=new SimpleMailMessage();
			 * simpleMailMessage.setFrom("gostbaducking2@gmail.com");
			 * simpleMailMessage.setTo(auth.getEmail());
			 * simpleMailMessage.setSubject("arp 인증 테스트");
			 * simpleMailMessage.setText(req.getServerName()+":"+req.getServerPort()+
			 * "/arp/auth.me?code="+auth.getCode());
			 * javaMailSenderImple.send(simpleMailMessage);
			 */
			
			MimeMessage message = javaMailSenderImple.createMimeMessage();
			try {
				message.setFrom(new InternetAddress("gostbaducking2@gmail.com"));
				message.addRecipient(RecipientType.TO, new InternetAddress(auth.getEmail()));
				message.setSubject("arp 인증 테스트");
				message.setText("<a href=\""+req.getServerName()+":"+req.getServerPort()+"/arp/auth.me?code="+auth.getCode()+"\" target=\"_blank\">여기를 누르면 가입페이지로 이동합니다.</a>","utf-8", "html");
				javaMailSenderImple.send(message);
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}  
			  
			mv.setViewName("redirect:/memberList.ad");
		}else {
			mv.setViewName("mypage/admin/insertStudent");
		}
		return mv;
	}
	
	@GetMapping("/insertMemberToLecture.ad")
	public ModelAndView insertMemberToLectureGet(ModelAndView mv) {
		List<Member> mlist=ms.getStudentList();
		List<Member> tlist=ms.getTeacherList();
		
		mv.addObject("mlist", mlist);
		mv.addObject("tlist", tlist);
		mv.setViewName("mypage/admin/insertStudentToLecture");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="tlist.lec", produces="application/json; charset=UTF-8")
	public String getLectureListByTeacher(int m_no)  {
		List<Lecture> list=ms.getLectureListByTeacher(m_no);
		Gson gson = new GsonBuilder().create();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="inglist.lec", produces="application/json; charset=UTF-8")
	public String getIngStudentList(int lec_no)  {
		List<Member> list=ms.getIngStudentList(lec_no);
		Gson gson = new GsonBuilder().create();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="otherlist.lec", produces="application/json; charset=UTF-8")
	public String getOtherStudentList(int lec_no)  {
		List<Member> list=ms.getOtherStudentList(lec_no);
		Gson gson = new GsonBuilder().create();
		return gson.toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("insertStudentToIng.lec")
	public String insertStudentToIng(MyClass mc)  {
		int result=ms.insertStudentToIng(mc);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping("insertStudentToOther.lec")
	public String insertStudentToOther(MyClass mc)  {
		int result=ms.insertStudentToOther(mc);
		return "success";
	}
	
	@PostMapping("/addStudentToLecture.ad")
	public ModelAndView addStudentToLecture(int[] s, int t, int lec, ModelAndView mv) {
		for(int i=0;i<s.length;i++) {
			System.out.println(s[i]);
		}
		System.out.println(t);
		System.out.println(lec);
		
		mv.setViewName("mypage/admin/insertStudentToLecture");
		return mv;
	}
	
	
	
	
	
	
	
	@RequestMapping("/boardList.ad")
	public ModelAndView boardList(ModelAndView mv) {
		List<Board> list=ms.getBoardList();
		mv.addObject("list",list);
		mv.setViewName("mypage/admin/boardList");
		return mv;
	}
	
	@PostMapping("/deleteBoard.ad")
	public ModelAndView deleteBoardPost(Board b, ModelAndView mv) {
		int result=ms.deleteBoard(b);
		if(result>0) {
			mv.setViewName("redirect:/boardList.ad");
		}
		return mv;
	}
	
	@PostMapping("/deleteCancleBoard.ad")
	public ModelAndView deleteCancleBoardPost(Board b, ModelAndView mv) {
		int result=ms.deleteCancleBoard(b);
		if(result>0) {
			mv.setViewName("redirect:/boardList.ad");
		}
		return mv;
	}
	
	@RequestMapping("/replyList.ad")
	public ModelAndView replyList(ModelAndView mv) {
		List<BReply> list=ms.getReplyList();
		mv.addObject("list",list);
		mv.setViewName("mypage/admin/replyList");
		return mv;
	}
	
	@PostMapping("/deleteReply.ad")
	public ModelAndView deleteReplyPost(BReply r, ModelAndView mv) {
		int result=ms.deleteReply(r);
		if(result>0) {
			mv.setViewName("redirect:/replyList.ad");
		}
		return mv;
	}
	
	@PostMapping("/deleteCancleReply.ad")
	public ModelAndView deleteCancleReplyPost(BReply r, ModelAndView mv) {
		int result=ms.deleteCancleReply(r);
		if(result>0) {
			mv.setViewName("redirect:/replyList.ad");
		}
		return mv;
	}
	
	@RequestMapping("/declareList.ad")
	public ModelAndView declareList(ModelAndView mv) {
		List<Declaree> list=ms.getDeclareList();
		mv.addObject("list",list);
		mv.setViewName("mypage/admin/declareList");
		return mv;
	}
	
	@PostMapping("/okDeclare.ad")
	public ModelAndView deleteDeclarePost(Declaree d, ModelAndView mv) {
		int result=ms.okDeclare(d);
		if(result>0) {
			mv.setViewName("redirect:/declareList.ad");
		}
		return mv;
	}
	
	@RequestMapping("/qnaList.ad")
	public ModelAndView qnaList(ModelAndView mv) {
		List<Qna> list=ms.getQnaList();
		mv.addObject("list",list);
		mv.setViewName("qna/list");
		return mv;
	}
	
	@PostMapping("/answerQna.ad")
	public ModelAndView answerPost(Qna qna, ModelAndView mv) {
		Qna newqna=qs.getQna(qna.getQna_no());
		newqna.setAnswer(qna.getAnswer());
		int result=qs.answerQna(newqna);
		mv.setViewName("redirect:/get.qna?qna_no="+qna.getQna_no());
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	//랜덤코드 생성
	public String randomCode(int len) {
		String code="";
		int num = 0;
		while (true) {
			num = (int)Math.floor(Math.random()*75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				code+=(char)num;
			}
			if(code.length()>len)break;
		}
		return code;
	}
}
