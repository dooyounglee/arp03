package com.kh.arp.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.arp.board.model.vo.BReply;
import com.kh.arp.board.model.vo.Board;
import com.kh.arp.declaree.model.vo.Declaree;
import com.kh.arp.member.model.service.MemberService;
import com.kh.arp.member.model.vo.Auth;
import com.kh.arp.member.model.vo.Lecture;
import com.kh.arp.member.model.vo.Member;

@Controller
public class AdminController {

	@Autowired
	private MemberService ms;
	
	@Autowired
	private JavaMailSenderImpl javaMailSenderImple;
	
	@RequestMapping("/lectureList.ad")
	public ModelAndView classList(ModelAndView mv) {
		List<Lecture> list=ms.getClassList();
		System.out.println(list);
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
		if(newm!=null) {
			result=1;
		}else {
			result=ms.insertMember(m);
		}
		if(result>0) {
			Auth auth=new Auth();
			auth.setEmail(m.getEmail());
			
			//이미 있는 email인지 확인.
			Auth newauth=ms.getAuth(auth);
			if(newauth==null) {//없으면 insert. 
				auth.setCode(randomCode(50));
				int result1=ms.insertAuth(auth);
			}else {//있으면 그거.
				auth=newauth;
			}
			
			//이메일 전송
			SimpleMailMessage simpleMailMessage=new SimpleMailMessage();
			simpleMailMessage.setFrom("gostbaducking2@gmail.com");
			simpleMailMessage.setTo(auth.getEmail());
			simpleMailMessage.setSubject("arp 인증 테스트");
			simpleMailMessage.setText(req.getServerName()+":"+req.getServerPort()+"/arp/auth.me?code="+auth.getCode());
			javaMailSenderImple.send(simpleMailMessage);
			
			mv.setViewName("redirect:/memberList.ad");
		}else {
			mv.setViewName("mypage/admin/insertStudent");
		}
		return mv;
	}
	
	@GetMapping("/insertMemberToLecture.ad")
	public ModelAndView insertMemberToLectureGet(ModelAndView mv) {
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
